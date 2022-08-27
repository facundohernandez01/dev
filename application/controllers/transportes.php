<?php
_auth();
$ui->assign('_application_menu', 'transportes');
$ui->assign(
    '_title',
    Transportes. '- ' . $config['CompanyName']
);
$ui->assign('_st', Transportes);
// *$ui->assign('content_inner', inner_contents($config['c_cache']));*/
$action = $routes['1'];
$user = User::_info();
$ui->assign('user', $user);

$ui->assign(
    'jsvar',
    '
_L[\'Working\'] = \'' .
        $_L['Working'] .
        '\';
_L[\'Submit\'] = \'' .
        $_L['Submit'] .
        '\';
 '
);

switch ($action) {
    
    case 'modal-list':
          
          
    echo '
    <div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
<h3>Productos</h3>
</div>
<div class="modal-body">
<input class="form-control" type="text" id="search" placeholder="Search" />
<table class="table table-dark table-hover" id="items_table">
<tr>
<thead>
<tr>
  <th width="10%">#</th>
  <th width="20%"></th>
  <th width="55%"></th>

  <th width="15%"></th>
</tr>
</thead>
<tbody id="body_table">

</tbody>
</tr>
</table>

</div>

  <div class="modal-footer">
  <button type="button" data-dismiss="modal" class="btn">' .$_L['Close'] .'</button>
  <button class="btn btn-primary update">' .$_L['Select'] .'</button>
  </div>';

    break;

    case 'add':
        $ui->display('add-ts.tpl');

    break;
    
    case 'add-post':
            $nombre_transporte = _post('nombre_transporte');
            $direccion_transporte = _post('direccion_transporte');
            $telefono_transporte = _post('telefono_transporte');
            $horario_transporte = _post('horario_transporte');
            $alcance_Transporte = _post('alcance_Transporte');
            $msg = '';
            if ($msg == '') {

            $d = ORM::for_table('sys_transportes')
                ->where('nombre_transporte', $nombre_transporte)
                ->find_one();
            if ($d) {
                $msg .= $_L['account_already_exist'] . '<br>';
                 }
    
                // Add Account
                $d = ORM::for_table('sys_transportes')->create();
                $d->nombre_transporte = $nombre_transporte;
                $d->alcance_Transporte = _post('alcance_Transporte');
                $d->telefono_transporte = _post('telefono_transporte');
                $d->horario_transporte = _post('horario_transporte');
                $d->direccion_transporte = _post('direccion_transporte');

                $d->save();
                r2(
                    U . 'transportes/t-list',
                    's',
                    $_L['account_created_successfully'] . $ex_msg
                );
            } else {
                r2(U . 'transportes/add', 'e', $msg);
            }
            break;

    case 'modal_add':
            Event::trigger('transportes/modal_add/');
    
            $ui->display('add-ts.tpl');
    
            break;
    
    case 'set_view_mode':
            Event::trigger('ps/set_view_mode/');
    
            if (isset($routes[2]) and $routes[2] != '') {
                $mode = $routes['2'];
            } else {
                $mode = 'tbl';
            }
    
            $available_mode = ["tbl", "card", "search"];
            if (in_array($mode, $available_mode)) {
                update_option('contact_set_view_mode', $mode);
            }
    
            r2(U . 'ps/list/');
    
            break;
    

    case 'edit':
        Event::trigger('ps/edit/');

        $iid = _post('id');
        $d = ORM::for_table('sys_items')->find_one($iid);      
        $ui->display('ps-edit.tpl');



        break;

        case 'edit-postt':
            Event::trigger('transportes/edit-post/');
    
            $id = _post('id');
            $d = ORM::for_table('sys_transportes')->find_one($id);
            if ($d) {
                $old_name = $d->nombre_transporte;
                $name = _post('nombre_transporte');
                $description = _post('alcance_transporte');
    
                if (isset($_POST['tags'])) {
                    $tags = $_POST['tags'];
                } else {
                    $tags = '';
                }
                $horario_transporte = _post('horario_transporte');
                $msg = '';
    
                if ($name == '') {
                    $msg .= $_L['Account Name is required'] . ' <br>';
                }
                Tags::save($tags, 'Transportes');
    
                if ($msg == '') {
                    $d = ORM::for_table('sys_transportes')->find_one($id);
                    $d->nombre_transporte = $name;
                    $d->tags = Arr::arr_to_str($tags);            
                    $d->save();
                   
    
                    if ($name != $old_name) {
                        $sql = "update sys_transportes set nombre_transporte='$name' where nombre_transporte='$old_name'";
    
                        ORM::execute($sql);
                    }
    
                    _msglog('s', $_L['account_updated_successfully']);
    
                    echo $id;
                } else {
                    echo $msg;
                }
            } else {
                r2(U . $myCtrl . '/list', 'e', $_L['Account_Not_Found']);
            }
    
            break;

    case 'view':
        Event::trigger('transportes/view/');

        $id = $routes['2'];
        $d = ORM::for_table('sys_transportes')->find_one($id);
        $ui->assign('d', $d);

        if ($d) {

            $ui->assign(
                'xheader',
                Asset::css([
                    's2/css/select2.min',
                    'dp/dist/datepicker.min',
                    'sn/summernote',
                    'sn/summernote-bs3',
                    'modal',
                    'sn/summernote-application',
                ])
            );

            $ui->assign(
                'xfooter',
                Asset::js([
                    's2/js/select2.min',
                    's2/js/i18n/' . lan(),
                    'dp/dist/datepicker.min',
                    'dp/i18n/' . $config['language'],
                    'numeric',
                    'modal',
                    'sn/summernote.min',
                    'jslib/invoice-view',
                ])
            );

            $x_html = '';

            Event::trigger('view_invoice');

            $ui->assign('x_html', $x_html);

            $ui->assign(
                'xjq',
                ' $(\'.amount\').autoNumeric(\'init\', {

   
    dGroup: ' .
                    $config['thousand_separator_placement'] .
                    ',
    aPad: ' .
                    $config['currency_decimal_digits'] .
                    ',
    pSign: \'' .
                    $config['currency_symbol_position'] .
                    '\',
    aDec: \'' .
                    $config['dec_point'] .
                    '\',
    aSep: \'' .
                    $config['thousands_sep'] .
                    '\'

    });'
            );

            $ui->display('ts-view.tpl');
        } else {
            r2(U . 'transportes/list/', 'e', $_L['Account_Not_Found']);
        }

        break;

        case 'list':
            Event::trigger('transportes/list/');
            $name = _post('nombre_transporte');
    
            if ($config['ps_set_view_mode'] == 'search') {
                // Foo Table
    
                $mode_css = Asset::css('footable/css/footable.core.min');
    
                $mode_js = Asset::js([
                    'footable/js/footable.all.min',
                    'ps/mode_search',
                ]);
    
                $d = ORM::for_table('sys_transportes')
                    ->order_by_desc('id')
                    ->find_many();
    
                $paginator['contents'] = '';
            } elseif ($name != '') {
                $paginator = Paginator::bootstrap(
                    'sys_transportes',
                    'nombre_transporte',
                    '%' . $name . '%'
                );
                $d = ORM::for_table('sys_transportes')
                    ->where_like('nombre_transporte', '%' . $name . '%')
                    ->offset($paginator['startpoint'])
                    ->limit($paginator['limit'])
                    ->order_by_desc('id')
                    ->find_many();
            } elseif (
                isset($routes[2]) and
                $routes[2] != '' and
                !is_numeric($routes[2])
            ) {
                $tags = $routes[2];
                $paginator['contents'] = '';
                $d = ORM::for_table('sys_transportes')
                    ->where_like('tags', '%' . $tags . '%')
                    ->order_by_desc('id')
                    ->find_many();
            } else {
                $paginator = Paginator::bootstrap('sys_transportes');
                $d = ORM::for_table('sys_transportes')
                    ->offset($paginator['startpoint'])
                    ->limit($paginator['limit'])
                    ->order_by_desc('id')
                    ->find_many();
            }
    
            $ui->assign('d', $d);
            $ui->assign('paginator', $paginator);
    
            $ui->assign('xheader', $mode_css);
    
            $ui->assign(
                'xfooter',
                $mode_js .
                    '
    <script type="text/javascript" src="' .
                    $_theme .
                    '/lib/list-ts.js"></script>
    
    '
            );
            $ui->assign(
                'jsvar',
                '
    _L[\'are_you_sure\'] = \'' .
                    $_L['are_you_sure'] .
                    '\';
     '
            );
            $ui->display('list-transportes.tpl');
    
            break;


    case 'delete':
        Event::trigger('transportes/delete/');

        $id = $routes['2'];
        if ($_app_stage == 'Demo') {
            r2(
                U . $myCtrl . '/list/',
                'e',
                'Sorry! Deleting Account is disabled in the demo mode.'
            );
        }
        $d = ORM::for_table('sys_transportes')->find_one($id);
        if ($d) {
            $d->delete();
            r2(U . $myCtrl . '/list/', 's', $_L['account_delete_successful']);
        }

        break;
        case 't-list':
            $paginator = Paginator::bootstrap('sys_transportes');
            $d = ORM::for_table('sys_transportes')
                ->offset($paginator['startpoint'])
                ->limit($paginator['limit'])
                ->order_by_desc('id')
                ->find_many();
            $ui->assign('d', $d);
            $ui->assign('paginator', $paginator);
            $ui->assign(
                'xheader',
                '
    <link rel="stylesheet" type="text/css" href="' .
                    $_theme .
                    '/css/modal.css"/>
    
    '
            );
            $ui->assign(
                'xfooter',
                '
            <script type="text/javascript" src="' .
                    $_theme .
                    '/lib/modal.js"></script>	
            <script type="text/javascript" src="' .
                    $_theme .
                    '/lib/ts-list.js"></script>
    
    '
            );
            $ui->display('ts-list.tpl');
            break;

            case 'edit-post':
                $msg = '';
                $id = _post('id');
                $horario = _post('horario_transporte');
                $name = _post('nombre_transporte');
                $telefono = _post('telefono_transporte');
                $description = _post('alcance_transporte');
                $direccion = _post('direccion_transporte');

                if ($name == '') {
                    $msg .= 'Name is Required <br>';
                }

        
                if ($msg == '') {
                    $d = ORM::for_table('sys_transportes')->find_one($id);
                    if ($d) {
                        $d->nombre_transporte = $name;
                        $d->horario_transporte = $horario;
                        $d->telefono_transporte = $telefono;
                        $d->alcance_transporte = $description;
                        $d->direccion_transporte = $direccion;
                        $d->save();
                        echo $d->id();
                    } else {
                        echo 'Not Found';
                    }
                } else {
                    echo $msg;
                }
        
                break;

                case 'edit-form':
                    if (!has_access($user->roleid, 'products_n_services', 'edit')) {
                        echo 'Permission Denied';
                    }
            
                    $id = $routes['2'];
                    $d = ORM::for_table('sys_transportes')->find_one($id);
                    if ($d) {                                                                                                                                                
                        echo '
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>' .
                            $_L['Edit'] .
                            '</h3>
            </div>
            <div class="modal-body">
            
            <form class="form-horizontal" role="form" id="edit_form" method="post">
              <div class="form-group">
                <label for="name" class="col-sm-2 control-label">' .$_L['Name'].'</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="' .
                            $d['nombre_transporte'] .
                            '" name="nombre_transporte" id="nombre_transporte">
                </div>
              </div>

              <div class="form-group">
              <label for="name" class="col-sm-2 control-label">' .$_L['Phone'].'</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="' .
                          $d['telefono_transporte'] .
                          '" name="telefono_transporte" id="telefono_transporte">
              </div>
            </div>

              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label">'.Direccion.'</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="direccion_transporte" value="' .
                            $d['direccion_transporte'] .
                            '" id="direccion_transporte">
                  <input type="hidden" name="id" value="' .
                            $d['id'] .
                            '">
                </div>
              </div>
              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label">' .Horarios. '</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="horario_transporte" value="' .
                  $d['horario_transporte'] .
                  '" id="horario_transporte">

                </div>
              </div>
                <div class="form-group">
                <label for="name" class="col-sm-2 control-label">' .
                            $_L['Description'] .
                            '</label>
                <div class="col-sm-10">
                  <textarea id="alcance_transporte" name="alcance_transporte" class="form-control" rows="3">' .
                            $d['alcance_transporte'] .
                            '</textarea>
                </div>
              </div>
            </form>
            
            </div>
            <div class="modal-footer">
            
                <button type="button" data-dismiss="modal" class="btn">' .
                            $_L['Close'] .
                            '</button>
                <button id="update" class="btn btn-primary">' .
                            $_L['Update'] .
                            '</button>
            </div>';
                    } else {
                        echo 'not found';
                    }
            
                    break;
                    

    default:
        echo 'action not defined';



        
}


?>
