<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 11/8/2018
 * Time: 8:58 PM
 */
class _Class
{
    public $id, $shorturl, $title, $detail, $date_created, $name_creator, $id_creator, $status, $password;
    function __construct($id = null, $shorturl = null, $title = null, $detail = null, $date_created = null, $id_creator = null, $status = 1, $password = null)
    {
        $this->id = $id;
        $this->shorturl = $shorturl;
        $this->title = $title;
        $this->detail = $detail;
        $this->date_created = $date_created;
        $this->id_creator = $id_creator;
        $this->status = $status;
        $this->password = $password;
        try
        {
            $info = Account::find($this->id_creator);
            $this->name_creator = $info->name;
        }
        catch (Exception $e)
        {
            $this->name_creator = "[Không tìm thấy]";
        }
    }

    static function all($status = -1)
    {
        $list = [];
        $db = DB::getInstance();
        if ($status < 0) $req = $db->query('SELECT * FROM class ORDER BY Status DESC');
        else $req = $db->query('SELECT * FROM class WHERE Status>='. $status . ' ORDER BY Status');
        foreach ($req->fetchAll() as $item) {
            $list[] = new _Class($item["idClass"], $item["linkClass"], $item["Title"], $item["Detail"], $item["DateCreated"], $item["idCreator"], $item["Status"], $item["Password"]);
        }
        return $list;
    }

