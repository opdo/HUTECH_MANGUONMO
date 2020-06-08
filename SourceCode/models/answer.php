<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 16/8/2018
 * Time: 8:42 PM
 */
class Answer extends Question
{
    public $point, $point_id, $point_name, $point_date, $_answer, $comment;

    public static function findAnswer($id_Student, $id_Question)
    {
        $question = Question::find($id_Question);
        $answer = new Answer();
        $answer->id = $question->id;
        $answer->id_lesson = $question->id_lesson;
        $answer->content = $question->content;
        $answer->limit_number = $question->limit_number;
        $answer->answer = $question->answer;

        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_test_result WHERE idTest = :lesson AND idMember = :student AND idQuestion = :question');
        $req->execute(array('lesson' => $answer->id_lesson,'question' => $id_Question, 'student' => $id_Student));

        $item = $req->fetch();
        if (isset($item['idTest'])) {
            $answer->point = $item['Point'];
            $answer->point_id = $item['idMark'];
            try
            {
                $answer->point_name = Account::find($answer->point_id)->name;
            }
            catch (Exception $e)
            {
                $answer->point_name = "[Không tìm thấy]";
            }
            $answer->point_date = $item['DateMark'];
            $answer->_answer = strip_tags($item['Answer']);
            $answer->comment = strip_tags($item['Comment']);
            return $answer;
        }
        throw new Exception("Không tồn tại câu trả lời này");
    }

    public function saveAnswer($id_Student)
    {
        $admin = $_SESSION["USER"];
        $status = _Class::find(Lesson::find($this->id_lesson)->id_class)->status;
        if ($status == 2) throw new Exception('Khóa học này đã bị khóa, bạn không thể tương tác với dữ liệu trong khóa học');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số câu hỏi');

        $db = DB::getInstance();
        $req = $db->prepare('UPDATE student_test_result SET idMark=NULL, DateMark=NULL, Point=NULL, Comment=NULL, Answer=:answer WHERE idQuestion = :id AND idMember = :student');
        if (!$req->execute(array('id' => $this->id,'student' => $id_Student, 'answer' => $this->_answer))) throw new Exception("Không thể lưu lại kết quả này, vui lòng thử lại sau");

    }
    public function saveMark($id_Student)
    {
        $admin = $_SESSION["USER"];
        $status = _Class::find(Lesson::find($this->id_lesson)->id_class)->status;
        if ($status == 2) throw new Exception('Khóa học này đã bị khóa, bạn không thể tương tác với dữ liệu trong khóa học');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số câu hỏi');

        $db = DB::getInstance();
        $req = $db->prepare('UPDATE student_test_result SET idMark=:idmark, DateMark=now(), Point=:point, Comment=:comment WHERE idQuestion = :id AND idMember = :student');
        if (!$req->execute(array('id' => $this->id,'student' => $id_Student, 'idmark' => $admin->id, 'point' => $this->point, 'comment' => $this->comment))) throw new Exception("Không thể lưu lại kết quả này, vui lòng thử lại sau");
    }
    public static function all_Answer($id_Student, $id_Test)
    {
        $list = [];
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_test_result WHERE idTest = :lesson AND idMember = :student');
        $req->execute(array('lesson' => $id_Test,'student' => $id_Student));

        foreach ($req->fetchAll() as $item) {
            $list[] = Answer::findAnswer($id_Student, $item["idQuestion"]);
        }

        return $list;
    }
}