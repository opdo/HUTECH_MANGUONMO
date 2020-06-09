<div class="container">
    <p style="padding-top: 40px"></p>
    <div class="row">
        <div class="col-lg-2">
            <?php
                require_once('menu.php');
            ?>
        </div>
        <div class="col-lg">
            <h1>Quản lý thành viên</h1>
            <hr>
            <div class="row">
                <div class="col-lg-9 hidden-lg-down">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fas fa-search"></i></span>
                        <input type="text" class="form-control" placeholder="Nhập tên hoặc mã số sinh viên để tìm kiếm">
                    </div>
                </div>
                <div class="col-lg text-right">
                    <button type="button" class="btn btn-block btn-primary" onclick="_New()"><i class="fas fa-plus-circle"></i> Thêm sinh viên</button>
                </div>
            </div>
            <br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>MSSV</th>
                    <th>Họ tên</th>
                    <th>Lớp</th>
                    <th>Email</th>
                    <th>Điện thoại</th>
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
                        <td><?= $item->mssv ?></td>
                        <td><?= $item->name ?></td>
                        <td><?= $item->class ?></td>
                        <td><?= $item->email ?></td>
                        <td><?= $item->phone ?></td>
                        <td>
                            <div class="btn-group btn-group-sm" role="group" id-member="<?= $item->id ?>">
                                <button type="button" class="btn btn-primary" name="btn-info"><i class="fas fa-eye"></i></button>
                                <?php
                                    if ($item->status == 0)
                                    {
                                        ?>
                                        <button type="button" class="btn btn-warning" name="btn-lock" data-toggle="popover" data-placement="top" data-trigger="focus" data-content="Lệnh đã được thực hiện thành công. Thành viên này đã bị cấm truy cập hệ thống."><i class="fas fa-lock"></i></button>
                                        <?php
                                    }
                                    else
                                    {
                                        ?>
                                        <button type="button" class="btn btn-warning" name="btn-lock" data-toggle="popover" data-placement="top" data-trigger="focus" data-content="Lệnh đã được thực hiện thành công. Thành viên này đã có thể truy cập hệ thống."><i class="fas fa-unlock"></i></button>
                                        <?php
                                    }
                                ?>
                                <button type="button" class="btn btn-danger" name="btn-delete" data-toggle="tooltip" data-placement="top" title="Xóa thành viên"><i class="fas fa-trash"></i></button>
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

<div class="modal fade" id="modalInfo" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin thành viên</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="form-control-label">Mã thành viên:</label>
                        <input type="text" class="form-control" id="txtID" disabled>
                        <small class="form-text text-muted">Thành viên này tham gia vào ngày <span id="spanDateJoin"></span></small>
                        <small class="form-text text-muted" style="display: none">Quyền hạn được thay đổi vào <span id="spanRoleDate"></span> bởi <span id="spanRoleMember"></span></small>

                    </div>
                    <div class="row">
                        <div class="form-group col-lg">
                            <label class="form-control-label">Quyền hạn:</label>
                            <select class="form-control" id="txtRole">
                                <option value="0">Thành viên</option>
                                <option value="1">Quản trị viên</option>
                            </select>
                        </div>
                        <div class="form-group col-lg">
                            <label class="form-control-label">Mã số sinh viên:</label>
                            <input type="text" class="form-control" id="txtMSSV">
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-lg">
                            <label class="form-control-label">Họ tên sinh viên:</label>
                            <input type="text" class="form-control" id="txtName">
                        </div>
                        <div class="form-group col-lg">
                            <label class="form-control-label">Lớp:</label>
                            <input type="text" class="form-control" id="txtClass">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg">
                            <label class="form-control-label">Email:</label>
                            <input type="email" class="form-control" id="txtEmail">
                        </div>
                        <div class="form-group col-lg">
                            <label class="form-control-label">Điện thoại:</label>
                            <input type="text" class="form-control" id="txtPhone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">Mật khẩu đăng nhập:</label>
                        <input type="password" class="form-control" id="txtPass">
                        <small class="form-text text-muted">Thay đổi trường này nếu bạn muốn đặt lại mật khẩu cho thành viên này</small>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary btn-save" onclick="_SaveInfo()"><i class="fas fa-save"></i> Lưu lại</button>
            </div>
        </div>
    </div>
</div>

