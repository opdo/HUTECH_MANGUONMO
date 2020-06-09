<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 10/8/2018
 * Time: 7:45 PM
 */
require_once('controllers/base_controller.php');

class PagesController extends BaseController
{
    function __construct()
    {
        $this->folder = 'pages';
    }

    public function home()
    {
        if (isset($_SESSION["USER"]))
        {
            $data = array(
                'user' => $_SESSION["USER"]
            );
            $this->render('home_user', $data);
        }
        else
        {
            $this->render('home_guest');
        }
    }

    public function error()
    {
        $this->render('error');
    }
}