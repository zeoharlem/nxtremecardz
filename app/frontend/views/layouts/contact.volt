{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}
    <!-- Page Title
    ============================================= -->
    <section id="page-title" class="page-title-parallax page-title-dark page-title-right" style="padding: 150px 0; background-image: url({{url('assets/images/contacts.jpg')}}); background-size: cover; background-position: center center;" data-bottom-top="background-position:0px 440px;" data-top-bottom="background-position:0px -500px;">

        <div class="container clearfix">
                    <h1>Contact Us</h1>
                    <span>Everything you need to know about our Company</span>
                </div>

    </section><!-- #page-title end -->


    {{ this.getContent() }}

{% endblock %}