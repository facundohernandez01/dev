in{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">

                <div class="ibox-content" id="ibox_form">
                    <form id="invform" method="post">
                        <div class="ibox-content">
                            <div class="row">
                                <div class="alert alert-danger" id="emsg">
                                    <span id="emsgbody"></span>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                           
                                                <label for="cid">{$_L['Customer']}</label>
                                                <select id="cid" name="cid" class="form-control">
                                                        <option value="">{$_L['Select Contact']}...</option>
                                                        {foreach $c as $cs}
                                                            <option value="{$cs['id']}"
                                                                    {if $p_cid eq ($cs['id'])}selected="selected" {/if}>{$cs['company_name']}</option>
                                                        {/foreach}
                                                    </select>
                                                    <span class="help-block"><a href="#" id="company_add">| O Agregar Cliente</a> </span>
                                                    <input name="item_modify" id="item_modify" type="hidden" value="">
                                                    <span id="contacto" class="help-block">
                                                    <input class="form-control" type="text" value="*Seleccione un contacto">
                                                    </span>
                                                    <a href="#" id="contact_add">| O nuevo contacto</a><br>
                                                    <label for="subject">{$_L['Subject']}</label>
                                                    <input type="text" class="form-control" name="subject" id="subject">
                                            </div>
                                                        
                                            {$extra_fields}
    
                                            {*<div class="form-group">
                                                <label for="inputPassword3"
                                                       class="col-sm-4 control-label">{$_L['Address']}</label>
    
                                                <div class="col-sm-8" hidden>
                                                    <textarea id="address_old" readonly class="form-control" rows="5"></textarea>
                                                </div>
                                            </div>
    
                                            <div class="form-group">
                                                <label for="invoicenum"
                                                       class="col-sm-4 control-label">{$_L['Quote Prefix']}</label>
    
                                                <div class="col-sm-4">
                                                    <input type="text" class="form-control" id="invoicenum" name="invoicenum">
    
                                                </div>
                                            </div>
    
                                            <div class="form-group">
                                                <label for="cn"
                                                       class="col-sm-4 control-label">{$_L['Quote']} #</label>
    
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="cn" name="cn">
                                                    <span class="help-block">{$_L['quote_number_help']}</span>
                                                </div>
                                            </div>*}
    
    


                                </div>
                                <div class="col-md-2">
                                <div class="form-group">
                                <label for="tid" class="control-label">{$_L['TAX']}</label>

                                    <select id="tid" name="tid" class="form-control">
                                        <option value="">{$_L['None']}</option>
                                        {foreach $t as $ts}
                                            <option value="{$ts['id']}">{$ts['name']}
                                                ({{number_format($ts['rate'],2,$_c['dec_point'],$_c['thousands_sep'])}}
                                                %)
                                            </option>
                                        {/foreach}

                                    </select>
                                    <input type="hidden" id="stax" name="stax" value="0.00">
                                    <input type="hidden" id="discount_amount" name="discount_amount" value="">
                                    <input type="hidden" id="discount_type" name="discount_type" value="p">




                            <label for="currency">{$_L['Currency']}</label>

                            <select id="currency" name="currency" class="form-control">

                                {foreach $currencies as $currency}
                                    <option value="{$currency['id']}"
                                            {if $_c['home_currency'] eq ($currency['cname'])}selected="selected" {/if}>{$currency['cname']}</option>
                                    {foreachelse}
                                    <option value="0">{$_c['home_currency']}</option>
                                {/foreach}

                            </select>

                                <label for="add_discount" class="control-label">{$_L['Discount']}</label>
                                <br>
                                    <a href="#" id="add_discount" class="btn btn-info btn-md"
                                       style="margin-top: 5px;"><i
                                                class="fa fa-minus-circle"></i> {$_L['Set Discount']}</a>
                            </div>

                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="control-label">{$_L['Date Created']}</label>
                                            <input type="text" class="form-control" id="idate" name="idate" datepicker
                                                   data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                   value="{$idate}">

                                    <label for="edate" class="control-label">{$_L['Expiry Date']}</label>
                                            <input type="text" class="form-control" id="edate" name="edate" datepicker
                                                   data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                   value="{ib_after_1_month()}">

                                        <label for="stage"
                                               class="control-label">{$_L['Stage']}</label>

                                            <select class="form-control" name="stage" id="stage">
                                                <option value="Draft">Pendiente de envío</option>
                                                <option value="Delivered">Enviado</option>
                                                <option value="Accepted">Parcial</option>
                                                
                                                
                                            </select>
                                    </div>
                                    
                            </div>

                            </div>

                          

                            <div class="row">
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="proposal_text">Notas encabezado</label>
                                        <textarea class="form-control" id="proposal_text" name="proposal_text" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                <label for="customer_notes">Notas pie</label>
                                <textarea class="form-control input-sm" id="customer_notes" name="customer_notes" rows="6"></textarea>
                                </div>
                                <div class="col-md-2">
                                <label for="cond_pago">Cond. pago (días)</label>
                                <input type="number" id="cond_pago" name="cond_pago" class="form-control">

                                </div>
                                </div>



                            <div class="table-responsive m-t" id="application_ajaxrender">
                            <button type="button" class="btn btn-primary" id="blank-add"><i
                            class="fa fa-plus"></i> {$_L['Add blank Line']}</button>
                            <button type="button" class="btn btn-primary" id="item-add"><i class="fa fa-search"></i> {$_L['Add Product OR Service']}</button>
                            <button type="button" class="btn btn-primary cnew"><i class="fa fa-plus"></i> {$_L['New']}</button>
                            <button type="button" class="btn btn-danger" id="item-remove"><i
                            class="fa fa-minus-circle"></i> {$_L['Delete']}</button>
                                <table class="table invoice-table" id="invoice_items">
                                    <thead>
                                    <tr>
                                        <th width="10%">{$_L['Item Code']}</th>
                                        <th width="50%">{$_L['Item Name']}</th>
                                        <th width="10%">{$_L['Qty']}</th>
                                        <th width="10%">{$_L['Price']}</th>
                                        <th width="10%">U.M</th>
                                        <th width="10%">{$_L['Total']}</th>
                                        <th width="10%">Impuestos</th>

                                    </tr>
                                    </thead>
                                    <tbody>
        <tr> <td><input type="text" class="form-control id" name="id[]"</td><td><textarea class="form-control item_name" name="desc[]" rows="1"></textarea> </td> <td><input type="text" class="form-control qty" value="" name="qty[]"></td> <td><input type="text" class="form-control item_price" name="amount[]" value=""></td><td><select name="un[]" class="form-control item_un"><option value="UN" selected>UN</option><option value="KG">KG</option><option value="Mts">Mts</option></select></td><td class="ltotal"><input type="text" class="form-control lvtotal" readonly="" value=""></td> <td> <select class="form-control taxed" name="taxed[]"> <option value="Yes">{$_L['Yes']}</option> <option value="No" selected="">{$_L['No']}</option></select></td></tr>
                                    
                                    </tbody>
                                </table>

                                <hr>

                            </div>
                            <!-- /table-responsive -->

                            <table class="table invoice-total">
                                <tbody>
                                <tr>
                                    <td><strong>{$_L['Sub Total']} :</strong></td>
                                    <td id="sub_total" class="amount" data-a-sign="" data-a-dec="{$_c['dec_point']}"
                                        data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>{$_L['Discount']} <span id="is_pt"></span> :</strong></td>
                                    <td id="discount_amount_total" class="amount" data-a-sign=""
                                        data-a-dec="{$_c['dec_point']}" data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>{$_L['TAX']} :</strong></td>
                                    <td id="taxtotal" class="amount" data-a-sign="" data-a-dec="{$_c['dec_point']}"
                                        data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>{$_L['TOTAL']} :</strong></td>
                                    <td id="total" class="amount" data-a-sign="" data-a-dec="{$_c['dec_point']}"
                                        data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>



                            <div class="text-right">
                                <input type="hidden" id="_dec_point" name="_dec_point" value="{$_c['dec_point']}">
                                <input type="hidden" id="taxed_type" name="taxed_type" value="individual">
                                <button class="btn btn-primary" id="submit"><i class="fa fa-save"></i> {$_L['Save']}
                                </button>
                            </div>


                        </div>
                    </form>


                </div>
            </div>
        </div>

    </div>

    {* lan variables *}

    <input type="hidden" id="_lan_set_discount" value="{$_L['Set Discount']}">
    <input type="hidden" id="_lan_discount" value="{$_L['Discount']}">
    <input type="hidden" id="_lan_discount_type" value="{$_L['Discount Type']}">
    <input type="hidden" id="_lan_percentage" value="{$_L['Percentage']}">
    <input type="hidden" id="_lan_fixed_amount" value="{$_L['Fixed Amount']}">
    <input type="hidden" id="_lan_btn_save" value="{$_L['Save']}">
    <input type="hidden" id="_lan_no_results_found" value="{$_L['No results found']}">


{/block}