<script>

    $('.btn-lock').popover({
        trigger: 'focus'
    });

    function _New() {
        $('#txtPass').val("");
        $('#txtID').val("");
        $('#txtMSSV').val("");
        $('#txtName').val("");
        $('#txtClass').val("");
        $('#txtEmail').val("");
        $('#txtPhone').val("");
        $('#txtRole').val(0);
        $("#spanRoleDate").parent().hide();
        $("#txtID").parent().hide();
        $('#spanDateJoin').text("");
        $('#modalInfo').find('.btn-save').html('<i class="fas fa-plus-circle"></i> Tạo mới');
        $('#modalInfo').modal('show');
    }
    
    $(document).delegate("button[name='btn-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa thành viên này?\nToàn bộ dữ liệu liên quan đến sinh viên này cũng sẽ bị xóa theo.")) return;
        var _id = $(this).parent().attr("id-member");
        var _btn = $(this);
        $.ajax({
            url : "/index.php?ajax=member_delete",
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

    $(document).delegate("button[name='btn-lock']",'click',function() {
        var _btn = $(this);

        var _id = $(this).parent().attr("id-member");
        $.ajax({
            url : "/index.php?ajax=member_lock",
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
                        if (data.status == 1)
                        {
                            // đã lock
                            _btn.attr("data-content", "Thành viên này đã bị CẤM truy cập hệ thống.");
                            _btn.html('<i class="fas fa-unlock"></i>');
                        }
                        else
                        {
                            // unlock
                            _btn.attr("data-content", "Thành viên này đã được CHO PHÉP truy cập hệ thống.");
                            _btn.html('<i class="fas fa-lock"></i>');
                        }
                        _btn.popover('show');
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

    $(document).delegate("button[name='btn-info']",'click',function() {
        var _id = $(this).parent().attr("id-member");
        $.ajax({
            url : "/index.php?ajax=member_info",
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
                        $("#txtID").parent().show();
                        $('#txtPass').val("");
                        $('#txtID').val(data.info.id);
                        $('#txtMSSV').val(data.info.mssv);
                        $('#txtName').val(data.info.name);
                        $('#txtClass').val(data.info.class);
                        $('#txtEmail').val(data.info.email);
                        $('#txtPhone').val(data.info.phone);
                        $('#txtRole').val(data.info.admin ? 1 : 0);
                        if (data.info.admin)
                        {
                            $("#spanRoleDate").text(data.admin.dateset);
                            $("#spanRoleMember").text(data.admin.membername);
                            $("#spanRoleDate").parent().show();
                        }
                        else
                        {
                            $("#spanRoleDate").parent().hide();
                        }
                        $('#spanDateJoin').text(data.info.date_joined);
                        $('#modalInfo').find('.btn-save').html('<i class="fas fa-save"></i> Lưu lại');
                        $('#modalInfo').modal('show')
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
    
    function _SaveInfo() {
        var _id = $("#txtID").val();
        var _mssv = $("#txtMSSV").val();
        var _name = $("#txtName").val();
        var _email = $("#txtEmail").val();
        var _phone = $("#txtPhone").val();
        var _password = $("#txtPass").val();
        var _role = $("#txtRole").val();
        var _class = $("#txtClass").val();

        if (_mssv.length < 1 || _name.length < 1)
        {
            alert("Vui lòng nhập đầy đủ mã số sinh viên và tên sinh viên");
            return;
        }
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (_email !== "")
        {
            if (!re.test(_email))
            {
                alert("Vui lòng nhập đúng email để kích hoạt tài khoản");
                return;
            }
        }

        if (_phone !== "")
        {
            if (isNaN(_phone) || _phone.length < 9 || _phone.length > 11)
            {
                alert("Số điện thoại không hợp lệ, vui lòng nhập lại");
                return;
            }
        }

        $.ajax({
            url : "/index.php?ajax=member_save",
            type : "post",
            dateType:"text",
            data : {
                id : _id,
                account : _mssv,
                password : _password,
                name : _name,
                idclass : _class,
                email : _email,
                phone : _phone,
                role : _role
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        if (parseInt(_id) > 0)
                        {
                            var _content = $("[id-member='"+ _id +"']").parent().parent().find('td');
                            _content[0].innerHTML = _mssv;
                            _content[1].innerHTML = _name;
                            _content[2].innerHTML = _class;
                            _content[3].innerHTML = _email;
                            _content[4].innerHTML = _phone;
                        }
                        else
                        {
                            $('table > tbody').append(data.html);
                            var _i = 0;
                            $('table > tbody  > tr').each(function() {
                                $(this).find('th').html(++_i);
                            });
                        }
                        $('#modalInfo').modal('hide');
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