<?php
/* Smarty version 4.2.0, created on 2022-08-09 14:33:41
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\quote-edit.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_62f29a75b5efa8_13191676',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '307758bfd0f631cfd9695307063710669ce7d56d' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\quote-edit.tpl',
      1 => 1660066420,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62f29a75b5efa8_13191676 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_135561773262f29a75ade0c7_60972668', "content");
$_smarty_tpl->inheritance->endChild($_smarty_tpl, ((string)$_smarty_tpl->tpl_vars['tpl_admin_layout']->value));
}
/* {block "content"} */
class Block_135561773262f29a75ade0c7_60972668 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_135561773262f29a75ade0c7_60972668',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'C:\\Users\\97605619\\local\\htdocs\\gestion\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.replace.php','function'=>'smarty_modifier_replace',),));
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
                                        <label><?php echo $_smarty_tpl->tpl_vars['_L']->value['Subject'];?>
</label>
                                        <input type="text" class="form-control" name="subject" id="subject" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['subject'];?>
">
                
                                        <label><?php echo $_smarty_tpl->tpl_vars['_L']->value['Company'];?>
</label>
                                        <input type="text" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['co']->value['company_name'];?>
" disabled>
                                        <input name="item_modify" id="item_modify" type="hidden" value="">

                                        <label for="cid"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Contact'];?>
</label>                               
                                            <select id="cid" name="cid" class="form-control">
                                                <option value=""><?php echo $_smarty_tpl->tpl_vars['_L']->value['Select Contact'];?>
...</option>
                                                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['co2']->value, 'cs');
