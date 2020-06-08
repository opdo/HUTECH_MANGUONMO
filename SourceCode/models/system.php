<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 15/8/2018
 * Time: 12:03 AM
 */
class System
{
    public $title, $detail, $keyword;

    function __construct($title, $detail, $keyword = null)
    {
        $this->title = $title;
        $this->detail = $detail;
        $this->keyword = $keyword;
    }

    public function save()
    {
        $admin = $_SESSION["USER"];
        if (!$admin->isAdmin()) throw new Exception('Bạn không có quyền truy cập mục này');
        $this->saveData("WEB_TITLE", $this->title);
        $this->saveData("WEB_DETAIL", $this->detail);
        $this->saveData("WEB_KEYWORD", $this->keyword);
        $this->saveData("LOG_SYS_EDIT_ID", $admin->id);
        $this->saveData("LOG_SYS_EDIT_TIME", date("Y/m/d H:i"));
    }

    public function saveData($id, $content)
    {
        $db = DB::getInstance();
        try
        {
            self::find($id);
            $req = $db->prepare('UPDATE parameter SET Content = :content WHERE idPARAMETER = :id');
            if (!$req->execute(array('id' => $id, 'content' => $content))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }
        catch (Exception $e)
        {
            $req = $db->prepare('INSERT INTO parameter VALUES (:id, :content)');
            if (!$req->execute(array('id' => $id, 'content' => $content))) throw new Exception("Lỗi thao tác cơ sở dữ liệu, vui lòng thử lại sau\n" . var_export($req->errorInfo()));
        }
    }

    public static function find($id)
    {
        if (empty($id)) throw new Exception('Thông tin nhập vào không đầy đủ');
        $db = DB::getInstance();
        $req = $db->prepare('SELECT * FROM parameter WHERE idPARAMETER = :id');
        $req->execute(array('id' => $id));
        $item = $req->fetch();
        if (isset($item['idPARAMETER'])) return $item["Content"];
        throw new Exception('Trường dữ liệu này không tồn tại');
    }
}