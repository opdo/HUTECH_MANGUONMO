<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 11/8/2018
 * Time: 8:58 PM
 */
class Account
{
    public $mssv;
    public $name;
    public $class;
    public $password;
    public $email;
    public $phone;
    public $id;
    public $status;
    public $admin;
    public $date_joined;

    function __construct($id, $mssv, $password, $name = null, $class = null, $email = null, $phone = null, $status = null)
    {
        $this->mssv = strip_tags($mssv);
        $this->name = strip_tags($name);
        $this->class = strip_tags($class);
        $this->password = $password;
        $this->email = strip_tags($email);
        $this->phone = strip_tags($phone);
        $this->id = $id;
        $this->status = $status;
        $this->admin = $this->isAdmin();
    }
    public function delete()
    {
        if (empty($this->id)) throw new Exception('Vui lòng không mã số thành viên');
        $db = DB::getInstance();
        $req = $db->prepare('DELETE FROM member WHERE idMember=:id');
        if (!$req->execute(array('id' => $this->id))) throw new Exception("Lỗi xóa dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
    }

    public function checkInfoHUTECH()
    {
        $name = mb_strtolower(StringEx::convert_vi_to_en($this->name));
        $name = str_replace(' ', '', $name);
        $class = strtolower($this->class);
        $class =  str_replace(' ', '', $class);

        try
        {
            // create curl resource
            $ch = curl_init();
            // set url
            curl_setopt($ch, CURLOPT_URL, "http://daotao.hutech.edu.vn/Default.aspx?page=thoikhoabieu&sta=0&id=$this->mssv");
            //return the transfer as a string
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            // $output contains the output string
            $output = curl_exec($ch);
            // close curl resource to free up system resources
            curl_close($ch);

            preg_match('/ContentPlaceHolder1_ctl00_lblContentTenSV" class="Label"><b><font color="Teal">(.*?)-/', $output, $matches, PREG_OFFSET_CAPTURE, 3);
            if (count($matches) < 1) return false;
            $_NAME = $matches[1][0];

            $_CLASS = "";
            preg_match('/ContentPlaceHolder1_ctl00_lblContentLopSV" class="Label"><b><font color="Teal">(.*?)-/', $output, $matches, PREG_OFFSET_CAPTURE, 3);
            if (count($matches) < 1) return false;
            else $_CLASS = $matches[1][0];
            $name_Return = $_NAME;
            $_NAME = mb_strtolower(StringEx::convert_vi_to_en($_NAME));
            $_NAME = str_replace(' ', '', $_NAME);
            $_CLASS = strtolower($_CLASS);
            $_CLASS =  str_replace(' ', '', $_CLASS);
            if ($name == $_NAME && $class == $_CLASS) return $name_Return;
        }
        catch (Exception $e)
        {
            return false;
        }
        return false;
    }

    public function save()
    {
        if (empty($this->id))
        {
            if (isset($_SESSION["USER"]))
            {
                $admin = $_SESSION["USER"];
                if ($admin->isAdmin()) $this->id = self::reg($this->mssv, $this->password, $this->name, $this->class, $this->email, $this->phone);
            }
        }
        if (!empty($this->email) && !filter_var($this->email, FILTER_VALIDATE_EMAIL)) throw new Exception('Email nhập vào không hợp lệ');
        if (!empty($this->phone) && (!is_numeric($this->phone) || strlen($this->phone) < 8)) throw new Exception('Số điện thoại liên hệ không hợp lệ');
        if (empty($this->mssv) || empty($this->name)) throw new Exception('Vui lòng không bỏ trống tên và mã số sinh viên');

        try
        {
            $info = Account::findMSSV($this->mssv);
            if ($info->id != $this->id) throw new Exception("Mã số sinh viên này đã tồn tại trong hệ thống", 20);
        }
        catch (Exception $e)
        {
            if ($e->getCode() == 20) throw $e;
        }
        $this->class = strtoupper(str_replace(' ', '', $this->class));
        $this->name = str_replace('  ', ' ', $this->name);
        $this->name = mb_convert_case($this->name, MB_CASE_TITLE, "UTF-8");

        $db = DB::getInstance();
        $req = $db->prepare('UPDATE member SET Name = :ten, idStudent = :mssv, idClass = :class, Email = :email, Phone = :phone, Status = '. $this->status .' WHERE idMember=:id');
        if (!$req->execute(array('id' => $this->id, 'ten' => $this->name, 'mssv' => $this->mssv, 'class' => $this->class, 'email' => $this->email, 'phone' => $this->phone))) throw new Exception("Lỗi lưu dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));

        if (!empty($this->password))
        {
            $req = $db->prepare('UPDATE member SET Password = md5(:pass) WHERE idMember=:id');
            if (!$req->execute(array('id' => $this->id, 'pass' => $this->password))) throw new Exception('Không thể đổi mật khẩu do lỗi lưu dữ liệu, vui lòng thử lại sau');
        }

        if ($this->admin != $this->isAdmin())
        {
            if ($this->admin)
            {
                $whoset = $_SESSION["USER"];
                $req = $db->prepare('INSERT INTO admin (idMember, idCreator) VALUES (:id, :whoset)');
                if (!$req->execute(array('id' => $this->id, 'whoset' => $whoset->id))) throw new Exception("Không thể lưu quyền hạn cho thành viên này, vui lòng thử lại sau\n" . $req->errorInfo()[2]);
            }
            else
            {
                $req = $db->prepare('DELETE FROM admin WHERE idMember=:id');
                if (!$req->execute(array('id' => $this->id))) throw new Exception('Không thể xóa quyền hạn cho thành viên này, vui lòng thử lại sau');
            }
        }
    }

    public function isAdmin()
    {
        if (empty($this->id)) return false;
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM admin WHERE idMember = :id');
        $req->execute(array('id' => $this->id));
        $item = $req->fetch();
        if (isset($item['idMember'])) return true;
        return false;
    }

    public function infoAdmin()
    {
        $result = array('memberset' => '', 'dateset' => '', 'membername' => '');
        if (empty($this->id)) return $result;
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM admin WHERE idMember = :id');
        $req->execute(array('id' => $this->id));
        $item = $req->fetch();
        if (isset($item['idMember']))
        {
            $result['memberset'] = $item['idCreator'];
            $result['dateset'] = $item['DateSet'];
            try
            {
                $memberset_info = Account::find($result['memberset']);
                $result['membername'] = $memberset_info->name;
            }
            catch (Exception $e)
            {
                $result['membername'] = "[Không tìm thấy]";
            }
        }
        return $result;
    }

    static function count()
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT count(*) as TONG FROM member');
        $req->execute();
        $item = $req->fetch();
        if (isset($item['TONG'])) return $item['TONG'];
        return 0;
    }

    static function all()
    {
        $list = [];
        $db = DB::getInstance();
        $req = $db->query('SELECT * FROM member');

        foreach ($req->fetchAll() as $item) {
            $list[] = new Account($item["idMember"], $item["idStudent"], $item["Password"], $item["Name"], $item["idClass"], $item["Email"], $item["Phone"], $item["Status"]);
        }

        return $list;
    }

    static function allClass($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $list = [];
        $db = DB::getInstance();
        $req = $db->query('SELECT * FROM student_class WHERE idMember=' . $id);

        foreach ($req->fetchAll() as $item) {
            $list[] = array(
                'idClass' => $item["idClass"],
                'dateJoin' => $item["DateJoin"]
            );
        }
        return $list;
    }

    static function allLesson($id, $id_class)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $list = [];
        $db = DB::getInstance();
        $req = $db->query('SELECT * FROM student_lesson a, lesson b WHERE a.idLesson = b.idLesson AND b.idClass = '. $id_class .' AND a.idMember=' . $id);

        foreach ($req->fetchAll() as $item) {
            $list[] = array(
                'idLesson' => $item["idLesson"],
                'idClass' => $item["idClass"],
                'dateFinished' => $item["DateFinished"]
            );
        }
        return $list;
    }

