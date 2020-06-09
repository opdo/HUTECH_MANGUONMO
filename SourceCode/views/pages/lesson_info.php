<?php
    $string_disbaled = 'aria-disabled="true" href="#"';
    try
    {
        $lesson_pre = "href='/class?lesson=". $lesson->getPreLesson()->id ."' ";
    }
    catch (Exception $e)
    {
        $lesson_pre = $string_disbaled;
    }

    try
    {
        $lesson_next = " href='/class?lesson=". $lesson->getNextLesson()->id ."'";
    }
    catch (Exception $e)
    {
        $lesson_next = $string_disbaled;
    }
?>
<div class="container">
    <p style="padding-top: 30px"></p>
    <input type="text" class="form-control"  id="txtLessonID" value="<?= $lesson->id ?>" hidden>
    <h1 class="display-4"><?= $lesson->title ?></h1>
    <a href="/class?url=<?= $class->shorturl ?>"><button type="button" class="btn btn-outline-primary"><i class="fas fa-graduation-cap"></i> <?= $class->title ?></button></a>
    <br>
    <br>
    <?php
    if (isset($lesson->test_type))
    {
        if ($lesson->isDone($user->id) > 0)
        {
            require_once ('test_rank.php');
        }
    }
    ?>

    <div class="jumbotron">
        <h3><i class="fas fa-info-circle"></i> Nội dung <?= $lesson->isTest() ? "bài kiểm tra" : "bài học" ?></h3>
        <hr class="my-4">
        <?php
        if ($class->status == 1)
        {
            if (Account::statusLesson($user->id, $lesson->lesson_require) > 0 || empty($lesson->lesson_require))
            {
                if (!$lesson->isTest())
                {
                    if (!$lesson->checkStudent($user->id)) $lesson->addStudent($user->id);
                    echo $lesson->content;
                }
                else
                {
                    $list_question = Answer::all_Answer($user->id, $lesson->id);
                    if (count($list_question) < 1)
                    {
                        echo $lesson->content;
                        if (!empty($lesson->content)) echo "<hr>";
                        ?>
                        <div class="alert alert-info" role="alert">
                            <strong>Xin lưu ý!</strong> Bạn chỉ có thể làm một lần duy nhất và không thể chỉnh sửa sau khi làm, hệ thống sẽ <b>tự động lưu câu trả lời của bạn mỗi 20 giây</b>, khi hết giờ làm bài hoặc ấn nộp bài thì đồng nghĩa với việc bạn không còn được thay đổi đáp án.
                            <ul>
                                <li><i>Hình thức: </i><?= $lesson->test_type == 0 ? "Tự luận" : "Trắc nghiệm" ?></li>
                                <li><i>Số câu hỏi: </i><?= (empty($lesson->test_limit_number) || $lesson->test_limit_number < 1) ? Question::count($lesson->id) : $lesson->test_limit_number ?> câu</li>
                                <li><i>Thời gian làm: </i><?= empty($lesson->test_limit_time)? "Không giới hạn" : $lesson->test_limit_time . " phút" ?></li>
                                <li><i>Hạn chót làm: </i><?= empty($lesson->test_dateline)? "Không giới hạn" : date("d/m/Y \l\ú\c H:i", strtotime($lesson->test_dateline)) ?></li>
                            </ul>
                        </div>
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="_StartTest()" id="btnStartTest"><i class="fas fa-hand-point-right"></i> Bắt đầu làm bài</button>
                        <script>
                    function _StartTest() {
                        var _btn = $("#btnStartTest");
                        _btn.html('<i class="fa fa-spinner fa-pulse fa-fw margin-bottom"></i> Đang tạo câu hỏi, vui lòng đợi');
                        _btn.prop('disabled', true);
                        var _id = $("#txtLessonID").val();
                        $.ajax({
                            url : "/index.php?ajax=test_start",
                            type : "post",
                            dateType:"text",
                            data : {
                                id : _id
                            },
                            success : function (result){
                                try
                                {
                                    var data = JSON.parse(result);
                                    if (data.success == 0) {
                                        alert(data.msg);
                                        _btn.html('<i class="fas fa-hand-point-right"></i> Bắt đầu làm bài');
                                        _btn.prop('disabled', false);
                                    }
                                    else
                                    {
                                        _btn.html('THÀNH CÔNG');
                                        _btn.prop('disabled', false);
                                        alert("Đã khởi tạo thành công danh sách câu hỏi kiểm tra, nhấn OK để bắt đầu tính giờ làm bài");
                                        location.reload(true);
                                        return true;
                                    }
                                }
                                catch(err)
                                {
                                    alert("Có lỗi xảy ra, trang sẽ được refresh lại\n" + err + "\n" + result);
                                    location.reload(true);
                                }
                            }
                        });
                    }
                </script>
                        <?php
                    }
                    else
                    {
                        if ($lesson->isDone($user->id) > 0 && Account::statusLesson($user->id, $lesson->id) > 0)
                        {
                            if ($lesson->test_type == 1)
                            {
                        ?>
                <div class="card">
                    <div class="card-block text-center">
                        <h1><i class="fas fa-grin-hearts"></i></h1>
                        <h5>Xin chúc mừng bạn đã hoàn thành bài kiểm tra này và đạt được số điểm là:</h5>
                        <h1 class="card-title display-3" id="mark1"><?= $lesson->getTestPoint($user->id) ?>/10</h1>
                    </div>
                </div>
                <?php
                            }
                            else
                            {
                                if (!$lesson->isMark($user->id))
                                {
                                    ?>
                <div class="card">
                    <div class="card-block text-center">
                        <h1><i class="fas fa-grin-hearts"></i></h1>
                        <h5>Xin chúc mừng bạn đã hoàn tất bài kiểm tra này, hiện đang đợi giảng viên chấm bài<br>Bạn vui lòng quay lại sau nhé!</h5>
                    </div>
                </div>
                                    <?php
                                }
                                else
                                {

                                    ?>
            <div class="card">
                <div class="card-block text-center">
                    <h1><i class="fas fa-grin-hearts"></i></h1>
                    <h5>Xin chúc mừng bạn đã hoàn thành bài kiểm tra này và đạt được số điểm là:</h5>
                    <h1 class="card-title display-3" id="mark1"><?= $lesson->getTestPoint($user->id) ?>/10</h1>
                </div>
            </div>
            <hr>

                                    <?php
                                    $i = 0;
                                    foreach ($list_question as $item)
                                    {
                                    ?>
                                    <div class="card">
                                        <div class="card-header">
                                            <b>Câu hỏi số <?= ++$i ?></b>
                                        </div>
                                        <div class="card-block">
                                            <p class="card-text"><?= $item->content ?></p>
                                            <br>
                                            <div class="alert alert-info admin-mark" id-mark="<?= $item->id ?>" role="alert">
                                                <div class="form-group">
                                                    <label>Câu trả lời của bạn</label>
                                                    <textarea class="form-control" rows="3" readonly><?= $item->_answer ?></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label><i class="fas fa-star"></i> Điểm số đạt được: </label>
                                                    <input type="number" class="form-control" value="<?= $item->point ?>" readonly>
                                                </div>

                                                <div class="form-group">
                                                    <label><i class="fas fa-comment"></i> Nhận xét của giảng viên</label>
                                                    <textarea class="form-control" rows="3" readonly><?= $item->comment ?></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <br>
                                    <?php
                                    }
                                }
                            }
                        }
                        else
                        {
                        // làm bài
                        if (!$lesson->checkStudent($user->id)) $lesson->addStudent($user->id);
                        ?>
                        <script src="/assets/js/jquery.countdown.min.js" type="text/javascript"></script>
                        <div class="card" <?= (empty($lesson->test_limit_time) || intval($lesson->test_limit_time) <=0) ? "hidden" : "" ?>>
                            <div class="card-header">
                                <b><i class="fas fa-3x fa-clock"></i> THỜI GIAN CÒN LẠI</b>
                            </div>
                            <div class="card-block text-center">
                                <h1 id="clock"></h1>
                            </div>
                        </div>
                        <br>
                    <?php
                        $i = 0;
                        foreach ($list_question as $item)
                        {
                        ?>
                <div class="card">
                    <div class="card-header">
                        <b>Câu hỏi số <?= ++$i ?></b>
                    </div>
                    <div class="card-block">
                        <p class="card-text"><?= $item->content ?></p>
                        <?php
                        if ($lesson->test_type == 0)
                        {
                            ?>
                            <div class="form-group question" id-question="<?= $item->id ?>">
                                <label>Câu trả lời</label>
                                <textarea name="question<?= $item->id ?>" class="form-control" <?= (isset($item->limit_number) || $item->limit_number <= 0) ? '' : 'maxlength="'. $item->limit_number .'"' ?> rows="3"><?= $item->_answer ?></textarea>
                            </div>
                            <?php
                        }
                        else
                        {
                            echo "<div id-question='". $item->id ."' class='question'>";
                            for ($j = 1; $j <= 4; $j++)
                            {
                                if (empty($item->answer[$j])) continue;
                                ?>
                                <div class="custom-controls-stacked">
                                    <label class="custom-control custom-radio">
                                        <input type="radio" name="question<?= $item->id ?>" value="<?= $j ?>" class="custom-control-input" <?= intval($item->_answer) == $j ? "checked" : "" ?>>
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description"><?= $item->answer[$j] ?></span>
                                    </label>
                                </div>
                                <?php
                            }
                            echo "</div>";
                        }
                        ?>
                    </div>
                </div>
            <br>
            <?php
            }

            ?>
            <div class="fixed-bottom" style="background-color: rgba(41, 43, 44, 0.4); padding: 5px 10px 5px 5px">
                <div class="row">
                    <div class="col-4 text-center hidden-lg-down">
                        <h2><span class="badge badge-primary"><i class="fas fa-clock"></i> <span id="clock2"></span></span></h2>
                    </div>
                    <div class="col-4 text-right hidden-lg-down">
                        <b id="spanSaveTime" class="text-white"></b>
                    </div>
                    <div class="col text-right">
                        <button class="btn btn-danger" onclick="_Finish()" id="btnFinishTest"><i class="fas fa-check"></i> Nộp bài</button>
                        <button class="btn btn-success" onclick="_Save()" id="btnSaveTest"><i class="fas fa-save"></i> Lưu lại</button>
                    </div>
                </div>
            </div>
            <script>
                <?php
                if (!empty($lesson->test_limit_time) && intval($lesson->test_limit_time) > 0)
                {
                ?>
                var _finish = false;
                $('#clock').countdown('<?= $lesson->getTimeLeft($user->id)->format('Y/m/d H:i:s') ?>')
                    .on('update.countdown', function(event) {
                        var format = '%H:%M:%S';
                        $(this).html(event.strftime(format));
                    })
                    .on('finish.countdown', function(event) {
                        $(this).parent().addClass('disabled');
                        if (!_finish)
                        {
                            _finish = true;
                            _Save();
                            alert("Đã hết giờ làm bài, bấm OK để tiến hành nộp bài");
                            _Finish(false);
                        }
                    });
                $('#clock2').countdown('<?= $lesson->getTimeLeft($user->id)->format('Y/m/d H:i:s') ?>')
                    .on('update.countdown', function(event) {
                        var format = '%H:%M:%S';
                        $(this).html(event.strftime(format));
                    });
                <?php
                }
                ?>



                <?php
                if ($lesson->test_type == 1)
                {
                ?>
                function _GetAnswer() {
                    var answer = [];

                    $( ".question" ).each(function( index ) {
                        var _id = $(this).attr("id-question");
                        var _answer = $('input[name=question'+ _id +']:checked').val();
                        if (_answer == undefined) _answer = "";
                        answer.push({id: _id, answer: _answer});
                    });

                    return JSON.stringify(answer);
                }
                <?php
                }
                else
                {
                ?>
                function _GetAnswer() {
                    var answer = [];

                    $( ".question" ).each(function( index ) {
                        var _id = $(this).attr("id-question");
                        var _answer = $('textarea[name=question'+ _id +']').val();
                        if (_answer == undefined) _answer = "";
                        answer.push({id: _id, answer: _answer});
                    });

                    return JSON.stringify(answer);
                }
                <?php
                }
                ?>
                function _Save() {
                    var _btn = $("#btnSaveTest");
                    _btn.html('<i class="fa fa-spinner fa-pulse fa-fw margin-bottom"></i> Đang lưu');
                    _btn.prop('disabled', true);

                    var _answer = _GetAnswer();
                    var _id = $("#txtLessonID").val();

                    $.ajax({
                        url : "/index.php?ajax=test_save",
                        type : "post",
                        dateType:"text",
                        data : {
                            answer : _answer,
                            id : _id
                        },
                        success : function (result){
                            try
                            {
                                var data = JSON.parse(result);
                                if (data.success == 0) {
                                    alert(data.msg);
                                }
                                else
                                {
                                    $("#spanSaveTime").html("Đã lưu vào ngày " + data.date_save);
                                    if (data.reloadpage != undefined)
                                    {
                                        alert(data.msg);
                                        location.reload(true);
                                    }
                                }
                                _btn.html('<i class="fas fa-save"></i> Lưu lại');
                                _btn.prop('disabled', false);
                            }
                            catch(err)
                            {
                                alert("Có lỗi xảy ra, trang sẽ được refresh lại\n" + err + "\n" + result);
                                location.reload(true);
                            }
                        }
                    });
                }
                function _Finish(_ask = true) {
                    _Save();
                    if (_ask)
                    {
                        if (!confirm("Bạn có chắc chắn muốn nộp bài không?\nBạn chỉ có thể nộp một lần và không thể chỉnh sửa đáp án sau khi nộp")) return;
                    }
                    var _btn = $("#btnFinishTest");
                    _btn.html('<i class="fa fa-spinner fa-pulse fa-fw margin-bottom"></i> Đang lưu');
                    _btn.prop('disabled', true);
                    var _id = $("#txtLessonID").val();
                    $.ajax({
                        url : "/index.php?ajax=test_finish",
                        type : "post",
                        dateType:"text",
                        data : {
                            id : _id
                        },
                        success : function (result){
                            try
                            {
                                var data = JSON.parse(result);
                                if (data.success == 0) {
                                    alert(data.msg);
                                }
                                else location.reload(true);

                                _btn.html('<i class="fas fa-check"></i> Nộp bài');
                                _btn.prop('disabled', false);


                            }
                            catch(err)
                            {
                                alert("Có lỗi xảy ra, trang sẽ được refresh lại\n" + err + "\n" + result);
                                location.reload(true);
                            }
                        }
                    });
                }
                setInterval(function(){ _Save(); }, 20000);

            </script>
        <?php

                        }
                    }
                }

            }
            else
            {
                $lesson_require = Lesson::find($lesson->lesson_require);
                ?>
                <div class="alert alert-danger" role="alert">
                     <strong>Khoan đã!</strong> Để học bài học này, bạn phải hoàn tất bài <b><a href="/class?lesson=<?= $lesson_require->id ?>"><?= $lesson_require->title  ?></a></b>
                </div>
                <?php
            }
        }
        else
        {
                ?>
            <div class="alert alert-danger" role="alert">
                <strong><i class="fas fa-2x fa-shield-alt"></i> Khóa học này đã được khóa hoặc ẩn bởi quản trị viên, bạn không thể xem hoặc thao tác trong khóa học này</strong>
            </div>
            <?php
        }
        ?>
        <br>
        <hr>
        <a role="button" class="btn btn-outline-primary float-left <?= $lesson_pre == $string_disbaled ? "disabled" : "" ?>" style="border-radius: 1rem" <?= $lesson_pre ?>><i class="fa fa-chevron-left" aria-hidden="true"></i> Bài trước</a>
        <a role="button" class="btn btn-outline-primary float-right <?= $lesson_next == $string_disbaled ? "disabled" : "" ?>" style="border-radius: 1rem" <?= $lesson_next ?>>Bài tiếp theo <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
    </div>
</div>