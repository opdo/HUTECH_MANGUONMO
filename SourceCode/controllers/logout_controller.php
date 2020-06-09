<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 10/8/2018
 * Time: 7:45 PM
 */
require_once('controllers/base_controller.php');

class LogoutController extends BaseController
{
    function __construct()
    {
        $this->folder = 'pages';
    }

    public function home()
    {
        if (isset($_SESSION["USER"]))
        {
           unset($_SESSION["USER"]);
        }
        header("Location: /");
        die();
    }
}