//Set Private Roles and Actions to Events
var urlPath         = window.location;
var stringVi        = urlPath.hostname === "localhost" ? "nxtremecardz" : "xtr";
var fullpath        = urlPath.protocol+'//'+urlPath.hostname+urlPath.pathname;
var frontend        = urlPath.pathname.substring(0, urlPath.pathname.indexOf(stringVi)+stringVi.length);
var urlRowString    = urlPath.protocol+'//'+urlPath.hostname+frontend;

var PackagesAction  = function() {

    var ReadySampleFinishBox    = function(){
        var typeRadioBox    = $('.finishTypeRadio');
        var SelectQueryBox  = $('#selectRowShowQty');
        var finishCardTypes = $('#finishCardTypes');

        typeRadioBox.on("change", function(){
            var checkRadioBox   = $(".finishTypeRadio:checked").val();

            $.ajax({
                method: "POST",
                data: {'pack_id': checkRadioBox},
                url: urlRowString + '/packages/packtype/',
                success: function (result) {
                    var tableRow    = "<div class='row'>"
                    var optionsRow  = "<select class='form-control' id='selectQuantityRow' name='quantity'>";
                    optionsRow  += "<option value='0'>-- Select Quantity --</option>";
                    for(var i=0; i < result.pricing.length; i++){
                        optionsRow += "<option value='"
                            + parseFloat(result.pricing[i].quantity * result.pricing[i].price).toFixed(2)
                            +"' title='"+result.pricing[i].quantity+"' id='"+result.pricing[i].price+"'>"
                            + result.pricing[i].quantity +"(@)&#8358;"+result.pricing[i].price+"</option>";
                    }
                    for(var n=0; n < result.cardDesign.length; n++){
                        tableRow += "<div class='col-lg-6'><label for='rowCard"+n
                            +"'><img src='"+urlRowString+"/assets/base_design/sub/"
                            +result.cardDesign[n].finish_type_image+"' />"
                            +result.cardDesign[n].finish_type_name
                            +"<input type='radio' id='rowCard"+n
                            +"' name='finish_type' value='"+result.cardDesign[n].finish_type_id
                            +"' /></label></div>";
                    }
                    tableRow    += "</div>"
                    optionsRow += "</select>";

                    SelectQueryBox.html(optionsRow);
                    finishCardTypes.html(tableRow);

                    SelectQueryBox.show();
                    $("select").children("option").on("click", function(e){
                        $('#price_tagged').html(number_format($(this).val(),2,".",","));
                        $("input[name='singlePrice']").val($(this).prop('id'));
                        $("input[name='singleQty']").val($(this).prop('title'));
                        $('#quantityDerive').val($(this).val());
                    })
                }
            })
        });


    };

    var BoostrapFileUpload  = function(){
        $("#input-5").fileinput({
            showCaption: false,
            showBrowse: false,
            dropZoneTitle: 'Drag & drop Multiple files here, Max 4, Min 2 including Front & Back Designs',
            browseOnZoneClick: true,
            browseLabel: "Upload Your Designs | Multiple",
            allowedFileExtensions: ["zip", "rar", "gz", "tgz","jpeg","jpg","png"],
            minFileCount: 2,
            maxFileCount: 4,
            uploadAsync: false,
            theme: 'fas',
            browseClass: "btn btn-lg btn-block btn-primary",
            uploadUrl: urlRowString+"/packages/uploadimg/",
            uploadExtraData: {
                register_id: 1,
                type_package: "swift"
            }
        }).on('filebatchuploadsuccess', function(event, data, id, index) {
            //$('#kv-success-2').html('<h4>Upload Status</h4><ul></ul>').hide();
            var stringRow   = JSON.stringify(data.response.data.toString());
            $("input[name='file_list']").val(stringRow);
        });
    };

    var SubmitSwiftPack = function () {
        $('.add-to-cart').on('click', function(e){
            var stringRowParams     = "";
            //Assign values for the form fields to variables
            var radioInputFields    = $('#cartFormPackage').find("input:radio:checked");
            var hiddenInputFields   = $('#cartFormPackage').find("input[type='hidden']");
            var projectDetails      = $('#cartFormPackage').find("#project_details");

            if($("input[name='file_list']").val().length !== 0 || $('#graphic_design_service').is(':checked')){
                hiddenInputFields.each(function (k, v) {
                    if ($(v).val().length === 0) {
                        return Swal.fire(
                            'Error!',
                            'Empty Field'+$(v).prop("name"),
                            'error'
                        )
                    }
                });
                stringRowParams = radioInputFields.serialize()+'&'+hiddenInputFields.serialize()+'&'+$.param({project_details:projectDetails.val()});
                alert(stringRowParams);
            }
            else{
                Swal.fire(
                    'Picking Error!',
                    'Seems you have not stated whether you prefer us designing for you or uploading you design!',
                    'error'
                )
            }
        });
    };

    var SubmitElitesPackage = function(){
        $('.add-to-cart-elites').on('click', function(){
            if($("input[name='file_list']").val().length !== 0 || $('#graphic_design_service').is(':checked')){
                var fileList        = $("input[name='file_list']");
                var graphicDes      = $('#graphic_design_service');
                var quantityDerive  = $("#quantityDerive");
                var tagDescript     = $('#project_details');
                var totalQuantity   = $('#total_quantity');

                var querySerial = {
                    totalQuantity: 100,
                    packageType: "elites",
                    fileList : fileList.val(),
                    graphicDes : graphicDes.val(),
                    quantityDerive : quantityDerive.val(),
                    tagDescript : tagDescript.val(),
                }
                //alert(JSON.stringify(querySerial));
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You are about sending your request!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Submit',
                    showLoaderOnConfirm: true,
                }).then((result) => {
                    if (result.value) {
                        //alert(JSON.stringify(querySerial))
                        $.ajax({
                            type: "POST",
                            url: urlRowString+'/packages/setrequest/',
                            data: querySerial,
                            success: function(response){
                                if(response.status === "OK"){
                                    $("input[name='hash_tag']").val(response.hashtag);
                                    Swal.fire(
                                        'Success!',
                                        'Your request has been added to cart.',
                                        'success'
                                    ).then(() => {
                                        window.location.reload();
                                    })
                                }
                                else{
                                    Swal.fire(
                                        'There is problem!',
                                        response.message,
                                        'error'
                                    );
                                }
                            }
                        });
                    }
                })
            }
            else{
                Swal.fire(
                    'Picking Error!',
                    'Seems you have not stated whether you prefer us designing for you or uploading you design!',
                    'error'
                );
            }
        });
    };

    var BootstrapHeadsOnImageBox  = function(){
        $("#heads_on_images").fileinput({
            showCaption: false,
            showBrowse: false,
            dropZoneTitle: 'Drag & drop Multiple files here, Max 4, Min 2 including Front & Back Designs',
            browseOnZoneClick: true,
            browseLabel: "Upload Your Designs | Multiple",
            allowedFileExtensions: ["zip", "rar", "gz", "tgz","jpeg","jpg","png"],
            minFileCount: 2,
            maxFileCount: 4,
            uploadAsync: false,
            theme: 'fas',
            browseClass: "btn btn-lg btn-block btn-primary",
            uploadUrl: urlRowString+"/packages/uploadimg/",
            uploadExtraData: {
                register_id: 1,
                type_package: "headson"
            }
        }).on('filebatchuploadsuccess', function(event, data, id, index) {
            var stringRow   = JSON.stringify(data.response.data.toString());
            $("input[name='hash_tag']").val(data.response.hashtag);
            $("input[name='file_list']").val(stringRow);
        });
    };

    var BootstrapEliteImageBox  = function(){
        $("#elites_images").fileinput({
            showCaption: false,
            showBrowse: false,
            dropZoneTitle: 'Drag & drop Multiple files here, Max 4, Min 2 including Front & Back Designs',
            browseOnZoneClick: true,
            browseLabel: "Upload Your Designs | Multiple",
            allowedFileExtensions: ["zip", "rar", "gz", "tgz","jpeg","jpg","png"],
            minFileCount: 2,
            maxFileCount: 4,
            uploadAsync: false,
            theme: 'fas',
            browseClass: "btn btn-lg btn-block btn-primary",
            uploadUrl: urlRowString+"/packages/uploadimg/",
            uploadExtraData: {
                register_id: 1,
                type_package: "elites"
            }
        }).on('filebatchuploadsuccess', function(event, data, id, index) {
            var stringRow   = JSON.stringify(data.response.data.toString());
            $("input[name='hash_tag']").val(data.response.hashtag);
            $("input[name='file_list']").val(stringRow);
        });
    };

    var SubmitHeadsPackage  = function(){
        $('.add-to-cart-heads').on('click', function(){
            if($("input[name='file_list']").val().length !== 0 || $('#graphic_design_service').is(':checked')){
                var fileList        = $("input[name='file_list']");
                var graphicDes      = $('#graphic_design_service');
                var quantityDerive  = $("#quantityDerive");
                var tagDescript     = $('#project_details');
                var totalQuantity   = $('#total_quantity');

                var querySerial = {
                    totalQuantity: 100,
                    packageType: "headson",
                    fileList : fileList.val(),
                    graphicDes : graphicDes.val(),
                    quantityDerive : quantityDerive.val(),
                    tagDescript : tagDescript.val(),
                }
                //alert(JSON.stringify(querySerial));
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You are about sending your request!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Submit',
                    showLoaderOnConfirm: true,
                }).then((result) => {
                    if (result.value) {
                        //alert(JSON.stringify(querySerial))
                        $.ajax({
                            type: "POST",
                            url: urlRowString+'/packages/setrequest/',
                            data: querySerial,
                            success: function(response){
                                if(response.status === "OK"){
                                    $("input[name='hash_tag']").val(response.hashtag);
                                    Swal.fire(
                                        'Success!',
                                        'Your request has been added to cart.',
                                        'success'
                                    ).then(() => {
                                        window.location.reload();
                                    })
                                }
                                else{
                                    Swal.fire(
                                        'There is problem!',
                                        response.message,
                                        'error'
                                    );
                                }
                            }
                        });
                    }
                })
            }
            else{
                Swal.fire(
                    'Picking Error!',
                    'Seems you have not stated whether you prefer us designing for you or uploading you design!',
                    'error'
                );
            }
        });
    };

    var CheckBoxGraphicDesign   = function(){
        var graphicDesService   = $('#graphic_design_service');
        graphicDesService.on('change', function(e){
            if($(this).is(':checked')) {
                var checkedBoxVal   = $(this).val();
                var summation       = parseInt(checkedBoxVal.toString()) + parseInt($('#price_tagged').prop("title"));
                $('#price_tagged').text(number_format(summation, 2, ".",","));
                $("input[name='quantityDerive']").val(summation);
                $('#price_tagged').prop('title', summation);
            }
            else{
                var checkedBoxVal   = $(this).val();
                var summation       = parseInt($('#price_tagged').prop("title")) - parseInt(checkedBoxVal.toString());
                $('#price_tagged').text(number_format(summation, 2, ".",","));
                $("input[name='quantityDerive']").val(summation);
                $('#price_tagged').prop('title', summation);
            }
        })
    }

    var showHidePswdTask    = function(){
        $(".toggle-password").click(function() {

            $(this).toggleClass("icon-eye");
            var input = $($(this).attr("toggle"));
            if (input.attr("type") === "password") {
                input.attr("type", "text");
            } else {
                input.attr("type", "password");
            }
        });
    }

    return{
        initPackage: function(){
            BoostrapFileUpload();
            BootstrapHeadsOnImageBox();
            BootstrapEliteImageBox();
            ReadySampleFinishBox();
            CheckBoxGraphicDesign();
            SubmitSwiftPack();
            SubmitElitesPackage();
            SubmitHeadsPackage();
            showHidePswdTask();
        }
    }

}();

$(document).ready(function () {
    PackagesAction.initPackage();
});

$(document).ready(function() {
    var getReference;
    $('#example').DataTable();
    $('.viewDetails').on("click", function(e){
        getReference    = $(this).prop("title");
        $('.modal').modal('show');
    });
    $('.modal').on('shown.bs.modal', function(e){

        $.ajax({
            url: urlRowString+'/dashboard/get',
            data:{reference: getReference},
            method: "POST",
            beforeSend: function(){
                $('#showDetailsRow').html("Loading...");
            },
            success: function(results){
                $('#showDetailsRow').html(results);
            }
        });
    });
});

//Number format like the PHP function
function number_format (number, decimals, dec_point, thousands_sep) {
    // Strip all characters but numerical ones.
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
        dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
        s = '',
        toFixedFix = function (n, prec) {
            var k = Math.pow(10, prec);
            return '' + Math.round(n * k) / k;
        };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}