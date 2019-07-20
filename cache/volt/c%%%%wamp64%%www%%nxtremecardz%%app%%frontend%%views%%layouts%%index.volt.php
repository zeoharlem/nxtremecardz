<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <?= $this->tag->gettitle() ?>

        <!-- Viewport-->
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="stylesheet" href="<?= $this->url->get('assets/css/bootstrap.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/style.css') ?>" type="text/css" />
        <!--<link rel="stylesheet" href="<?= $this->url->get('assets/css/adjust-header.css') ?>" type="text/css" />-->
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/re-adjust-header.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/swiper.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/dark.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/font-icons.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/animate.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/magnific-popup.css') ?>" type="text/css" />
        <link rel="stylesheet" href="<?= $this->url->get('assets/css/responsive.css') ?>" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Raleway:300,400,500,600,700|Crete+Round:400i" rel="stylesheet" type="text/css" />
        <!--<link rel="stylesheet" href="<?= $this->url->get('assets/css/typograph-styler.css') ?>" type="text/css" />-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>

        <?= $this->assets->outputCss('headers') ?>

    </head>

    <!-- Body-->
    <body class="stretched">
    <div id="wrapper" class="clearfix">
        <?= $this->partial('partials/header') ?>

        
    <?= $this->getContent() ?>


        <?= $this->partial('partials/footer') ?>
    </div>

    <!-- Go To Top ============================================= -->
    <div id="gotoTop" class="icon-angle-up"></div>
    <!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
    <script src="<?= $this->url->get('assets/js/jquery.js') ?>"></script>
    <script src="<?= $this->url->get('assets/js/plugins.js') ?>"></script>
    <script src="<?= $this->url->get('assets/js/bootstrap-notify.min.js') ?>"></script>
    <script src="<?= $this->url->get('assets/js/functions.js') ?>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
    <script src="<?= $this->url->get('assets/js/cartsystem.js') ?>"></script>
    <?= $this->assets->outputJs('footers') ?>
    </body>
</html>