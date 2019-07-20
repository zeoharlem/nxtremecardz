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

            <div class="row clearfix">

                <div class="col-md-9">

                    <img src="<?= $this->url->get('assets/images/icons/avatar.jpg') ?>" class="alignleft img-circle img-thumbnail notopmargin nobottommargin" alt="Avatar" style="max-width: 84px;">

                    <div class="heading-block noborder">
                        <h3 style="text-transform: capitalize"><?= $this->session->get('auth')['fullname'] ?></h3>
                        <span style="margin-top:-5px"><?= $this->session->get('auth')['email'] . ' | ' . $this->session->get('auth')['phonenumber'] ?></span>
                    </div>

                    <div class="clear"></div>

                    <div class="row clearfix">

                        <div class="col-lg-12">
                        <table id="example" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Reference</th>
                                        <th>Email</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                foreach($activity as $key => $value){
                                ?>
                                    <tr>
                                        <td><?php echo $value->order_id; ?></td>
                                        <td><?php echo ucwords($value->firstname." ".$value->lastname); ?></td>
                                        <td><?php echo $value->reference; ?></td>
                                        <td><?php echo $value->email; ?></td>
                                        <td><?php echo $value->order_date; ?></td>
                                        <td><a href="javascript:void(0)" class="viewDetails" title="<?php echo $value->reference; ?>">View</a></td>
                                    </tr>
                                <?php
                                }
                                ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Reference</th>
                                        <th>Email</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="col-md-3 clearfix">

                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action clearfix">Reset Password <i class="icon-user float-right"></i></a>
                        <a href="#" class="list-group-item list-group-item-action clearfix">Logout <i class="icon-line2-logout float-right"></i></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-body">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Order Details</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p id="showDetailsRow"></p>
                </div>
            </div>
        </div>
    </div>
</div>


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