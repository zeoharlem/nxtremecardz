{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}

<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">

        <div class="container clearfix">

            <div class="row clearfix">

                <div class="col-md-9">

                    <img src="{{ url('assets/images/icons/avatar.jpg') }}" class="alignleft img-circle img-thumbnail notopmargin nobottommargin" alt="Avatar" style="max-width: 84px;">

                    <div class="heading-block noborder">
                        <h3 style="text-transform: capitalize">{{ session.get('auth')['fullname']}}</h3>
                        <span style="margin-top:-5px">{{ session.get('auth')['email'] ~' | '~session.get('auth')['phonenumber'] }}</span>
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
{% endblock %}