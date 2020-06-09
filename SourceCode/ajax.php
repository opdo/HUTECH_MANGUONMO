<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 11/8/2018
 * Time: 9:10 PM
 */

$ajax = $_GET["ajax"];
$result = array('success' => 0);
switch ($ajax)
{
    case "login":
        require_once('models/account.php');
        if (!isset($_SESSION["USER"]))
        {
            $account = isset($_POST["account"]) ? $_POST["account"] : "";
            $password = isset($_POST["password"]) ? $_POST["password"] : "";
            try {
                $login = Account::login($account, $password);
                $result["success"] = 1;
                $_SESSION["USER"] = $login;
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        else
        {
            $result["msg"] = "Vui lòng đăng xuất để có thể đăng nhập tài khoản khác";
        }
        break;
    case "reg":
        if (isset($_SESSION["USER"]))
        {
            $result["msg"] = "Vui lòng đăng xuất để có thể đăng ký tài khoản khác";
            break;
        }

        require_once('models/account.php');

        try {
            $account = $_POST["account"];
            $password = $_POST["password"];
            $name = $_POST["name"];
            $class = $_POST["idclass"];
            $email = $_POST["email"];
            $phone = $_POST["phone"];

            if (1)
            {
                $checkInfo = new Account(null, $account, "", $name, $class);
                $name = $checkInfo->checkInfoHUTECH();
                if ($name === false) throw new Exception("Họ tên hoặc lớp của sinh viên này không trùng khớp với mã số sinh viên\nVui lòng sử dụng thông tin thật");
            }

            Account::reg($account, $password, $name, $class, $email, $phone);
            $result["success"] = 1;
        } catch (Exception $e) {
            $result["success"] = 0;
            $result["msg"] = $e->getMessage();
        }
        break;

    case "member_info":
        if (isset($_SESSION["USER"], $_POST["id"]))
        {
            try {

                $user = $_SESSION["USER"];
                $id = $_POST["id"];

                $info = Account::find($id);
                if (!$user->admin) $info = new Account($info->id, $info->mssv, null,$info->name);
                else
                {
                    $result["admin"] = $info->infoAdmin();
                }
                $result["info"] = $info;
                $result["success"] = 1;
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        else
        {
            $result["msg"] = "Thiếu dữ kiện đầu vào";
        }
        break;
    case "member_save":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/account.php');

                try {
                    $id = isset($_POST["id"]) ? $_POST["id"] : null;

                    $status = 0;
                    try
                    {
                        $info = Account::find($id);
                        $status = $info->status;
                    }
                    catch (Exception $e)
                    {

                    }
                    $role = isset($_POST["role"]) ? (intval($_POST["role"]) > 0 ? 1 : 0) : 0;
                    $account = $_POST["account"];
                    $password = isset($_POST["password"]) ? $_POST["password"] : "";
                    $name = $_POST["name"];
                    $class = isset($_POST["idclass"]) ? $_POST["idclass"] : "";
                    $email = isset($_POST["email"]) ? $_POST["email"] : "";
                    $phone = isset($_POST["phone"]) ? $_POST["phone"] : "";

                    $info = new Account($id, $account, $password, $name, $class, $email, $phone, $status);
                    $info->admin = $role;
                    $info->save();
                    $result["html"] = '<tr>
                        <th scope="row"></th>
                        <td>'. $info->mssv .'</td>
                        <td>'. $info->name .'</td>
                        <td>'. $info->class .'</td>
                        <td>'. $info->email .'</td>
                        <td>'. $info->phone. '</td>
                        <td>
                            <div class="btn-group btn-group-sm" role="group" id-member="'. $info->id .'">
                                <button type="button" class="btn btn-primary" name="btn-info"><i class="fas fa-eye"></i></button>
                                <button type="button" class="btn btn-warning" name="btn-lock" data-toggle="popover" data-placement="top" data-trigger="focus" data-content="Lệnh đã được thực hiện thành công. Thành viên này đã có thể truy cập hệ thống."><i class="fas fa-unlock"></i></button>
                                <button type="button" class="btn btn-danger" name="btn-delete" data-toggle="tooltip" data-placement="top" title="Xóa thành viên"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                        </tr>'
                        ;
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "member_lock":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/account.php');

                try {
                    $id = $_POST["id"];
                    $info = Account::find($id);
                    $info->status = intval($info->status) == 1 ? 0 : 1;
                    $info->password = "";
                    $info->save();
                    $result["status"] = $info->status;
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "member_delete":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/account.php');

                try {
                    $id = $_POST["id"];
                    $info = Account::find($id);
                    if ($user->id == $info->id) throw new Exception("Bạn không thể xóa chính mình");
                    $info->delete();
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "class_new":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/class.php');

                try {
                    $title = $_POST["title"];
                    $class = new _Class(null, null, $title);
                    $class->save();
                    $result["success"] = 1;
                    $result["url"] = "/admin/class?url=".$class->shorturl;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "class_delete":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/class.php');

                try {
                    $id = $_POST["id"];
                    $class = _Class::find($id);
                    $class->delete();
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "test_start":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            try {
                $id = $_POST["id"];
                $test = Test::find($id);
                if (Account::statusLesson($user->id, $test->lesson_require) > 0 || empty($test->lesson_require))
                {
                    if (!empty($test->test_dateline))
                    {
                        if (date("Y-m-d H:i:s") > $test->test_dateline) throw new Exception("Đã hết thời gian làm bài kiểm tra này");
                    }
                    $test->getTestQuestion($user->id);
                    $result["success"] = 1;
                }
                else throw new Exception("Bạn chưa đủ điều kiện tham gia bài học này");
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        break;

    case "test_mark":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            try {
                $id = $_POST["id"];
                $id_test = $_POST["id_test"];
                $mark = json_decode($_POST["mark"]);
                $test = Test::find($id_test);
                if (!$test->isDone($user->id)) throw new Exception("Sinh viên này chưa nộp bài kiểm tra này");
                $result["success"] = 1;
                foreach ($mark as $item)
                {
                    if (empty($item->point)) $item->point = 0;
                    $test->setTestPoint($id, $item->id, $item->point, $item->comment);
                }
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        break;

    case "test_save":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            try {
                $id = $_POST["id"];
                $answer = json_decode($_POST["answer"]);
                $test = Test::find($id);
                if (Account::statusLesson($user->id, $test->id) > 0)
                {
                    if (!empty($test->test_dateline))
                    {
                        if (date("Y-m-d H:i:s") > $test->test_dateline) throw new Exception("Đã hết thời gian làm bài kiểm tra này");
                    }
                    if ($test->isDone($user->id) > 0) throw new Exception("Bạn đã hoàn thành bài kiểm tra này");
                    $result["success"] = 1;
                    if ($test->outTime($user->id))
                    {
                        $result["reloadpage"] = 1;
                        $result["msg"] = "Kết quả không thể lưu do đã hết giờ làm bài";
                    }
                    else
                    {
                        foreach ($answer as $item)
                        {
                            $test->saveAnswer($user->id, $item->id, $item->answer);
                        }
                        $result["date_save"] = date("d/m/Y \l\ú\c H \g\i\ờ i \p\h\ú\\t s \g\i\â\y");
                    }
                }
                else throw new Exception("Bạn chưa tham gia bài kiểm tra này");
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        break;

    case "test_finish":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            try {
                $id = $_POST["id"];
                $test = Test::find($id);
                $result["success"] = 1;
                $test->setTestFinish($user->id);
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        break;

    case "class_remove_student":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {

                try {
                    $id = $_POST["id"];
                    $id_student = $_POST["id_student"];

                    $class = _Class::find($id);
                    $class->removeStudent($id_student);
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "class_add_student":
        if (isset($_SESSION["USER"])) {
            $user = $_SESSION["USER"];
            try {
                $id = $_POST["id"];
                $password = isset($_POST["password"]) ? $_POST["password"] : "";

                $class = _Class::find($id);
                if (!empty($class->password))
                {
                    if ($password != $class->password) throw new Exception("Mật khẩu khóa học không hợp lệ");
                }

                $class->addStudent($user->id);
                $result["success"] = 1;
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        break;
    case "class_save":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $id = $_POST["id"];
                    $title = $_POST["title"];
                    $detail = isset($_POST["detail"]) ? $_POST["detail"] : "";
                    $status = isset($_POST["status"]) ? $_POST["status"] : "";
                    $password = isset($_POST["password"]) ? $_POST["password"] : "";
                    if (intval($status) > 2) $status = 2;
                    if (intval($status) < 0) $status = 0;
                    $class = _Class::find($id);
                    $class->detail = $detail;
                    $class->title = $title;
                    $class->status = $status;
                    $class->password = $password;
                    $class->save();
                    $result["success"] = 1;
                    $result["url"] = "/admin/class?url=".$class->shorturl;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "class_require_add":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/class.php');
                try {
                    $id = $_POST["id"];
                    $id_require = $_POST["id_require"];
                    $class = _Class::find($id);
                    $class_require = _Class::find($id_require);
                    if ($class->id == $class_require->id) throw new Exception("Không thể thêm khóa học trước là chính nó");
                    $class->addRequire($id_require);
                    $html = '
                        <tr>
                            <th scope="row"></th>
                            <td>'. $class_require->shorturl .'</td>
                            <td>'. $class_require->title .'</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group" id-class="'. $class_require->id .'">
                                    <button type="button" class="btn btn-danger" name="btn-info-delete" data-toggle="tooltip" data-placement="top" title="Xóa điều kiện"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                    ';
                    $result["success"] = 1;
                    $result["html"] = $html;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "class_require_delete":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                require_once('models/class.php');
                try {
                    $id = $_POST["id"];
                    $id_require = $_POST["id_require"];
                    $class = _Class::find($id);
                    $class_require = _Class::find($id_require);
                    $class->deleteRequire($id_require);
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "lesson_new":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $title = $_POST["title"];
                    $id_class = $_POST["id_class"];
                    $type = isset($_POST["type"]) ? $_POST["type"] : -1;

                    if ($type >= 0) $lesson = new Test(null, $title, $type);
                    else $lesson = new Lesson(null, $title);
                    $lesson->id_class = $id_class;
                    $lesson->save();

                    $result["success"] = 1;
                    $result["url"] = "/admin/lesson?id=".$lesson->id;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "lesson_save":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $id = $_POST["id"];
                    $title = $_POST["title"];
                    $detail = isset($_POST["detail"]) ? $_POST["detail"] : "";
                    $require = isset($_POST["require"]) ? $_POST["require"] : "";
                    try
                    {
                        $lesson = Test::find($id);
                        $limit_time = isset($_POST["limit_time"]) ? $_POST["limit_time"] : null;
                        $limit_number = isset($_POST["limit_number"]) ? $_POST["limit_number"] : null;
                        $limit_date = isset($_POST["limit_date"]) ? $_POST["limit_date"] : null;
                        if ($limit_number < 0) $limit_number = 0;
                        if ($limit_time < 0) $limit_time = 0;
                        $lesson->test_limit_number = $limit_number;
                        $lesson->test_limit_time = $limit_time;
                        if (!empty($limit_date)) $lesson->test_dateline = new DateTime($limit_date);
                    }
                    catch (Exception $e)
                    {
                        $lesson = Lesson::find($id);
                    }
                    $lesson->content = $detail;
                    $lesson->title = $title;
                    $lesson->lesson_require = empty($require) ? null : $require;
                    $lesson->save();
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "lesson_delete":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $id = $_POST["id"];
                    $lesson = Lesson::find($id);
                    $lesson->delete();
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;

    case "lesson_remove_student":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {

                try {
                    $id = $_POST["id"];
                    $id_student = $_POST["id_student"];

                    $lesson = Lesson::find($id);
                    $lesson->removeStudent($id_student);

                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;

    case "question_info":
        if (isset($_SESSION["USER"], $_POST["id"]))
        {
            try {

                $user = $_SESSION["USER"];
                $id = $_POST["id"];

                $info = Question::find($id);
                if (!$user->admin) $info->answer = null;

                $result["info"] = $info;
                $result["success"] = 1;
            } catch (Exception $e) {
                $result["success"] = 0;
                $result["msg"] = $e->getMessage();
            }
        }
        else
        {
            $result["msg"] = "Thiếu dữ kiện đầu vào";
        }
        break;
    case "question_save":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $id_question = isset($_POST["id_question"]) ? $_POST["id_question"] : null;;
                    $id_lesson = $_POST["id_lesson"];
                    $content = $_POST["content"];
                    $limit_number = isset($_POST["limit_number"]) ? $_POST["limit_number"] : null;
                    $answer = array(
                        0 => isset($_POST["answer_r"]) ? $_POST["answer_r"] : null,
                        1 => isset($_POST["answer_a"]) ? $_POST["answer_a"] : null,
                        2 => isset($_POST["answer_b"]) ? $_POST["answer_b"] : null,
                        3 => isset($_POST["answer_c"]) ? $_POST["answer_c"] : null,
                        4 => isset($_POST["answer_d"]) ? $_POST["answer_d"] : null
                    );

                    $lesson = Test::find($id_lesson);
                    $question = new Question($id_question, $id_lesson,$content, $answer, $limit_number);
                    $question->save();
                    $result["short_content"] = StringEx::get_words(strip_tags($question->content));
                    $result["html"] = '<tr>
                        <th scope="row"><?= ++$i ?></th>
                        <td>'. StringEx::get_words(strip_tags($question->content)) .'...</td>
                        <td>
                            <div class="btn-group btn-group-sm" role="group" id-question="'. $question->id .'">
                                <button type="button" class="btn btn-primary" name="btn-question-info"><i class="fas fa-eye"></i></button>
                                <button type="button" class="btn btn-danger" name="btn-question-delete" data-toggle="tooltip" data-placement="top" title="Xóa khỏi bài kiểm tra"><i class="fas fa-trash"></i></button>
                            </div>
                        </td>
                </tr>';
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;

    case "question_delete":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $id = $_POST["id"];
                    $question = Question::find($id);
                    $question->delete();
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
    case "system_save":
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->admin)
            {
                try {
                    $title = $_POST["title"];
                    $detail = $_POST["detail"];
                    $keyword = isset($_POST["keyword"]) ? $_POST["keyword"] : null;
                    $system = new System($title, $detail, $keyword);
                    $system->save();
                    $result["success"] = 1;
                } catch (Exception $e) {
                    $result["success"] = 0;
                    $result["msg"] = $e->getMessage();
                }
            }
        }
        break;
}

// trả giá trị về
echo json_encode($result);
die();
