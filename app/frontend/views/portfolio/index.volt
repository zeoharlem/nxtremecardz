<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">

        <div class="container clearfix">

            <div class="clear"></div>

            <!-- Portfolio Items
            ============================================= -->
            <div id="portfolio" class="portfolio grid-container clearfix">

                {% for nkeys,nvalues in catproducts %}
                    {% for keys, values in nvalues %}
                    <article class="portfolio-item pf-illustrations pf-icons">
                        <div class="portfolio-image" style="max-height:180px; overflow: hidden;">
                            <div class="fslider" data-arrows="false" data-speed="650" data-pause="3500" data-animation="fade">
                                <div class="flexslider">
                                    <div class="slider-wrap">
                                    {% for keyRows, valueRows in values %}
                                        <div class="slide"><a href="{{url('portfolio/open?tag='~keys~'&layers=&gr='~nkeys)}}"><img src="{{ url('assets/portfolio/'~valueRows['filename']) }}" alt="{{nkeys}}"></a></div>
                                    {% endfor %}
                                    </div>
                                </div>
                            </div>
                            <div class="portfolio-overlay" data-lightbox="gallery">
                            {% for keyRows, valueRows in values %}
                                <a href="{{ url('assets/portfolio/'~valueRows['filename']) }}" class="left-icon" data-lightbox="gallery-item"><i class="icon-line-stack-2"></i></a>
                             {% endfor %}
                            </div>
                        </div>
                        <div class="portfolio-desc">
                            <h3 style="font-weight:bolder;"><a href="{{url('portfolio/open?tag='~keys~'&layers=&gr='~nkeys)}}">{{nkeys | capitalize}}</a></h3>
                            <span><a href="{{url('portfolio/open?tag='~keys~'&layers=&gr='~nkeys)}}">Xtremecardz</a></span>
                        </div>
                    </article>
                    {% endfor %}
                {% endfor %}

            </div><!-- #portfolio end -->

        </div>

    </div>

</section><!-- #content end -->