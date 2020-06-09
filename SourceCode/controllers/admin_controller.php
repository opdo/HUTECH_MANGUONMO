<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 10/8/2018
 * Time: 7:45 PM
 */
require_once('controllers/base_controller.php');

class AdminController extends BaseController
{
    function __construct()
    {
        $this->folder = 'admin';
    }

    public function system()
    {
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->isAdmin()) {
                $WEB = array('TITLE' => 'Quản trị hệ thống');
                $data = array(
                    '_WEB' => $WEB
                );
                $this->render('system', $data);
            }
        }
    }

    public function home()
    {
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->isAdmin()) {
                $WEB = array('TITLE' => 'Quản trị thành viên');
                $list = Account::all();
                $data = array('list' => $list, '_WEB' => $WEB);

                $this->render('home', $data);
            }
        }
    }

    public function _class()
    {
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->isAdmin()) {
                if (isset($_GET["url"]))
                {
                    try
                    {
                        $class = _Class::findURL($_GET["url"]);
                        $WEB = array('TITLE' => $class->title);

                        $student = _Class::student_all($class->id);
                        $data = array('class' => $class, 'student_list' => $student, '_WEB' => $WEB);
                        $this->render('class_info', $data);
                    }
                    catch (Exception $e)
                    {

                    }
                }
                else
                {
                    $WEB = array('TITLE' => 'Quản trị khóa học');

                    $list = _Class::all();
                    $data = array('list' => $list, '_WEB' => $WEB);
                    $this->render('class', $data);
                }
            }
        }
    }

    public function lesson()
    {
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->isAdmin()) {

                if (isset($_GET["id"]))
                {
                    try
                    {
                        try
                        {
                            $lesson = Test::find($_GET["id"]);
                        }
                        catch (Exception $e)
                        {
                            $lesson = Lesson::find($_GET["id"]);
                        }
                        $WEB = array('TITLE' => $lesson->title);
                        $data = array('lesson' => $lesson, '_WEB' => $WEB);
                        $this->render('lesson_info', $data);
                    }
                    catch (Exception $e)
                    {

                    }
                }
            }
        }
    }

    public function test()
    {
        if (isset($_SESSION["USER"]))
        {
            $user = $_SESSION["USER"];
            if ($user->isAdmin()) {

                if (isset($_GET["id"], $_GET["student"]))
                {
                    try
                    {
                        $student = Account::find($_GET["student"]);
                        $test = Test::find($_GET["id"]);
                        $answer = Answer::all_Answer($student->id, $test->id);
                        $WEB = array('TITLE' => $test->title);
                        $data = array('student' => $student,'user' => $user, 'test' => $test, '_WEB' => $WEB, 'answer' => $answer);
                        $this->render('test_detail', $data);
                    }
                    catch (Exception $e)
                    {

                    }
                }
            }
        }
    }
}