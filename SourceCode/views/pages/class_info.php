
<div class="container">
    <p style="padding-top: 30px"></p>
    <h1 class="display-4"><?= $class->title ?></h1>
    <br>
    <?php
    if (!empty($class->detail)) {
        ?>
        <div class="jumbotron">
            <h3><i class="fas fa-info-circle"></i> Thông tin khóa học</h3>
            <small class="text-muted">Khóa học này tạo bởi <?= $class->name_creator ?> vào ngày <?= date("d/m/Y", strtotime($class->date_created)) ?></small>
            <hr class="my-4">
            <?= $class->detail ?>
        </div>
        <?php
    }
    ?>
    <div class="jumbotron">
        <h3><i class="fas fa-sign-in-alt"></i> Tham gia khóa học</h3>
        <hr class="my-4">
        <?php
        if ($class->status == 1)
        {
            $class_Require = $class->getRequire();
            $class_user = Account::allClass($user->id);
            $list_Require = "";
            foreach ($class_Require as $item)
            {
                if (array_search($item["id"], array_column($class_user, "idClass")) !== false) continue;
                $list_Require .= "<li><a href='/class?url=". $item["url"] ."' target='_blank'>". $item["title"] ."</a></li>";
            }

            if (!empty($list_Require))
            {
                ?>
                <div class="alert alert-danger" role="alert">
                    Tiếc ghê, bạn chưa đủ điều kiện tham gia khóa học này <strong><i class="fas fa-sad-tear"></i></strong><br>
                <?php
                echo "Bạn cần phải hoàn thành các khóa học sau:";
                echo "<ul>";
                echo $list_Require;
                echo "</ul></div>";
            }
            else
            {
                if (!empty($class->password))
                {
                    ?>
                    <div class="alert alert-warning" role="alert">
                        <strong><i class="fas fa-2x fa-shield-alt"></i></strong> Khóa học này được bảo vệ bằng mật khẩu, vui lòng nhập mật khẩu để tham gia khóa học
                        <br>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" placeholder="Mật khẩu tham gia khóa học"  id="txtClassPassword">
                        </div>
                    </div>
                    <?php
                }
                else
                {
                    ?>
                    <div class="alert alert-info" role="alert">
                        <strong><i class="fas fa-2x fa-grin-hearts"></i></strong> Bạn đã đủ điều kiện tham gia khóa học này, ấn nút bên dưới để bắt đầu tham gia khóa học bạn nhé
                    </div>
                    <?php
                }
                ?>
                <hr>
                <input type="text" class="form-control"  id="txtClassID" value="<?= $class->id ?>" hidden>
                <button type="button" class="btn btn-primary btn-lg btn-block" onclick="_JoinClass()" id="btnJoinClass"><i class="fas fa-hand-point-right"></i> Tham gia khóa học</button>
                <script>
                    function _JoinClass() {
                        var _btn = $("#btnJoinClass");
                        _btn.html('<i class="fa fa-spinner fa-pulse fa-fw margin-bottom"></i> Đang kiểm tra điều kiện, vui lòng đợi');
                        _btn.prop('disabled', true);
                        var _id = $("#txtClassID").val();
                        var _password = "";
                        if ($("#txtClassPassword").val() != undefined)
                        {
                            _password = $("#txtClassPassword").val();
                            if (_password.length < 1)
                            {
                                alert("Vui lòng nhập mật khẩu để đăng nhập khóa học");
                                return;
                            }
                        }
                        if (!confirm("Bạn có muốn tham gia khóa học này?")) return;
                        $.ajax({
                            url : "/index.php?ajax=class_add_student",
                            type : "post",
                            dateType:"text",
                            data : {
                                password : _password,
                                id : _id
                            },
                            success : function (result){
                                try
                                {
                                    var data = JSON.parse(result);
                                    if (data.success == 0) {
                                        $("#txtClassPassword").val("");
                                        _btn.html('<i class="fas fa-hand-point-right"></i> Tham gia khóa học');
                                        _btn.prop('disabled', false);
                                        alert(data.msg);

                                    }
                                    else
                                    {
                                        _btn.html('THÀNH CÔNG, TRANG SẼ ĐƯỢC TẢI LẠI');
                                        alert("Đã tham gia khóa học thành công");
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
        }
        else
        {
            echo '
                <div class="alert alert-danger" role="alert">
                  <strong><i class="fas fa-2x fa-shield-alt"></i> Khóa học này đã được khóa hoặc ẩn bởi quản trị viên, bạn không thể tham gia khóa học</strong> 
                </div>
                ';
        }
        ?>
    </div>
</div>