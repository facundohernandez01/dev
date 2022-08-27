<?php
/* Smarty version 4.2.0, created on 2022-08-27 12:40:04
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\add-quote.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_630a3ad40e5eb5_04142836',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '064495bb2967f219857c5f1b1df0ecfbfc5f9bef' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\add-quote.tpl',
      1 => 1661614799,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_630a3ad40e5eb5_04142836 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>
in

<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_2117440748630a3ad409b804_62105671', "content");
$_smarty_tpl->inheritance->endChild($_smarty_tpl, ((string)$_smarty_tpl->tpl_vars['tpl_admin_layout']->value));
}
/* {block "content"} */
class Block_2117440748630a3ad409b804_62105671 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_2117440748630a3ad409b804_62105671',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


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
                           
                                                <label for="cid"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Customer'];?>
</label>
                                                <select id="cid" name="cid" class="form-control">
                                                        <option value=""><?php echo $_smarty_tpl->tpl_vars['_L']->value['Select Contact'];?>
...</option>
                                                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['c']->value, 'cs');
$_smarty_tpl->tpl_vars['cs']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['cs']->value) {
$_smarty_tpl->tpl_vars['cs']->do_else = false;
?>
                                                            <option value="<?php echo $_smarty_tpl->tpl_vars['cs']->value['id'];?>
"
                                                                    <?php if ($_smarty_tpl->tpl_vars['p_cid']->value == ($_smarty_tpl->tpl_vars['cs']->value['id'])) {?>selected="selected" <?php }?>><?php echo $_smarty_tpl->tpl_vars['cs']->value['company_name'];?>
</option>
                                                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                                    </select>
                                                    <span class="help-block"><a href="#" id="company_add">| O Agregar Cliente</a> </span>
                                                    <input name="item_modify" id="item_modify" type="hidden" value="">
                                                    <span id="contacto" class="help-block">
                                                    <input class="form-control" type="text" value="*Seleccione un contacto">
                                                    </span>
                                                    <a href="#" id="contact_add">| O nuevo contacto</a><br>
                                                    <label for="subject"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Subject'];?>
</label>
                                                    <input type="text" class="form-control" name="subject" id="subject">
                                            </div>
                                                        
                                            <?php echo $_smarty_tpl->tpl_vars['extra_fields']->value;?>

    
                                                
    


                                </div>
                                <div class="col-md-2">
                                <div class="form-group">
                                <label for="tid" class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['TAX'];?>
</label>

                                    <select id="tid" name="tid" class="form-control">
                                        <option value=""><?php echo $_smarty_tpl->tpl_vars['_L']->value['None'];?>
</option>
                                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['t']->value, 'ts');
$_smarty_tpl->tpl_vars['ts']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['ts']->value) {
$_smarty_tpl->tpl_vars['ts']->do_else = false;
?>
                                            <option value="<?php echo $_smarty_tpl->tpl_vars['ts']->value['id'];?>
"><?php echo $_smarty_tpl->tpl_vars['ts']->value['name'];?>

                                                (<?php ob_start();
echo number_format($_smarty_tpl->tpl_vars['ts']->value['rate'],2,$_smarty_tpl->tpl_vars['_c']->value['dec_point'],$_smarty_tpl->tpl_vars['_c']->value['thousands_sep']);
$_prefixVariable1 = ob_get_clean();
echo $_prefixVariable1;?>

                                                %)
                                            </option>
                                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

                                    </select>
                                    <input type="hidden" id="stax" name="stax" value="0.00">
                                    <input type="hidden" id="discount_amount" name="discount_amount" value="">
                                    <input type="hidden" id="discount_type" name="discount_type" value="p">




                            <label for="currency"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Currency'];?>
</label>

                            <select id="currency" name="currency" class="form-control">

                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['currencies']->value, 'currency');
