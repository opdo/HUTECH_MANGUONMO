<div class="container">
    <p style="padding-top: 40px"></p>
    <div class="row">
        <div class="col-lg-2">
            <?php
                require_once('menu.php');
            ?>
        </div>
        <div class="col-lg">
            <h1>Thiết lập hệ thống</h1>
            <hr>
            <?php
                try
                {
                    $edit_id = System::find("LOG_SYS_EDIT_ID");
                    $edit_date = System::find("LOG_SYS_EDIT_TIME");
                    try
                    {
                        $edit_name = Account::find($edit_id)->name;
                    }
                    catch (Exception $e)
                    {
                        $edit_name = "[Không tìm thấy]";
                    }
                    ?>
                    <div class="alert alert-success" role="alert">
                        Một số mục được chỉnh sửa lần cuối bởi <b><?= $edit_name ?></b> vào ngày <?= $edit_date ?>
                    </div>
                    <?php
                }
                catch (Exception $e)
                {

                }
            ?>
            <div class="form-group">
                <label>Tiêu đề website</label>
                <input type="text" class="form-control" id="txtWebTitle" placeholder="Tiêu đề website" value="<?php try { echo System::find("WEB_TITLE"); } catch (Exception $e) {} ?>">
                <small class="form-text text-muted">Tiêu đề được hiển thị trên trình duyệt khi truy cập vào website</small>
            </div>

            <div class="form-group">
                <label>Mô tả website</label>
                <textarea class="form-control" id="txtWebDetail" placeholder="Mô tả website"><?php try { echo System::find("WEB_DETAIL"); } catch (Exception $e) {} ?></textarea>
                <small class="form-text text-muted">Mô tả sẽ giúp ích cho việc dẫn link website hoặc tìm kiếm trên google</small>
            </div>

            <div class="form-group">
                <label>Từ khóa tìm kiếm</label>
                <input type="text" class="form-control" id="txtWebKeyword" placeholder="Từ khóa tìm kiếm website" value="<?php try { echo System::find("WEB_KEYWORD"); } catch (Exception $e) {} ?>">
                <small class="form-text text-muted">Từ khóa sẽ giúp ích cho việc tìm kiếm và hỗ trợ SEO website</small>
            </div>

            <div class="text-right">
                <button type="button" class="btn btn-primary btn-lg" onclick="_Save()"><i class="fas fa-save"></i> Lưu thông tin</button>
            </div>
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
                <button type="button" class="btn btn-primary" onclick="_SaveInfo()"><i class="fas fa-save"></i> Lưu lại</button>
            </div>
        </div>
    </div>
</div>

<script>

    function _Save() {
        var _title = $("#txtWebTitle").val();
        var _detail = $("#txtWebDetail").val();
        var _keyword = $("#txtWebKeyword").val();

        if (_title.length < 1 || _detail.length < 1)
        {
            alert("Vui lòng nhập đầy đủ tiêu đề website và mô tả website");
            return;
        }

        $.ajax({
            url : "/index.php?ajax=system_save",
            type : "post",
            dateType:"text",
            data : {
                title : _title,
                keyword : _keyword,
                detail : _detail
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
</script>