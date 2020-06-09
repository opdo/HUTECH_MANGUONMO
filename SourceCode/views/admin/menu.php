<ul class="list-group">
    <a href="/admin/home" class="list-group-item list-group-item-action <?= ($_GET["action"] == "home" || empty($_GET["action"])) ? "active" : "" ?>">Thành viên</a>
    <a href="/admin/class" class="list-group-item list-group-item-action <?= $_GET["action"] == "class" ? "active" : "" ?>">Lớp học</a>
    <a href="/admin/system" class="list-group-item list-group-item-action <?= $_GET["action"] == "system" ? "active" : "" ?>">Hệ thống</a>
</ul>