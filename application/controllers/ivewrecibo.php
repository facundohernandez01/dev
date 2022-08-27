<?php
$ui->assign('_application_menu', 'recibos');
$ui->assign('_st', $_L['Recibo']);
$ui->assign('_title', $_L['Accounts'] . '- ' . $config['CompanyName']);
$action = $routes['1'];
$id = $routes['2'];
$d = ORM::for_table('sys_recibos')->find_one($id);

if ($d) {
    $token = $routes['3'];
    $token = str_replace('token_', '', $token);
    $vtoken = $d['vtoken'];
    if ($token != $vtoken) {
        echo 'Sorry Token does not match222!';
        exit();
    }

    //find all activity for this user
    $items = ORM::for_table('sys_recibositems')
        ->where('invoiceid', $id)
        ->order_by_asc('id')
        ->find_many();

    $trs_c = ORM::for_table('sys_transactions')
        ->where('iid', $id)
        ->count();

    $trs = ORM::for_table('sys_transactions')
        ->where('iid', $id)
        ->order_by_desc('id')
        ->find_many();

    //find the user
    $a = ORM::for_table('crm_accounts')->find_one($d['userid']);

    $i_credit = $d['credit'];
    $i_due = '0.00';
    $i_total = $d['total'];
    if ($d['credit'] != '0.00') {
        $i_due = $i_total - $i_credit;
    } else {
        $i_due = $d['total'];
    }

    $cf = ORM::for_table('crm_customfields')
        ->where('showinvoice', 'Yes')
        ->order_by_asc('id')
        ->find_many();

    require 'application/lib/recibos/render.php';
} else {
    r2(U . 'customers/list', 'e', $_L['Account_Not_Found']);
}
