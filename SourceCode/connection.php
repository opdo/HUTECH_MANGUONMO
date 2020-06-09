<?php
/**
 * Created by PhpStorm.
 * User: Vinh Pham
 * Date: 10/8/2018
 * Time: 7:41 PM
 */
class DB
{
    private static $instance = NULl;
    public static function getInstance() {
        if (!isset(self::$instance)) {
            try {
                self::$instance = new PDO('mysql:host=localhost;dbname=elearning_db', 'root', '');
                self::$instance->exec("SET NAMES 'utf8'");
            } catch (PDOException $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }
}