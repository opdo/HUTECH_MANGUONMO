<?php
    try
    {
        $process = round((count(Account::allLesson($user->id, $class->id))/count(Lesson::all($class->id)))*100);
    }
    catch (Exception $e)
    {
        $process = 0;
    }
?>
<div class="container">
    <p style="padding-top: 30px"></p>
    <h1 class="display-4"><?= $class->title ?></h1>
    <small class="text-muted">Khóa học này tạo bởi <?= $class->name_creator ?> vào ngày <?= date("d/m/Y", strtotime($class->date_created)) ?></small>
    <br>
    <div class="progress">
        <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: <?= $process ?>%;" aria-valuenow="<?= $process ?>" aria-valuemin="0" aria-valuemax="100"><?= $process ?>%</div>
    </div>
    <br>
    <div class="jumbotron">
        <h3><i class="fas fa-book"></i> Danh sách bài học</h3>
        <hr class="my-4">
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead class="thead-inverse">
                <tr>
                    <th>#</th>
                    <th>Tiêu đề</th>
                    <th>Loại</th>
                    <th>Tham gia</th>
                    <th>Tiến độ</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $lesson_list = Lesson::all($class->id);
                $i = 0;
                foreach ($lesson_list as $item) {

                    $status =  '<span class="badge badge-pill badge-default"><i class="fas fa-eye"></i> Chưa xem</span>';
                    if ($item->isTest())
                    {
                        $test = Test::find($item->id);
                        if (!empty($test->test_dateline))
                        {
                            $status =  '<span class="badge badge-pill badge-danger"><i class="fas fa-calendar"></i> Hạn chót ngày '. date("d/m/Y \l\ú\c H:i", strtotime($test->test_dateline)) .'</span>';
                        }
                    }
                    if (Account::statusLesson($user->id, $item->id) >= 0)
                    {
                        $status =  '<span class="badge badge-pill badge-primary"><i class="fas fa-check"></i> Đã xem</span>';
                        if ($item->isTest())
                        {
                            $test = Test::find($item->id);
                            if ($test->isDone($user->id) > 0)
                            {
                                $status =  '<span class="badge badge-pill badge-primary"><i class="fas fa-star"></i> Điểm: '. $test->getTestPoint($user->id) .'</span>';
                                if ($test->test_type == 0)
                                {
                                    if (!$test->isMark($user->id)) $status =  '<span class="badge badge-pill badge-warning"><i class="fas fa-user-clock"></i> Chờ chấm</span>';
                                }
                            }
                            else
                            {
                                $status =  '<span class="badge badge-pill badge-warning">Đang làm</span>';
                            }
                        }
                    }

                    ?>
                    <tr>
                        <th scope="row"><?= ++$i ?></th>
                        <td><a href="/class?lesson=<?= $item->id ?>"><?= $item->title ?></a></td>
                        <td><?= $item->isTest() ? (intval($item->test_type) == 0 ? "Tự luận" : "Trắc nghiệm") : "Bài học" ?></td>
                        <td><?= count(Lesson::student_all($item->id)) ?></td>
                        <td><?= $status ?></td>
                    </tr>
                    <?php
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>