<div class="card mb-3">
    <div class="card-header">
      <h5 class="mb-0">{{titleString | capitalize}}</h5>

    </div>
    <div class="card-body bg-light">
            {{flash.output()}}
            <form method="POST" enctype="multipart/form-data">
                  <div class="form-group">
                    <label for="finish_type_name">Type Name</label>
                    <input class="form-control" name="finish_type_name" id="finish_type_name" type="text" placeholder="Finish Type Name">
                  </div>

                  <div class="form-group">
                    <label for="finish_type_image">Image</label>
                    <input class="form-control-file" name="finish_type_image" id="finish_type_image" type="file">
                  </div>
                   <input type='hidden' name="base_card_design_id" value="{{base_card_id}}" />
                  <button class="btn btn-primary" type="submit">Create</button>
            </form>
    </div>
</div>
