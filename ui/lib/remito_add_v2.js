$(document).ready(function () {

    var _url = $("#_url").val();

    $('.amount').autoNumeric('init');
    $('#notes').redactor(
        {
            minHeight: 200, // pixels
            plugins: ['fontcolor']
        }
    );

    var $remito_items = $('#remito_items');

    $('.item_name').redactor({paragraphize: false,
        replaceDivs: false,
        linebreaks: true});







    $remito_items.on('change', 'select', function(){
        //   $('#taxtotal').html('dd');
        var taxrate = $('#stax').val().replace(',', '.');
        // $(this).val(taxrate);

    });

    var item_remove = $('#item-remove');
    item_remove.hide();

    function update_address(){
        var _url = $("#_url").val();
        var cid = $('#cid').val();
        if(cid != ''){
            $.post(_url + 'contacts/render-address/', {
                cid: cid

            })
                .done(function (data) {
                    var adrs2 = $("#address");


                    adrs2.html(data);

                });
        }

    }
    update_address();



    function update_contacto(){
        var _url = $("#_url").val();
        var cid = $('#cid').val();
        if(cid != ''){
            $.post(_url + 'contacts/render-contacto/', {
                cid: cid

            })
                .done(function (data) {
                    var adrs = $("#contacto");


                    adrs.html(data);

                });
        }

    }
    update_contacto();
    $('#cid').select2({
        theme: "bootstrap",
        language: {
            noResults: function () {
                return $("#_lan_no_results_found").val();
            }
        }
    })
        .on("change", function(e) {
            // mostly used event, fired to the original element when the value changes
            // log("change val=" + e.val);
            //  alert(e.val);

            update_contacto();
            update_address();

        });

        $('#trid').select2({
            theme: "bootstrap",
            language: {
                noResults: function () {
                    return $("#_lan_no_results_found").val();
                }
            }
        })




    item_remove.on('click', function(){
        $("#remito_items tr.info").fadeOut(300, function(){
            $(this).remove();

        });

    });

    var $modal = $('#ajax-modal');



    $('#item-add').on('click', function(){

        // create the backdrop and wait for next modal to be triggered
        $('body').modalmanager('loading');

        $modal.load( _url + 'ps/modal-list/', '', function(){
            $modal.modal();
        });


    });

    /*
     / @since v 2.0
     */

     $('#contact_add').on('click', function(e){
        e.preventDefault();
        // create the backdrop and wait for next modal to be triggered
        $('body').modalmanager('loading');

        $modal.load( _url + 'contacts/modal_add/', '', function(){
            $modal.modal();
            $("#ajax-modal .country").select2({
                theme: "bootstrap"
                
            });
            $('#company2').val($("#cid option:selected").val());
            $('#company3').val($("#cid option:selected").text());

        });
    });

    $('#company_add').on('click', function(e){
        e.preventDefault();
        // create the backdrop and wait for next modal to be triggered
        $('body').modalmanager('loading');

        $modal.load( _url + 'recibos/modal_add_company_from/', '', function(){
            $modal.modal();
            $("#ajax-modal .country").select2({
                theme: "bootstrap"
            });
        });
    });

    var rowNum = 0;

    $('#blank-add').on('click', function(){
        rowNum++;
        $remito_items.find('tbody')
            .append(
            '<tr> <td></td> <td><textarea class="form-control item_name" name="desc[]" rows="1" id="i_' + rowNum + '"></textarea></td> <td><input type="text" class="form-control qty" value="" name="qty[]"></td> <td><input type="text" class="form-control item_price" name="amount[]" value=""></td><td><select name="un[]" class="form-control item_un"><option value="UN" selected>UN</option><option value="KG">KG</option><option value="Mts">Mts</option></select></td><td class="ltotal"><input type="text" class="form-control lvtotal" readonly value=""></td> <td> <select class="form-control taxed" name="taxed[]"> <option value="Yes">Yes</option> <option value="No" selected>No</option></select></td></tr>'
            
        );


        $('#i_' + rowNum).redactor({paragraphize: false,
            replaceDivs: false,
            linebreaks: true});


    });

    	
    $modal.on('click', '.modal_submit_from', function(e){

        e.preventDefault();

        $modal.modal('loading');

        $.post( _url + "remitos/add_company_post_from/", $("#ib_modal_form").serialize())
            .done(function( data ) {

                if ($.isNumeric(data)) {

                    window.location = base_url + 'remitos/add/' +  '/' + data;

                }

                else {
                    $modal.modal('loading');
                    toastr.error(data);
                }

            });

    });

    $remito_items.on('click', '.redactor-editor', function(){
        $("tr").removeClass("info");
        $(this).closest('tr').addClass("info");

        item_remove.show();
    });

    $modal.on('click', '.update', function(){
        var tableControl= document.getElementById('items_table');
        $modal.modal('loading');
        $modal.modal('loading');
        //$modal
        //    .modal('loading')
        //    .find('.modal-body')
        //    .prepend('<div class="alert alert-info fade in">' +
        //    'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' +
        //    '</div>');


        //  input type="text" class="form-control item_name" name="desc[]" value="' + item_name + '">
        // var obj = new Array();

        $('input:checkbox:checked', tableControl).each(function() {
            rowNum++;
            var item_code = $(this).closest('tr').find('td:eq(1)').text();
            var item_name = $(this).closest('tr').find('td:eq(2)').text();
            var item_price = $(this).closest('tr').find('td:eq(3)').text();
            var item_un = $(this).closest('tr').find('td:eq(4)').text();


            //  obj.push(innertext);
            $remito_items.find('tbody')
                .append(
                '<tr> <td>' + item_code + '</td> <td><textarea class="form-control item_name" name="desc[]" rows="1" id="i_' + rowNum + '">' + item_name + '</textarea></td> <td><input type="text" class="form-control qty" value="1" name="qty[]"></td> <td><input type="text" class="form-control item_price" name="amount[]" value="' + item_price + '"></td><td><select name="un[]" class="form-control item_un"><option value="'+ item_un +'" selected>UN</option><option value="KG">KG</option><option value="Mts">Mts</option></select></td><td class="ltotal"><input type="text" class="form-control lvtotal" readonly value=""></td> <td> <select class="form-control taxed" name="taxed[]"> <option value="Yes">Yes</option> <option value="No" selected>No</option></select></td></tr>'
              
              

            );

            $('#i_' + rowNum).redactor({paragraphize: false,
                replaceDivs: false,
                linebreaks: true});

        });

        //  console.debug(obj); // Write it to the console
        //  calculateTotal();


        $modal.modal('hide');

    });


    $modal.on('click', '.contact_submit', function(e){
        e.preventDefault();
        //  var tableControl= document.getElementById('items_table');
        $modal.modal('loading');

        var _url = $("#_url").val();
        $.post(_url + 'contacts/add-post-modal/', {


            account: $('#account').val(),
            company: $('#company2').val(),            
            company_name: $('#company3').val(),
            address: $('#m_address').val(),

            city: $('#city').val(),
            state: $('#state').val(),
            zip: $('#zip').val(),
            country: $('#country').val(),
            phone: $('#phone').val(),
            email: $('#email').val()

        })
            .done(function (data) {

                var _url = $("#_url").val();
                $modal.modal('hide');
            update_contacto();


                

            
                
            });


    });



    $("#add_discount").click(function (e) {
        e.preventDefault();
        var s_discount_amount = $('#discount_amount');
        var c_discount = s_discount_amount.val();
        var c_discount_type = $('#discount_type').val();
        var p_checked = "";
        var f_checked = "";
        if( c_discount_type == "p" ){
            p_checked = 'checked="checked"';
        }else{
            f_checked = 'checked="checked"';
        }
        bootbox.dialog({
                title: $("#_lan_set_discount").val(),
                message: '<div class="row">  ' +
                '<div class="col-md-12"> ' +
                '<form class="form-horizontal" action="javascript:void(0);"> ' +
                '<div class="form-group"> ' +
                '<label class="col-md-4 control-label" for="set_discount">' + $("#_lan_discount").val() +'</label> ' +
                '<div class="col-md-4"> ' +
                '<input id="set_discount" name="set_discount" type="text" class="form-control input-md" value="' + c_discount + '"> ' +
                '</div> ' +
                '</div> ' +
                '<div class="form-group"> ' +
                '<label class="col-md-4 control-label" for="set_discount_type">' + $("#_lan_discount_type").val() +'</label> ' +
                '<div class="col-md-4"> <div class="radio"> <label for="set_discount_type-0"> ' +
                '<input type="radio" name="set_discount_type" id="set_discount_type-0" value="p" ' + p_checked + '> ' +
                '' + $("#_lan_percentage").val() +' (%) </label> ' +
                '</div><div class="radio"> <label for="set_discount_type-1"> ' +
                '<input type="radio" name="set_discount_type" id="set_discount_type-1" value="f" ' + f_checked + '> ' + $("#_lan_fixed_amount").val() +' </label> ' +
                '</div> ' +
                '</div> </div>' +
                '</form> </div>  </div>',
                buttons: {
                    success: {
                        label: $("#_lan_btn_save").val(),
                        className: "btn-success",
                        callback: function () {
                            var discount_amount = $('#set_discount').val();
                            var discount_type = $("input[name='set_discount_type']:checked").val();
                            $('#discount_amount').val(discount_amount);
                            $('#discount_type').val(discount_type);
                            //calculateTotal();
                            //updateTax();
                            //updateTotal();
                        }
                    }
                }
            }
        );
    });


    //var callbacks = $.Callbacks();
    //callbacks.add( updateTotal );
    //callbacks.fire(  alert('done') );


    $(".progress").hide();
    $("#emsg").hide();
    $("#submit").click(function (e) {
        e.preventDefault();
        $('#ibox_form').block({ message: null });
        var _url = $("#_url").val();
        $.post(_url + 'remitos/add-post/', $('#invform').serialize(), function(data){

            var _url = $("#_url").val();
            if ($.isNumeric(data)) {

                window.location = _url + 'remitos/edit/' + data + '/';
            }
            else {
                $('#ibox_form').unblock();
                var body = $("html, body");
                body.animate({scrollTop:0}, '1000', 'swing');
                $("#emsgbody").html(data);
                $("#emsg").show("slow");
            }
        });
    });


    $("#save_n_close").click(function (e) {
        e.preventDefault();
        $('#ibox_form').block({ message: null });
        var _url = $("#_url").val();
        $.post(_url + 'remitos/add-post/', $('#invform').serialize(), function(data){

            var _url = $("#_url").val();
            if ($.isNumeric(data)) {

                window.location = _url + 'remitos/view/' + data + '/';
            }
            else {
                $('#ibox_form').unblock();
                var body = $("html, body");
                body.animate({scrollTop:0}, '1000', 'swing');
                $("#emsgbody").html(data);
                $("#emsg").show("slow");
            }
        });
    });

    //function doStuff() {
    //    $('.amount').autoNumeric('init');
    //   // alert('dd');
    //}
    //setInterval(doStuff, 5000);

});