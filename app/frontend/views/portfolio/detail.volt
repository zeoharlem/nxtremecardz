<!-- Page Title
============================================= -->
<section id="page-title" style="margin-top:-170px;">

    <div class="container clearfix">
        <h1 class="h3 font-weight-bold">{{first.title|capitalize}}</h1>
        <div id="portfolio-navigation">
            <a href="#"><i class="icon-angle-left"></i></a>
            <a href="#"><i class="icon-line-grid"></i></a>
            <a href="#"><i class="icon-angle-right"></i></a>
        </div>
    </div>

</section><!-- #page-title end -->

<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">

        <div class="container clearfix">

            <!-- Portfolio Single Image
            ============================================= -->
            <div class="col_half portfolio-single-image nobottommargin">
                <a href="#"><img src="{{ url('assets/portfolio/'~mainImg) }}" alt=""></a>

            </div><!-- .portfolio-single-image end -->

            <!-- Portfolio Single Content
            ============================================= -->
            <div class="col_half portfolio-single-content col_last nobottommargin">

                <?php
                      if($first->category_id == 1){
                      ?>
                        {{partial("partials/cart")}}
                      <?php
                      }
                      elseif($first->category_id == 2){
                      ?>
                        {{partial("partials/cart_1")}}
                      <?php
                      }
                      elseif($first->category_id == 3){
                      ?>
                        {{partial("partials/cart_2")}}
                      <?php
                      }
                      elseif($first->category_id == 4){
                      ?>
                        {{partial("partials/cart_3")}}
                      <?php
                      }
                ?>
                <!-- Portfolio Single - Share
                ============================================= -->
                <div class="si-share clearfix">
                    <span>Share:</span>
                    <div>
                        <a href="#" class="social-icon si-borderless si-facebook">
                            <i class="icon-facebook"></i>
                            <i class="icon-facebook"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-twitter">
                            <i class="icon-twitter"></i>
                            <i class="icon-twitter"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-pinterest">
                            <i class="icon-pinterest"></i>
                            <i class="icon-pinterest"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-gplus">
                            <i class="icon-gplus"></i>
                            <i class="icon-gplus"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-rss">
                            <i class="icon-rss"></i>
                            <i class="icon-rss"></i>
                        </a>
                        <a href="#" class="social-icon si-borderless si-email3">
                            <i class="icon-email3"></i>
                            <i class="icon-email3"></i>
                        </a>
                    </div>
                </div>
                <!-- Portfolio Single - Share End -->

            </div><!-- .portfolio-single-content end -->

            <div class="clear"></div>

            <div class="divider divider-center"><i class="icon-circle"></i></div>

            <!-- Related Portfolio Items
            ============================================= -->
            <h4>Related Projects:</h4>

            <div id="related-portfolio" class="owl-carousel portfolio-carousel carousel-widget" data-margin="20" data-nav="false" data-autoplay="5000" data-items-xs="1" data-items-sm="2" data-items-md="3" data-items-xl="4">
                {% for keyBag, valueBag in active_img %}
                <div class="oc-item">
                    <div class="iportfolio">
                        <div class="portfolio-image" style="max-height:160px; overflow:hidden;">
                            <a href="portfolio-single.html">
                                <img src="{{ url('assets/portfolio/'~valueBag['filename']) }}" alt="Xtremecardz">
                            </a>
                            <div class="portfolio-overlay">
                                <a href="{{url('portfolio')}}" class="right-icon"><i class="icon-line-ellipsis"></i></a>
                            </div>
                        </div>
                        <div class="portfolio-desc">
                            <span><a href="#">Xtremecardz</a></span>
                        </div>
                    </div>
                </div>
                {% endfor %}

            </div><!-- .portfolio-carousel end -->


        </div>

    </div>

</section><!-- #content end -->