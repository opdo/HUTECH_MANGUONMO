<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 14/8/2018
 * Time: 11:54 AM
 */
class Test extends Lesson
{
    public $test_type;
    public $test_limit_number;
    public $test_limit_time;
    public $test_dateline;

    function __construct($id = null, $title = null, $type = null)
    {
        parent::__construct($id, $title);
        $this->test_type = $type;
    }

    public function save()
    {
        parent::save();
        if (empty($this->id)) throw new Exception('Không tìm thấy mã số bài kiểm tra');

        if (intval($this->test_type) > 1) $this->test_type = 1;
        else if (intval($this->test_type) < 0) $this->test_type = 0;

        if (empty($this->test_limit_time)) $this->test_limit_time = 0;
        if (empty($this->test_limit_number)) $this->test_limit_number = 0;
        if (empty($this->test_dateline)) $this->test_dateline = null;

        $db = DB::getInstance();
        try
        {
            Test::find($this->id);
            $req = $db->prepare('UPDATE test SET TimeLimit = :timetest, NumberLimit = :numbertest, Dateline = :datetest WHERE idLesson = :idlesson');
            if (!$req->execute(array('idlesson' => $this->id, 'numbertest' => $this->test_limit_number, 'timetest' => $this->test_limit_time, 'datetest' => empty($this->test_dateline) ? null : $this->test_dateline->format('Y-m-d H:i')))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }
        catch (Exception $e)
        {
            $req = $db->prepare('INSERT INTO test VALUES (:idlesson, '. $this->test_type .', :timetest, :numbertest, :datetest)');
            if (!$req->execute(array('idlesson' => $this->id, 'numbertest' => $this->test_limit_number, 'timetest' => $this->test_limit_time, 'datetest' => empty($this->test_dateline) ? null : $this->test_dateline->format('Y-m-d H:i')))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }
    }

    public static function find($id)
    {
        $test = new Test();
        $lesson = parent::find($id);
        $test->id = $lesson->id;
        $test->shorturl = $lesson->shorturl;
        $test->title = $lesson->title;
        $test->content = $lesson->content;
        $test->date_created = $lesson->date_created;
        $test->name_creator = $lesson->name_creator;
        $test->id_creator = $lesson->id_creator;
        $test->lesson_require = $lesson->lesson_require;
        $test->id_class = $lesson->id_class;
        $test->name_class = $lesson->name_class;

        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM test WHERE idLesson = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idLesson'])) {
            $test->test_type = $item["Type"];
            $test->test_limit_time = $item["TimeLimit"];
            $test->test_limit_number = $item["NumberLimit"];
            $test->test_dateline = $item["Dateline"];
            return $test;
        }
        throw new Exception('Bài kiểm tra này không tồn tại');
    }

    public static function all_Question($id)
    {
        $list = [];
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM test_question WHERE idTest = :id');
        $req->execute(array('id' => $id));

        foreach ($req->fetchAll() as $item) {
            $list[] = Question::find($item["idQuestion"]);
        }

        return $list;
    }

    public function randomQuestion()
    {
        $question_list = self::all_Question($this->id);
        if ($this->test_type != 1) return $question_list;
        if (intval($this->test_limit_number) < 0) $this->test_limit_number = 0;
        if ($this->test_limit_number > count($question_list) || $this->test_limit_number < 1) return $question_list;
        $question_random = [];
        for ($i = 0; $i < $this->test_limit_number; $i++)
        {
            $key = array_rand($question_list);
            $question_random[] = $question_list[$key];
            unset($question_list[$key]);
        }
        return $question_random;
    }
    public function getTestQuestion($id_student)
    {
        $list = Answer::all_Answer($id_student, $this->id);
        if (count($list) < 1)
        {
            $db = DB::getInstance();
            $random = self::randomQuestion();
            foreach ($random as $item)
            {
                if (!isset($item->id)) continue;
                if (empty($item->id)) continue;
                $req = $db->prepare('INSERT INTO student_test_result (idMember,idTest,idQuestion) VALUES (:member, :lesson, :question)');
                if (!$req->execute(array('member' => $id_student, 'question' => $item->id, 'lesson' => $this->id))) throw new Exception("Lỗi thao tác cơ sở dữ liệu khi sinh bộ test\n" . var_export($req->errorInfo()[2]));
            }
            return self::getTestQuestion($id_student);
        }
        else
        {
            return $list;
        }
    }

    public function isDone($id_Student)
    {
        $list = Answer::all_Answer($id_Student, $this->id);
        if (count($list) < 1) return -1;
        if (Account::statusLesson($id_Student, $this->id)  <= 0) return -1;
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_test_result WHERE idTest = :lesson AND idMember = :student AND (DateMark is NULL OR DateMark="")');
        $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
        $item = $req->fetch();
        if (isset($item['idTest']))
        {
            if (self::outTime($id_Student)) return 1;
            if (!empty($this->test_dateline) && date("Y-m-d H:i:s") > $this->test_dateline) return 1;
            return -1;
        }

        return 1;
    }

    public function getRank($top = 10)
    {
        $list = [];
        $db = DB::getInstance();
        if ($this->test_type == 0)
        {
            $req = $db->prepare('select DISTINCT idMember, DateMark, sum(Point) as TotalMark from student_test_result t1 where idTest = :lesson AND idMember NOT IN (SELECT DISTINCT idMember FROM student_test_result WHERE Point is NULL AND idTest = t1.idTest) ORDER BY TotalMark DESC, DateMark LIMIT '. $top);
        }
        else
        {
            $req = $db->prepare('select DISTINCT idMember, DateMark, (select count(*) from student_test_result a, question_choose b where a.idQuestion = b.idQuestion and a.Answer = b.Answer AND idMember=t1.idMember and idTest=:lesson)/(select count(*) from student_test_result where idMember=t1.idMember and idTest=:lesson)*10 as TotalMark from student_test_result t1 where idTest = :lesson AND idMember NOT IN (SELECT DISTINCT idMember FROM student_test_result WHERE (DateMark is NULL OR DateMark = "")  AND idTest = t1.idTest) ORDER BY TotalMark DESC, DateMark LIMIT '. $top);
        }
        $req->execute(array('lesson' => $this->id));

        foreach ($req->fetchAll() as $item) {
            if (empty($item["idMember"])) continue;
            $list[] = array('id' => $item["idMember"], "mark" => round($item["TotalMark"], 1), "date" => $item["DateMark"]);
        }
        return $list;
    }

    public function isMark($id_Student)
    {
        $list = Answer::all_Answer($id_Student, $this->id);
        if (count($list) < 1) return false;
        if ($this->test_type == 1) return true;
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_test_result WHERE idTest = :lesson AND idMember = :student AND Point is NULL');
        $req->execute(array('lesson' => $this->id, 'student' => $id_Student));

        $item = $req->fetch();
        if (isset($item['idMember']))
        {
            return false;
        }
        return true;
    }

    public function outTime($id_Student)
    {
        // hết giờ làm bài
        if (intval($this->test_limit_time) > 0)
        {
            $db = DB::getInstance();
            $req = $db->prepare('SELECT * FROM student_lesson WHERE idLesson = :lesson AND idMember = :student');
            $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
            $item = $req->fetch();
            if (!isset($item['DateFinished'])) return true;
            $date_start = new DateTime($item['DateFinished']);
            $date_start->add(new DateInterval('PT' . ($this->test_limit_time + 1) . 'M'));
            if ((new DateTime()) > $date_start)
            {
                $req = $db->prepare('UPDATE student_test_result SET DateMark=now() WHERE idTest = :lesson AND idMember = :student AND (DateMark is NULL OR DateMark="")');
                $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
                return true;
            }
        }
        return false;
    }

    public function getTimeLeft($id_Student)
    {
        if (intval($this->test_limit_time) > 0)
        {
            $db = DB::getInstance();
            $req = $db->prepare('SELECT * FROM student_lesson WHERE idLesson = :lesson AND idMember = :student');
            $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
            $item = $req->fetch();
            if (!isset($item['DateFinished'])) return null;
            $date_start = new DateTime($item['DateFinished']);
            $date_start->add(new DateInterval('PT' . $this->test_limit_time . 'M'));
            return $date_start;
        }
        return null;
    }

    public function getTestPoint($id_Student)
    {
        $db = DB::getInstance();
        if ($this->test_type == 0)
        {
            $req = $db->prepare('SELECT sum(Point) as TotalMark FROM student_test_result WHERE idTest = :lesson AND idMember = :student');
            $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
            $item = $req->fetch();
            if (isset($item['TotalMark'])) return $item['TotalMark'];
        }
        else
        {
            $req = $db->prepare('select count(*) as TotalRightAnswer from student_test_result a, question_choose b where a.idQuestion = b.idQuestion and a.Answer = b.Answer AND a.idTest = :lesson AND a.idMember = :student');
            $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
            $item = $req->fetch();
            if (isset($item['TotalRightAnswer']))
            {
                $req = $db->prepare('select count(*) as TotalAnswer from student_test_result WHERE idTest = :lesson AND idMember = :student');
                $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
                $item2 = $req->fetch();
                if (isset($item2['TotalAnswer']))
                {
                    $mark = round(($item['TotalRightAnswer']/$item2['TotalAnswer'])*10, 1);
                    return $mark;
                }
            }
        }
        return 0;
    }
    public function setTestFinish($id_Student)
    {
        if (self::isDone($id_Student) > 0) throw new Exception("Bạn đã hoàn thành bài kiểm tra này trước đó");
        $db = DB::getInstance();
        $req = $db->prepare('UPDATE student_test_result SET DateMark=now() WHERE idTest = :lesson AND idMember = :student AND (DateMark is NULL OR DateMark="")');
        $req->execute(array('lesson' => $this->id, 'student' => $id_Student));
    }

    public function setTestPoint($id_student, $id_question, $point, $comment)
    {
        $question = Answer::findAnswer($id_student, $id_question);
        $question->point = $point;
        $question->comment = $comment;
        $question->saveMark($id_student);
    }
    public function saveAnswer($id_student, $id_question, $answer)
    {
        if (!self::outTime($id_student))
        {
            if ($this->test_type == 1)
            {
                if (!empty($answer))
                {
                    $answer = intval($answer);
                    if ($answer < 1) $answer = 0;
                    elseif ($answer > 4) $answer = 4;
                }
            }
            $question = Answer::findAnswer($id_student, $id_question);
            $question->_answer = $answer;
            $question->saveAnswer($id_student);
        }
        else throw new Exception("Đã hết thời gian làm bài");
    }


}