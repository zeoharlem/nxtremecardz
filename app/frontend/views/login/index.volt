{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}
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
                {{ flash.output() }}
                <p>Register with us to have your details filled automatically on another purchase and also for you to receive notifications for other activities.</p>

                <form id="register-form" name="register-form" class="nobottommargin" action="{{ url('register/') }}" method="post">

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
{% endblock %}