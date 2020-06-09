<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 10/8/2018
 * Time: 7:42 PM
 */
$controllers = array(
    'pages' => ['home', 'error'],
    'admin' => ['home', '_class', 'system', 'lesson', 'test'],
    'system' => ['home'],
    'class' => ['home'],
    'logout' => ['home']
); // Các controllers trong hệ thống và các action có thể gọi ra từ controller đó.

// Nếu các tham số nhận được từ URL không hợp lệ (không thuộc list controller và action có thể gọi
// thì trang báo lỗi sẽ được gọi ra.
if (!array_key_exists($controller, $controllers) || !in_array($action, $controllers[$controller])) {
    $controller = 'pages';
    $action = 'error';
}

// Nhúng file định nghĩa controller vào để có thể dùng được class định nghĩa trong file đó
include_once('controllers/' . $controller . '_controller.php');
// Tạo ra tên controller class từ các giá trị lấy được từ URL sau đó gọi ra để hiển thị trả về cho người dùng.
$klass = str_replace('_', '', ucwords($controller, '_')) . 'Controller';
$controller = new $klass;
$controller->$action();