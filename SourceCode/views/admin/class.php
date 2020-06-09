<div class="container">
    <p style="padding-top: 40px"></p>
    <div class="row">
        <div class="col-lg-2">
            <?php
                require_once('menu.php');
            ?>
        </div>
        <div class="col-lg">
            <h1>Quản lý khóa học</h1>
            <hr>
            <div class="row">
                <div class="col-lg-9 hidden-lg-down">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fas fa-search"></i></span>
                        <input type="text" class="form-control" placeholder="Nhập tên hoặc mã lớp để tìm kiếm">
                    </div>
                </div>
                <div class="col-lg text-right">
                    <button type="button" class="btn btn-block btn-primary" onclick="_New()"><i class="fas fa-plus-circle"></i> Thêm lớp học</button>
                </div>
            </div>
            <br>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên khóa học</th>
                        <th>Bài học</th>
                        <th>Tham gia</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $i = 0;
                    foreach ($list as $item) {
                        ?>
                        <tr>
                            <th scope="row"><?= ++$i ?></th>
                            <td><?= $item->status == 1 ? '' : ($item->status == 0 ? '<span class="badge badge-warning"><i class="fas fa-eye-slash"></i></span>' : '<span class="badge badge-danger"><i class="fas fa-lock"></i></span>') ?> <b><a href="/admin/class?url=<?= $item->shorturl ?>"><?= $item->title ?></a></b></td>
                            <td><?= Lesson::count($item->id) ?></td>
                            <td><?= count(_Class::student_all($item->id)) ?></td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group" id-class="<?= $item->id ?>">
                                    <a href="/admin/class?url=<?= $item->shorturl ?>" role="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Xem thông tin"><i class="fas fa-eye"></i></a>
                                    <button type="button" class="btn btn-danger" name="btn-delete" data-toggle="tooltip" data-placement="top" title="Xóa khóa học"><i class="fas fa-trash"></i></button>
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

<div class="modal fade" id="modalNew" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tạo mới khóa học</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="form-control-label">Tên khóa học:</label>
                        <input type="text" class="form-control" id="txtTitle">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="_AddClass()"><i class="fas fa-plus-circle"></i> Tạo mới</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).delegate("button[name='btn-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa khóa học này?\nToàn bộ những dữ liệu liên quan đến khóa học cũng sẽ bị xóa theo")) return;
        var _id = $(this).parent().attr("id-class");
        var _btn = $(this);

        $.ajax({
            url : "/index.php?ajax=class_delete",
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
                        _btn.parent().parent().parent().remove();
                        $('table > tbody  > tr').each(function() {
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


    function _New() {
        $("#txtTitle").val('');
        $('#modalNew').modal('show')
    }
    function _AddClass() {
        var _title = $("#txtTitle").val();

        if (_title.length < 1)
        {
            alert("Vui lòng nhập tiêu đề khóa học để tiến hành tạo mới");
            return;
        }
        $.ajax({
            url : "/index.php?ajax=class_new",
            type : "post",
            dateType:"text",
            data : {
                title : _title
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
</script>