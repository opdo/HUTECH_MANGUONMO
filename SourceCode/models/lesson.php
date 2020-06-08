<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 14/8/2018
 * Time: 2:16 AM
 */
class Lesson
{
    public $id, $shorturl, $title, $content, $date_created, $name_creator, $id_creator, $lesson_require, $id_class, $name_class;
    function __construct($id = null, $title = null)
    {
        $this->id = $id;
        $this->title = $title;
    }

    public function save()
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->title)) throw new Exception('Tiêu đề không hợp lệ');
        $db = DB::getInstance();
        if (empty($this->id))
        {
            $req = $db->prepare('INSERT INTO lesson (idCreator, idClass, Title, Content, idLesson_Require) VALUES (:creator, :class, :title, :content, :require)');
            if (!$req->execute(array('class' => $this->id_class, 'creator' => $admin->id, 'title' => $this->title, 'content' => $this->content, 'require' => $this->lesson_require))) throw new Exception("Lỗi lưu dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
            $this->id = $db->lastInsertId();
        }
        else
        {
            if ($this->id_creator != $admin->id && !empty($this->id_creator)) throw new Exception('Mục này được tạo bởi quản trị viên ' . $this->name_creator . ', bạn không có quyền chỉnh sửa');
            $req = $db->prepare('UPDATE lesson SET idLesson_Require = :require, Title = :title, Content = :content WHERE idLesson=:id');
            if (!$req->execute(array('require' => $this->lesson_require, 'id' => $this->id, 'title' => $this->title, 'content' => $this->content))) throw new Exception("Lỗi lưu dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }
    }

    public function delete()
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số bài học');

        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM lesson WHERE idLesson=:id');
        if (!$req->execute(array('id' => $this->id))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }

    public function getNextLesson()
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT lesson.* FROM lesson WHERE idClass = :id AND Title > :title ORDER BY Title LIMIT 1');
        $req->execute(array('id' => $this->id_class, 'title' => $this->title));
        $item = $req->fetch();
        if (isset($item['idLesson'])) {
            $lesson = new Lesson($item["idLesson"], $item["Title"]);
            $lesson->content = $item["Content"];
            $lesson->date_created = $item["DateCreated"];
            $lesson->id_class = $item["idClass"];
            $lesson->id_creator = $item["idCreator"];
            $lesson->lesson_require = $item["idLesson_Require"];
            $lesson->name_class = _Class::find($lesson->id_class)->title;
            $lesson->name_creator = Account::find($lesson->id_creator)->name;
            $lesson->shorturl = $lesson->id . "-" . strtolower(StringEx::convert_vi_to_en($lesson->title));
            $lesson->shorturl = str_replace(' ', '-', $lesson->shorturl);
            return $lesson;
        }
        throw new Exception('Khóa học này không tồn tại');
    }

    public function getPreLesson()
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT lesson.* FROM lesson WHERE idClass = :id AND Title < :title ORDER BY Title DESC LIMIT 1');
        $req->execute(array('id' => $this->id_class, 'title' => $this->title));
        $item = $req->fetch();
        if (isset($item['idLesson'])) {
            $lesson = new Lesson($item["idLesson"], $item["Title"]);
            $lesson->content = $item["Content"];
            $lesson->date_created = $item["DateCreated"];
            $lesson->id_class = $item["idClass"];
            $lesson->id_creator = $item["idCreator"];
            $lesson->lesson_require = $item["idLesson_Require"];
            $lesson->name_class = _Class::find($lesson->id_class)->title;
            $lesson->name_creator = Account::find($lesson->id_creator)->name;
            $lesson->shorturl = $lesson->id . "-" . strtolower(StringEx::convert_vi_to_en($lesson->title));
            $lesson->shorturl = str_replace(' ', '-', $lesson->shorturl);
            return $lesson;
        }
        throw new Exception('Khóa học này không tồn tại');
    }

    public function isTest()
    {
        if (empty($this->id)) return false;
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM test WHERE idLesson = :id');
        $req->execute(array('id' => $this->id));
        $item = $req->fetch();
        if (isset($item['idLesson'])) return true;
        return false;
    }

    public function removeStudent($id_student)
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số bài học');

        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM student_lesson WHERE idLesson=:id AND idMember = :member');
        if (!$req->execute(array('id' => $this->id, 'member' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));

        $req = $db->prepare('DELETE FROM student_test_result WHERE idTest=:id AND idMember = :member');
        if (!$req->execute(array('id' => $this->id, 'member' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));

    }

    static function all($idClass, $type = -1)
    {
        $list = [];
        $db = DB::getInstance();
        if ($type < 0) $req = $db->prepare('SELECT * FROM lesson WHERE idClass=:id ORDER BY Title');
        else $req = $db->prepare('SELECT * FROM lesson WHERE idClass=:id AND idLesson IN (SELECT idLesson FROM test WHERE Type = '. $type .') ORDER BY Title');
        $req->execute(array('id' => $idClass));
        foreach ($req->fetchAll() as $item) {
            $lesson = self::find($item["idLesson"]);
            if (!$lesson->isTest()) $list[] = $lesson;
            else $list[] = Test::find($item["idLesson"]);
        }
        return $list;
    }


    static function count($idClass = null)
    {
        $db = DB::getInstance();
        if ($idClass === null)
        {
            $req = $db->prepare('SELECT count(*) as TONG FROM lesson');
            $req->execute();
        }
        else
        {
            $req = $db->prepare('SELECT count(*) as TONG FROM lesson WHERE idClass=:id');
            $req->execute(array('id' => $idClass));
        }
        $item = $req->fetch();
        if (isset($item['TONG'])) return $item['TONG'];
        return 0;
    }
    
    public function addStudent($id_student)
    {
        $admin = $_SESSION["USER"];
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số bài học');
        if (!Account::inClass($id_student, $this->id_class) && !$admin->isAdmin()) throw new Exception('Bạn chưa tham gia lớp học này');
        if (_Class::find($this->id_class)->status != 1) throw new Exception('Khóa học này đã bị quản trị viên ẩn hoặc khóa lại');

        $db = DB::getInstance();
        $req = $db->prepare('INSERT INTO student_lesson (idLesson, idMember) VALUES (:id1, :id2)');
        if (!$req->execute(array('id1' => $this->id, 'id2' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()[2]));
    }

    public function checkStudent($id_student)
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_lesson WHERE idLesson = :id AND idMember = :student');
        $req->execute(array('id' => $this->id, 'student' => $id_student));
        $item = $req->fetch();
        if (isset($item['idLesson'])) return true;
        return false;
    }

    static function find($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM lesson WHERE idLesson = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idLesson'])) {
            $lesson = new Lesson($item["idLesson"], $item["Title"]);
            $lesson->content = $item["Content"];
            $lesson->date_created = $item["DateCreated"];
            $lesson->id_class = $item["idClass"];
            $lesson->id_creator = $item["idCreator"];
            $lesson->lesson_require = $item["idLesson_Require"];
            $lesson->name_class = _Class::find($lesson->id_class)->title;
            $lesson->name_creator = Account::find($lesson->id_creator)->name;
            $lesson->shorturl = $lesson->id . "-" . strtolower(StringEx::convert_vi_to_en($lesson->title));
            $lesson->shorturl = str_replace(' ', '-', $lesson->shorturl);
            return $lesson;
        }
        throw new Exception('Khóa học này không tồn tại');
    }

    static function student_all($id)
    {
        $list = [];
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_lesson WHERE idLesson = :id');
        $req->execute(array('id' => $id));

        foreach ($req->fetchAll() as $item) {
            try
            {
                $user = Account::find($item["idMember"]);
                $list[] = array(
                    'id' => $item["idMember"],
                    'name' => $user->name,
                    'mssv' => $user->mssv,
                    'class' => $user->class,
                    'date' => $item["DateFinished"]
                );
            } catch (Exception $e)
            {

            }
        }
        return $list;
    }
}