
<nav class="navbar navbar-toggleable-md navbar-inverse bg-primary">
    <div class="container">
        <a class="navbar-brand" href="."><i class="fas fa-graduation-cap"></i> <b>eLearning</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bd-main-nav" aria-controls="bd-main-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="bd-main-nav">
            <ul class="navbar-nav mr-auto">
                <?php
                    if (isset($_SESSION["USER"]) && !($_GET['action'] == "test" && isset($_GET["student"], $_GET["id"])))
                    {
                        ?>
                        <li class="nav-item">
                            <a class="nav-link" href="/">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/class">Lớp học</a>
                        </li>
                        <?php
                        $user = $_SESSION["USER"];
                        if ($user->admin)
                        {
                            ?>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin">Quản trị</a>
                            </li>
                            <?php
                        }
                        ?>
                        <li class="nav-item">
                            <a class="nav-link" href="/logout">Đăng xuất</a>
                        </li>
                        <?php
                    }

                ?>
            </ul>
        </div>
    </div>
</nav>
