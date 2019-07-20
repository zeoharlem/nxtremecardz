{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}
    <!-- Page Title
    ============================================= -->
    <section id="page-title" class="page-title-parallax page-title-dark page-title-right" style="padding: 150px 0; background-image: url({{url('assets/images/about/Black_matte.jpg')}}); background-size: cover; background-position: center center;" data-bottom-top="background-position:0px 440px;" data-top-bottom="background-position:0px -500px;">

        <div class="container clearfix">
                    <h1>Heads-On Package</h1>
                    <span>Everything you need to know about our Company</span>
                </div>

    </section><!-- #page-title end -->

<!-- Content
		============================================= -->
<section id="content">

    <div class="content-wrap">

        <div class="container clearfix">

            <div class="single-product">

                <div class="product">

                    <div class="col_two_fifth">

                        <!-- Product Single - Gallery
                        ============================================= -->
                        <div class="product-image">
                            <div class="fslider" data-pagi="false" data-arrows="false" data-thumbs="true">
                                <div class="flexslider">
                                    <div class="slider-wrap" data-lightbox="gallery">
                                        <div class="slide" data-thumb="{{url('assets/images/portfolio/4/2.jpg')}}"><a href="{{url('assets/images/portfolio/full/2.jpg')}}" title="Pink Printed Dress - Front View" data-lightbox="gallery-item"><img src="{{url('assets/images/portfolio/full/2.jpg')}}" alt="Pink Printed Dress"></a></div>
                                        <div class="slide" data-thumb="{{url('assets/images/portfolio/4/3.jpg')}}"><a href="{{url('assets/images/portfolio/full/3.jpg')}}" title="Pink Printed Dress - Side View" data-lightbox="gallery-item"><img src="{{url('assets/images/portfolio/full/3.jpg')}}" alt="Pink Printed Dress"></a></div>
                                        <div class="slide" data-thumb="{{url('assets/images/portfolio/4/4.jpg')}}"><a href="{{url('assets/images/portfolio/full/4.jpg')}}" title="Pink Printed Dress - Back View" data-lightbox="gallery-item"><img src="{{url('assets/images/portfolio/full/4.jpg')}}" alt="Pink Printed Dress"></a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="sale-flash">Sale!</div>
                        </div><!-- Product Single - Gallery End -->

                    </div>

                    <div class="col_two_fifth product-desc">

                        <!-- Product Single - Quantity & Cart Button
                        ============================================= -->
                        <form class="cart nobottommargin clearfix" role="form" method="post" id="cartFormPackage" enctype='multipart/form-data'>


                            <div class="clear"></div>

                            <!-- Product Single - Short Description
                            ============================================= -->
                            <p>
                                <h1>Elites Package</h1>
                            </p>

                            <div id="accordion" role="tablist">

                                <div class="card">
                                    <div class="card-header" role="tab" id="headingFour">
                                        <h5 class="mb-0">
                                            <a class="collapsed" data-toggle="collapse" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                Artwork/Design Service
                                            </a>
                                        </h5>
                                    </div>
                                    <div id="collapseFour" class="collapse show" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <label>You have your Artwork Design:</label><br>
                                                    <p>Upload Multiple files of at least 2 design files, especially front and back designs of your project and atmost 4 design files</p>
                                                    <input id="elites_images" name="card_designs[]" type="file" class="file-loading" data-max-file-size="50M" multiple /><br/>
                                                </div>
                                                <div class="col-lg-12 bottommargin">
                                                    <label for="graphic_design_service" class="radio-style-3-label">
                                                        Or You want us to Design for you: &#8358;25,000.00
                                                    </label><br/>
                                                    <input id="graphic_design_service" class="checkbox-style" name="graphic_design_service" type="checkbox" value="25000"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>

                            <div class="form-group" style="padding-top:10px;">
                                <label for="project_details">You can give Details</label>
                                <textarea class="form-control" id="project_details" placeholder="Tell us more of what you want" rows="3" name="project_details"></textarea>
                            </div>



                            <!-- Product Single - Price
                            ============================================= -->
                            <div class="product-price">
                                <input type="hidden" name="file_list" />
                                <input type="hidden" name="hash_tag" id="hash_tag" />
                                <input type="hidden" name="total_quantity" id="total_quantity" value="100" />
                                <input type="hidden" name="quantityDerive" id="quantityDerive" value="144000" />
                                <ins>&#8358;<span id="price_tagged" title="144000">144,000.00</span></ins>
                            </div><!-- Product Single - Price End -->


                            <div class="clear"></div>
                            <div class="line"></div>

                            <button type="button" class="add-to-cart-elites button nomargin">Add to cart</button>
                        </form>
                        <!-- Product Single - Quantity & Cart Button End -->

                        <div class="clear"></div>
                        <p>&nbsp;</p>

                        <!-- Product Single - Meta
                        ============================================= -->
                        <div class="card product-meta">
                            <div class="card-body">
                                <span itemprop="productID" class="sku_wrapper">SKU: <span class="sku">8465415</span></span>
                                <span class="posted_in">Category: <a href="#" rel="tag">Dress</a>.</span>
                                <span class="tagged_as">Tags: <a href="#" rel="tag">Pink</a>, <a href="#" rel="tag">Short</a>, <a href="#" rel="tag">Dress</a>, <a href="#" rel="tag">Printed</a>.</span>
                            </div>
                        </div><!-- Product Single - Meta End -->

                        <!-- Product Single - Share
                        ============================================= -->
                        <div class="si-share noborder clearfix">
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
                        </div><!-- Product Single - Share End -->


                    </div>

                    <div class="col_one_fifth col_last">

                        <div class="divider divider-center"><i class="icon-circle-blank"></i></div>

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-thumbs-up2"></i>
                            </div>
                            <h3>100% Original</h3>
                            <p class="notopmargin">We guarantee you the sale of Original Brands.</p>
                        </div>

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-credit-cards"></i>
                            </div>
                            <h3>Payment Options</h3>
                            <p class="notopmargin">We accept Visa, MasterCard and American Express.</p>
                        </div>

                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                            <div class="fbox-icon">
                                <i class="icon-truck2"></i>
                            </div>
                            <h3>Free Shipping</h3>
                            <p class="notopmargin">Free Delivery to 100+ Locations on orders above $40.</p>
                        </div>

                    </div>



                </div>

            </div>


        </div>

    </div>

</section><!-- #content end -->

{% endblock %}