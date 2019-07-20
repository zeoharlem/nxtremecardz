<div class="card mb-3">
    <div class="card-header">
      <h5 class="mb-0">Pricing Table</h5>

    </div>
    <div class="card-body bg-light">
            {{flash.output()}}
            <form method="POST" enctype="multipart/form-data">
                  <div class="form-group">
                    <label for="base_card_design_id">Finish Type</label>
                    <select class="form-control" id="base_card_design_id" name="base_card_design_id">
                      {% for keys, values in finish_type %}
                        <option value='{{values.base_card_design_id}}'>{{values.base_card_title | capitalize}}</option>
                      {% endfor %}
                    </select>
                  </div>

                  <div class="form-group">
                    <label for="quantity">Quantity</label>
                    <input class="form-control" name="quantity" id="quantity" type="text" placeholder="Quantity">
                  </div>

                  <div class="form-group">
                    <label for="price">Price</label>
                    <input class="form-control" name="price" id="price" type="text" placeholder="Price">
                  </div>

                  <button class="btn btn-primary" type="submit">Create</button>
            </form>
    </div>
</div>
