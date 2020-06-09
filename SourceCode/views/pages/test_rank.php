<?php
    $list_rank = $lesson->getRank();
    if (count($list_rank) > 0)
    {
        ?>
        <div class="card">
            <div class="card-header text-center bg-primary" role="tab">
                <h5 class="mb-0">
                    <a class="collapsed text-white" data-toggle="collapse" data-parent="#accordion" href="#divRank" aria-expanded="false">
                        <i class="fas fa-crown"></i> <b>BẢNG XẾP HẠNG</b> <i class="fas fa-crown"></i>
                    </a>
                </h5>
            </div>
            <div id="divRank" class="collapse show" role="tabpanel">
                <div class="card-block table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Hạng</th>
                            <th>Họ tên</th>
                            <th>Lớp</th>
                            <th>Ngày nộp</th>
                            <th>Điểm</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i = 0;

                        foreach ($list_rank as $item) {
                            ?>
                            <tr>
                                <th scope="row"><?= ++$i ?></th>
                                <td><?= Account::find($item["id"])->name ?></td>
                                <td><?= Account::find($item["id"])->class ?></td>
                                <td><?= date("d/m/Y \l\ú\c H:i:s", strtotime($item["date"])) ?></td>
                                <td><?= $item["mark"] ?></td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <br>
        <?php
    }
?>
