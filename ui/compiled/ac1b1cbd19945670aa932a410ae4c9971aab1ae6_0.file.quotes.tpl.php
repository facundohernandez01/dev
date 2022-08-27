<?php
/* Smarty version 4.2.0, created on 2022-08-09 09:50:14
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\quotes.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_62f25806acc617_23108319',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ac1b1cbd19945670aa932a410ae4c9971aab1ae6' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\quotes.tpl',
      1 => 1660049413,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62f25806acc617_23108319 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, true);
?>


<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_70332089962f25806a5b575_70512561', "content");
$_smarty_tpl->inheritance->endChild($_smarty_tpl, ((string)$_smarty_tpl->tpl_vars['tpl_admin_layout']->value));
}
/* {block "content"} */
class Block_70332089962f25806a5b575_70512561 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'content' => 
  array (
    0 => 'Block_70332089962f25806a5b575_70512561',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>


    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5><?php echo $_smarty_tpl->tpl_vars['_L']->value['Total'];?>
 : <?php echo $_smarty_tpl->tpl_vars['total_quote']->value;?>
</h5>
            <div class="ibox-tools">

            <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
quotes/new/" class="btn btn-primary btn"><i class="fa fa-plus"></i> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Add quote'];?>
</a>
            </div>
        </div>
        <div class="ibox-content">
        
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
            
            <table class="table table-bordered table-hover sys_table footable" data-filter="#foo_filter" data-page-size="50">
                <thead>
                <tr>
                    <th>#</th>
                    <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Account'];?>
</th>
                    <th width="30%"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Subject'];?>
</th>
                    <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Amount'];?>
</th>
                    <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Date Created'];?>
</th>
                    <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Expiry Date'];?>
</th>
                    <th><?php echo $_smarty_tpl->tpl_vars['_L']->value['Stage'];?>
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
                        <td><a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
quotes/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
</a> </td>
                        <td>                                                         
                        <select id="cid" name="cid" class="form-control" disabled>
                        <option value=""></option>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['cempresa']->value, 'cs');
$_smarty_tpl->tpl_vars['cs']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['cs']->value) {
$_smarty_tpl->tpl_vars['cs']->do_else = false;
?>
                        <option value="<?php echo $_smarty_tpl->tpl_vars['cs']->value['id'];?>
"<?php if ($_smarty_tpl->tpl_vars['ds']->value['userid'] == ($_smarty_tpl->tpl_vars['cs']->value['id'])) {?>selected="selected" <?php }?>><?php echo $_smarty_tpl->tpl_vars['cs']->value['company_name'];?>
 
                        </option>
                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                        </select>

                        </td>
                                                <td><a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
quotes/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/"><?php echo $_smarty_tpl->tpl_vars['ds']->value['subject'];?>
</a> </td>
                        <td class="amount" data-a-sign="<?php if ($_smarty_tpl->tpl_vars['ds']->value['currency_symbol'] == '') {?> <?php echo $_smarty_tpl->tpl_vars['_c']->value['currency_code'];?>
 <?php } else { ?> <?php echo $_smarty_tpl->tpl_vars['ds']->value['currency_symbol'];
}?> "><?php echo $_smarty_tpl->tpl_vars['ds']->value['total'];?>
</td>

                        <td><?php echo date($_smarty_tpl->tpl_vars['_c']->value['df'],strtotime($_smarty_tpl->tpl_vars['ds']->value['datecreated']));?>
</td>
                        <td><?php echo date($_smarty_tpl->tpl_vars['_c']->value['df'],strtotime($_smarty_tpl->tpl_vars['ds']->value['validuntil']));?>
</td>
                        <td>
                            <?php if ($_smarty_tpl->tpl_vars['ds']->value['stage'] == 'Dead') {?>
                                <span class="label label-default"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Dead'];?>
</span>
                            <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['stage'] == 'Lost') {?>
                                <span class="label label-danger"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Lost'];?>
</span>
                            <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['stage'] == 'Accepted') {?>
                                <span class="label label-info">Parcial</span>
                            <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['stage'] == 'Draft') {?>
                                <span class="label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Draft'];?>
</span>
                            <?php } elseif ($_smarty_tpl->tpl_vars['ds']->value['stage'] == 'Delivered') {?>
                                <span class="label label-success"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Delivered'];?>
</span>
                            <?php } else { ?>
                                <span class="label label-info"><?php echo $_smarty_tpl->tpl_vars['ds']->value['stage'];?>
</span>
                            <?php }?>

                        </td>

                        <td class="text-right">
                            <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
quotes/view/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-primary btn-xs"><i class="fa fa-search"></i></a>
                            <a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
quotes/edit/<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
/" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i></a>
                            <a href="#" class="btn btn-danger btn-xs cdelete" id="iid<?php echo $_smarty_tpl->tpl_vars['ds']->value['id'];?>
"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="8">
                        <ul class="pagination">
                        </ul>
                    </td>
                </tr>
                </tfoot>
            </table>
            <?php echo $_smarty_tpl->tpl_vars['paginator']->value['contents'];?>

        </div>
    </div>

<?php
}
}
/* {/block "content"} */
}
