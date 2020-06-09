<?php
/**
 * Created by PhpStorm.
 * User: Vinh Pham
 * Date: 10/8/2018
 * Time: 7:40 PM
 */
require_once('models/stringex.php');
require_once('models/account.php');
require_once('models/class.php');
require_once('models/lesson.php');
require_once('models/test.php');
require_once('models/question.php');
require_once('models/system.php');
require_once('models/answer.php');

date_default_timezone_set("Asia/Ho_Chi_Minh");
session_start();

require_once('connection.php');

if (isset($_GET['ajax'])) require_once('ajax.php');
if (isset($_GET['controller'])) {
    $controller = empty($_GET['controller']) ? "pages" : $_GET['controller'];;
    if (isset($_GET['action'])) {
        $action = empty($_GET['action']) ? "home" : $_GET['action'];
    } else {
        $action = 'home';
    }
} else {
    $controller = 'pages';
    $action = 'home';
}
if ($action == "class") $action = "_class";

require_once('routes.php');