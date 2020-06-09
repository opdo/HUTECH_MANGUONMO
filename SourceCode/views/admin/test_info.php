<div id="Tab2" class="tab-pane fade" aria-expanded="true">
    <div class="row">
        <div class="col-lg-9 hidden-lg-down">
            <div class="input-group">
                <span class="input-group-addon"><i class="fas fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Nhập nội dung câu hỏi để tìm kiếm">
            </div>
        </div>
        <div class="col-lg text-right">
            <button type="button" class="btn btn-block btn-primary" onclick="_NewQuestion()"><i class="fas fa-plus-circle"></i> Thêm câu hỏi</button>
        </div>
    </div>
    <br>
    <div class="table-responsive">
        <table class="table table-hover" id="tableQuestion">
            <thead>
            <tr>
                <th>#</th>
                <th>Nội dung</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <?php
            $i = 0;
            $question_list = Test::all_Question($lesson->id);
            foreach ($question_list as $item) {
                ?>
                <tr>
                    <th scope="row"><?= ++$i ?></th>
                    <td><?= StringEx::get_words(strip_tags($item->content)) ?>...</td>
                    <td>
                        <div class="btn-group btn-group-sm" role="group" id-question="<?= $item->id ?>">
                            <button type="button" class="btn btn-primary" name="btn-question-info"><i class="fas fa-eye"></i></button>
                            <button type="button" class="btn btn-danger" name="btn-question-delete" data-toggle="tooltip" data-placement="top" title="Xóa khỏi bài kiểm tra"><i class="fas fa-trash"></i></button>
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


<div class="modal fade" id="modalNewQuestion" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông tin câu hỏi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label class="form-control-label">Nội dung câu hỏi</label>
                        <textarea class="form-control" id="txtQuestionDetail" name="txtInfoDetail" rows="10" cols="80"></textarea>
                    </div>
                    <input type="text" class="form-control" id="txtQuestionID" hidden>

                    <div class="form-group" <?= $lesson->test_type == 0 ? "" : "hidden" ?>>
                        <label>Giới hạn ký tự trả lời</label>
                        <input type="number" class="form-control" id="txtQuestionLimitNumber" value="">
                        <small class="form-text text-muted">Nhập vào một số nguyên số từ bị giới hạn khi làm bài. Nếu bạn không nhập hoặc là số âm thì bài kiểm tra sẽ không giới hạn số từ được dùng.</small>
                    </div>
                    <div <?= $lesson->test_type == 1 ? "" : "hidden" ?>>
                        <div class="form-group">
                            <label class="form-control-label">Đáp án đúng</label>
                            <select class="form-control" id="txtQuestion_AnswerRight">
                                <option value="1">Đáp án A</option>
                                <option value="2">Đáp án B</option>
                                <option value="3">Đáp án C</option>
                                <option value="4">Đáp án D</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Đáp án A</label>
                            <textarea type="number" class="form-control" id="txtQuestion_AnswerA" value="" maxlength="200"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Đáp án B</label>
                            <textarea type="number" class="form-control" id="txtQuestion_AnswerB" value="" maxlength="200"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Đáp án C</label>
                            <textarea type="number" class="form-control" id="txtQuestion_AnswerC" value="" maxlength="200"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Đáp án D</label>
                            <textarea type="number" class="form-control" id="txtQuestion_AnswerD" value="" maxlength="200"></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary btn-save" onclick="_SaveQuestion()"><i class="fas fa-plus-circle"></i> Tạo mới</button>
            </div>
        </div>
    </div>
</div>

<script>
    CKEDITOR.replace( 'txtQuestionDetail' );

    function _NewQuestion() {
        CKEDITOR.instances.txtQuestionDetail.setData("");
        $("#txtQuestionLimitNumber").val('');
        $("#txtQuestion_AnswerRight").val(1);
        $("#txtQuestion_AnswerA").val('');
        $("#txtQuestion_AnswerB").val('');
        $("#txtQuestion_AnswerC").val('');
        $("#txtQuestion_AnswerD").val('');
        $("#txtQuestionID").val('');
        $('#modalNewQuestion').find('.btn-save').html('<i class="fas fa-plus-circle"></i> Tạo mới');
        $('#modalNewQuestion').modal('show');
    }
    function _SaveQuestion() {
        var _id_question = $("#txtQuestionID").val();
        var _id_lesson = $("#txtInfoID").val();
        var _content = CKEDITOR.instances.txtQuestionDetail.getData();
        var _limit_number = $("#txtQuestionLimitNumber").val();
        var _answer_a = $("#txtQuestion_AnswerA").val();
        var _answer_b = $("#txtQuestion_AnswerB").val();
        var _answer_c = $("#txtQuestion_AnswerC").val();
        var _answer_d = $("#txtQuestion_AnswerD").val();
        var _answer_r = $("#txtQuestion_AnswerRight").val();

        $.ajax({
            url : "/index.php?ajax=question_save",
            type : "post",
            dateType:"text",
            data : {
                id_question : _id_question,
                id_lesson : _id_lesson,
                content : _content,
                limit_number : _limit_number,
                answer_a : _answer_a,
                answer_b : _answer_b,
                answer_c : _answer_c,
                answer_d : _answer_d,
                answer_r : _answer_r
            },
            success : function (result){
                try
                {
                    var data = JSON.parse(result);
                    if (data.success == 0) alert(data.msg);
                    else
                    {
                        $('#modalNewQuestion').modal('hide');
                        if (parseInt(_id_question) > 0)
                        {
                            var _content = $("[id-question='"+ _id_question +"']").parent().parent().find('td')[0];
                            if (_content != undefined)
                            {
                                _content.innerHTML = data.short_content + "...";
                            }
                        }
                        else $('#tableQuestion > tbody').append(data.html);
                        var _i = 0;
                        $('#tableQuestion > tbody  > tr').each(function() {
                            $(this).find('th').html(++_i);
                        });
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

    $(document).delegate("button[name='btn-question-info']",'click',function() {
        var _id = $(this).parent().attr("id-question");
        $.ajax({
            url : "/index.php?ajax=question_info",
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
                        CKEDITOR.instances.txtQuestionDetail.setData(data.info.content);
                        $("#txtQuestionID").val(data.info.id);
                        $("#txtQuestionLimitNumber").val(data.info.limit_number);
                        $("#txtQuestion_AnswerRight").val( data.info.answer[0]);
                        $("#txtQuestion_AnswerA").val( data.info.answer[1]);
                        $("#txtQuestion_AnswerB").val( data.info.answer[2]);
                        $("#txtQuestion_AnswerC").val( data.info.answer[3]);
                        $("#txtQuestion_AnswerD").val( data.info.answer[4]);
                        $('#modalNewQuestion').find('.btn-save').html('<i class="fas fa-save"></i> Lưu lại');
                        $('#modalNewQuestion').modal('show')
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

    $(document).delegate("button[name='btn-question-delete']",'click',function() {
        if (!confirm("Bạn có thực sự muốn xóa câu hỏi này?\nToàn bộ dữ liệu liên quan đến câu hỏi này này cũng sẽ bị xóa theo.")) return;
        var _id = $(this).parent().attr("id-question");
        var _btn = $(this);
        $.ajax({
            url : "/index.php?ajax=question_delete",
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

</script>