<script src="/assets/ckeditor/ckeditor.js"></script>
<div class="container">
    <p style="padding-top: 40px"></p>
    <div class="row">
        <div class="col-lg-2">
            <?php
                require_once('menu.php');
            ?>
        </div>
        <div class="col-lg">
            <div class="card">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs pull-left">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#Tab1" aria-expanded="true"><i class="fas fa-info-circle"></i> Thông tin bài học</a>
                        </li>
                        <?php
                        if (isset($lesson->test_type))
                        {
                            ?>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#Tab2" aria-expanded="true"><i class="fas fa-question-circle"></i> Danh sách câu hỏi</a>
                            </li>
                            <?php
                        }
                        ?>

                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#Tab3" aria-expanded="true"><i class="fas fa-users"></i> Thành viên tham gia</a>
                        </li>
                    </ul>
                </div>

                <div class="card-block tab-content">
                    <div class="alert alert-success" role="alert">
                        <?php
                        if (isset($lesson->test_type))
                        {
                            echo "Bài kiểm tra ";
                            if ($lesson->test_type == 0) echo "tự luận ";
                            else echo "trắc nghiệm ";
                        }
                        else echo "Bài học ";
                        ?>
                        này được tạo bởi <b><?= $lesson->name_creator ?></b> vào ngày <?= date("d/m/Y \l\ú\c H:i:s", strtotime($lesson->date_created)) ?>
                        <br>
                        Bài học thuộc lớp <a href="/admin/class?url=<?= _Class::find($lesson->id_class)->shorturl ?>"><b><?= $lesson->name_class ?></b></a>
                    </div>
                    <div id="Tab1" class="tab-pane fade active show" aria-expanded="true">
                        <input type="text" class="form-control" id="txtInfoID" value="<?= $lesson->id ?>" hidden>

                        <div class="form-group">
                            <label>Tiêu đề bài học</label>
                            <input type="text" class="form-control" id="txtInfoTitle" placeholder="Tiêu đề bài học" value="<?= $lesson->title ?>">
                            <small class="form-text text-muted">Thay đổi trường này sẽ làm cho đường dẫn truy cập bài học bị thay đổi.</small>
                        </div>

                        <div class="form-group">
                            <label class="form-control-label">Yêu cầu học trước bài</label>
                            <select class="form-control" id="txtInfoRequire">
                                <option value="">Không yêu cầu</option>
                                <?php
                                $lesson_list = Lesson::all($lesson->id_class);
                                foreach ($lesson_list as $item)
                                {
                                    if ($item->id == $lesson->id) continue;
                                    ?>
                                    <option value="<?= $item->id ?>" <?= $item->id == $lesson->lesson_require ? "selected" : "" ?>><?= $item->title ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <?php
                        if (isset($lesson->test_type))
                        {
                            ?>
                            <div class="card">
                                <div class="card-header" role="tab">
                                    <h5 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#divDieuKien" aria-expanded="false" aria-controls="collapseTwo">
                                            <i class="fas fa-check-circle"></i> Ràng buộc thời gian làm bài
                                        </a>
                                    </h5>
                                </div>

                                <div id="divDieuKien" class="collapse" role="tabpanel">
                                    <div class="card-block">
                                        <div class="form-group">
                                            <label>Thời gian tối đa hoàn tất</label>
                                            <input type="number" class="form-control" id="txtInfoLimitTime" value="<?= $lesson->test_limit_time ?>">
                                            <small class="form-text text-muted">Nhập vào một số nguyên, tính bằng phút. Nếu bạn không nhập hoặc là số âm thì bài kiểm tra này được hiểu không giới hạn thời gian làm bài</small>
                                        </div>
                                        <?php
                                            if ($lesson->test_type == 1)
                                            {
                                                ?>
                                                <div class="form-group">
                                                    <label>Số câu hỏi trắc nghiệm</label>
                                                    <input type="number" class="form-control" id="txtInfoLimitNumber" value="<?= $lesson->test_limit_number ?>">
                                                    <small class="form-text text-muted">Nhập vào một số nguyên để hệ thống sinh ngẫu nhiên. Nếu bạn không nhập hoặc là số âm thì bài kiểm tra sẽ hiển thị toàn bộ câu trắc nghiệm</small>
                                                </div>
                                                <?php
                                            }
                                        ?>
                                        <div class="form-group">
                                            <label>Hạn chót nộp bài</label>
                                            <small class="form-text text-muted">Nếu bỏ trống đồng nghĩa với việc không giới hạn ngày nộp</small>
                                            <input class="form-control" type="datetime-local" value="<?= empty($lesson->test_dateline) ? "" : date("Y-m-d\TH:i", strtotime($lesson->test_dateline)) ?>" id="txtInfoLimitDate">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <?php
                        }
                        ?>
                        <div class="form-group">
                            <label>Nội dung bài học</label>
                            <textarea class="form-control" id="txtInfoDetail" name="txtInfoDetail" rows="10" cols="80"><?= $lesson->content; ?></textarea>
                        </div>

                        <div class="text-right">
                            <button type="button" class="btn btn-primary btn-lg" onclick="_SaveLesson()"><i class="fas fa-save"></i> Lưu thông tin</button>

                        </div>
                    </div>
                    <?php
                        if (isset($lesson->test_type))
                        {
                            require_once ("test_info.php");
                        }
                    ?>
                    <div id="Tab3" class="tab-pane fade" aria-expanded="true">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fas fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Nhập tên hoặc mã sinh viên để tìm kiếm">
                        </div>
                        <br>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>MSSV</th>
                                    <th>Họ tên</th>
                                    <th>Lớp</th>
                                    <th>Ngày xem</th>
                                    <?= $lesson->isTest() ? "<th>Điểm số</th>" : "" ?>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $i = 0;
                                $student_list = Lesson::student_all($lesson->id);
                                foreach ($student_list as $item) {
                                    ?>
                                    <tr>
                                        <th scope="row"><?= ++$i ?></th>
                                        <td><?= $item["mssv"] ?></td>
                                        <td><?= $item["name"] ?></td>
                                        <td><?= $item["class"] ?></td>
                                        <td><?= date("d/m/Y \l\ú\c H:i:s", strtotime($item["date"])) ?></td>
                                        <?php
                                        if ($lesson->isTest())
                                        {
                                            echo "<td><a onclick=\"window.open('/admin/test?id=". $lesson->id ."&student=". $item["id"] ."','name','width=800,height=600')\" href='javascript:void(0)' target='_blank'>";
                                            if ($lesson->isDone($item["id"]) > 0)
                                            {
                                                if ($lesson->isMark($item["id"]))
                                                {
                                                    echo '<span class="badge badge-pill badge-primary"><i class="fas fa-star"></i> Điểm: '. $lesson->getTestPoint($item["id"]) .'</span>';
                                                }
                                                else
                                                {
                                                    echo '<span class="badge badge-pill badge-danger"><i class="fas fa-clipboard-list"></i> Đợi chấm</span>';
                                                }
                                            }
                                            else
                                            {
                                                echo '<span class="badge badge-pill badge-warning"><i class="fas fa-user-clock"></i> Đang làm</span>';
                                            }
                                            echo "</a></td>";
                                        }
                                        ?>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group" id-member="<?= $item["id"] ?>">
                                                <?php
                                                if ($lesson->isTest())
                                                {
                                                    ?>
                                                    <button onclick="window.open('/admin/test?id=<?= $lesson->id ?>&student=<?= $item["id"] ?>','name','width=800,height=600')" type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Xem thông tin"><i class="fas fa-eye"></i></button>
                                                    <?php
                                                }
                                                ?>
                                                <button type="button" class="btn btn-danger" name="btn-student-delete" data-toggle="tooltip" data-placement="top" title="Xóa khỏi khóa học"><i class="fas fa-trash"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    CKEDITOR.replace( 'txtInfoDetail' );

    function _SaveLesson() {
        var _id = $("#txtInfoID").val();
        var _title = $("#txtInfoTitle").val();
        var _detail = CKEDITOR.instances.txtInfoDetail.getData();
        var _require = $("#txtInfoRequire").val();
        var _test_limit_time = "";
        var _test_limit_number = "";
        var _test_limit_date = "";
        if ($("#txtInfoLimitTime").val() != undefined) _test_limit_time = $("#txtInfoLimitTime").val();
        if ($("#txtInfoLimitNumber").val() != undefined) _test_limit_number = $("#txtInfoLimitNumber").val();
        if ($("#txtInfoLimitDate").val() != undefined) _test_limit_date = $("#txtInfoLimitDate").val();


        if (_title.length < 1)
        {
            alert("Vui lòng nhập tiêu đề khóa học để tiến hành tạo mới");
            return;
        }
        $.ajax({
            url : "/index.php?ajax=lesson_save",
            type : "post",
            dateType:"text",
            data : {
                id : _id,
                title : _title,
                detail : _detail,
                require : _require,
                limit_time : _test_limit_time,
                limit_number : _test_limit_number,
                limit_date : _test_limit_date
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        alert("Lưu dữ liệu thành công");
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

    $(document).delegate("button[name='btn-student-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa thành viên ra khỏi bài học này?\nToàn bộ dữ liệu liên quan đến sinh viên trong bài học này cũng sẽ bị xóa theo.")) return;
        var _id_student = $(this).parent().attr("id-member");
        var _id = $("#txtInfoID").val();
        var _btn = $(this);
        $.ajax({
            url : "/index.php?ajax=lesson_remove_student",
            type : "post",
            dateType:"text",
            data : {
                id_student : _id_student,
                id : _id
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        var _i = 0;
                        var _table = _btn.parent().parent().parent().parent();
                        _btn.parent().parent().parent().remove();
                        _table.find('tr').each(function() {
                            $(this).find('th').html(++_i);
                        });
                    }
                }
                catch(err)
                {
                    alert("Có lỗi xảy ra, trang sẽ được refresh lại\n"+err+"\n" + result);
                    location.reload(true);
                }
            }
        });
    });
</script>