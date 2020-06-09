
<DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- deffault -->
        <title><?= System::find("WEB_TITLE") ?> <?= isset($_WEB["TITLE"]) ? " - " . $_WEB["TITLE"] : "" ?></title>
        <meta name="description" content="<?= isset($_WEB["DETAIL"]) ? " - " . $_WEB["DETAIL"] : System::find("WEB_DETAIL") ?>"/>
        <meta name="keywords" content="<?= System::find("WEB_KEYWORD") ?>">
        <meta property="og:image" content="/assets/img.jpg">
        <link rel="icon" type="image/x-icon" href="/favicon.ico"/>

        <!-- Facebook -->
        <meta property="og:title" content="<?= System::find("WEB_TITLE") ?>">
        <meta content='website' property='og:type'/>
        <meta content="<?= isset($_WEB["DETAIL"]) ? " - " . $_WEB["DETAIL"] : System::find("WEB_DETAIL") ?>" property='og:description'/>
        <meta content="<?= System::find("WEB_TITLE") ?> <?= isset($_WEB["TITLE"]) ? " - " . $_WEB["TITLE"] : "" ?>" property='og:site_name'/>
        <!-- CSS & ICON -->
        <link href='Test' rel='icon' type='image/x-icon'/>
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <link href="/assets/css/all.min.css" rel="stylesheet">
        <script src="/assets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="/assets/js/tether.min.js" type="text/javascript"></script>
        <script src="/assets/js/bootstrap.min.js" type="text/javascript"></script>
        <style>
            img {
                max-width: 100%;
                max-height: 100%;
            }
        </style>
    </head>
    <?php
        require_once('views/layouts/menu.php');
    ?>
    <body>
    <?= @$content ?>
    </body>
</html>