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

        
<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">

        <div class="container clearfix">

            <div class="col_one_third nobottommargin" style="border:1px solid #bbb; padding:20px; box-shadow:0px 3px 3px #ccc;">

                <div class="well well-lg nobottommargin">
                    <form id="login-form" name="login-form" class="nobottommargin" action="#" method="post">

                        <h3>Login to your Account</h3>

                        <div class="col_full">
                            <label for="login-form-username">Username:</label>
                            <input type="text" id="login-form-username" name="username" class="form-control" />
                        </div>

                        <div class="col_full">
                            <label for="login-form-password">Password:</label>
                            <input type="password" id="login-form-password" name="fpassword" class="form-control" />
                        </div>

                        <div class="col_full nobottommargin">
                            <button class="button button-3d nomargin" id="login-form-submit" type="submit">Login</button>
                            <a href="#" class="fright">Forgot Password?</a>
                        </div>

                    </form>
                </div>

            </div>

            <div class="col_two_third col_last nobottommargin">
                <style>
                    .field-icon {
                      float: right;
                      margin-left: -25px;
                      margin-right: 15px;
                      margin-top: -35px;
                      position: relative;
                      z-index: 2;
                    }
                </style>

                <h3>Don't have an Account? Register Now.</h3>
                <?= $this->flash->output() ?>
                <p>Register with us to have your details filled automatically on another purchase and also for you to receive notifications for other activities.</p>

                <form id="register-form" name="register-form" class="nobottommargin" action="<?= $this->url->get('register/') ?>" method="post">

                    <div class="col_half">
                        <label for="fullname">Name:</label>
                        <input type="text" id="fullname" name="fullname" class="form-control form-control-lg" />
                    </div>

                    <div class="col_half col_last">
                        <label for="email">Email Address:</label>
                        <input type="email" id="email" name="email" class="form-control form-control-lg" />
                    </div>

                    <div class="clear"></div>

                    <div class="col_half">
                        <label for="phone">Phone:</label>
                        <input type="text" id="phone" name="phone_number" class="form-control form-control-lg" />
                    </div>

                    <div class="col_half col_last">
                        <label for="password-field">Type Password:</label>
                        <input type="password" id="password-field" name="password" class="form-control form-control-lg" />
                        <span toggle="#password-field" class="toggle-password field-icon"><i class="icon-lock"></i></span>
                    </div>

                    <div class="clear"></div>

                    <div class="col_full nobottommargin">
                        <button class="button button-3d button-black nomargin" type="submit" id="register-form-submit" name="submit">Register Now</button>
                    </div>
                </form>

            </div>

        </div>

    </div>

</section><!-- #content end -->


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