$_smarty_tpl->tpl_vars['currency']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['currency']->value) {
$_smarty_tpl->tpl_vars['currency']->do_else = false;
?>
                                    <option value="<?php echo $_smarty_tpl->tpl_vars['currency']->value['id'];?>
"
                                            <?php if ($_smarty_tpl->tpl_vars['_c']->value['home_currency'] == ($_smarty_tpl->tpl_vars['currency']->value['cname'])) {?>selected="selected" <?php }?>><?php echo $_smarty_tpl->tpl_vars['currency']->value['cname'];?>
</option>
                                    <?php
}
if ($_smarty_tpl->tpl_vars['currency']->do_else) {
?>
                                    <option value="0"><?php echo $_smarty_tpl->tpl_vars['_c']->value['home_currency'];?>
</option>
                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

                            </select>

                                <label for="add_discount" class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Discount'];?>
</label>
                                <br>
                                    <a href="#" id="add_discount" class="btn btn-info btn-md"
                                       style="margin-top: 5px;"><i
                                                class="fa fa-minus-circle"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Set Discount'];?>
</a>
                            </div>

                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="inputEmail3" class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Date Created'];?>
</label>
                                            <input type="text" class="form-control" id="idate" name="idate" datepicker
                                                   data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                   value="<?php echo $_smarty_tpl->tpl_vars['idate']->value;?>
">

                                    <label for="edate" class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Expiry Date'];?>
</label>
                                            <input type="text" class="form-control" id="edate" name="edate" datepicker
                                                   data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                   value="<?php echo ib_after_1_month();?>
">

                                        <label for="stage"
                                               class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Stage'];?>
</label>

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
                            class="fa fa-plus"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Add blank Line'];?>
</button>
                            <button type="button" class="btn btn-primary" id="item-add"><i class="fa fa-search"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Add Product OR Service'];?>
</button>
                            <button type="button" class="btn btn-primary cnew"><i class="fa fa-plus"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['New'];?>
</button>
                            <button type="button" class="btn btn-danger" id="item-remove"><i
                            class="fa fa-minus-circle"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Delete'];?>
</button>
                                <table class="table invoice-table" id="invoice_items">
                                    <thead>
                                    <tr>
                                        <th width="10%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Item Code'];?>
</th>
                                        <th width="50%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Item Name'];?>
</th>
                                        <th width="10%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Qty'];?>
</th>
                                        <th width="10%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Price'];?>
</th>
                                        <th width="10%">U.M</th>
                                        <th width="10%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Total'];?>
</th>
                                        <th width="10%">Impuestos</th>

                                    </tr>
                                    </thead>
                                    <tbody>
        <tr> <td><input type="text" class="form-control id" name="id[]"</td><td><textarea class="form-control item_name" name="desc[]" rows="1"></textarea> </td> <td><input type="text" class="form-control qty" value="" name="qty[]"></td> <td><input type="text" class="form-control item_price" name="amount[]" value=""></td><td><select name="un[]" class="form-control item_un"><option value="UN" selected>UN</option><option value="KG">KG</option><option value="Mts">Mts</option></select></td><td class="ltotal"><input type="text" class="form-control lvtotal" readonly="" value=""></td> <td> <select class="form-control taxed" name="taxed[]"> <option value="Yes"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Yes'];?>
</option> <option value="No" selected=""><?php echo $_smarty_tpl->tpl_vars['_L']->value['No'];?>
</option></select></td></tr>
                                    
                                    </tbody>
                                </table>

                                <hr>

                            </div>
                            <!-- /table-responsive -->

                            <table class="table invoice-total">
                                <tbody>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['Sub Total'];?>
 :</strong></td>
                                    <td id="sub_total" class="amount" data-a-sign="" data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
"
                                        data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['Discount'];?>
 <span id="is_pt"></span> :</strong></td>
                                    <td id="discount_amount_total" class="amount" data-a-sign=""
                                        data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
" data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['TAX'];?>
 :</strong></td>
                                    <td id="taxtotal" class="amount" data-a-sign="" data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
"
                                        data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['TOTAL'];?>
 :</strong></td>
                                    <td id="total" class="amount" data-a-sign="" data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
"
                                        data-a-sep="" data-d-group="2">0.00
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>



                            <div class="text-right">
                                <input type="hidden" id="_dec_point" name="_dec_point" value="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
">
                                <input type="hidden" id="taxed_type" name="taxed_type" value="individual">
                                <button class="btn btn-primary" id="submit"><i class="fa fa-save"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Save'];?>

                                </button>
                            </div>


                        </div>
                    </form>


                </div>
            </div>
        </div>

    </div>

    
    <input type="hidden" id="_lan_set_discount" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Set Discount'];?>
">
    <input type="hidden" id="_lan_discount" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Discount'];?>
">
    <input type="hidden" id="_lan_discount_type" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Discount Type'];?>
">
    <input type="hidden" id="_lan_percentage" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Percentage'];?>
">
    <input type="hidden" id="_lan_fixed_amount" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Fixed Amount'];?>
">
    <input type="hidden" id="_lan_btn_save" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Save'];?>
">
    <input type="hidden" id="_lan_no_results_found" value="<?php echo $_smarty_tpl->tpl_vars['_L']->value['No results found'];?>
">


<?php
}
}
/* {/block "content"} */
}
