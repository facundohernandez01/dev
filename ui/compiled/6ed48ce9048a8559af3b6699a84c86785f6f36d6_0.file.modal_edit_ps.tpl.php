<?php
/* Smarty version 4.2.0, created on 2022-08-05 14:24:40
  from 'C:\Users\97605619\local\htdocs\gestion\ui\theme\ibilling\modal_edit_ps.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.2.0',
  'unifunc' => 'content_62ed5258acf227_56759742',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '6ed48ce9048a8559af3b6699a84c86785f6f36d6' => 
    array (
      0 => 'C:\\Users\\97605619\\local\\htdocs\\gestion\\ui\\theme\\ibilling\\modal_edit_ps.tpl',
      1 => 1654782556,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_62ed5258acf227_56759742 (Smarty_Internal_Template $_smarty_tpl) {
?>
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3> <?php echo $_smarty_tpl->tpl_vars['_L']->value['Edit'];?>
</h3>
            </div>
            <div class="modal-body">
            <form class="form-horizontal" role="form" id="edit_form" method="post">
              <div class="form-group">
                <label for="name" class="col-sm-2 control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Name'];?>
</label>
                <div class="col-sm-10">
               <tr> <td> <input type="text" class="form-control" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['name'];?>
" name="name" id="name">  </td>
                </div>
              </div>
              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Item Number'];?>
</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="item_number" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['item_number'];?>
" id="item_number">                                                                                                                                                                
                  <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['id'];?>
">
                </div>
              </div>
              <div class="form-group">
              <label for="c1" class="col-sm-2 control-label">Norma de fabricación</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c1" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['c1'];?>
" id="c1"></div>
              </div>
              <div class="form-group">
              <label for="c2" class="col-sm-2 control-label">Material de Construcción</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c2" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['c2'];?>
" id="c2"></div>
              </div>
              <div class="form-group">
              <label for="c3" class="col-sm-2 control-label">Coeficiente de Seguridad</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c3" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['c3'];?>
" id="c3"></div></div>
              <div class="form-group">
              <label for="c4" class="col-sm-2 control-label">Carga de trabajo</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c4" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['c4'];?>
" id="c4"></div></div>
              <div class="form-group">
              <label for="c5" class="col-sm-2 control-label">Carga de rotura</label><div class="col-md-4">
              <input type="text" class="form-control" name="c5" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['c5'];?>
" id="c5"></div>
            </div>

              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Price'];?>
</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="price" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['sales_price'];?>
" id="price">
                  <input type="hidden" name="id" value="<?php echo $_smarty_tpl->tpl_vars['d']->value['id'];?>
">
                </div>
              </div>
                <div class="form-group">
                <label for="name" class="col-sm-2 control-label"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Description'];?>
</label>
                <div class="col-sm-10">
                 <td><textarea id="description" name="description" class="form-control" rows="3"><?php echo $_smarty_tpl->tpl_vars['d']->value['description'];?>
</textarea></td></tr>
                </div>
              </div>
            </form>
            
            </div>
            <div class="modal-footer">
            
                <button type="button" data-dismiss="modal" class="btn"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Close'];?>
</button>
                <button id="update_item" class="btn btn-primary"><?php echo $_smarty_tpl->tpl_vars['_L']->value['Update'];?>
</button>
            </div><?php }
}
