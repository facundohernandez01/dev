<script src="http://192.168.1.10:80/gestion/ui/lib/script.js"></script>

<?php
_auth();
$ui->assign('_application_menu', 'ps');
$ui->assign(
    '_title',
    $_L['Products n Services'] . '- ' . $config['CompanyName']
);
$ui->assign('_st', $_L['Products n Services']);
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
<h3>Productos</h3>  
<div class="text-right"><button class="btn btn-primary update">' .$_L['Select'] .' ></button></div>

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
  </div>';

    break;

    case 'add':
        $ui->display('add-ps.tpl');

    break;
    
    case 'add-post':
            $name = _post('name');
            $tags = _post('tags');
            $msg = '';
            if ($msg == '') {

            $d = ORM::for_table('sys_items')
                ->where('name', $name)
                ->find_one();
            if ($d) {
                $msg .= $_L['account_already_exist'] . '<br>';
                 }
    
                // Add Account
                $d = ORM::for_table('sys_items')->create();
                $d->name = $name;
                $d->tags = $tags;
                $d->description = _post('description');
                $d->sales_price = _post('sales_price');
                $d->c1 = _post('c1');
                $d->c2 = _post('c2');
                $d->c3 = _post('c3');
                $d->c4 = _post('c4');
                $d->c5 = _post('c5');
               
                $d->type = _post('type');
                $d->id = _post('item_number');
                $d->item_number = _post('item_number');
                $d->save();
                r2(
                    U . 'ps/p-list',
                    's',
                    'Guardado' . $ex_msg
                );
            } else {
                r2(U . 'ps/add', 'e', $msg);
            }
            break;

    case 'modal_add':
            Event::trigger('ps/modal_add/');
    
            $ui->display('add-ps.tpl');
    
            break;
    

    

    case 'edit':
        Event::trigger('ps/edit/');

        $iid = _post('id');
        $d = ORM::for_table('sys_items')->find_one($iid);      
        $ui->display('ps-edit.tpl');



        break;

        case 'edit-post':
            $msg = '';
            $id = _post('id');
            $price = _post('price');
            $price = Finance::amount_fix($price);
            $name = _post('name');
            $item_number = _post('item_number');
            $description = _post('description');
            if ($name == '') {
                $msg .= 'Name is Required <br>';
            }
            if (!is_numeric($price)) {
                $msg .= 'Invalid Sales Price <br>';
            }
    
            if ($msg == '') {
                $d = ORM::for_table('sys_items')->find_one($id);
                if ($d) {
                    $d->name = $name;
                    $d->item_number = $item_number;
                    $d->sales_price = $price;
                    $d->c1 = _post('c1');;
                    $d->c2 = _post('c2');;
                    $d->c3 = _post('c3');;
                    $d->c4 = _post('c4');;
                    $d->c5 = _post('c5');;


                    $d->save();
                    echo $d->id();
                } else {
                    echo 'Not Found';
                }
            } else {
                echo $msg;
            }
    
            break;
    case 'view':
        Event::trigger('ps/view/');

        $id = $routes['2'];
        $d = ORM::for_table('sys_items')->find_one($id);
        if ($d) {


            $ui->assign('d', $d);


        } else {
            r2(U . 'ps/p-list/', 'e', $_L['Account_Not_Found']);
        }

        break;

    case 'list':
        Event::trigger('ps/list/');
        $name = _post('name');

        if ($config['ps_set_view_mode'] == 'search') {
            // Foo Table

            $mode_css = Asset::css('footable/css/footable.core.min');

            $mode_js = Asset::js([
                'footable/js/footable.all.min',
                'ps/mode_search',
            ]);

            $d = ORM::for_table('sys_items')
                ->order_by_desc('id')
                ->find_many();

            $paginator['contents'] = '';
        } elseif ($name != '') {
            $paginator = Paginator::bootstrap(
                'sys_items',
                'name',
                '%' . $name . '%'
            );
            $d = ORM::for_table('sys_items')
                ->where_like('name', '%' . $name . '%')
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
            $d = ORM::for_table('sys_items')
                ->where_like('tags', '%' . $tags . '%')
                ->order_by_desc('id')
                ->find_many();
        } else {
            $paginator = Paginator::bootstrap('sys_items');
            $d = ORM::for_table('sys_items')
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
                '/lib/list-ps.js"></script>

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
        $ui->display('list-ps.tpl');

        break;


    case 'delete':
        Event::trigger('ps/delete/');

        $id = $routes['2'];
        if ($_app_stage == 'Demo') {
            r2(
                U . $myCtrl . '/list/',
                'e',
                'Sorry! Deleting Account is disabled in the demo mode.'
            );
        }
        $d = ORM::for_table('sys_items')->find_one($id);
        if ($d) {
            $d->delete();
            r2(U . $myCtrl . '/list/', 's', $_L['account_delete_successful']);
        }

        break;

        case 'p-new':
            $ui->assign('type', 'Product');
            $ui->assign('xfooter', Asset::js(['numeric', 'jslib/ps-list']));
            $ui->assign(
                'xjq',
                '
     $(\'.amount\').autoNumeric(\'init\');
     '
            );
    
            $max = ORM::for_table('sys_items')->max('id');
            $nxt = $max + 1;
            $ui->assign('nxt', $nxt);
            $ui->display('add-ps.tpl');
    
            break;
    
        case 's-new':
            $ui->assign('type', 'Product');
            $ui->assign('xfooter', Asset::js(['numeric', 'jslib/add-ps']));
    
            $ui->assign(
                'xjq',
                '
     $(\'.amount\').autoNumeric(\'init\');
     '
            );
    
            $max = ORM::for_table('sys_items')->max('id');
            $nxt = $max + 1;
            $ui->assign('nxt', $nxt);
            $ui->display('add-ps.tpl');
    
            break;

        case 'p-list':
            $paginator = Paginator::bootstrap('sys_items', 'type', 'Product');
            $d = ORM::for_table('sys_items')
    
                ->where('type', 'Product')
                ->offset($paginator['startpoint'])
                ->limit($paginator['limit'])
                ->order_by_desc('id')
                ->find_many();
            $ui->assign('d', $d);
            $ui->assign('type', 'Product');
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
                    '/lib/ps-list.js"></script>
    
    '
            );
            $ui->display('ps-list.tpl');
            break;

            case 'edit-post':
                $msg = '';
                $id = _post('id');
                $price = _post('price');
                $price = Finance::amount_fix($price);
                $name = _post('name');
                $item_number = _post('item_number');
                $description = _post('description');
                if ($name == '') {
                    $msg .= 'Name is Required <br>';
                }
                if (!is_numeric($price)) {
                    $msg .= 'Invalid Sales Price <br>';
                }
        
                if ($msg == '') {
                    $d = ORM::for_table('sys_items')->find_one($id);
                    if ($d) {
                        $d->name = $name;
                        $d->item_number = $item_number;
                        $d->sales_price = $price;
                        $d->description = $description;
                        $d->save();
                        r2(U . $myCtrl . '/list/', 's', 'Guardado');
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
                    $d = ORM::for_table('sys_items')->find_one($id);
                    if ($d) {
                        $price = number_format(
                            $d['sales_price'],
                            2,
                            $config['dec_point'],
                            $config['thousands_sep']
                    );
                        echo '
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>' .$_L['Edit'] .
                            '</h3>
            </div>
            <div class="modal-body">
            
            <form class="form-horizontal" role="form" id="edit_form" method="post">
              <div class="form-group">
                <label for="name" class="col-sm-2 control-label">' .
                            $_L['Name'] .
                            '</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="' .
                            $d['name'] .
                            '" name="name" id="name">
                </div>
              </div>
              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label">' .
                            $_L['Item Number'] .
                            '</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="item_number" value="' .
                            $d['item_number'] .
                            '" id="item_number">                                                                                                                                                                
                  <input type="hidden" name="id" value="' .
                            $d['id'] .
                            '">
                </div>
              </div>
              <div class="form-group">
              <label for="c1" class="col-sm-2 control-label">Norma de fabricación</label><div class="col-sm-10">

              <input type="text" class="form-control" name="c1" value="'.$d['c1'].'" id="c1"></div></div>
              <div class="form-group">
              <label for="c2" class="col-sm-2 control-label">Material de Construcción</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c2" value="'.$d['c2'].'" id="c2"></div></div>
              <div class="form-group">
              <label for="c3" class="col-sm-2 control-label">Coeficiente de Seguridad</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c3" value="'.$d['c3'].'" id="c3"></div></div>
              <div class="form-group">
              <label for="c4" class="col-sm-2 control-label">Carga de trabajo</label><div class="col-sm-10">
              <input type="text" class="form-control" name="c4" value="'.$d['c4'].'" id="c4"></div></div>
              <div class="form-group">
              <label for="c5" class="col-sm-2 control-label">Carga de rotura</label><div class="col-md-4">
              <input type="text" class="form-control" name="c5" value="'.$d['c5'].'" id="c5"></div>
            </div>









              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label">' .
                            $_L['Price'] .
                            '</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="price" value="' .
                            $price .
                            '" id="price">
                  <input type="hidden" name="id" value="' .
                            $d['id'] .
                            '">
                </div>
              </div>
                <div class="form-group">
                <label for="name" class="col-sm-2 control-label">' .
                            $_L['Description'] .
                            '</label>
                <div class="col-sm-10">
                  <textarea id="description" name="description" class="form-control" rows="3">' .
                            $d['description'] .
                            '</textarea>
                </div>
              </div>
            </form>
            
            </div>
            <div class="modal-footer">
            
                <button type="button" data-dismiss="modal" class="btn">' .
                            $_L['Close'] .
                            '</button>
                <button id="update_item" class="btn btn-primary">' .
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
