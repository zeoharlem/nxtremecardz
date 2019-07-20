{% extends "templates/base.volt" %}

{% block head %}

{% endblock %}

{% block content %}
    <!-- Content
    ============================================= -->
    <section id="content">

        <div class="content-wrap">

            <div class="container clearfix">

                <div class="col_half">
                    <div class="card">
                        <div class="card-body">
                            Returning customer? <a href="{{ url('login') }}">Click here to login</a>
                        </div>
                    </div>
                </div>
                <?php
                if($this->session->get("auth")){
                ?>
                <div class="col_half col_last">
                    <div class="card">
                        <div class="card-body">
                            <!--<a href="{{ url('dashboard') }}" class="button button-3d button-rounded button-amber"><i class="icon-ok"></i>Dashboard</a>-->
                            <a href="{{ url('dashboard') }}?token=<?php echo uniqid('xcR8'); ?>"><b>Dashboard</b></a>
                        </div>
                    </div>
                </div>
                <?php
                }
                ?>
                <div class="clear"></div>

                <div class="row clearfix">
                    <div class="col-lg-6">
                        <h3>Billing Address</h3>

                        <p>International clients are responsible for shipping as well as any other taxes or fees associated with that country.</p>

                        <form id="billing-form" name="billing-form" class="nobottommargin" action="#" method="post">

                            <div class="col_half">
                                <label for="firstname">First Name: *</label>
                                <input type="text" id="firstname" name="firstname" class="sm-form-control" value="<?php echo @$this->session->get("auth")["firstname"];?>" />
                            </div>

                            <div class="col_half col_last">
                                <label for="lastname">Last Name: *</label>
                                <input type="text" id="lastname" name="lastname" class="sm-form-control" value="<?php echo @$this->session->get("auth")["lastname"]; ?>" />
                            </div>

                            <div class="clear"></div>

                            <div class="col_full">
                                <label for="company">Company Name: *</label>
                                <input type="text" id="company" name="company" class="sm-form-control" value="<?php echo @$this->session->get("auth")["company"]; ?>" />
                            </div>

                            <div class="col_full">
                                <label for="address">Address: *</label>
                                <input type="text" id="address" name="address" class="sm-form-control" value="<?php echo @$this->session->get("auth")["address"]; ?>" />
                            </div>

                            <div class="col_half">
                                <label for="country">Country *</label>
                                <select class="sm-form-control name="country" id="country">
                                   <option value="Afganistan">Afghanistan</option>
                                   <option value="Albania">Albania</option>
                                   <option value="Algeria">Algeria</option>
                                   <option value="American Samoa">American Samoa</option>
                                   <option value="Andorra">Andorra</option>
                                   <option value="Angola">Angola</option>
                                   <option value="Anguilla">Anguilla</option>
                                   <option value="Antigua & Barbuda">Antigua & Barbuda</option>
                                   <option value="Argentina">Argentina</option>
                                   <option value="Armenia">Armenia</option>
                                   <option value="Aruba">Aruba</option>
                                   <option value="Australia">Australia</option>
                                   <option value="Austria">Austria</option>
                                   <option value="Azerbaijan">Azerbaijan</option>
                                   <option value="Bahamas">Bahamas</option>
                                   <option value="Bahrain">Bahrain</option>
                                   <option value="Bangladesh">Bangladesh</option>
                                   <option value="Barbados">Barbados</option>
                                   <option value="Belarus">Belarus</option>
                                   <option value="Belgium">Belgium</option>
                                   <option value="Belize">Belize</option>
                                   <option value="Benin">Benin</option>
                                   <option value="Bermuda">Bermuda</option>
                                   <option value="Bhutan">Bhutan</option>
                                   <option value="Bolivia">Bolivia</option>
                                   <option value="Bonaire">Bonaire</option>
                                   <option value="Bosnia & Herzegovina">Bosnia & Herzegovina</option>
                                   <option value="Botswana">Botswana</option>
                                   <option value="Brazil">Brazil</option>
                                   <option value="British Indian Ocean Ter">British Indian Ocean Ter</option>
                                   <option value="Brunei">Brunei</option>
                                   <option value="Bulgaria">Bulgaria</option>
                                   <option value="Burkina Faso">Burkina Faso</option>
                                   <option value="Burundi">Burundi</option>
                                   <option value="Cambodia">Cambodia</option>
                                   <option value="Cameroon">Cameroon</option>
                                   <option value="Canada">Canada</option>
                                   <option value="Canary Islands">Canary Islands</option>
                                   <option value="Cape Verde">Cape Verde</option>
                                   <option value="Cayman Islands">Cayman Islands</option>
                                   <option value="Central African Republic">Central African Republic</option>
                                   <option value="Chad">Chad</option>
                                   <option value="Channel Islands">Channel Islands</option>
                                   <option value="Chile">Chile</option>
                                   <option value="China">China</option>
                                   <option value="Christmas Island">Christmas Island</option>
                                   <option value="Cocos Island">Cocos Island</option>
                                   <option value="Colombia">Colombia</option>
                                   <option value="Comoros">Comoros</option>
                                   <option value="Congo">Congo</option>
                                   <option value="Cook Islands">Cook Islands</option>
                                   <option value="Costa Rica">Costa Rica</option>
                                   <option value="Cote DIvoire">Cote DIvoire</option>
                                   <option value="Croatia">Croatia</option>
                                   <option value="Cuba">Cuba</option>
                                   <option value="Curaco">Curacao</option>
                                   <option value="Cyprus">Cyprus</option>
                                   <option value="Czech Republic">Czech Republic</option>
                                   <option value="Denmark">Denmark</option>
                                   <option value="Djibouti">Djibouti</option>
                                   <option value="Dominica">Dominica</option>
                                   <option value="Dominican Republic">Dominican Republic</option>
                                   <option value="East Timor">East Timor</option>
                                   <option value="Ecuador">Ecuador</option>
                                   <option value="Egypt">Egypt</option>
                                   <option value="El Salvador">El Salvador</option>
                                   <option value="Equatorial Guinea">Equatorial Guinea</option>
                                   <option value="Eritrea">Eritrea</option>
                                   <option value="Estonia">Estonia</option>
                                   <option value="Ethiopia">Ethiopia</option>
                                   <option value="Falkland Islands">Falkland Islands</option>
                                   <option value="Faroe Islands">Faroe Islands</option>
                                   <option value="Fiji">Fiji</option>
                                   <option value="Finland">Finland</option>
                                   <option value="France">France</option>
                                   <option value="French Guiana">French Guiana</option>
                                   <option value="French Polynesia">French Polynesia</option>
                                   <option value="French Southern Ter">French Southern Ter</option>
                                   <option value="Gabon">Gabon</option>
                                   <option value="Gambia">Gambia</option>
                                   <option value="Georgia">Georgia</option>
                                   <option value="Germany">Germany</option>
                                   <option value="Ghana">Ghana</option>
                                   <option value="Gibraltar">Gibraltar</option>
                                   <option value="Great Britain">Great Britain</option>
                                   <option value="Greece">Greece</option>
                                   <option value="Greenland">Greenland</option>
                                   <option value="Grenada">Grenada</option>
                                   <option value="Guadeloupe">Guadeloupe</option>
                                   <option value="Guam">Guam</option>
                                   <option value="Guatemala">Guatemala</option>
                                   <option value="Guinea">Guinea</option>
                                   <option value="Guyana">Guyana</option>
                                   <option value="Haiti">Haiti</option>
                                   <option value="Hawaii">Hawaii</option>
                                   <option value="Honduras">Honduras</option>
                                   <option value="Hong Kong">Hong Kong</option>
                                   <option value="Hungary">Hungary</option>
                                   <option value="Iceland">Iceland</option>
                                   <option value="Indonesia">Indonesia</option>
                                   <option value="India">India</option>
                                   <option value="Iran">Iran</option>
                                   <option value="Iraq">Iraq</option>
                                   <option value="Ireland">Ireland</option>
                                   <option value="Isle of Man">Isle of Man</option>
                                   <option value="Israel">Israel</option>
                                   <option value="Italy">Italy</option>
                                   <option value="Jamaica">Jamaica</option>
                                   <option value="Japan">Japan</option>
                                   <option value="Jordan">Jordan</option>
                                   <option value="Kazakhstan">Kazakhstan</option>
                                   <option value="Kenya">Kenya</option>
                                   <option value="Kiribati">Kiribati</option>
                                   <option value="Korea North">Korea North</option>
                                   <option value="Korea Sout">Korea South</option>
                                   <option value="Kuwait">Kuwait</option>
                                   <option value="Kyrgyzstan">Kyrgyzstan</option>
                                   <option value="Laos">Laos</option>
                                   <option value="Latvia">Latvia</option>
                                   <option value="Lebanon">Lebanon</option>
                                   <option value="Lesotho">Lesotho</option>
                                   <option value="Liberia">Liberia</option>
                                   <option value="Libya">Libya</option>
                                   <option value="Liechtenstein">Liechtenstein</option>
                                   <option value="Lithuania">Lithuania</option>
                                   <option value="Luxembourg">Luxembourg</option>
                                   <option value="Macau">Macau</option>
                                   <option value="Macedonia">Macedonia</option>
                                   <option value="Madagascar">Madagascar</option>
                                   <option value="Malaysia">Malaysia</option>
                                   <option value="Malawi">Malawi</option>
                                   <option value="Maldives">Maldives</option>
                                   <option value="Mali">Mali</option>
                                   <option value="Malta">Malta</option>
                                   <option value="Marshall Islands">Marshall Islands</option>
                                   <option value="Martinique">Martinique</option>
                                   <option value="Mauritania">Mauritania</option>
                                   <option value="Mauritius">Mauritius</option>
                                   <option value="Mayotte">Mayotte</option>
                                   <option value="Mexico">Mexico</option>
                                   <option value="Midway Islands">Midway Islands</option>
                                   <option value="Moldova">Moldova</option>
                                   <option value="Monaco">Monaco</option>
                                   <option value="Mongolia">Mongolia</option>
                                   <option value="Montserrat">Montserrat</option>
                                   <option value="Morocco">Morocco</option>
                                   <option value="Mozambique">Mozambique</option>
                                   <option value="Myanmar">Myanmar</option>
                                   <option value="Nambia">Nambia</option>
                                   <option value="Nauru">Nauru</option>
                                   <option value="Nepal">Nepal</option>
                                   <option value="Netherland Antilles">Netherland Antilles</option>
                                   <option value="Netherlands">Netherlands (Holland, Europe)</option>
                                   <option value="Nevis">Nevis</option>
                                   <option value="New Caledonia">New Caledonia</option>
                                   <option value="New Zealand">New Zealand</option>
                                   <option value="Nicaragua">Nicaragua</option>
                                   <option value="Niger">Niger</option>
                                   <option value="Nigeria">Nigeria</option>
                                   <option value="Niue">Niue</option>
                                   <option value="Norfolk Island">Norfolk Island</option>
                                   <option value="Norway">Norway</option>
                                   <option value="Oman">Oman</option>
                                   <option value="Pakistan">Pakistan</option>
                                   <option value="Palau Island">Palau Island</option>
                                   <option value="Palestine">Palestine</option>
                                   <option value="Panama">Panama</option>
                                   <option value="Papua New Guinea">Papua New Guinea</option>
                                   <option value="Paraguay">Paraguay</option>
                                   <option value="Peru">Peru</option>
                                   <option value="Phillipines">Philippines</option>
                                   <option value="Pitcairn Island">Pitcairn Island</option>
                                   <option value="Poland">Poland</option>
                                   <option value="Portugal">Portugal</option>
                                   <option value="Puerto Rico">Puerto Rico</option>
                                   <option value="Qatar">Qatar</option>
                                   <option value="Republic of Montenegro">Republic of Montenegro</option>
                                   <option value="Republic of Serbia">Republic of Serbia</option>
                                   <option value="Reunion">Reunion</option>
                                   <option value="Romania">Romania</option>
                                   <option value="Russia">Russia</option>
                                   <option value="Rwanda">Rwanda</option>
                                   <option value="St Barthelemy">St Barthelemy</option>
                                   <option value="St Eustatius">St Eustatius</option>
                                   <option value="St Helena">St Helena</option>
                                   <option value="St Kitts-Nevis">St Kitts-Nevis</option>
                                   <option value="St Lucia">St Lucia</option>
                                   <option value="St Maarten">St Maarten</option>
                                   <option value="St Pierre & Miquelon">St Pierre & Miquelon</option>
                                   <option value="St Vincent & Grenadines">St Vincent & Grenadines</option>
                                   <option value="Saipan">Saipan</option>
                                   <option value="Samoa">Samoa</option>
                                   <option value="Samoa American">Samoa American</option>
                                   <option value="San Marino">San Marino</option>
                                   <option value="Sao Tome & Principe">Sao Tome & Principe</option>
                                   <option value="Saudi Arabia">Saudi Arabia</option>
                                   <option value="Senegal">Senegal</option>
                                   <option value="Seychelles">Seychelles</option>
                                   <option value="Sierra Leone">Sierra Leone</option>
                                   <option value="Singapore">Singapore</option>
                                   <option value="Slovakia">Slovakia</option>
                                   <option value="Slovenia">Slovenia</option>
                                   <option value="Solomon Islands">Solomon Islands</option>
                                   <option value="Somalia">Somalia</option>
                                   <option value="South Africa">South Africa</option>
                                   <option value="Spain">Spain</option>
                                   <option value="Sri Lanka">Sri Lanka</option>
                                   <option value="Sudan">Sudan</option>
                                   <option value="Suriname">Suriname</option>
                                   <option value="Swaziland">Swaziland</option>
                                   <option value="Sweden">Sweden</option>
                                   <option value="Switzerland">Switzerland</option>
                                   <option value="Syria">Syria</option>
                                   <option value="Tahiti">Tahiti</option>
                                   <option value="Taiwan">Taiwan</option>
                                   <option value="Tajikistan">Tajikistan</option>
                                   <option value="Tanzania">Tanzania</option>
                                   <option value="Thailand">Thailand</option>
                                   <option value="Togo">Togo</option>
                                   <option value="Tokelau">Tokelau</option>
                                   <option value="Tonga">Tonga</option>
                                   <option value="Trinidad & Tobago">Trinidad & Tobago</option>
                                   <option value="Tunisia">Tunisia</option>
                                   <option value="Turkey">Turkey</option>
                                   <option value="Turkmenistan">Turkmenistan</option>
                                   <option value="Turks & Caicos Is">Turks & Caicos Is</option>
                                   <option value="Tuvalu">Tuvalu</option>
                                   <option value="Uganda">Uganda</option>
                                   <option value="United Kingdom">United Kingdom</option>
                                   <option value="Ukraine">Ukraine</option>
                                   <option value="United Arab Erimates">United Arab Emirates</option>
                                   <option value="United States of America">United States of America</option>
                                   <option value="Uraguay">Uruguay</option>
                                   <option value="Uzbekistan">Uzbekistan</option>
                                   <option value="Vanuatu">Vanuatu</option>
                                   <option value="Vatican City State">Vatican City State</option>
                                   <option value="Venezuela">Venezuela</option>
                                   <option value="Vietnam">Vietnam</option>
                                   <option value="Virgin Islands (Brit)">Virgin Islands (Brit)</option>
                                   <option value="Virgin Islands (USA)">Virgin Islands (USA)</option>
                                   <option value="Wake Island">Wake Island</option>
                                   <option value="Wallis & Futana Is">Wallis & Futana Is</option>
                                   <option value="Yemen">Yemen</option>
                                   <option value="Zaire">Zaire</option>
                                   <option value="Zambia">Zambia</option>
                                   <option value="Zimbabwe">Zimbabwe</option>

                                </select>
                            </div>

                            <div class="col_half col_last">
                                <label for="city">City / Town *</label>
                                <input type="text" id="city" name="city" value="<?php echo @$this->session->get("auth")["city"];?>" class="sm-form-control" />
                            </div>

                            <div class="col_half">
                                <label for="email">Email Address: *</label>
                                <input type="email" id="email" name="email" value="<?php echo @$this->session->get("auth")["email"];?>" class="sm-form-control" />
                            </div>

                            <div class="col_half col_last">
                                <label for="phonenumber">Phone: *</label>
                                <input type="text" id="phonenumber" name="phonenumber" class="sm-form-control" value="<?php echo @$this->session->get("auth")["phonenumber"];?>" />
                            </div>

                            <div class="col_full">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="create_account" id="defaultCheck1">
                                    <label class="form-check-label" for="defaultCheck1">
                                        <b>Create An Account From These Detail</b>
                                    </label>
                                </div>
                            </div>

                            <div class="col_full" style="display:none;" id='pswdShowDiv'>
                                <label for="address">Password: *</label>
                                <input type="password" id="password" name="password" class="sm-form-control" />
                            </div>

                        </form>
                    </div>
                    <div class="col-lg-6" style="border:1px solid #bbb; padding:25px; box-shadow:0px 3px 3px #ccc; background:#fcfcfc;">

                        <h4><b>Your Orders</b></h4>

                        <div class="table-responsive">
                            <table class="table cart">
                                <thead>
                                    <tr>
                                        <th class="cart-product-thumbnail">&nbsp;</th>
                                        <th class="cart-product-name">Product</th>
                                        <th class="cart-product-quantity">Quantity</th>
                                        <th class="cart-product-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if($this->session->has('cart_item')){
                                    foreach($this->session->get('cart_item') as $key => $value){
                                    ?>
                                        <tr class="cart_item">

                                            <td class="cart-product-thumbnail">
                                                <a href="#"><img width="64" height="64" src="<?php echo $value['image']; ?>" alt="<?php echo ucwords($value['name']); ?>"></a>
                                            </td>

                                            <td class="cart-product-name">
                                                <a href="#"><?php echo ucwords($value['name']); ?></a>
                                            </td>

                                            <td class="cart-product-quantity">
                                                <div class="quantity clearfix">

                                                   <?php echo $value['quantity']; ?>

                                                </div>
                                            </td>

                                            <td class="cart-product-subtotal">
                                                <span class="amount">&#8358;<?php echo number_format($value['price']*$value['quantity'], 2); ?></span>
                                            </td>
                                        </tr>
                                    <?php
                                        }
                                    }
                                    ?>
                                </tbody>

                            </table>
                        </div>
                        <div class="w-100 bottommargin"></div>
                        <h4><b>Cart Totals</b></h4>

                        <div class="table-responsive">
                            <table class="table cart">
                                <tbody>
                                    <tr class="cart_item">
                                        <td class="notopborder cart-product-name">
                                            <strong>Cart Subtotal</strong>
                                        </td>

                                        <td class="notopborder cart-product-name">
                                            <span class="amount">&#8358;<?php echo $totalAmountFt; ?></span>
                                        </td>
                                    </tr>
                                    <tr class="cart_item">
                                        <td class="cart-product-name">
                                            <strong>Shipping</strong>
                                        </td>

                                        <td class="cart-product-name">
                                            <span class="amount">Free Delivery</span>
                                        </td>
                                    </tr>
                                    <tr class="cart_item">
                                        <td class="cart-product-name">
                                            <strong>Total</strong>
                                        </td>

                                        <td class="cart-product-name">
                                            <span class="amount color lead"><strong style="font-weight:bold;">&#8358;<?php echo $totalAmountFt; ?></strong></span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <script src="https://js.paystack.co/v1/inline.js"></script>
                        <a href="#" class="button button-3d fright" id="withPayStack">Buy with PayStack</a>
                    </div>
                    <div class="w-100 bottommargin"></div>

                </div>
            </div>

        </div>

    </section><!-- #content end -->

{% endblock %}