$_smarty_tpl->tpl_vars['cs']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['cs']->value) {
$_smarty_tpl->tpl_vars['cs']->do_else = false;
?>
                                                    <option value="<?php echo $_smarty_tpl->tpl_vars['cs']->value['id'];?>
"
                                                            <?php if ($_smarty_tpl->tpl_vars['d']->value['userid'] == ($_smarty_tpl->tpl_vars['cs']->value['id'])) {?>selected="selected" <?php }?>><?php echo $_smarty_tpl->tpl_vars['cs']->value['account'];?>
 <?php if ($_smarty_tpl->tpl_vars['cs']->value['email'] != '') {?>- <?php echo $_smarty_tpl->tpl_vars['cs']->value['email'];
}?></option>
                                                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                                            </select>
                                            
                                        </div>

                                    </div>
                                    <div class="col-md-2">


                                    <div class="form-group">
                                        <label for="tid" class="control-label">Impuestos</label>

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
"
                                                            <?php if ($_smarty_tpl->tpl_vars['ts']->value['name'] == $_smarty_tpl->tpl_vars['i']->value['taxname']) {?>selected="selected" <?php }?> ><?php echo $_smarty_tpl->tpl_vars['ts']->value['name'];?>

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
                                            <input type="hidden" id="stax" name="stax" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['taxrate'];?>
">
                                            <input type="hidden" id="discount_amount" name="discount_amount" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['discount_value'];?>
">
                                            <input type="hidden" id="discount_type" name="discount_type" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['discount_type'];?>
">
                                            

                                            <div class="form-group">
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
                                                            <?php if ($_smarty_tpl->tpl_vars['i']->value['currency'] == ($_smarty_tpl->tpl_vars['currency']->value['id'])) {?>selected="selected" <?php }?>><?php echo $_smarty_tpl->tpl_vars['currency']->value['cname'];?>
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
            
                                        </div>
                                        <label for="add_discount"
                                               class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Discount'];?>
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
                                            <label for="inputEmail3"
                                            class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Date Created'];?>
</label>
                                                <input type="text" class="form-control" id="idate" name="idate" datepicker
                                                       data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                       value="<?php echo $_smarty_tpl->tpl_vars['d']->value['datecreated'];?>
">

                                            <label for="edate" class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Expiry Date'];?>
</label>

                                                <input type="text" class="form-control" id="edate" name="edate" datepicker
                                                       data-date-format="yyyy-mm-dd" data-auto-close="true"
                                                       value="<?php echo $_smarty_tpl->tpl_vars['d']->value['validuntil'];?>
">

                                             <label for="stage" class="control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Stage'];?>
</label>
    
                                                    <select class="form-control" name="stage" id="stage">
                                                        <option value="Draft" <?php if ($_smarty_tpl->tpl_vars['d']->value['stage'] == 'Draft') {?>selected<?php }?>><?php echo $_smarty_tpl->tpl_vars['_L']->value['Draft'];?>
</option>
                                                        <option value="Delivered" <?php if ($_smarty_tpl->tpl_vars['d']->value['stage'] == 'Delivered') {?>selected<?php }?>><?php echo $_smarty_tpl->tpl_vars['_L']->value['Delivered'];?>
</option>
                                                        <option value="Accepted" <?php if ($_smarty_tpl->tpl_vars['d']->value['stage'] == 'Accepted') {?>selected<?php }?>>Parcial</option>
    
                                                    </select>
                                        </div>
                                        </div>
                                        <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="qid" class="control-label"> Cotización N° </label>
                                            <input type="text" id="qid" name="qid" value="<?php echo $_smarty_tpl->tpl_vars['i']->value['id'];?>
"" class="form-control input-id">
                                          </div>
                                          </div>


                            <div class="row">


                              


                            </div>

                            <div class="row">
                                <div class="col-md-5">
                                        <label for="proposal_text">Notas encabezado</label>
                                        <textarea id="proposal_text" name="proposal_text" rows="1"><?php echo $_smarty_tpl->tpl_vars['d']->value['proposal'];?>
</textarea>
                                </div>
                                <div class="col-md-5">

                                <label for="customer_notes">Notas pie</label>
                                <textarea class="form-control" id="customer_notes" name="customer_notes" rows="6"><?php echo $_smarty_tpl->tpl_vars['d']->value['customernotes'];?>
</textarea>
                                
                                </div>
                        <div class="col-md-2">
                                <label for="cond_pago">Cond. pago (días)</label>
                                <input type="number" id="cond_pago" name="cond_pago" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['cond_pago'];?>
" class="form-control">

                                </div>
                            </div>



                            <div class="table-responsive m-t" id="application_ajaxrender">
                            <button type="button" class="btn btn-primary" id="blank-add"><i
                                        class="fa fa-plus"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Add blank Line'];?>
</button>
                            <button type="button" class="btn btn-primary" id="item-add"><i
                                        class="fa fa-search"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Add Product OR Service'];?>
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

                                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['items']->value, 'item');