    static function student_all($id)
    {
        $list = [];
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM student_class WHERE idClass = :id');
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
                    'datejoined' => $item["DateJoin"]
                );
            } catch (Exception $e)
            {

            }
        }
        return $list;
    }

    static function count()
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT count(*) as TONG FROM class');
        $req->execute();
        $item = $req->fetch();
        if (isset($item['TONG'])) return $item['TONG'];
        return 0;
    }

    static function find($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM class WHERE idClass = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idClass'])) {
            return new _Class($item["idClass"], $item["linkClass"], $item["Title"], $item["Detail"], $item["DateCreated"], $item["idCreator"], $item["Status"], $item["Password"]);
        }
        throw new Exception('Khóa học này không tồn tại');
    }

    static function findURL($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM class WHERE linkClass = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idClass'])) {
            return new _Class($item["idClass"], $item["linkClass"], $item["Title"], $item["Detail"], $item["DateCreated"], $item["idCreator"], $item["Status"], $item["Password"]);
        }
        throw new Exception('Khóa học này không tồn tại');
    }

    public function delete()
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số lớp học');
        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM class WHERE idClass=:id');
        if (!$req->execute(array('id' => $this->id))) throw new Exception("Lỗi xóa dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }

    public function removeStudent($id_student)
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số lớp học');
        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM student_class WHERE idClass=:id AND idMember = :member');
        if (!$req->execute(array('id' => $this->id, 'member' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()[2]));

        $req = $db->prepare('DELETE FROM student_lesson WHERE idLesson IN (select idLesson FROM lesson WHERE idClass=:id) AND idMember = :member');
        if (!$req->execute(array('id' => $this->id, 'member' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));

        $req = $db->prepare('DELETE FROM student_test_result WHERE idTest IN (select idLesson FROM lesson WHERE idClass=:id) AND idMember = :member');
        if (!$req->execute(array('id' => $this->id, 'member' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }
    public function addStudent($id_student)
    {
        $admin = $_SESSION["USER"];
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số lớp học');
        if (!$this->checkRequireStudent($id_student) && !$admin->isAdmin()) throw new Exception('Bạn không đủ điều kiện tham gia lớp học này');
        if ($this->status != 1 && !$admin->isAdmin()) throw new Exception('Khóa học này đã bị quản trị viên ẩn hoặc khóa lại');

        $db = DB::getInstance();
        $req = $db->prepare('INSERT INTO student_class (idClass, idMember) VALUES (:id1, :id2)');
        if (!$req->execute(array('id1' => $this->id, 'id2' => $id_student))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()[2]));
    }
    public function checkRequireStudent($id)
    {
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số lớp học');

        try
        {
            $list_Require = $this->getRequire();
            $user_Class = Account::allClass($id);
            foreach ($list_Require as $item)
            {
                if (array_search($item["id"], array_column($user_Class, "idClass")) === false) return false;
            }
            return true;
        }
        catch (Exception $e)
        {
            return false;
        }
    }

    public function addRequire($id)
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số lớp học');
        if ($this->id_creator != $admin->id && !empty($this->id_creator)) throw new Exception('Mục này được tạo bởi quản trị viên ' . $this->name_creator . ', bạn không có quyền chỉnh sửa');

        $list_require = _Class::getRequire();
        foreach ($list_require as $item)
        {
            if ($item["id"] == $id) throw new Exception('Khóa học này đã được thêm vào danh sách yêu cầu học trước đó');
        }

        $db = DB::getInstance();
        $req = $db->prepare('INSERT INTO class_require VALUES (:id1, :id2)');
        if (!$req->execute(array('id1' => $this->id, 'id2' => $id))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }
    public function deleteRequire($id)
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->id)) throw new Exception('Vui lòng nhập mã số lớp học');
        if ($this->id_creator != $admin->id && !empty($this->id_creator)) throw new Exception('Mục này được tạo bởi quản trị viên ' . $this->name_creator . ', bạn không có quyền chỉnh sửa');

        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM class_require WHERE idClass = :id1 AND idClass_Require = :id2');
        if (!$req->execute(array('id1' => $this->id, 'id2' => $id))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }
    
    public function save()
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        if (empty($this->title)) throw new Exception('Tiêu đề không hợp lệ');
        $this->shorturl = $this->getLink();
        $db = DB::getInstance();
        if (empty($this->id))
        {
            $req = $db->prepare('INSERT INTO class (idCreator, linkClass, Title, Detail, Password) VALUES (:id, :link, :title, :detail, :pass)');
            if (!$req->execute(array('link' => $this->shorturl, 'id' => $admin->id, 'title' => $this->title, 'detail' => $this->detail, 'pass' => $this->password))) throw new Exception("Lỗi lưu dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
            $this->id = $db->lastInsertId();
        }
        else
        {
            if ($this->id_creator != $admin->id && !empty($this->id_creator)) throw new Exception('Mục này được tạo bởi quản trị viên ' . $this->name_creator . ', bạn không có quyền chỉnh sửa');
            $req = $db->prepare('UPDATE class SET linkClass = :link, Title = :title, Detail = :detail, Password = :pass, Status = '. $this->status .' WHERE idClass=:id');
            if (!$req->execute(array('link' => $this->shorturl, 'id' => $this->id, 'title' => $this->title, 'detail' => $this->detail, 'pass' => $this->password))) throw new Exception("Lỗi lưu dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }

        if (empty($this->password))
        {
            $req = $db->prepare('UPDATE class SET Password = NULL WHERE idClass=:id');
            $req->execute(array('id' => $this->id));
        }
    }

    public function getRequire()
    {
        if (empty($this->id)) throw new Exception('Mã khóa học không tồn tại');
        $list = [];
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM class_require WHERE idClass = :id');
        $req->execute(array('id' => $this->id));

        foreach ($req->fetchAll() as $item) {
            try
            {
                $class = _Class::find($item["idClass_Require"]);
                $list[] = array(
                    'id' => $item["idClass_Require"],
                    'title' => $class->title,
                    'url' => $class->shorturl
                );
            } catch (Exception $e)
            {

            }
        }
        return $list;
    }

    public function getLink()
    {
        if (empty($this->title)) throw new Exception('Tiêu đề không hợp lệ');

        $newtitle = StringEx::convert_vi_to_en($this->title);
        $newtitle = strtoupper($newtitle);
        $words = explode(" ", $newtitle);
        $link = "";
        foreach ($words as $w) {
            $link .= $w[0];
        }

        for ($i = strlen($link)+1; $i < 4; $i++)
        {
            $link .= "A";
        }
        $link = substr($link, 0, 3);
        $i = 0;
        $testlink = "";
        while ($i++ >= 0)
        {
            if ($i < 10) $number = "00" . $i;
            else if ($i < 100) $number = "0" . $i;
            else $number = $i;

            $testlink = $link . "" . $number;

            try{
                $class = _Class::findURL($testlink);
                if (empty($this->id)) continue;
                if ($this->id == $class->id) break;
            } catch (Exception $e)
            {
                break;
            }
        }
        return $testlink;
    }
}