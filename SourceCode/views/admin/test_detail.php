<div class="container">
    <br>
    <div class="row">
        <div class="col-md">
            <h6><i>Mã số sinh viên</i></h6>
            <h5><?= $student->mssv ?></h5>
        </div>
        <div class="col-md">
            <h6><i>Họ tên sinh viên</i></h6>
            <h5><?= $student->name ?></h5>
        </div>
        <div class="col-md">
            <h6><i>Mã lớp</i></h6>
            <h5><?= $student->class ?></h5>
        </div>
    </div>
    <?php
        if ($test->test_type == 0 && $test->isMark($student->id))
        {
            ?>
            <div class="row">
                <div class="col-md">
                    <h6><i>Người chấm</i></h6>
                    <h5><?= $answer[0]->point_name ?></h5>
                </div>
                <div class="col-md">
                    <h6><i>Ngày chấm</i></h6>
                    <h5><?= $answer[0]->point_date ?></h5>
                </div>
                <div class="col-md">
                    <h6><i>Điểm</i></h6>
                    <h5><?= $test->getTestPoint($student->id) ?></h5>
                </div>
            </div>
            <?php
        }
        elseif ($test->test_type == 1)
        {
            if ($test->isDone($student->id) > 0)
            {
                ?>
                <div class="row">

                    <div class="col-md">
                        <h6><i>Ngày nộp</i></h6>
                        <h5><?= date("d/m/Y \l\ú\c H:i:s", strtotime($answer[0]->point_date)) ?></h5>
                    </div>
                    <div class="col-md">
                        <h6><i>Điểm</i></h6>
                        <h5><?= $test->getTestPoint($student->id) ?></h5>
                    </div>
                    <div class="col-md">
                    </div>
                </div>
                <?php
            }
        }
    ?>
    <br>
    <div class="card">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs pull-left">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#Tab1" aria-expanded="true"><i class="fas fa-info-circle"></i> Nội dung bài kiểm tra</a>
                </li>
            </ul>
        </div>
        <div class="card-block tab-content">
            <div id="Tab1" class="tab-pane fade active show" aria-expanded="true">
                <input type="password" class="form-control"  id="txtStudentID" value="<?= $student->id ?>" hidden>
                <input type="password" class="form-control"  id="txtTestID" value="<?= $test->id ?>" hidden>

                <?php
                    if ($test->isDone($student->id) > 0)
                    {
                        $i = 0;
                        foreach ($answer as $item)
                        {
                            ?>
                            <div class="card">
                                <div class="card-header">
                                    <b>Câu hỏi số <?= ++$i ?></b>
                                </div>
                                <div class="card-block">
                                    <p class="card-text"><?= $item->content ?></p>
                                    <?php
                                    if ($test->test_type == 0)
                                    {
                                        ?>
                                        <div class="form-group question" id-question="<?= $item->id ?>">
                                            <label>Câu trả lời</label>
                                            <textarea name="question<?= $item->id ?>" class="form-control" rows="3" readonly><?= $item->_answer ?></textarea>
                                        </div>


                                        <div class="alert alert-info admin-mark" id-mark="<?= $item->id ?>" role="alert">
                                            <strong>Phần chấm điểm của giảng viên</strong>
                                            <div class="form-group">
                                                <label><i class="fas fa-star"></i> Điểm số</label>
                                                <input type="number" class="form-control" name="markpoint<?= $item->id ?>" value="<?= $item->point ?>">
                                                <small class="form-text text-muted">Chấp nhận số thực, điểm tổng sẽ được làm tròn đến chữ số thập phân thứ nhất</small>
                                            </div>

                                            <div class="form-group">
                                                <label><i class="fas fa-comment"></i> Nhận xét của giảng viên</label>
                                                <textarea name="markcomment<?= $item->id ?>" class="form-control" rows="3"><?= $item->comment ?></textarea>
                                            </div>
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
                                                    <input type="radio" name="question<?= $item->id ?>" value="<?= $j ?>" class="custom-control-input" <?= intval($item->_answer) == $j ? "checked" : "disabled" ?>>
                                                    <span class="custom-control-indicator <?= intval($item->_answer) == $j ? ($item->answer[0] == $item->_answer ? "bg-success" : "bg-danger") : "" ?>"></span>
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

                        if ($test->test_type == 0)
                        {
                            ?>
                        <div class="fixed-bottom" style="background-color: rgba(41, 43, 44, 0.4); padding: 5px 10px 5px 5px">
                            <div class="text-right">
                                <button class="btn btn-danger" onclick="_Save()"><i class="fas fa-save"></i> Lưu điểm</button>
                            </div>
                        </div>

                            <script>
                                function _GetMark() {
                                    var answer = [];

                                    $( ".admin-mark" ).each(function( index ) {
                                        var _id = $(this).attr("id-mark");
                                        var _point = $('input[name=markpoint'+ _id +']').val();
                                        if (_point == undefined) _point = 0;
                                        var _comment = $('textarea[name=markcomment'+ _id +']').val();
                                        if (_comment == undefined) _comment = "";
                                        answer.push({id: _id, point: _point, comment : _comment});
                                    });

                                    return JSON.stringify(answer);
                                }

                                function _Save() {
                                    var _mark = _GetMark();
                                    var _id = $("#txtStudentID").val();
                                    var _id_test = $("#txtTestID").val();

                                    $.ajax({
                                        url : "/index.php?ajax=test_mark",
                                        type : "post",
                                        dateType:"text",
                                        data : {
                                            mark : _mark,
                                            id : _id,
                                            id_test : _id_test
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
                                                    alert("Chấm bài thành công!");
                                                    location.reload(true);
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
                    }
                    else
                    {
                        ?>
                        <div class="alert alert-danger" role="alert">
                            <strong><i class="fas fa-2x fa-shield-alt"></i> Sinh viên này chưa hoàn tất bài kiểm tra và chưa hết giờ nộp bài, vui lòng đợi sau khi sinh viên ấn nộp bài giảng viên mới có thể chấm</strong>
                        </div>
                        <?php
                    }
                ?>
            </div>
        </div>
    </div>
</div>