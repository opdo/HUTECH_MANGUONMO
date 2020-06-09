<div class="container">
    <p style="padding-top: 40px"></p>
    <div class="row">

        <div class="col-lg-6 hidden-md-down">
            <p class="lead">Hệ thống hỗ trợ học tập trực tuyến là nơi kết nối các bài giảng của giảng viên với sinh viên trực tuyến, phát huy tinh thần tự học, cung cấp cho sinh viên một môi trường tự học lý tưởng.</p>
            <div class="row">
                <div class="col text-center">
                    <h2 class="display-4"><i class="fas fa-users"></i></h2>
                    <p class="lead"><?= Account::count() ?> HỌC VIÊN</p>
                </div>
                <div class="col text-center">
                    <h2 class="display-4"><i class="fab fa-leanpub"></i></h2>
                    <p class="lead"><?= _Class::count() ?> KHÓA HỌC</p>
                </div>
                <div class="col text-center">
                    <h2 class="display-4"><i class="fas fa-book"></i></h2>
                    <p class="lead"><?= Lesson::count() ?> BÀI HỌC</p>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card" id="divLogin">
                <div class="card-header">
                    Đăng nhập hệ thống
                </div>
                <div class="card-block">
                    <p style="display: none" class="loading text-center">
                        <i class="fa fa-spinner fa-pulse fa-4x fa-fw margin-bottom"></i><br>
                        <span class="lead">Đang tải vui lòng đợi</span>
                    </p>
                    <div class="form-group">
                        <label>Mã số sinh viên:</label>
                        <input type="text" class="form-control" id="txtAccount" placeholder="Mã số sinh viên">
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu đăng nhập:</label>
                        <input type="password" class="form-control" id="txtPassword" placeholder="Mật khẩu đăng nhập">
                    </div>
                    <div class="float-md-right">
                        <button type="button" class="btn btn-secondary" onclick="_ShowDiv(1)">Đăng ký</button>
                        <button type="button" class="btn btn-primary" onclick="_Login()"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                    </div>
                </div>
            </div>

            <div class="card" id="divReg" style="display: none">
                <div class="card-header">
                    Đăng ký thành viên
                </div>
                <div class="card-block">
                    <p style="display: none" class="loading text-center">
                        <i class="fa fa-spinner fa-pulse fa-4x fa-fw margin-bottom"></i><br>
                        <span class="lead">Đang tải vui lòng đợi</span>
                    </p>

                    <div class="form-group">
                        <label>Mã số sinh viên:</label>
                        <input type="text" class="form-control" id="txtRegAccount" placeholder="Mã số sinh viên">
                    </div>

                    <div class="row">
                        <div class="form-group col-lg">
                            <label>Họ và tên:</label>
                            <input type="text" class="form-control" id="txtRegName" placeholder="Họ tên">
                        </div>
                        <div class="form-group col-lg">
                            <label>Lớp sinh viên:</label>
                            <input type="text" class="form-control" id="txtRegClass" placeholder="Mã lớp">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg">
                            <label>Email liên lạc:</label>
                            <input type="email" class="form-control" id="txtRegEmail" placeholder="Email liên lạc">
                        </div>
                        <div class="form-group col-lg">
                            <label>Số điện thoại:</label>
                            <input type="text" class="form-control" id="txtRegPhone" placeholder="Điện thoại">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-lg">
                            <label>Mật khẩu đăng nhập:</label>
                            <input type="password" class="form-control" id="txtRegPassword" placeholder="Mật khẩu đăng nhập">
                        </div>
                        <div class="form-group col-lg">
                            <label>Xác nhận lại mật khẩu:</label>
                            <input type="password" class="form-control" id="txtRegRePassword" placeholder="Xác nhận mật khẩu">
                        </div>
                    </div>
                    <div class="float-md-right">
                        <button type="button" class="btn btn-secondary" onclick="_ShowDiv()">Trở lại</button>
                        <button type="button" class="btn btn-danger" onclick="_Reg()"><i class="fas fa-edit"></i> Đăng ký</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    function _ShowDiv($id = 0) {
        $("#divReg").hide();
        $("#divLogin").hide();
        if ($id == 0)
        {
            $("#divLogin input").each(function(){
                $(this).val("");
            });
            _ShowLoading("divLogin", false);
            $("#divLogin").fadeIn();
        }
        else
        {
            $("#divReg input").each(function(){
                $(this).val("");
            });
            _ShowLoading("divReg", false);
            $("#divReg").fadeIn();
        }
    }
    function _ShowLoading($id, $show = true) {
        $("#" + $id + " > .card-block > div").each(function(){
            if ($show)
            {
                $(this).hide();
                $("#" + $id + " > .card-block > .loading").show();
            }
            else
            {
                $(this).show();
                $("#" + $id + " > .card-block > .loading").hide();
            }
        });
    }

    function _Login() {
        var flag = true;
        $("#divLogin input").each(function(){
            var input = $(this).val();
            if (input.length < 1)
            {
                alert("Vui lòng nhập đầy đủ thông tin để đăng nhập");
                flag = false;
                return flag;
            }
        });
        if (!flag) return flag;
        _ShowLoading("divLogin");
        $.ajax({
            url : "/index.php?ajax=login",
            type : "post",
            dateType:"text",
            data : {
                account : $("#txtAccount").val(),
                password : $("#txtPassword").val()
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        // login thành công
                        location.reload(true);
                        return;
                    }
                }
                catch(err)
                {
                    alert("Có lỗi xảy ra, trang sẽ được refresh lại");
                    location.reload(true);
                }
                _ShowLoading("divLogin", false);
            }
        });

    }

    $('#txtPassword').keydown( function(e) {
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        if(key == 13) _Login();
    });
    $('#txtRegRePassword').keydown( function(e) {
        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
        if(key == 13) _Reg();
    });

    function _Reg() {
        var flag = true;
        $("#divReg input").each(function(){
            var input = $(this).val();
            if (input.length < 1)
            {
                alert("Vui lòng nhập đầy đủ thông tin để đăng ký");
                flag = false;
                return flag;
            }
        });
        if (!flag) return flag;
        var email = String($("#txtRegEmail").val()).toLowerCase();
        var phone = $("#txtRegPhone").val();
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!re.test(email))
        {
            alert("Vui lòng nhập email để kích hoạt tài khoản");
            return false;
        }
        if (isNaN(phone) || phone.length < 9 || phone.length > 11)
        {
            alert("Số điện thoại không hợp lệ, vui lòng nhập lại");
            return false;
        }
        var pass = $("#txtRegPassword").val();
        var repass = $("#txtRegRePassword").val();
        if (pass != repass)
        {
            alert("Mật khẩu xác nhận chưa hợp lệ, vui lòng kiểm tra lại");
            return false;
        }
        _ShowLoading("divReg");
        $.ajax({
            url : "/index.php?ajax=reg",
            type : "post",
            dateType:"text",
            data : {
                account : $("#txtRegAccount").val(),
                password : pass,
                name : $("#txtRegName").val(),
                idclass : $("#txtRegClass").val(),
                email : email,
                phone : phone
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        // reg thành công
                        alert("Đăng ký thành công, bạn có thể dùng mã số sinh viên và mật khẩu đã đăng ký để đăng nhập hệ thống");
                        _ShowDiv();
                        return true;
                    }
                }
                catch(err)
                {
                    alert("Có lỗi xảy ra, trang sẽ được refresh lại");
                    location.reload(true);
                }
                _ShowLoading("divReg", false);
            }
        });

    }
</script>