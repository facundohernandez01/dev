<?php
/* Smarty version 4.2.0, created on 2022-08-05 11:08:07
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\list-recibos.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_62ed24474ff2f1_62310805',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'b031defa0b4d2c8cc648b347fa035ae3f9d83aa5' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\list-recibos.tpl',
      1 => 1658606103,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62ed24474ff2f1_62310805 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_124120778362ed2447495842_53874404', "content");
?>

<?php $_smarty_tpl->inheritance->endChild($_smarty_tpl, ((string)$_smarty_tpl->tpl_vars['tpl_admin_layout']->value));
}
/* {block "content"} */
class Block_124120778362ed2447495842_53874404 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_124120778362ed2447495842_53874404',
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
recibos/list/filter/" class="btn btn-primary btn-xs"><i class="fa fa-search"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Filter'];?>
</a>
                        <?php } else { ?>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
recibos/list/" class="btn btn-primary btn-xs"><i class="fa fa-arrow-left"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Back'];?>
</a>
                        <?php }?>
                        <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
recibos/add/" class="btn btn-primary btn"><i class="fa fa-plus"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Add recibo'];?>
</a>

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
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Account'];?>
</th>
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Amount'];?>
</th>
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Invoice Date'];?>
</th>
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Due Date'];?>
</th>
                            <th>
                                <?php echo $_smarty_tpl->tpl_vars['_L']->value['Status'];?>

                            </th>
                            <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Credit'];?>
</th>
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
recibos/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
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
                                <td class="amount" data-a-sign="<?php if ($_smarty_tpl->tpl_vars['ds']->value['currency_symbol'] == '') {?> <?php echo $_smarty_tpl->tpl_vars['_c']->value['currency_code'];?>
 <?php } else { ?> <?php echo $_smarty_tpl->tpl_vars['ds']->value['currency_symbol'];
}?> "><?php echo $_smarty_tpl->tpl_vars['ds']->value['total'];?>
</td>
                                <td data-value="<?php echo strtotime($_smarty_tpl->tpl_vars['ds']->value['date']);?>
"><?php echo date($_smarty_tpl->tpl_vars['_c']->value['df'],strtotime($_smarty_tpl->tpl_vars['ds']->value['date']));?>
</td>
                                <td data-value="<?php echo strtotime($_smarty_tpl->tpl_vars['ds']->value['duedate']);?>
"><?php echo date($_smarty_tpl->tpl_vars['_c']->value['df'],strtotime($_smarty_tpl->tpl_vars['ds']->value['duedate']));?>
</td>
                                <td>

                                    <?php if ($_smarty_tpl->tpl_vars['ds']->value['status'] == 'Unpaid') {?>
                                        <span class="label label-danger"><?php echo ib_lan_get_line($_smarty_tpl->tpl_vars['ds']->value['status']);?>
</span>
                                    <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['status'] == 'Paid') {?>
                                        <span class="label label-success"><?php echo ib_lan_get_line($_smarty_tpl->tpl_vars['ds']->value['status']);?>
</span>
                                    <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['status'] == 'Pago parcial') {?>
                                        <span class="label label-info"><?php echo ib_lan_get_line($_smarty_tpl->tpl_vars['ds']->value['status']);?>
</span>
                                    <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['status'] == 'Cancelled') {?>
                                        <span class="label"><?php echo ib_lan_get_line($_smarty_tpl->tpl_vars['ds']->value['status']);?>
</span>
                                    <?php } else { ?>
                                        <?php echo ib_lan_get_line($_smarty_tpl->tpl_vars['ds']->value['status']);?>

                                    <?php }?>



                                </td>
                                <td>

                                        <?php if ($_smarty_tpl->tpl_vars['ds']->value['total']-$_smarty_tpl->tpl_vars['ds']->value['credit'] != $_smarty_tpl->tpl_vars['ds']->value['total']) {?>                                       
                                            <?php echo $_smarty_tpl->tpl_vars['ds']->value['total']-$_smarty_tpl->tpl_vars['ds']->value['credit'];?>

                                                 <?php } else { ?> <span class="label label-danger">Imputar pago</span>
                                        
                                          <?php }?>  
                                            
        
                                </td>
                                <td class="text-right">

                                    <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
recibos/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="<?php echo $_smarty_tpl->tpl_vars['_L']->value['View'];?>
"><i class="fa fa-file-text-o"></i></a>
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
recibos/clone/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="<?php echo $_smarty_tpl->tpl_vars['_L']->value['Clone'];?>
"><i class="fa fa-files-o"></i></a>
                                    <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
recibos/edit/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
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
