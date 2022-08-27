{extends file="$tpl_admin_layout"}

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
                                        <label>{$_L['Subject']}</label>
                                        <input type="text" class="form-control" name="subject" id="subject" value="{$d['subject']}">
                
                                        <label>{$_L['Company']}</label>
                                        <input type="text" class="form-control" value="{$co['company_name']}" disabled>
                                        <input name="item_modify" id="item_modify" type="hidden" value="">

                                        <label for="cid">{$_L['Contact']}</label>                               
                                            <select id="cid" name="cid" class="form-control">
                                                <option value="">{$_L['Select Contact']}...</option>
                                                {foreach $co2 as $cs}
                                                    <option value="{$cs['id']}"
                                                            {if $d['userid'] eq ($cs['id'])}selected="selected" {/if}>{$cs['account']} {if $cs['email'] neq ''}- {$cs['email']}{/if}</option>
                                                {/foreach}
                                            </select>
                                            
                                        </div>

                                    </div>
                                    <div class="col-md-2">


                                    <div class="form-group">
                                        <label for="tid" class="control-label">Impuestos</label>

                                            <select id="tid" name="tid" class="form-control">
                                                <option value="">{$_L['None']}</option>
                                                {foreach $t as $ts}
                                                    <option value="{$ts['id']}"
                                                            {if $ts['name'] eq $i['taxname']}selected="selected" {/if} >{$ts['name']}
                                                        ({{number_format($ts['rate'],2,$_c['dec_point'],$_c['thousands_sep'])}}
                                                        %)
                                                    </option>
                                                {/foreach}

                                            </select>
                                            <input type="hidden" id="stax" name="stax" value="{$d['taxrate']}">
                                            <input type="hidden" id="discount_amount" name="discount_amount" value="{$d['discount_value']}">
                                            <input type="hidden" id="discount_type" name="discount_type" value="{$d['discount_type']}">
                                            

                                            <div class="form-group">
                                            <label for="currency">{$_L['Currency']}</label>
            
                                            <select id="currency" name="currency" class="form-control">
            
                                                {foreach $currencies as $currency}
                                                    <option value="{$currency['id']}"
                                                            {if $i['currency'] eq ($currency['id'])}selected="selected" {/if}>{$currency['cname']}</option>
                                                    {foreachelse}
                                                    <option value="0">{$_c['home_currency']}</option>
                                                {/foreach}
            
                                            </select>
            
                                        </div>
                                        <label for="add_discount"
                                               class="control-label">{$_L['Discount']}</label>
                                                <br>

                                            <a href="#" id="add_discount" class="btn btn-info btn-md"
                                               style="margin-top: 5px;"><i
                                                        class="fa fa-minus-circle"></i> {$_L['Set Discount']}</a>
                                    </div>


                                </div>

                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="inputEmail3"
                                            class="control-label">{$_L['Date Created']}</label>
                                                <input type="text" class="form-control" id="idate" name="idate" datepicker
                                                       data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                       value="{$d['datecreated']}">

                                            <label for="edate" class="control-label">{$_L['Expiry Date']}</label>

                                                <input type="text" class="form-control" id="edate" name="edate" datepicker
                                                       data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                       value="{$d['validuntil']}">

                                             <label for="stage" class="control-label">{$_L['Stage']}</label>
    
                                                    <select class="form-control" name="stage" id="stage">
                                                        <option value="Draft" {if $d['stage'] eq 'Draft'}selected{/if}>{$_L['Draft']}</option>
                                                        <option value="Delivered" {if $d['stage'] eq 'Delivered'}selected{/if}>{$_L['Delivered']}</option>
                                                        <option value="Accepted" {if $d['stage'] eq 'Accepted'}selected{/if}>Parcial</option>
    
                                                    </select>
                                        </div>
                                        </div>
                                        <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="qid" class="control-label"> Cotización N° </label>
                                            <input type="text" id="qid" name="qid" value="{$i['id']}"" class="form-control input-id">
                                          </div>
                                          </div>


                            <div class="row">


                              {*  <div class="col-md-6">
                                    <div class="form-horizontal">


                                        {$extra_fields}

                                        <div class="form-group">
                                            <label for="inputPassword3"
                                                   class="col-sm-4 control-label">{$_L['Address']}</label>

                                            <div class="col-sm-8">
                                                <textarea id="address" readonly class="form-control" rows="5"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="invoicenum"
                                                   class="col-sm-4 control-label">{$_L['Quote Prefix']}</label>

                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" id="invoicenum" name="invoicenum" value="{$d['invoicenum']}">

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="cn"
                                                   class="col-sm-4 control-label">{$_L['Quote']} #</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="cn" name="cn" value="{$d['cn']}">
                                                <span class="help-block">{$_L['quote_number_help']}</span>
                                            </div>
                                        </div>


                                    </div>
                                </div> *}



                            </div>

                            <div class="row">
                                <div class="col-md-5">
                                        <label for="proposal_text">Notas encabezado</label>
                                        <textarea id="proposal_text" name="proposal_text" rows="1">{$d['proposal']}</textarea>
                                </div>
                                <div class="col-md-5">

                                <label for="customer_notes">Notas pie</label>
                                <textarea class="form-control" id="customer_notes" name="customer_notes" rows="6">{$d['customernotes']}</textarea>
                                
                                </div>
                        <div class="col-md-2">
                                <label for="cond_pago">Cond. pago (días)</label>
                                <input type="number" id="cond_pago" name="cond_pago" value="{$d['cond_pago']}" class="form-control">

                                </div>
                            </div>



                            <div class="table-responsive m-t" id="application_ajaxrender">
                            <button type="button" class="btn btn-primary" id="blank-add"><i
                                        class="fa fa-plus"></i> {$_L['Add blank Line']}</button>
                            <button type="button" class="btn btn-primary" id="item-add"><i
                                        class="fa fa-search"></i> {$_L['Add Product OR Service']}</button>
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

                                    {foreach $items as $item}
                                        <tr><td><input type="text" class="form-control id" name="id[]" value="{$item['itemcode']}"></td><td><textarea class="form-control item_name" name="desc[]" rows="1">{$item['description']}</textarea> </td> <td><input type="text" class="form-control qty" value="{if ($_c['dec_point']) eq ','}{$item['qty']|replace:'.':','}{else}{$item['qty']}{/if}" name="qty[]"></td> <td><input type="text" class="form-control item_price" name="amount[]" value="{if ($_c['dec_point']) eq ','}{$item['amount']|replace:'.':','}{else}{$item['amount']}{/if}"></td><td><select name="un[]" class="form-control item_un"><option value="UN" {if $item['un'] eq 'UN'}selected{/if}>UN</option><option value="KG" {if $item['un'] eq 'KG'}selected{/if}>KG</option><option value="Mts"{if $item['un'] eq 'Mts'}selected{/if}>Mts</option></select></td> <td class="ltotal"><input type="text" class="form-control lvtotal" readonly="" value="{if ($_c['dec_point']) eq ','}{{$item['total']}|replace:'.':','}{else}{{$item['total']}}{/if}"></td> <td> <select class="form-control taxed" name="taxed[]"> <option value="Yes" {if $item['taxable'] eq '1'}selected=""{/if}>Yes</option> <option value="No" {if $item['taxable'] eq '0'}selected=""{/if}>No</option></select></td><td><a href="#" class="btn btn-primary btn-sm cedit" id="e{$item['itemcode']}"><i class="fa fa-edit"></i>Edit</a></td><td><input name="item_modify2" id="item_modify2" type="hidden" value="e{$item['itemcode']}"</td></tr>
                                    {/foreach}



                                    </tbody>
                                </table>



                            </div>
                            <!-- /table-responsive -->

                            <table class="table invoice-total">
                                <tbody>
                                <tr>
                                    <td><strong>{$_L['Sub Total']} :</strong></td>
                                    <td id="sub_total" class="amount" data-a-sign="" data-a-dec="{$_c['dec_point']}"
                                        data-a-sep="" data-d-group="2">{$d['subtotal']}
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>{$_L['Discount']} <span id="is_pt"></span> :</strong></td>
                                    <td id="discount_amount_total" class="amount" data-a-sign=""
                                        data-a-dec="{$_c['dec_point']}" data-a-sep="" data-d-group="2">{$d['discount']}
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>{$_L['TAX']} :</strong></td>
                                    <td id="taxtotal" class="amount" data-a-sign="" data-a-dec="{$_c['dec_point']}"
                                        data-a-sep="" data-d-group="2">{$d['tax1']}
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>{$_L['TOTAL']} :</strong></td>
                                    <td id="total" class="amount" data-a-sign="" data-a-dec="{$_c['dec_point']}"
                                        data-a-sep="" data-d-group="2">{$d['total']}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>



                            <div class="text-right">


                                <input type="hidden" id="qid" name="qid" value="{$d['id']}">
                                <input type="hidden" id="_dec_point" name="_dec_point" value="{$_c['dec_point']}">
                                <input type="hidden" id="taxed_type" name="taxed_type" value="individual">
                                <button class="btn btn-info" id="save_n_close"><i class="fa fa-check"></i> {$_L['Save n Close']}</button>
                                <button class="btn btn-primary" id="submit"><i class="fa fa-save"></i> {$_L['Save']}
                                </button>
                            </div>


                        </div>
                    </form>

                    </div>

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

{/block}