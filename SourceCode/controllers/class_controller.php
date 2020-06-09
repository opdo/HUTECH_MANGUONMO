<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 10/8/2018
 * Time: 7:45 PM
 */
require_once('controllers/base_controller.php');

class ClassController extends BaseController
{
    function __construct()
    {
        $this->folder = 'pages';
    }

    public function home()
    {
        if (isset($_SESSION["USER"]))
        {
            if (isset($_GET["url"]))
            {
                try
                {
                    $class = _Class::findURL($_GET["url"]);
                    $WEB = array('TITLE' => $class->title);
                    $data = array('user' => $_SESSION["USER"], 'class' => $class, '_WEB' => $WEB);
                    if (Account::inClass($_SESSION["USER"]->id, $class->id))
                    {
                        $this->render('class_study', $data);
                    }
                    else
                    {
                        $this->render('class_info', $data);
                    }
                }
                catch (Exception $e)
                {

                }
            }
            elseif (isset($_GET["lesson"]))
            {
                try
                {
                    $lesson = Lesson::find($_GET["lesson"]);
                    if ($lesson->isTest()) $lesson = Test::find($_GET["lesson"]);
                    $class = _Class::find($lesson->id_class);

                    $WEB = array('TITLE' => $lesson->title);
                    $data = array('user' => $_SESSION["USER"], 'class' => $class, 'lesson' => $lesson, '_WEB' => $WEB);
                    if (Account::inClass($_SESSION["USER"]->id, $class->id))
                    {
                        $this->render('lesson_info', $data);
                    }
                    else
                    {
                        $this->render('class_info', $data);
                    }
                }
                catch (Exception $e)
                {

                }
            }
            else
            {
                $WEB = array('TITLE' => 'Danh sách khóa học');
                $myclass_list = Account::allClass($_SESSION["USER"]->id);
                $class_list = _Class::all(1);
                $data = array(
                    'user' => $_SESSION["USER"],
                    '_WEB' => $WEB,
                    'myclass_list' => $myclass_list,
                    'class_list' => $class_list
                );
                $this->render('class', $data);
            }
        }
        else
        {
            $this->login();
        }
    }

    public function error()
    {
        $this->render('error');
    }

    public function login()
    {
        $this->render('home_guest');
    }
}