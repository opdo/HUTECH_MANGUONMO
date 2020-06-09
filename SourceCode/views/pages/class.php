<style>
    .card-class :hover
    {
        background-color: #d5d5d5;
        text-decoration: none;
    }
</style>
<div class="container">
    <p style="padding-top: 40px"></p>
    <div class="jumbotron">
        <h2><i class="fab fa-leanpub"></i> Lớp của bạn</h2>
        <hr class="my-4">
        <?php
        if (count($myclass_list)>0) {
            for ($i = 0; $i < count($myclass_list); $i+=3)
            {
                ?>
                <div class="card-deck">
                    <?php
                    for ($j = $i; $j < $i+3; $j++)
                    {
                        if ($j < count($myclass_list))
                        {
                            $class_item = $myclass_list[$j];
                            $item = _Class::find($class_item["idClass"]);
                            ?>
                            <div class="card card-class <?= $item->status == 2 ? 'card-outline-danger' : "" ?>">
                                <a href="/class?url=<?= $item->shorturl ?>">
                                    <div class="card-block">
                                        <h5 class="card-title <?= $item->status == 2 ? 'text-danger' : "" ?>"><?= $item->status == 2 ? '<i class="fas fa-lock"></i> ' : "" ?><?= $item->title ?><br></h5>
                                        <p class="card-text"><h5><span class="badge badge-pill <?= $item->status == 2 ? 'badge-danger' : "badge-primary" ?>"><i class="fa fa-user" aria-hidden="true"></i> <?= count(_Class::student_all($item->id)) ?></span>   <span class="badge badge-pill <?= $item->status == 2 ? 'badge-danger' : "badge-primary" ?>"><i class="fa fa-book" aria-hidden="true"></i> <?= count(Lesson::all($item->id)) ?></span></h5></p>
                                        <p class="card-text"><small class="text-muted <?= $item->status == 2 ? 'text-danger' : "" ?>">Tham gia vào ngày <?= date("d/m/Y \l\ú\c H:i", strtotime($class_item["dateJoin"])) ?></small></p>
                                    </div>
                                </a>
                            </div>
                            <?php
                        }
                        else
                        {
                            ?>
                            <div class="card" style="border: 0;background-color: transparent;"></div>
                            <?php
                        }
                        echo "<br>";
                    }
                    ?>
                </div>
                <br>
                <?php
            }
        }
        else {
            echo '<div class="text-center">
                    <h1><i class="fas fa-2x fa-smile-wink"></i></h1>
                    <p class="lead">Bạn chưa tham gia khóa học nào!</p>
                  </div>';
        }


        ?>
    </div>
    <div class="jumbotron">
        <h2><i class="fab fa-leanpub"></i> Các lớp học hiện mở</h2>
        <hr class="my-4">
        <?php
            if (1 == 1)
            {
                for ($i = 0; $i < count($class_list); $i+=3)
        {
        ?>
        <div class="card-deck">
            <?php
            for ($j = $i; $j < $i+3; $j++)
            {
            if ($j < count($class_list))
            {
                $item = $class_list[$j];
                $key = array_search($item->id, array_column($myclass_list, 'idClass'));
                if ($key !== false)
                {
                    $i++;
                    continue;
                }
                ?>
                <div class="card card-class <?= $item->status == 2 ? 'card-outline-danger' : "" ?>">
                    <a href="/class?url=<?= $item->shorturl ?>">
                        <div class="card-block">
                            <h5 class="card-title <?= $item->status == 2 ? 'text-danger' : "" ?>"><?= $item->status == 2 ? '<i class="fas fa-lock"></i> ' : "" ?><?= $item->title ?><br></h5>
                            <p class="card-text"><h5><span class="badge badge-pill <?= $item->status == 2 ? 'badge-danger' : "badge-primary" ?>"><i class="fa fa-user" aria-hidden="true"></i> <?= count(_Class::student_all($item->id)) ?></span>   <span class="badge badge-pill <?= $item->status == 2 ? 'badge-danger' : "badge-primary" ?>"><i class="fa fa-book" aria-hidden="true"></i> <?= count(Lesson::all($item->id)) ?></span></h5></p>
                            <p class="card-text"><small class="text-muted <?= $item->status == 2 ? 'text-danger' : "" ?>">Tạo bởi <?= $item->name_creator ?> vào ngày <?= date("d/m/Y", strtotime($item->date_created)) ?></small></p>
                        </div>
                    </a>
                </div>
                <?php
            }
            else
            {
                ?>
                <div class="card" style="border: 0;background-color: transparent;"></div>
                <?php
            }
            echo "<br>";
            }
            ?>
            </div>
            <br>
            <?php
            }
            }
            else {
                echo '<div class="text-center">
                    <h1><i class="fas fa-2x fa-smile-wink"></i></h1>
                    <p class="lead">Chưa có khóa học nào được tạo!</p>
                  </div>';
            }

        ?>


    </div>
</div>