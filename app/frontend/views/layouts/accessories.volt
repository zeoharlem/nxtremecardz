{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}
    <!-- Page Title
    ============================================= -->
    <section id="page-title" class="page-title-parallax page-title-dark page-title-right" style="padding: 150px 0; background-image: url({{url('assets/images/about/accessories2.jpg')}}); background-size: cover; background-position: center center;" data-bottom-top="background-position:0px 840px;" data-top-bottom="background-position:0px -500px;">

        <div class="container clearfix">
                    <h1>Accessories</h1>
                    <span>Check-Out our beautiful accessories</span>
                </div>

    </section><!-- #page-title end -->


    {{ this.getContent() }}

{% endblock %}