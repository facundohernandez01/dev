<?php
/* Smarty version 4.2.0, created on 2022-08-25 18:20:12
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\balance-sheet.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_6307e78c0a4fb3_11545557',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '12819b5b7cece801cd046272dae7edaa00092a50' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\balance-sheet.tpl',
      1 => 1621318798,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6307e78c0a4fb3_11545557 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_5055458426307e78c0860b4_29593566', "content");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, ((string)$_smarty_tpl->tpl_vars['tpl_admin_layout']->value));
}
/* {block "content"} */
class Block_5055458426307e78c0860b4_29593566 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_5055458426307e78c0860b4_29593566',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><?php echo $_smarty_tpl->tpl_vars['_L']->value['Balance Sheet'];?>
 </h5>

                </div>
                <div class="ibox-content">

                    <table class="table table-bordered sys_table">

                        <th width="80%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Account'];?>
</th>

                        <th class="text-right"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Balance'];?>
</th>

                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['d']->value, 'ds');
$_smarty_tpl->tpl_vars['ds']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['ds']->value) {
$_smarty_tpl->tpl_vars['ds']->do_else = false;
?>
                            <tr>

                                <td><?php echo $_smarty_tpl->tpl_vars['ds']->value['account'];?>
</td>

                                <td class="text-right"><span class="amount<?php if ($_smarty_tpl->tpl_vars['ds']->value['balance'] < 0) {?> text-red<?php }?>"><?php echo $_smarty_tpl->tpl_vars['ds']->value['balance'];?>
</span></td>

                            </tr>
                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>



                    </table>
                    <table class="table invoice-total">
                        <tbody>

                        <tr>
                            <td><strong><?php echo $_smarty_tpl->tpl_vars['_L']->value['TOTAL'];?>
 :</strong></td>
                            <td><strong><span class="amount<?php if ($_smarty_tpl->tpl_vars['tbal']->value < 0) {?> text-red<?php }?>"><?php echo $_smarty_tpl->tpl_vars['tbal']->value;?>
</strong></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>




        <!-- Widget-2 end-->
    </div> <!-- Row end-->


<?php
}
}
/* {/block "content"} */
}
