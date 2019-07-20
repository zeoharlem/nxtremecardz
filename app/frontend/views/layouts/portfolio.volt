{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}
    <!-- Page Title
    ============================================= -->
    <section id="page-title" class="page-title-parallax page-title-dark page-title-right" style="padding: 150px 0; background-image: url({{url('assets/images/about/portfolio.jpg')}}); background-size: cover; background-position: center;"  data-top-bottom="background-position:0px -500px;">

        <div class="container clearfix">
                    <h1>Product</h1>
                    <span>Our Portfolio</span>
                </div>

    </section><!-- #page-title end -->


    {{ this.getContent() }}

{% endblock %}