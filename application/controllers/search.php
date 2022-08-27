<?php

_auth();
$ui->assign('_application_menu', 'contacts');
$ui->assign('_st', $_L['Search']);
$ui->assign('_title', $_L['Accounts'] . '- ' . $config['CompanyName']);
$action = $routes['1'];
$user = User::_info();
$ui->assign('user', $user);
switch ($action) {
    case 'ps':
        $type = _post('stype');
        $name = _post('txtsearch');
        $d = ORM::for_table('sys_items')
            ->limit(15)
            ->where('type', $type)
            ->where_raw('(`name` LIKE ? OR `description` LIKE ?)', ['%'.$name.'%', '%'.$name.'%'])
            ->order_by_asc('name')
            ->find_many();
        if ($d) {
            echo '<table class="table table-hover">
        <tbody>';

            foreach ($d as $ds) {
                $price = number_format(
                    $ds['sales_price'],
                    2,
                    $config['dec_point'],
                    $config['thousands_sep']
                );
                echo ' <tr>

                <td class="project-title">
                    <a href="#" class="cedit"  id="t' .
                    $ds['id'] .
                    '">' .
                    $ds['name'] .
                    '</a>
                    <br>
                    <small>' .
                    $ds['item_number'] .
                    '</small>
                </td>

                <td>'.$ds['description'].'</td>
                <td>

                   ' .
                    $price .
                    '

                </td>

                <td class="project-actions">

                    <a href="#" class="btn btn-primary btn-sm cedit" id="e' .
                    $ds['id'] .
                    '"><i class="fa fa-pencil"></i> ' .
                    $_L['Edit'] .
                    ' </a>
                    <a href="#" class="btn btn-danger btn-sm cdelete" id="pid' .
                    $ds['id'] .
                    '"><i class="fa fa-trash"></i> ' .
                    $_L['Delete'] .
                    ' </a>
                </td>
            </tr>';
            }

            echo '
        </tbody>
    </table>
        <tfoot>
    <tr>
        <td colspan="7">
            <ul class="pagination">
            </ul>
        </td>
    </tr>
    </tfoot>'
    ;
        } else {
            echo '<h4>Nothing Found</h4>';
        }

        break;

case 'transportes':
        $name = _post('txtsearch');
        $d = ORM::for_table('sys_transportes')
            ->limit(15)
            ->where_raw('(`nombre_transporte` LIKE ? OR `alcance_transporte` LIKE ?)', ['%'.$name.'%', '%'.$name.'%'])
            ->order_by_asc('nombre_transporte')
            ->find_many();
        if ($d) {
            echo '<table class="table table-hover">
        <tbody>';

            foreach ($d as $ds) {                
                echo ' <tr>

                <td class="project-title">
                    <a href="#" class="cedit"  id="t' .
                    $ds['id'] .
                    '">' .
                    $ds['nombre_transporte'] .
                    '</a>
                    <br>
                    <small>' .
                    $ds['direccion_transporte'] .
                    '</small>
                </td>
                <td>' .$ds['telefono_transporte'] .'</td>
                <td>' .$ds['horario_transporte'] .'</td>
                <td>' .$ds['alcance_transporte'] .'</td>

                <td class="project-actions">

                    <a href="#" class="btn btn-primary btn-sm cedit" id="e' .
                    $ds['id'] .
                    '"><i class="fa fa-home"></i> ' .
                    $_L['Edit'] .
                    ' </a>
                    <a href="#" class="btn btn-danger btn-sm cdelete" id="pid' .
                    $ds['id'] .
                    '"><i class="fa fa-trash"></i> ' .
                    $_L['Delete'] .
                    ' </a>
                </td>
            </tr>';
            }

            echo '
        </tbody>
    </table>';
        } else {
            echo '<h4>Nothing </h4>';
        }

        break;

   
   default:
        echo 'action no defined';
}
