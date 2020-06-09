<?php
/**
 * Created by PhpStorm.
 * User: opdo
 * Date: 30/9/2018
 * Time: 11:13 PM
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

$test = new Test(23);
$test->test_type = 1;
$test->test_limit_number = 8;
$executionStartTime = microtime(true);
$result = $test->randomQuestion();
$executionEndTime = microtime(true);
$seconds = $executionEndTime - $executionStartTime;

foreach ($result as $r)
{
    echo $r->id . ", ";
}
echo "\n";
echo $seconds;