$_smarty_tpl->tpl_vars['item']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['item']->value) {
$_smarty_tpl->tpl_vars['item']->do_else = false;
?>
                                        <tr><td><input type="text" class="form-control id" name="id[]" value="<?php echo $_smarty_tpl->tpl_vars['item']->value['itemcode'];?>
"></td><td><textarea class="form-control item_name" name="desc[]" rows="1"><?php echo $_smarty_tpl->tpl_vars['item']->value['description'];?>
</textarea> </td> <td><input type="text" class="form-control qty" value="<?php if (($_smarty_tpl->tpl_vars['_c']->value['dec_point']) == ',') {
echo smarty_modifier_replace($_smarty_tpl->tpl_vars['item']->value['qty'],'.',',');
} else {
echo $_smarty_tpl->tpl_vars['item']->value['qty'];
}?>" name="qty[]"></td> <td><input type="text" class="form-control item_price" name="amount[]" value="<?php if (($_smarty_tpl->tpl_vars['_c']->value['dec_point']) == ',') {
echo smarty_modifier_replace($_smarty_tpl->tpl_vars['item']->value['amount'],'.',',');
} else {
echo $_smarty_tpl->tpl_vars['item']->value['amount'];
}?>"></td><td><select name="un[]" class="form-control item_un"><option value="UN" <?php if ($_smarty_tpl->tpl_vars['item']->value['un'] == 'UN') {?>selected<?php }?>>UN</option><option value="KG" <?php if ($_smarty_tpl->tpl_vars['item']->value['un'] == 'KG') {?>selected<?php }?>>KG</option><option value="Mts"<?php if ($_smarty_tpl->tpl_vars['item']->value['un'] == 'Mts') {?>selected<?php }?>>Mts</option></select></td> <td class="ltotal"><input type="text" class="form-control lvtotal" readonly="" value="<?php if (($_smarty_tpl->tpl_vars['_c']->value['dec_point']) == ',') {
ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['total'];
$_prefixVariable2 = ob_get_clean();
echo smarty_modifier_replace($_prefixVariable2,'.',',');
} else {
ob_start();
echo $_smarty_tpl->tpl_vars['item']->value['total'];
$_prefixVariable3 = ob_get_clean();
echo $_prefixVariable3;
}?>"></td> <td> <select class="form-control taxed" name="taxed[]"> <option value="Yes" <?php if ($_smarty_tpl->tpl_vars['item']->value['taxable'] == '1') {?>selected=""<?php }?>>Yes</option> <option value="No" <?php if ($_smarty_tpl->tpl_vars['item']->value['taxable'] == '0') {?>selected=""<?php }?>>No</option></select></td><td><a href="#" class="btn btn-primary btn-sm cedit" id="e<?php echo $_smarty_tpl->tpl_vars['item']->value['itemcode'];?>
"><i class="fa fa-edit"></i>Edit</a></td><td><input name="item_modify2" id="item_modify2" type="hidden" value="e<?php echo $_smarty_tpl->tpl_vars['item']->value['itemcode'];?>
"</td></tr>
                                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>



                                    </tbody>
                                </table>



                            </div>
                            <!-- /table-responsive -->

                            <table class="table invoice-total">
                                <tbody>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['Sub Total'];?>
 :</strong></td>
                                    <td id="sub_total" class="amount" data-a-sign="" data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
"
                                        data-a-sep="" data-d-group="2"><?php echo $_smarty_tpl->tpl_vars['d']->value['subtotal'];?>

                                    </td>
                                </tr>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['Discount'];?>
 <span id="is_pt"></span> :</strong></td>
                                    <td id="discount_amount_total" class="amount" data-a-sign=""
                                        data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
" data-a-sep="" data-d-group="2"><?php echo $_smarty_tpl->tpl_vars['d']->value['discount'];?>

                                    </td>
                                </tr>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['TAX'];?>
 :</strong></td>
                                    <td id="taxtotal" class="amount" data-a-sign="" data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
"
                                        data-a-sep="" data-d-group="2"><?php echo $_smarty_tpl->tpl_vars['d']->value['tax1'];?>

                                    </td>
                                </tr>
                                <tr>
                                    <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['TOTAL'];?>
 :</strong></td>
                                    <td id="total" class="amount" data-a-sign="" data-a-dec="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
"
                                        data-a-sep="" data-d-group="2"><?php echo $_smarty_tpl->tpl_vars['d']->value['total'];?>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <hr>



                            <div class="text-right">


                                <input type="hidden" id="qid" name="qid" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['id'];?>
">
                                <input type="hidden" id="_dec_point" name="_dec_point" value="<?php echo $_smarty_tpl->tpl_vars['_c']->value['dec_point'];?>
">
                                <input type="hidden" id="taxed_type" name="taxed_type" value="individual">
                                <button class="btn btn-info" id="save_n_close"><i class="fa fa-check"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Save n Close'];?>
</button>
                                <button class="btn btn-primary" id="submit"><i class="fa fa-save"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Save'];?>

                                </button>
                            </div>


                        </div>
                    </form>

                    </div>

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

<?php
}
}
/* {/block "content"} */
}