    static function inClass($id_student, $id_class)
    {
        if (empty($id_student) || empty($id_class)) return false;

        $db = DB::getInstance();
        $req = $db->query('SELECT * FROM student_class WHERE idMember=' . $id_student . ' AND idClass = '. $id_class);

        $item = $req->fetch();
        if (isset($item['idMember'])) return true;
        return false;
    }

    static function statusLesson($id_student, $id_lesson)
    {
        if (empty($id_student)) return -1;
        if (empty($id_lesson)) return -1;

        $db = DB::getInstance();
        $req = $db->query('SELECT * FROM student_lesson WHERE idMember=' . $id_student . ' AND idLesson = '. $id_lesson);
        $item = $req->fetch();
        if (isset($item['idMember'])) return 1;
        return -1;
    }

    static function find($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM member WHERE idMember = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idMember'])) {
            $info = new Account($item["idMember"], $item["idStudent"], $item["Password"], $item["Name"], $item["idClass"], $item["Email"], $item["Phone"], $item["Status"]);
            $info->date_joined = $item["DateCreated"];
            return $info;
        }
        throw new Exception('Tài khoản này không tồn tại');
    }

    static function findMSSV($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM member WHERE idStudent = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idMember'])) {
            $info = new Account($item["idMember"], $item["idStudent"], $item["Password"], $item["Name"], $item["idClass"], $item["Email"], $item["Phone"], $item["Status"]);
            $info->date_joined = $item["DateCreated"];
            return $info;
        }
        throw new Exception('Tài khoản này không tồn tại');
    }


    static function login($mssv, $password)
    {
        if (empty($mssv) || empty($password)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM member WHERE idStudent = :id and Password=md5(:pass)');
        $req->execute(array('id' => $mssv, 'pass' => $password));
        $item = $req->fetch();
        if (isset($item['idMember'])) {
            if ($item['Status'] != 0) throw  new Exception("Tài khoản của bạn đã bị vô hiệu, vui lòng liên hệ quản trị viên để biết thêm thông tin chi tiết");
            return new Account($item["idMember"], $item["idStudent"], $item["Password"], $item["Name"], $item["idClass"], $item["Email"], $item["Phone"], $item["Status"]);
        }
        throw new Exception('Tài khoản hoặc mật khẩu không chính xác');
    }

    static function exist($mssv)
    {
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM member WHERE idStudent = :id');
        $req->execute(array('id' => $mssv));
        $item = $req->fetch();
        if (isset($item['idMember'])) return true;
        return false;
    }

    static function reg($mssv, $password, $name, $class, $email, $phone)
    {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL) && !empty($email)) throw new Exception('Email nhập vào không hợp lệ');
        if ((!is_numeric($phone) || strlen($phone) < 8)  && !empty($phone)) throw new Exception('Số điện thoại liên hệ không hợp lệ');
        if (Account::exist($mssv)) throw new Exception('Mã số sinh viên này đã tồn tại trong hệ thống');
        if (empty($mssv) || empty($name)) throw new Exception('Vui lòng không bỏ trống tên và mã số sinh viên');

        $class = strtoupper(str_replace(' ', '', $class));
        $name = str_replace('  ', ' ', $name);
        $name = mb_convert_case($name, MB_CASE_TITLE, "UTF-8");

        $db = DB::getInstance();
        $req = $db->prepare('INSERT INTO member (`Name`, idStudent, idClass, Email, Phone, Password) VALUES (:ten, :mssv, :class, :email, :phone, md5(:pass))');

        if (!$req->execute(array('ten' => $name, 'mssv' => $mssv, 'class' => $class, 'email' => $email, 'phone' => $phone, 'pass' => $password))) throw new Exception('Lỗi đăng ký không thành công, vui lòng liên hệ quản trị viên');
        return $db->lastInsertId();
    }
}