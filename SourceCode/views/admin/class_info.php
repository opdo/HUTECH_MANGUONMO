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
                            <a class="nav-link active" data-toggle="tab" href="#Tab1" aria-expanded="true"><i class="fas fa-info-circle"></i> Thông tin khóa học</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#Tab2" aria-expanded="false"><i class="fas fa-book"></i> Quản lý bài học</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#Tab3" aria-expanded="false"><i class="fas fa-users"></i> Danh sách tham gia</a>
                        </li>
                    </ul>
                </div>
                <div class="card-block tab-content">
                    <div class="alert alert-success" role="alert">
                        Khóa học này được tạo bởi <b><?= $class->name_creator ?></b> vào ngày <?= date("d/m/Y \l\ú\c H:i:s", strtotime($class->date_created)) ?>
                    </div>

                    <div id="Tab1" class="tab-pane fade active show" aria-expanded="true">
                        <input type="text" class="form-control" id="txtInfoID" value="<?= $class->id ?>" hidden>

                        <div class="form-group">
                            <label>Tên khóa học</label>
                            <input type="text" class="form-control" id="txtInfoTitle" placeholder="Tên khóa học" value="<?= $class->title ?>">
                            <small class="form-text text-muted">Thay đổi trường này sẽ làm cho đường dẫn truy cập khóa học bị thay đổi.</small>
                        </div>

                        <div class="form-group">
                            <label class="form-control-label">Trạng thái</label>
                            <select class="form-control" id="txtInfoStatus">
                                <option value="0" <?= $class->status == 0 ? "selected" : "" ?>>Ẩn</option>
                                <option value="1" <?= $class->status == 1 ? "selected" : "" ?>>Mở</option>
                                <option value="2" <?= $class->status == 2 ? "selected" : "" ?>>Khóa</option>
                            </select>
                        </div>

                        <div class="card">
                            <div class="card-header" role="tab">
                                <h5 class="mb-0">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#divDieuKien" aria-expanded="false" aria-controls="collapseTwo">
                                        <i class="fas fa-check-circle"></i> Ràng buộc điều kiện tham gia
                                    </a>
                                </h5>
                            </div>
                            <div id="divDieuKien" class="collapse" role="tabpanel">
                                <div class="card-block">
                                    <div class="form-group">
                                        <label>Mật khẩu tham gia</label>
                                        <input type="password" class="form-control" id="txtInfoPassword" placeholder="Mật khẩu tham gia" value="<?= $class->password ?>">
                                        <small class="form-text text-muted">Nếu bỏ trống thì thành viên được tự do tham gia</small>
                                    </div>
                                    <label>Yêu cầu học trước khóa học</label>
                                    <div class="input-group">
                                        <select class="form-control" id="selectInfoRequire">
                                            <option value="0">Chọn một khóa học cần thêm</option>
                                            <?php
                                            $class_list = _Class::all();
                                            foreach ($class_list as $item)
                                            {
                                                if ($item->id == $class->id) continue;
                                                ?>
                                                <option value="<?= $item->id ?>"><?= $item->shorturl ?> - <?= $item->title ?></option>
                                                <?php
                                            }
                                            ?>
                                        </select>
                                        <span class="input-group-btn"><button class="btn btn-primary" type="button" onclick="_AddRequire()" disabled><i class="fas fa-plus-circle"></i> Thêm</button></span>
                                    </div>
                                    <br>
                                    <div class="table-responsive">
                                        <table class="table" id="tableRequireClass">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Mã khóa học</th>
                                                <th>Tên khóa học</th>
                                                <th>Hành động</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php
                                            $class_require = $class->getRequire();
                                            $i = 0;
                                            foreach ($class_require as $item) {
                                                ?>
                                                <tr>
                                                    <th scope="row"><?= ++$i ?></th>
                                                    <td><?= $item["url"] ?></td>
                                                    <td><a href="/admin/class?url=<?= $item["url"] ?>" target="_blank"><?= $item["title"] ?></a></td>
                                                    <td>
                                                        <div class="btn-group btn-group-sm" role="group" id-class="<?= $item["id"] ?>">
                                                            <button type="button" class="btn btn-danger" name="btn-info-delete" data-toggle="tooltip" data-placement="top" title="Xóa điều kiện"><i class="fas fa-trash"></i></button>
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
                        <br>
                        <div class="form-group">
                            <label>Mô tả khóa học</label>
                            <textarea class="form-control" id="txtInfoDetail" name="txtInfoDetail" rows="10" cols="80"><?= $class->detail; ?></textarea>
                        </div>

                        <div class="text-right">
                            <button type="button" class="btn btn-primary btn-lg" onclick="_SaveClass()"><i class="fas fa-save"></i> Lưu thông tin</button>
                        </div>
                    </div>
                    <div id="Tab2" class="tab-pane fade" aria-expanded="false">
                        <div class="row">
                            <div class="col-lg-9 hidden-lg-down">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fas fa-search"></i></span>
                                    <input type="text" class="form-control" placeholder="Nhập tên hoặc mã bài học để tìm kiếm">
                                </div>
                            </div>
                            <div class="col-lg text-right">
                                <button type="button" class="btn btn-block btn-primary" onclick="_NewLesson()"><i class="fas fa-plus-circle"></i> Thêm bài học</button>
                            </div>
                        </div>
                        <br>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên bài học</th>
                                    <th>Loại</th>
                                    <th>Người tạo</th>
                                    <th>Ngày tạo</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $lesson_list = Lesson::all($class->id);
                                $i = 0;
                                foreach ($lesson_list as $item) {
                                    ?>
                                    <tr>
                                        <th scope="row"><?= ++$i ?></th>
                                        <td><b><a href="/admin/lesson?id=<?= $item->id ?>"><?= $item->title ?></a></b></td>
                                        <td><?= isset($item->test_type) ? ($item->test_type == 0 ? "Tự luận" : "Trắc nghiệm") : "Bài học" ?></td>
                                        <td><?= $item->name_creator ?></td>
                                        <td><?= date("d/m/Y \l\ú\c H:i:s", strtotime($item->date_created)) ?></td>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group" id-lesson="<?= $item->id ?>">
                                                <a href="/admin/lesson?id=<?= $item->id ?>" role="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Xem thông tin"><i class="fas fa-eye"></i></a>
                                                <button type="button" class="btn btn-danger" name="btn-lesson-delete" data-toggle="tooltip" data-placement="top" title="Xóa khỏi khóa học"><i class="fas fa-trash"></i></button>
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
                    <div id="Tab3" class="tab-pane fade" aria-expanded="false">
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
                                    <th>Ngày tham gia</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $i = 0;
                                foreach ($student_list as $item) {
                                    ?>
                                    <tr>
                                        <th scope="row"><?= ++$i ?></th>
                                        <td><?= $item["mssv"] ?></td>
                                        <td><?= $item["name"] ?></td>
                                        <td><?= $item["class"] ?></td>
                                        <td><?= $item["datejoined"] ?></td>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group" id-member="<?= $item["id"] ?>">
                                                <button type="button" class="btn btn-primary" name="btn-student-admin" data-toggle="tooltip" data-placement="top" title="Đặt làm ban cán sự"><i class="fas fa-key"></i></button>
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

<div class="modal fade" id="modalNewLesson" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tạo mới bài học</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="form-control-label">Tiêu đề bài học:</label>
                        <input type="text" class="form-control" id="txtNewLessonTitle">
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">Loại bài học</label>
                        <select class="form-control" id="txtNewLessonType">
                            <option value="-1">Bài học bình thường</option>
                            <option value="0">Bài kiểm tra tự luận</option>
                            <option value="1">Bài kiểm tra trắc nghiệm</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="_AddLesson()"><i class="fas fa-plus-circle"></i> Tạo mới</button>
            </div>
        </div>
    </div>
</div>


<script>
    CKEDITOR.replace( 'txtInfoDetail' );

    function _NewLesson() {
        $("#txtNewLessonTitle").val('');
        $("#txtNewLessonType").val(-1);
        $('#modalNewLesson').modal('show')
    }
    function _AddLesson() {
        var _title = $("#txtNewLessonTitle").val();
        var _type = $("#txtNewLessonType").val();
        var _id_class = $("#txtInfoID").val();

        if (_title.length < 1)
        {
            alert("Vui lòng nhập tiêu đề bài học để tiến hành tạo mới");
            return;
        }
        $.ajax({
            url : "/index.php?ajax=lesson_new",
            type : "post",
            dateType:"text",
            data : {
                id_class : _id_class,
                title : _title,
                type : _type
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        window.location = data.url;
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

    function _SaveClass() {
        var _id = $("#txtInfoID").val();
        var _title = $("#txtInfoTitle").val();
        var _detail = CKEDITOR.instances.txtInfoDetail.getData();
        var _password = $("#txtInfoPassword").val();
        var _status = $("#txtInfoStatus").val();

        if (_title.length < 1)
        {
            alert("Vui lòng nhập tiêu đề khóa học để tiến hành tạo mới");
            return;
        }
        $.ajax({
            url : "/index.php?ajax=class_save",
            type : "post",
            dateType:"text",
            data : {
                id : _id,
                title : _title,
                detail : _detail,
                password : _password,
                status : _status
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        alert("Lưu dữ liệu thành công");
                        history.pushState(null, '', data.url);
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

    function _AddRequire() {
        var _id = $("#txtInfoID").val();
        var _id_require = $("#selectInfoRequire").val();
        if (parseInt(_id_require) <= 0)
        {
            alert("Vui lòng chọn một khóa học để thêm");
            return;
        }
        $.ajax({
            url : "/index.php?ajax=class_require_add",
            type : "post",
            dateType:"text",
            data : {
                id : _id,
                id_require : _id_require
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        $('#tableRequireClass > tbody').append(data.html);
                        var _i = 0;
                        $('#tableRequireClass > tbody  > tr').each(function() {
                            $(this).find('th').html(++_i);
                        });
                    }
                }
                catch(err)
                {
                    alert("Có lỗi xảy ra, trang sẽ được refresh lại\n" + err + "\n" + result);
                    location.reload(true);
                }
                $("#selectInfoRequire").val(0);
                $('#selectInfoRequire').parent().find(":button").prop('disabled', true);
            }
        });
    }

    $(document).delegate("button[name='btn-info-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa điều kiện yêu cầu học trước khóa học này?")) return;
        var _id = $("#txtInfoID").val();
        var _id_require = $(this).parent().attr("id-class");
        var _btn = $(this);
        $.ajax({
            url : "/index.php?ajax=class_require_delete",
            type : "post",
            dateType:"text",
            data : {
                id : _id,
                id_require : _id_require
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
    $(document).delegate("button[name='btn-student-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa thành viên ra khỏi khóa học này?\nToàn bộ dữ liệu liên quan đến sinh viên trong khóa học này cũng sẽ bị xóa theo.")) return;
        var _id_student = $(this).parent().attr("id-member");
        var _id = $("#txtInfoID").val();
        var _btn = $(this);
        $.ajax({
            url : "/index.php?ajax=class_remove_student",
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
    $(document).delegate("button[name='btn-lesson-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa bài học này ra khỏi khóa học?\nToàn bộ dữ liệu liên quan đến bài học này trong khóa học cũng sẽ bị xóa theo.")) return;
        var _id = $(this).parent().attr("id-lesson");
        var _btn = $(this);
        $.ajax({
            url : "/index.php?ajax=lesson_delete",
            type : "post",
            dateType:"text",
            data : {
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

    $('#selectInfoRequire').change(function() {
        if (parseInt($(this).val()) > 0) $('#selectInfoRequire').parent().find(":button").prop('disabled', false);
        else $('#selectInfoRequire').parent().find(":button").prop('disabled', true);
    });
</script>