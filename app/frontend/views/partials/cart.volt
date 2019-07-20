      <div class="fancy-title title-bottom-border">
          <h2 class="h3 font-weight-bold">{{first.title|capitalize}}</h2>
        </div>
      <h3 class="h4 font-weight-bold">
        &#8358;<span id="tagPrice"><?php echo number_format($first->price, 2); ?></span>
      </h3>
      <p class="text-muted"></p>

      <form method="POST" id="cartFormRow">

      <div class="row mt-4">
        <div class="col-sm-6">
          <div class="form-group">
            <input id="initPriceTag" type="hidden" name="price" value="<?php echo number_format($first->price, 2); ?>"/>
            <input id="realPriceTag" type="hidden" name="real_price" value="<?php echo number_format($first->price, 2); ?>"/>
            <input id="itemId" type="hidden" name="item_id" value="<?php echo $this->request->getQuery('item_id','int'); ?>"/>
            <input id="imageTag" type="hidden" name="image" value="<?php echo $this->request->getQuery('f'); ?>"/>
            <input id="itemTitleTag" type="hidden" name="item_title" value="<?php echo $first->title; ?>"/>
            <label for="size" style="font-weight:bold">Size</label>
            <select class="form-control" id="sizer" name="sizer">
              <option value="3.5 x 2">3.5 x 2</option>
            </select>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label for="color" style="font-weight:bold"><b>Thickness</b></label>
            <select class="form-control" id="color" name="thickness">
              <option value="30">30pt</option>
            </select>
          </div>
        </div>
      </div>
      <!--
      <div class="row">
          <div class="col-sm-12">
            <div class="form-group">
              <label for="size" style="font-weight:bold">Metal Cards</label>
              <select class="form-control">
                <option value="Stainless Steel Slack Matte">Stainless Steel Slack Matte</option>
                <option value="Stainless Steel Brushed">Stainless Steel Brushed</option>
                <option value="Stainless Steel Mirror">Stainless Steel Mirror</option>
                <option value="Silver Plated Metal">Silver Plated Metal</option>
                <option value="Gold Plated Metal">Gold Plated Metal</option>
              </select>
            </div>
          </div>
      </div>
      -->
      <div class="row">
          <div class="col-sm-12">
            <div class="form-group">
              <label for="size" style="font-weight:bold">Custom Die Cut</label>
              <select class="form-control" name="custom_die_cut">
                <option value="-100">Not Included</option>
                <option value="100">Included</option>
              </select>
            </div>
          </div>
      </div>
      <div class="row">
        <div class="col-sm-12">

           <div class="form-group">
                <div class="accordion" id="accordionExample">
                  <div class="card">
                    <div class="card-header" id="headingOne">
                      <h2 class="mb-0">
                        <a class="btn btn-link font-weight-bold" href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          Laser Engrave
                        </a>
                      </h2>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                      <div class="card-body">
                          <div class="opacity-75">
                              <div class="form-group">
                                    <label class="text-muted" for="size" style="font-weight:bold">FORM SIDE</label><br/>
                                    <div class="custom-control custom-checkbox custom-control-inline">
                                      <input class="custom-control-input" value="90" type="checkbox" id="engrave_front_side" name="engrave_front_side">
                                      <label class="custom-control-label" for="engrave_front_side">Laser Engrave</label>
                                    </div>
                              </div>
                              <div class="form-group">
                                  <label class="text-muted" for="size" style="font-weight:bold">BACK SIDE</label><br/>
                                <div class="custom-control custom-checkbox custom-control-inline">
                                  <input class="custom-control-input" value="70" type="checkbox" id="engrave_back_side" name="engrave_back_side">
                                  <label class="custom-control-label" for="engrave_back_side">Laser Engrave</label>
                                </div>
                              </div>
                          </div>
                      </div>
                    </div>
                  </div>
                  <!--<div class="card">
                    <div class="card-header" id="headingTwo">
                      <h2 class="mb-0">
                        <a class="btn btn-link collapsed font-weight-bold" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          Spot Color
                        </a>
                      </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                      <div class="card-body">
                          <div class="opacity-75">
                              <div class="form-group">
                                  <label for="size" style="font-weight:bold">Spot Color</label><br/>
                                  <label class="text-muted" for="size" style="font-weight:bold">FRONT SIDE</label><br/>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input class="custom-control-input defaultFace" type="radio" value="0" id="color_front_side_1" name="color_front_side" checked>
                                    <label class="custom-control-label" for="color_front_side_1">1 Color</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input class="custom-control-input" type="radio" id="color_front_side_2" value="100" name="color_front_side">
                                    <label class="custom-control-label" for="color_front_side_2">2 Color</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input class="custom-control-input" type="radio" id="color_front_side_3" value="200" name="color_front_side">
                                    <label class="custom-control-label" for="color_front_side_3">3 Color</label>
                                  </div>
                                  <div class="custom-control custom-radio custom-control-inline">
                                    <input class="custom-control-input" type="radio" id="color_front_side_4" value="300" name="color_front_side">
                                    <label class="custom-control-label" for="color_front_side_4">4 Color</label>
                                  </div>
                                </div>
                                <div class="form-group">
                                    <label class="text-muted" for="size" style="font-weight:bold">BACK SIDE</label><br/>
                                    <div class="custom-control custom-radio custom-control-inline">
                                      <input class="custom-control-input checkedDefault" type="radio" value="0" id="color_back_side_1" name="color_back_side" checked>
                                      <label class="custom-control-label" for="color_back_side_1">1 Color</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                      <input class="custom-control-input" type="radio" value="100" id="color_back_side_2" name="color_back_side">
                                      <label class="custom-control-label" for="color_back_side_2">2 Color</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                      <input class="custom-control-input" type="radio" value="200" id="color_back_side_3" name="color_back_side">
                                      <label class="custom-control-label" for="color_back_side_3">3 Color</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                      <input class="custom-control-input" type="radio" value="300" id="color_back_side_4" name="color_back_side">
                                      <label class="custom-control-label" for="color_back_side_4">4 Color</label>
                                    </div>
                              </div>
                          </div>
                        </div>
                    </div>
                  </div>-->
                  <div class="card">
                    <div class="card-header" id="headingThree">
                      <h2 class="mb-0 font-weight-bold">
                        <a class="btn btn-link collapsed  font-weight-bold" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          Send Notes
                        </a>
                      </h2>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                      <div class="card-body">
                          <div class="opacity-75">

                              <textarea class="form-control" placeholder="Type Additional Description" name="notes"> </textarea>
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
           </div>
        </div>
      </div>

      <div class="row align-items-end pb-4">
                <div class="col-sm-12">
                  <div class="form-group mb-0">
                    <label for="quantity" style="font-weight:bold">Quantity</label>
                    <input type="text" id="numQtyRow" required name="quantity" autocomplete="off" class="form-control form-control-lg" placeholder="Type Numbers" />
                  </div>
                </div>
            </div>


      <div class="row align-items-end pb-4">

        <div class="col-sm-12">
          <div class="pt-4 hidden-sm-up"></div>
          <button class="btn btn-primary btn-block m-0 btn-lg" type="button" id="addToCartBtn"><i class="fe-icon-shopping-cart"></i> Buy Now</button>
        </div>
      </div>
      </form>
