<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 14/8/2018
 * Time: 8:28 PM
 */
class Question
{
    public $id, $id_lesson, $content, $limit_number, $answer = array(0 => null, 1 => null, 2 => null, 3 => null, 4 => null);
    function __construct($id = null, $id_lesson = null, $content = null, $answer = null, $limit_number = null)
    {
        $this->id = $id;
        $this->id_lesson = $id_lesson;
        $this->content = $content;
        $this->limit_number = $limit_number;
        for ($i = 0; $i <= 4; $i++) $this->answer[$i] = isset($answer[$i]) ? $answer[$i] : null;
    }

    public static function find($id)
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM test_question WHERE idQuestion = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idQuestion'])) {
            $answer = array(0 => null, 1 => null, 2 => null, 3 => null, 4 => null);
            if (Test::find($item['idTest'])->test_type == 1)
            {
                $req = $db->prepare('SELECT * FROM question_choose WHERE idQuestion = :id');
                $req->execute(array('id' => $id));
                $item2 = $req->fetch();
                if (isset($item2['idQuestion'])) {
                    $answer[0] = $item2['Answer'];
                    $answer[1] = $item2['ChooseA'];
                    $answer[2] = $item2['ChooseB'];
                    $answer[3] = $item2['ChooseC'];
                    $answer[4] = $item2['ChooseD'];
                }
            }
            $question = new Question($id, $item['idTest'], $item['Content'], $answer, $item['Limit']);
            return $question;
        }
        throw new Exception('Câu hỏi này không tồn tại');
    }

    static function count($idClass = null)
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT count(*) as TONG FROM test_question WHERE idTest=:id');
        $req->execute(array('id' => $idClass));
        $item = $req->fetch();
        if (isset($item['TONG'])) return $item['TONG'];
        return 0;
    }

    public function save()
    {
        if (empty($this->id_lesson)) throw new Exception('Không tìm thấy mã số bài kiểm tra');
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (Lesson::find($this->id_lesson)->id_creator != $admin->id && !empty($this->id_creator)) throw new Exception('Mục này được tạo bởi quản trị viên ' . $this->name_creator . ', bạn không có quyền chỉnh sửa');

        $db = DB::getInstance();
        try
        {
            self::find($this->id);
            $req = $db->prepare("UPDATE test_question SET Content = :content, `Limit` = :limit WHERE idQuestion = :id");
            if (!$req->execute(array('id' => $this->id, 'content' => $this->content, 'limit' => $this->limit_number))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }
        catch (Exception $e)
        {
            if (!empty($this->id)) throw $e;
            $req = $db->prepare('INSERT INTO test_question VALUES (NULL, :idtest, :content, :limit)');
            if (!$req->execute(array('idtest' => $this->id_lesson, 'content' => $this->content, 'limit' => $this->limit_number))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
            $this->id = $db->lastInsertId();
        }

        if (Test::find($this->id_lesson)->test_type == 1)
        {
            $req = $db->prepare('SELECT * FROM question_choose WHERE idQuestion = :id');
            $req->execute(array('id' => $this->id));
            $item2 = $req->fetch();
            if (isset($item2['idQuestion'])) {
                $req = $db->prepare('UPDATE question_choose SET ChooseA = :a, ChooseB = :b, ChooseC = :c, ChooseD = :d, Answer = :r WHERE idQuestion = :id');
                if (!$req->execute(array('id' => $this->id, 'a' => $this->answer[1], 'b' => $this->answer[2], 'c' => $this->answer[3], 'd' => $this->answer[4], 'r' => $this->answer[0]))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
            }
            else
            {
                $req = $db->prepare('INSERT INTO question_choose VALUES (:id, :a, :b, :c, :d, :r)');
                if (!$req->execute(array('id' => $this->id, 'a' => $this->answer[1], 'b' => $this->answer[2], 'c' => $this->answer[3], 'd' => $this->answer[4], 'r' => $this->answer[0]))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
            }
        }
    }

    public function delete()
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số câu hỏi');
        if (Lesson::find($this->id_lesson)->id_creator != $admin->id && !empty($this->id_creator)) throw new Exception('Mục này được tạo bởi quản trị viên ' . $this->name_creator . ', bạn không có quyền chỉnh sửa');

        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM test_question WHERE idQuestion=:id');
        if (!$req->execute(array('id' => $this->id))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }


}