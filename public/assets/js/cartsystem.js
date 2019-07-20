
//Set Private Roles and Actions to Events
var urlPath         = window.location;
var stringVi        = urlPath.hostname === "localhost" ? "nxtremecardz" : "xtr";
var fullpath        = urlPath.protocol+'//'+urlPath.hostname+urlPath.pathname;
var frontend        = urlPath.pathname.substring(0, urlPath.pathname.indexOf(stringVi)+stringVi.length);
var urlRowString    = urlPath.protocol+'//'+urlPath.hostname+frontend;

(function($) {

    $.fn.inputFilter = function(inputFilter) {
        return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            }
        });
    };

}($));

var SetCartActions  = function(){

    var handleSpotColorClick    = function () {
        $('select[name="custom_die_cut"], select[name="uv_printing"], select[name="white_ink"]').change(function(e){

            var selectedDataRow = $(this).prop('value');
            var getPriceTag = parseInt($('#tagPrice').text().toString());

            if ($.isNumeric(selectedDataRow)) {
                $('#initPriceTag').val(getPriceTag + parseInt(selectedDataRow));
                $('#tagPrice').text((getPriceTag + parseInt(selectedDataRow)).toFixed(2));
                //alert(getPriceTag + parseInt(selectedDataRow));
            }
            else {
                $('#initPriceTag').val(getPriceTag - parseInt(selectedDataRow));
                $('#tagPrice').text((getPriceTag - parseInt(selectedDataRow)).toFixed(2));
            }
        });

    };

    var handleColorFrontRadioBox = function(){
        var previous        = 0;
        var radioBtn        = $('input[name="color_front_side"]');
        //var defaultChecked  = $('input[name="color_front_side"]');

        radioBtn.on("change",function(e){
            var getPriceTag = parseInt($('#tagPrice').text().toString());
            if (sessionStorage.getItem("color_front_side")) {
                previous = sessionStorage.getItem("color_front_side");
            }
            var newPrevRow  = $(this).val();
            var totalAmt    = ((getPriceTag + parseInt(newPrevRow)) - parseInt(previous.toString()));
            $('#tagPrice').text(totalAmt.toFixed(2));
            $('#initPriceTag').val(totalAmt);
            sessionStorage.setItem("color_front_side", $(this).val());
        })
    };

    var handleColorBackSideRadio    = function(){
        var previous        = 0;
        var radioBtn        = $('input[name="color_back_side"]');
        //var defaultChecked  = $('input[name="color_back_side"]');
        radioBtn.on("change",function(e){
            var getPriceTag = parseInt($('#tagPrice').text().toString());
            if (sessionStorage.getItem("color_back_side")) {
                previous = sessionStorage.getItem("color_back_side");
            }
            var newPrevRow = $(this).val();
            var totalAmt    = ((getPriceTag + parseInt(newPrevRow)) - parseInt(previous.toString()));
            $('#tagPrice').text(totalAmt.toFixed(2));
            $('#initPriceTag').val(totalAmt);
            sessionStorage.setItem("color_back_side", $(this).val());
        });
    };

    var submitBillingRegister   = function(){
        var options = {
            beforeSubmit:  showRequest,  // pre-submit callback
            success:       showResponse,  // post-submit callback

            // other available options:
            url: urlRowString+"/cart/checkout",        // override for form's 'action' attribute
            type: "POST",       // 'get' or 'post', override for form's 'method' attribute
            //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
            clearForm: true,        // clear all form fields after successful submit
            //resetForm: true        // reset the form after successful submit

            // $.ajax options can be used here too, for example:
            //timeout:   3000
        };
        $('#submitBillingRegister').click(function(){
            $('#formBillingRegister').ajaxSubmit(options);
            return false;
        });
    }

    var formSubmitRow   = function(){
        $('#addToCartBtn').click(function(e){
            e.preventDefault();
            var emptyTextRow    = false;
            // $("#cartFormRow").find("input, textarea").each(function(keyRow, valueRow){
            //     if($(this).val() ==""){
            //         emptyTextRow    = false;
            //         alert("Empty Field! Check the Fields"+$(this).attr("name"));
            //         return false;
            //     }
            // });

            var cartQty = $('#numQtyRow');
            if(cartQty.val() === ""){
                emptyTextRow    = true;
                alert("Empty Field! Check the Field "+cartQty.attr("name"));
                return false;
            }
            var serializeRow = $("#cartFormRow").serialize();
            if(!emptyTextRow) {
                var notify = $.notify(
                    '<strong>Please Wait...</strong>Adding to Cart', {
                        type: 'success',
                        allow_dismiss: false,
                        showProgressbar: false,
                        newest_on_top: true,
                    }
                );
                $.ajax({
                    method: "POST",
                    data: serializeRow,
                    url: urlRowString + '/cart/',
                    success: function (result) {
                        //alert(JSON.stringify(result));
                        if(result.status === "OK"){
                            notify;
                            window.location.reload();
                        }
                    }
                });
            }
        });
    };

    var laserEngraveAction  = function(){
        $("#engrave_front_side").change(function(e){
            var getEngrave = parseInt($(this).val().toString());
            var getPriceTag = parseInt($('#tagPrice').text().toString());
            if ($(this).is(':checked')) {
                $('#tagPrice').text((getPriceTag + getEngrave).toFixed(2));
                $('#initPriceTag').val(getPriceTag + getEngrave);
            }
            else {
                $('#tagPrice').text((getPriceTag - getEngrave).toFixed(2));
                $('#initPriceTag').val(getPriceTag - getEngrave);
            }
        });

        $("#engrave_back_side").change(function(e){
            var getEngrave = parseInt($(this).val().toString());
            var getPriceTag = parseInt($('#tagPrice').text().toString());
            if ($(this).is(':checked')) {
                $('#tagPrice').text((getPriceTag + getEngrave).toFixed(2));
                $('#initPriceTag').val(getPriceTag + getEngrave);
            }
            else {
                $('#tagPrice').text((getPriceTag - getEngrave).toFixed(2));
                $('#initPriceTag').val(getPriceTag - getEngrave);
            }
        });
    };

    var addAccessories  = function(){
        $(".addToCartBtn").click(function(e){
            e.preventDefault();
            $.ajax({
                method: "POST",
                url: urlRowString+"/cart/setproduct",
                data: {accessories_id:$(this).attr("data-value"),quantity:""},
                success: function(results){
                    if(results.status === "OK") {
                        var notify = $.notify(
                            '<strong>Accessory(ies)</strong>Added to Cart', {
                                type: 'success',
                                allow_dismiss: false,
                                showProgressbar: false,
                                newest_on_top: true,
                            }
                        );
                    }
                    else{
                        alert(JSON.stringify(results))
                    }
                }
            });
        });
    };

    var showCheckBoxPswd    = function(){
        $('#defaultCheck1').on('change', function(e){
            if($(this).is(":checked")){
                $("#pswdShowDiv").fadeIn();
            }
            else{
                $("#pswdShowDiv").hide();
            }
        })
    }

    var withPayStack    = function(){
        $('#withPayStack').click(function(e){
            e.preventDefault();
            var taskQueryRun    = true;
            var billingFormRow  = $("#billing-form");
            var formSubmitRow   = billingFormRow.serializeArray();
            formSubmitRow.push({name: "country", value: $("#country").val()});

            billingFormRow.find('input,select').each(function(key, value){
                if($(value).val().length === 0 && $(value).prop("name") === "firstname"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "First name is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "lastname"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Last name is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "company"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Company is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "address"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Address is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "country"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Country is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "city"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Town is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "email"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Email is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "phonenumber"){
                    taskQueryRun    = false;
                    return Swal.fire(
                        "Error!",
                        "Phone Number is empty",
                        "error"
                    );
                }
                else if($(value).val().length === 0 && $(value).prop("name") === "password"){
                    if($("#password").is(':visible')) {
                        taskQueryRun = false;
                        return Swal.fire(
                            "Error!",
                            "Password is empty",
                            "error"
                        );
                    }
                }
            });
            if(taskQueryRun) {
                $.ajax({
                    url: urlRowString + '/cart/checkout',
                    method: "POST",
                    data: $.param(formSubmitRow),
                    success: function (results) {
                        if (results.status === "OK") {
                            payWithPaystack();
                        }
                        else {
                            Swal.fire(
                                "Error",
                                results.data,
                                "error"
                            )
                        }
                    }
                });
            }
        });
    };

    return {
        init: function(){
            formSubmitRow();
            showCheckBoxPswd();
            handleSpotColorClick();
            handleColorFrontRadioBox();
            handleColorBackSideRadio();
            submitBillingRegister();
            laserEngraveAction();
            addAccessories();
            withPayStack();
        }
    }
}();

$(document).ready(function(){
    SetCartActions.init();
});

function payWithPaystack(){
    window.location.href = urlRowString+"/cart/check"
}

// pre-submit callback
function showRequest(formData, jqForm, options) {
    var queryString = $.param(formData);
    //alert('About to submit: \n\n' + queryString);
    $.notify({
        message: "Please Wait. Submitting Query"
    },{
        type: "primary",
        newest_on_top: true,
        allow_dismiss: false,
        showProgressbar: false,
    });
    return true;
}

// post-submit callback
function showResponse(responseText, statusText, xhr, $form)  {
    // alert('status: ' + statusText + '\n\nresponseText: \n' + responseText +
    //     '\n\nThe output div should have already been updated with the responseText.');
    if(responseText.status === "OK"){
        window.location.href = urlRowString+"/cart/payment?token="+Math.random().toString(32).slice(2);
    }
    else{
        alert(JSON.stringify(xhr));
    }
}

$("#numQtyRow").inputFilter(function(value){
    var getInitPrice    = $.trim($('#initPriceTag').val());
    $('#tagPrice').text((getInitPrice * value).toFixed(2));
    return /^-?\d*$/.test(value);
    // return value.match(/^-?\d*$/);
});

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