<?php
/* Smarty version 4.2.0, created on 2022-08-05 11:07:18
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\list-remitos.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_62ed2416cfc873_35907725',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd0f20919a895aa643a688c187424846d84fe60f6' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\list-remitos.tpl',
      1 => 1659387086,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62ed2416cfc873_35907725 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_148175069362ed2416ca2015_52268442', "content");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, ((string)$_smarty_tpl->tpl_vars['tpl_admin_layout']->value));
}
/* {block "content"} */
class Block_148175069362ed2416ca2015_52268442 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_148175069362ed2416ca2015_52268442',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


    <div class="row">
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <?php if ($_smarty_tpl->tpl_vars['view_type']->value == 'filter') {?>
                        <h5><?php echo $_smarty_tpl->tpl_vars['_L']->value['Total'];?>
 : <?php echo $_smarty_tpl->tpl_vars['total_invoice']->value;?>
</h5>
                    <?php } else { ?>
                        <h5><?php echo $_smarty_tpl->tpl_vars['paginator']->value['found'];?>
 <?php echo $_smarty_tpl->tpl_vars['_L']->value['Records'];?>
. <?php if ($_smarty_tpl->tpl_vars['paginator']->value['found'] > 0) {
echo $_smarty_tpl->tpl_vars['_L']->value['Page'];?>
 <?php echo $_smarty_tpl->tpl_vars['paginator']->value['page'];?>
 <?php echo $_smarty_tpl->tpl_vars['_L']->value['of'];?>
 <?php echo $_smarty_tpl->tpl_vars['paginator']->value['lastpage'];?>
.<?php }?></h5>
                    <?php }?>
                    <div class="ibox-tools">
                        <?php if ($_smarty_tpl->tpl_vars['view_type']->value != 'filter') {?>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/list/filter/" class="btn btn-primary btn-xs"><i class="fa fa-search"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Filter'];?>
</a>
                        <?php } else { ?>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/list/" class="btn btn-primary btn-xs"><i class="fa fa-arrow-left"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Back'];?>
</a>
                        <?php }?>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/add/" class="btn btn-primary btn"><i class="fa fa-plus"></i> Generar Remito</a>

                    </div>
                </div>
                <div class="ibox-content">

                    <?php if ($_smarty_tpl->tpl_vars['view_type']->value == 'filter') {?>
                        <form class="form-horizontal" method="post" action="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
customers/list/">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <span class="fa fa-search"></span>
                                        </div>
                                        <input type="text" name="name" id="foo_filter" class="form-control" placeholder="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Search'];?>
..."/>

                                    </div>
                                </div>

                            </div>
                        </form>
                    <?php }?>

                    <table class="table table-bordered table-hover sys_table footable" <?php if ($_smarty_tpl->tpl_vars['view_type']->value == 'filter') {?> data-filter="#foo_filter" data-page-size="50" <?php }?>>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Customer'];?>
</th>
                                                        <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Date'];?>
</th>
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Transportes'];?>
</th>
                                                        <th>Pedido #</th>
                            <th class="text-right"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Manage'];?>
</th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['d']->value, 'ds');
$_smarty_tpl->tpl_vars['ds']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['ds']->value) {
$_smarty_tpl->tpl_vars['ds']->do_else = false;
?>
                            <tr>
                                <td  data-value="<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
"><a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['ds']->value['invoicenum'];
if ($_smarty_tpl->tpl_vars['ds']->value['cn'] != '') {
echo $_smarty_tpl->tpl_vars['ds']->value['cn'];
} else {
echo $_smarty_tpl->tpl_vars['ds']->value['id'];
}?></a> </td>
                                <td><a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
contacts/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['userid'];?>
/"><?php echo $_smarty_tpl->tpl_vars['ds']->value['account'];?>
</a> </td>
                                                                <td data-value="<?php echo strtotime($_smarty_tpl->tpl_vars['ds']->value['date']);?>
"><?php echo date($_smarty_tpl->tpl_vars['_c']->value['df'],strtotime($_smarty_tpl->tpl_vars['ds']->value['date']));?>
</td>
                                
                                <td><?php if ($_smarty_tpl->tpl_vars['ds']->value['transporte_id'] != 0) {?> 
                                <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
transportes/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['transporte_id'];?>
/"> Ver transporte <i class="fa fa-truck"></i></a>
                                <?php }?></td>
                                                                                               <td>
                                <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
invoices/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['pedido_id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['ds']->value['pedido_id'];?>
</a>
                                </td>
                                <td class="text-right">

                                    <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="<?php echo $_smarty_tpl->tpl_vars['_L']->value['View'];?>
"><i class="fa fa-file-text-o"></i></a>
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/clone/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Clone'];?>
"><i class="fa fa-files-o"></i></a>
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
remitos/edit/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-info btn-xs" data-toggle="tooltip" data-placement="top" title="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Edit'];?>
"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="btn btn-danger btn-xs cdelete" id="iid<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
" data-toggle="tooltip" data-placement="top" title="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Delete'];?>
"><i class="fa fa-trash"></i></a>


                                </td>
                            </tr>
                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

                        </tbody>

                        <?php if ($_smarty_tpl->tpl_vars['view_type']->value == 'filter') {?>
                            <tfoot>
                            <tr>
                                <td colspan="8">
                                    <ul class="pagination">
                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        <?php }?>

                    </table>
                    <?php echo $_smarty_tpl->tpl_vars['paginator']->value['contents'];?>

                </div>
            </div>
        </div>
    </div>

<?php
}
}
/* {/block "content"} */
}
