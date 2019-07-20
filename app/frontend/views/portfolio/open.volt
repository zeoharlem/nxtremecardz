<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">

        <div class="container clearfix">



            <!-- Portfolio Items
            ============================================= -->
            <div id="portfolio" class="portfolio grid-container portfolio-3 clearfix">
                {% for keys,values in pager.getPaginate().items %}
                    <?php
                        $getActiveAlbum = $tActive->getActiveAlbumsAct($values->item_id);
                        $getActiveImage = $getActiveAlbum[array_rand($getActiveAlbum)];
                    ?>
                <article class="portfolio-item pf-media pf-icons">
                    <div class="portfolio-image">
                        <a href="portfolio-single.html">
                            <img src="{{url('assets/portfolio/'~getActiveImage['filename'])}}" alt="Open Imagination">
                        </a>
                        <div class="portfolio-overlay">
                            <a href="{{url('portfolio/detail?item_id='~values.item_id~'&category_id='~values.category_id~'&layout=')}}<?php echo uniqid('xLmrR').'&f='.$getActiveImage['filename']; ?>" class="right-icon"><i class="icon-line-ellipsis"></i></a>
                        </div>
                    </div>
                    <div class="portfolio-desc">
                        <h3><a href="{{url('portfolio/detail?item_id='~values.item_id~'&category_id='~values.category_id~'&layout=')}}<?php echo uniqid('xLmrR').'&f='.$getActiveImage['filename']; ?>">{{ values.title | capitalize }}</a></h3>
                        <span><a href="#">Xtremecardz</a></span>
                    </div>
                </article>
                {% endfor %}


            </div><!-- #portfolio end -->
            {{ partial('partials/pagination2', [
                'page': pager.getPaginate(),
                'limit': pager.getLimit()
                ])
            }}
        </div>

    </div>

</section><!-- #content end -->
