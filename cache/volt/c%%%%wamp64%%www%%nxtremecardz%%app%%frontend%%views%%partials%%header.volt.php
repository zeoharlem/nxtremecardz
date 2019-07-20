<!-- Header
============================================= -->
<header id="header" class="transparent-header floating-header dark">

    <div id="header-wrap">

        <!--<div class="container clearfix" style="background:#800020;">-->
        <div class="container clearfix" style="background:none;">

            <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

            <!-- Logo
            ============================================= -->
            <div id="logo">
                <a href="<?= $this->url->get('') ?>" class="standard-logo"><img src="<?= $this->url->get('assets/images/logo_only.png') ?>" alt="Xtremecardz"></a>
                <a href="<?= $this->url->get('') ?>" class="retina-logo"><img src="<?= $this->url->get('assets/images/xtrmc_logo_white.png') ?>" alt="Xtremecardz"></a>
            </div><!-- #logo end -->

            <!-- Primary Navigation
            ============================================= -->
            <nav id="primary-menu">

                <ul>
                    <li class="mega-menu"><a href="<?= $this->url->get('portfolio') ?>"><div>Products</div></a>
                        <div class="mega-menu-content style-2 clearfix">
                            <?php if(isset($products) && count($products) > 0){ ?>
                                <?php foreach ($products as $keys => $values) { ?>
                                    <ul class="mega-menu-column col-lg-3">
                                        <li class="mega-menu-title"><a href="#"><div><?= $keys ?></div></a>
                                            <ul>

                                                <?php foreach ($values as $keysRow => $valuesRow) { ?>
                                                    <li><a href="<?= $this->url->get('portfolio/detail?item_id=' . $valuesRow['portfolio_id'] . '&category_id=' . $valuesRow['category_id'] . '&layout=' . $valuesRow['layout'] . '&f=' . $valuesRow['albums_image']) ?>"><div><?= ucwords($valuesRow['items']) ?></div></a></li>
                                                <?php } ?>

                                            </ul>
                                        </li>
                                    </ul>
                                <?php } ?>
                            <?php } ?>
                            <ul class="mega-menu-column col-lg-3">
                                <li class="mega-menu-title"><a href="#"><div>Our Packages</div></a>
                                    <ul>
                                        <li><a href="<?= $this->url->get('packages/') ?>"><div>Heads-On Package</div></a></li>
                                        <li><a href="<?= $this->url->get('packages/swifts') ?>"><div>Swift Package</div></a></li>
                                        <li><a href="<?= $this->url->get('packages/elites') ?>"><div>Elite Package</div></a></li>
                                        <li><a href="#"><div>Corporate Package</div></a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="mega-menu-column col-lg-3 col_last">
                                <li>
                                    <div class="widget clearfix">

                                        <div class="ipost clearfix">
                                            <div class="entry-image">
                                                <a href="#"><img class="image_fade" style="width:60%; float:left;" src="<?= $this->url->get('assets/images/heads_on_pack_white.png') ?>"></a>
                                                <a href="#"><img class="image_fade" style="width:60%; float:left;" src="<?= $this->url->get('assets/images/elite_pack_white.png') ?>"></a>
                                                <a href="#"><img class="image_fade" style="width:60%; float:left;" src="<?= $this->url->get('assets/images/swift_pack_white.png') ?>"></a>
                                                <a href="#"><img class="image_fade" style="width:60%; float:left;" src="<?= $this->url->get('assets/images/packs/heads_on_pack.png') ?>"></a>
                                                <p>&nbsp;</p>
                                            </div>
                                        </div>

                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li><a href="<?= $this->url->get('accessories') ?>"><div>Accessories</div></a></li>
                    <li><a href="<?= $this->url->get('contact') ?>"><div>Contact Us</div></a></li>
                    <li><a href="<?= $this->url->get('about') ?>"><div>Our Story</div></a></li>
                    <?php if($this->session->has("auth")){ ?>
                        <li><a href="<?= $this->url->get('logout/') ?>"><div>Logout</div></a></li>
                    <?php }else{ ?>
                        <li><a href="<?= $this->url->get('login/') ?>?token=<?php echo uniqid(); ?>"><div>Login</div></a></li>
                    <?php } ?>

                </ul>

                <!-- Top Cart
                ============================================= -->
                <?php  $counterRow  = $this->session->has('cart_item') ? $this->session->get('cart_item') : []; ?>
                <div id="top-cart">
                    <a href="#" id="top-cart-trigger"><i class="icon-shopping-cart"></i><span id="cartQtyFig" style="background:#FFD700; color:#FFF;"><?php echo count($counterRow); ?></span></a>
                    <div class="top-cart-content">
                        <div class="top-cart-title">
                            <h4>Cart</h4>
                        </div>
                        <?php if($this->session->has('cart_item')){
                        //var_dump($this->session->get('portfolio_items')); exit;
                        foreach($this->session->get('cart_item') as $key => $value){

                        ?>
                        <div class="top-cart-items">
                            <div class="top-cart-item clearfix">
                                <div class="top-cart-item-image">
                                    <a href="#"><img src="<?php echo $value['image']; ?>" alt="<?php echo ucwords($value['name']); ?>" /></a>
                                </div>
                                <div class="top-cart-item-desc">
                                    <a href="#"><?php echo $value['name']; ?></a>
                                    <span class="top-cart-item-price">&#8358;<?php echo number_format($value['price'], 2); ?></span>

                                    <span class="top-cart-item-quantity">x <?php echo $value['quantity']; ?></span>

                                </div>
                            </div>
                        </div>
                        <div class="top-cart-action clearfix">
                        <?php if($value['name'] == "headson" || $value['name'] == "elites"){ ?>
                            <span class="fleft top-checkout-price">&#8358;<?php echo number_format($value['price'], 2); ?></span>
                        <?php }else{ ?>
                            <span class="fleft top-checkout-price">&#8358;<?php echo number_format($value['price']*$value['quantity'], 2); ?></span>
                        <?php } ?>
                        <a href="<?= $this->url->get('cart/viewcart') ?>" class="button button-3d button-small nomargin fright">View Cart</a>
                        </div>
                        <?php } ?>
                    </div>
                    <?php } ?>
                </div><!-- #top-cart end -->



            </nav><!-- #primary-menu end -->

        </div>

    </div>

</header><!-- #header end -->