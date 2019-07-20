<div class="card mb-3">
    <div class="card-header">
      <h5 class="mb-0">Base Design</h5>

    </div>
    <div class="card-body bg-light">
            {{flash.output()}}
            <form method="POST" enctype="multipart/form-data">
                  <div class="form-group">
                    <label for="name">Title</label>
                    <input class="form-control" name="base_card_title" id="base_card_title"  required type="text" placeholder="Base Card Title">
                  </div>

                  <div class="form-group">
                    <label for="exampleFormControlFile1">Base Design's Image</label>
                    <input class="form-control-file" name="base_card_image" id="base_card_image" required type="file">
                  </div>

                  <button class="btn btn-primary" type="submit">Create</button>
            </form>
    </div>
</div>
{% if baseCardDesign is defined %}
<div class="card mb-3">
    <div class="card-body bg-light">
        {{flash.output()}}
        <ul class="list-group">
        {% for key, values in baseCardDesign %}

          <li class="list-group-item d-flex justify-content-between align-items-center"><b><a href="{{url('admin/setcards/basecards/'~values.base_card_design_id)~'/'~values.base_card_title}}">{{values.base_card_title | capitalize}}</a></b></li>
        {% endfor %}
        </ul>
    </div>
</div>
{% endif %}