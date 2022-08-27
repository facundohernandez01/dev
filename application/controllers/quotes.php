<?php
_auth();
$ui->assign('_application_menu', 'invoices');
$ui->assign('_st', $_L['Quotes']);
$ui->assign('_title', $_L['Sales'] . '- ' . $config['CompanyName']);
$action = $routes['1'];
$user = User::_info();
$ui->assign('user', $user);
switch ($action) {
    case 'new':
        Event::trigger('quotes/new/');
        $extra_fields = '';
        $extra_jq = '';

        $ui->assign('extra_fields', $extra_fields);

        $currencies = Model::factory('Models_Currency')->find_array();
        $ui->assign('currencies', $currencies);

        if (isset($routes['3']) and $routes['3'] != '') {
            $p_cid = $routes['3'];
            $p_d = ORM::for_table('crm_accounts')->find_one($p_cid);
            if ($p_d) {
                $ui->assign('p_cid', $p_cid);
            }
        } else {
            $ui->assign('p_cid', '');
        }

        $ui->assign('_st', $_L['Add quote']);
        $c = ORM::for_table('sys_companies')
            ->select('id')
            ->select('company_name')            
            ->select('email')
            ->order_by_desc('id')
            ->find_many();
        $ui->assign('c', $c);

        $t = ORM::for_table('sys_tax')->find_many();
        $ui->assign('t', $t);

        //default idate ddate
        $ui->assign('idate', date('Y-m-d'));

        $ui->assign(
            'xheader',
            Asset::css([
                's2/css/select2.min',
                'modal',
                'dp/dist/datepicker.min',
                'redactor/redactor',
            ])
        );
        $ui->assign(
            'xfooter',
            Asset::js([
                'redactor/redactor.min',
                's2/js/select2.min',
                's2/js/i18n/' . lan(),
                'dp/dist/datepicker.min',
                'dp/i18n/' . $config['language'],
                'numeric',
                'modal',
                'quotes',
            ])
        );

        $ui->assign(
            'xjq',
            '

$(\'#proposal_text\').redactor(
{
minHeight: 50 // pixels
}
);

$(\'#customer_notes\').redactor(
{
minHeight: 50 // pixels
}
);

 ' . $extra_jq
        );

        $ui->display('add-quote.tpl');

        break;

        case 'modal_add_company_from':
            $id = route(2);
    
            $company = false;
    
            if ($id != '') {
                $id = str_replace('ae', '', $id);
                $id = str_replace('be', '', $id);
    
                $company = Model::factory('Models_Company')->find_one($id);
            }
    
            $val = [];
    
            if ($company) {
                $f_type = 'edit';
                $val['company_name'] = $company->company_name;
                $val['url'] = $company->url;
                $val['email'] = $company->email;
                $val['phone'] = $company->phone;
                $val['logo_url'] = $company->logo_url;
                $val['cid'] = $id;
    
                //            $val[''] = $company->;
            } else {
                $f_type = 'create';
                $val['company_name'] = '';
                $val['url'] = 'http://';
                $val['email'] = '';
                $val['phone'] = '';
                $val['logo_url'] = '';
                $val['cid'] = $id;
                //            $val[''] = '';
            }
    
            $ui->assign('f_type', $f_type);
            $ui->assign('val', $val);
    
            $ui->display('modal_add_company_from.tpl');
    
        
            break;

            case 'add_company_post_from':
                $data = ib_posted_data();
        
                if ($data['f_type'] == 'edit') {
                    $company = Model::factory('Models_Company')->find_one($data['cid']);
        
                    if (!$company) {
                        i_close('Company Not Found');
                    }
                } else {
                    $company = Model::factory('Models_Company')->create();
                }
        
                if ($data['company_name'] == '') {
                    i_close($_L['Company Name is required']);
                }
        
                if ($data['email'] != '' && !Validator::Email($data['email'])) {
                    i_close($_L['Invalid Email']);
                }
        
                if ($data['url'] == 'http') {
                    $data['url'] = '';
                }
        
                $company->company_name = $data['company_name'];
                $company->url = $data['url'];
                $company->email = $data['email'];
                $company->phone = $data['phone'];
                $company->logo_url = $data['logo_url'];
                $company->save();
        
                echo $company->id();
        
                break;

    case 'edit':
        Event::trigger('quotes/edit/');

        $id = $routes['2'];
        $d = ORM::for_table('sys_quotes')->find_one($id);
        if ($d) {
            $currencies = Model::factory('Models_Currency')->find_array();
            $ui->assign('currencies', $currencies);
            
            $extra_fields = '';
            $extra_jq = '';

            Event::trigger('edit_quote');

            $ui->assign('extra_fields', $extra_fields);

            $ui->assign('i', $d);
            $items = ORM::for_table('sys_quoteitems')
                ->where('qid', $id)
                ->order_by_asc('id')
                ->find_many();
            $ui->assign('items', $items);
            //find the user
            $a = ORM::for_table('crm_accounts')->find_one($d['userid']);
            $ui->assign('a', $a);
            $ui->assign('d', $d);
            $ui->assign('_st', 'Editar cotización');

            $c = ORM::for_table('crm_accounts')
                ->where('id', $d['userid'])
                ->select('id')
                ->select('account')
                ->select('email')
                ->find_many();
            $ui->assign('c', $c);

            $co = ORM::for_table('sys_companies')->find_one($a['cid']);
            $ui->assign('co', $co);
            $ui->assign('d', $d);

            $co2 = ORM::for_table('crm_accounts')
            ->where('cid', $a['cid'])
            ->select('id')
            ->select('account')
            ->select('email')
            ->find_many();
            $ui->assign('co2', $co2);

            $t = ORM::for_table('sys_tax')->find_many();
            $ui->assign('t', $t);

            //default idate ddate
            $ui->assign(
                'xheader',
                Asset::css([
                    's2/css/select2.min',
                    'modal',
                    'dp/dist/datepicker.min',
                    'redactor/redactor',
                ])
            );
            $ui->assign(
                'xfooter',
                Asset::js([
                    'redactor/redactor.min',
                    's2/js/select2.min',
                    's2/js/i18n/' . lan(),
                    'dp/dist/datepicker.min',
                    'dp/i18n/' . $config['language'],
                    'numeric',
                    'modal',
                    'quote-edit',
                ])
            );

            $ui->assign(
                'xjq',
                '

$(\'#proposal_text\').redactor(
{
minHeight: 50 // pixels
}
);

$(\'#customer_notes\').redactor(
{
minHeight: 50 // pixels
}
);

 ' . $extra_jq
            );

            $ui->assign('idate', date('Y-m-d'));

            $ui->display('quote-edit.tpl');
        } else {
            echo 'Quote Not Found';
        }
        //find all clients.

        break;

    case 'view':
        Event::trigger('quotes/view/');

        $id = $routes['2'];
        $d = ORM::for_table('sys_quotes')->find_one($id);
        if ($d) {
            //find all activity for this user
            $items = ORM::for_table('sys_quoteitems')
                ->where('qid', $id)
                ->order_by_asc('id')
                ->find_many();
            $ui->assign('items', $items);
            //find related transactions

            $a = ORM::for_table('crm_accounts')->find_one($d['userid']);
            $ui->assign('a', $a);
            $ui->assign('d', $d);

            //find all custom fields

            $cf = ORM::for_table('crm_customfields')
                ->where('showinvoice', 'Yes')
                ->order_by_asc('id')
                ->find_many();
            $ui->assign('cf', $cf);

            $ui->assign(
                'xheader',
                Asset::css([
                    's2/css/select2.min',
                    'dp/dist/datepicker.min',
                    'sn/summernote',
                    'sn/summernote-bs3',
                    'modal',
                    'sn/summernote-application',
                    'css/ribbon',
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
                    'jslib/quote-view',
                ])
            );

            $x_html = '';

            Event::trigger('view_invoice');

            $ui->assign(
                'xjq',
                '

             $(\'.amount\').autoNumeric(\'init\', {


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

    });

            '
            );

            $ui->assign('x_html', $x_html);

            $ui->display('quote.tpl');
        } else {
            r2(U . 'customers/list', 'e', $_L['Account_Not_Found']);
        }

        break;

    case 'add-post':
        Event::trigger('quotes/add-post/');
        $cid = _post('cid');
        $coid = _post('coid');

        //find user with cid
        $u = ORM::for_table('crm_accounts')->find_one($cid);

        $msg = '';
        if ($cid == '') {
            $msg .= $_L['select_a_contact'] . ' <br> ';
        }

        
        $currency_id = _post('currency');

        $currency_find = Model::factory('Models_Currency')->find_one(
            $currency_id
        );

        if ($currency_find) {
            $currency = $currency_id;
            $currency_symbol = $currency_find->symbol;
            $currency_rate = $currency_find->rate;
        } else {
            $currency = 0;
            $currency_symbol = $config['currency_code'];
            $currency_rate = 1.0;
        }


        $subject = $_POST['subject'];
        $proposal_text = $_POST['proposal_text'];
        $customer_notes = $_POST['customer_notes'];

        if ($subject == '') {
            $msg .= $_L['Subject is Required'] . ' <br> ';
        }

        if (isset($_POST['amount'])) {
            $amount = $_POST['amount'];
        } else {
            $msg .= $_L['at_least_one_item_required'] . ' <br> ';
        }

        $idate = _post('idate');
        $its = strtotime($idate);
        $edate = _post('edate');
        $dd = '';
        $searchString = " ";
        $replaceString = "";         
        
        if ($msg == '') {
            $qty = $_POST['qty'];
            $itemcodess = $_POST['id'];
            $un = $_POST['un'];

            if (isset($_POST['taxed'])) {
                $taxed = $_POST['taxed'];
            } else {
                $taxed = false;
            }

            $sTotal = '0';
            $taxTotal = '0';
            $i = '0';
            $a = [];

            $taxval = '0.00';
            $taxname = '';
            $taxrate = '0.00';
            $tax = _post('tid');
            $taxed_type = _post('taxed_type');
            if ($tax != '') {
                $dt = ORM::for_table('sys_tax')->find_one($tax);
                $taxrate = $dt['rate'];
                $taxname = $dt['name'];
                $taxtype = $dt['type'];
                //
            }

            $itemcodes = str_replace($searchString, $replaceString, $itemcodess); 

            $taxed_amount = 0.0;

            $lamount = 0.0;

            foreach ($amount as $samount) {
                $samount = Finance::amount_fix($samount);
                $a[$i] = $samount;
                /* @since v 2.0 */
                $sqty = $qty[$i];
                $sun = $un[$i];

                $sqty = Finance::amount_fix($sqty);

                $sTotal += $samount * $sqty;
                $lamount = $samount * $sqty;

                if ($taxed) {
                    $c_tax = $taxed[$i];
                } else {
                    $c_tax = 'No';
                }

                if ($c_tax == 'Yes') {
                    $taxed_amount += $lamount;
                } else {
                    $a_tax = 0.0;
                }

                $i++;
            }

            $invoicenum = _post('invoicenum');
            $cn = _post('cn');

            $fTotal = $sTotal;

            // calculate discount

            $discount_amount = _post('discount_amount');
            $discount_type = _post('discount_type');
            $discount_value = '0.00';

            if ($discount_amount == '0' or $discount_amount == '') {
                $actual_discount = '0.00';
            } else {
                if ($discount_type == 'f') {
                    $actual_discount = $discount_amount;
                    $discount_value = $discount_amount;
                } else {
                    $discount_type = 'p';
                    $actual_discount = ($sTotal * $discount_amount) / 100;
                    $discount_value = $discount_amount;
                }
            }

            $actual_discount = number_format(
                (float) $actual_discount,
                2,
                '.',
                ''
            );

            $fTotal = $fTotal - $actual_discount;

            $actual_taxed_amount = $taxed_amount - $actual_discount;

            if ($actual_taxed_amount > 0) {
                $taxval = ($actual_taxed_amount * $taxrate) / 100;
            }

            if ($taxed_type != 'individual' and $tax != '') {
                $taxval = ($fTotal * $taxrate) / 100;
            }

            $fTotal = $fTotal + $taxval;

            //

            $today = date('Y-m-d');

            $vtoken = _raid(10);
            $d = ORM::for_table('sys_quotes')->create();
            $d->subject = $subject;
            $d->stage = _post('stage');
            $d->validuntil = _post('edate');
            $d->userid = $coid;
            $d->account = $cid;
            $d->invoicenum = $invoicenum;
            $d->cn = $cn;
            $d->firstname = '';
            $d->lastname = '';
            $d->companyname = '';
            $d->email = '';
            $d->address1 = '';
            $d->address2 = '';
            $d->city = '';
            $d->state = '';
            $d->postcode = '';
            $d->country = '';
            $d->phonenumber = '';
            $d->currency = 1;
            $d->subtotal = $sTotal;
            $d->discount_type = $discount_type;
            $d->discount_value = $discount_value;
            $d->discount = $actual_discount;
            $d->taxname = $taxname;
            $d->taxrate = $taxrate;
            $d->tax1 = $taxval;
            $d->tax2 = '0.00';
            $d->total = $fTotal;
            $d->proposal = $proposal_text;
            $d->customernotes = $customer_notes;
            $d->adminnotes = '';
            $d->datecreated = $idate;
            $d->lastmodified = $today;
            $d->datesent = $today;
            $d->dateaccepted = $today;
            $d->vtoken = $vtoken;
            $d->cond_pago = _post('cond_pago');


            $d->currency = $currency;
            $d->currency_symbol = $currency_symbol;
            $d->currency_rate = $currency_rate;

            $d->save();

            $qid = $d->id();

            $description = $_POST['desc'];

            $i = '0';

            foreach ($description as $item) {
                $samount = $a[$i];
                /* @since v 2.0 */
                $sqty = $qty[$i];
                $itemcode = $itemcodes[$i];
                $sqty = Finance::amount_fix($sqty);
                $samount = Finance::amount_fix($samount);

                $ltotal = $samount * $sqty;

                $d = ORM::for_table('sys_quoteitems')->create();

                $d->qid = $qid;
                $d->itemcode = $itemcode;
                $d->description = $item;
                $d->un = $sun;
                $d->qty = $sqty;
                $d->amount = $samount;
                $d->discount = '0.00';
                $d->total = $ltotal;
                //  $d->taxable = '0';

                if ($taxed) {
                    if ($taxed[$i] == 'Yes') {
                        $d->taxable = '1';
                    } else {
                        $d->taxable = '0';
                    }
                } else {
                    $d->taxable = '0';
                }

                $d->save();
                $i++;
            }

            echo $qid;
        } else {
            echo $msg;
        }

        break;

    case 'list':
        Event::trigger('quotes/list/');
        $view_type = 'filter';

        $mode_css = Asset::css('footable/css/footable.core.min');

        $mode_js = Asset::js([
            'numeric',
            'footable/js/footable.all.min',
            'contacts/mode_search',
        ]);

        $total_quote = ORM::for_table('sys_quotes')->count();

        $ui->assign('total_quote', $total_quote);

        $d = ORM::for_table('sys_quotes')
            ->where_not_equal('stage', 'Delivered')
            ->order_by_desc('id')
            ->find_many();


            $cempresa = ORM::for_table('sys_companies')            
            ->raw_join(
                'JOIN (SELECT * FROM crm_accounts)',
                array('sys_companies.id', '=', 'crm_accounts.cid'),
                'crm_accounts',)
            ->order_by_asc('sys_companies.company_name')
            ->find_many();            
            $ui->assign('cempresa', $cempresa);




        
        $paginator['contents'] = '';

        $ui->assign('xheader', $mode_css);

        $ui->assign('xfooter', $mode_js . Asset::js(['numeric']));

        $ui->assign('d', $d);
        $ui->assign('dcon', $dcon);
        $ui->assign('dcom', $dcom);

        $ui->assign('paginator', $paginator);
        $ui->assign(
            'xjq',
            '
         $(\'.amount\').autoNumeric(\'init\', {

    
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

    });
$(".cdelete").click(function (e) {
        e.preventDefault();
        var id = this.id;
        bootbox.confirm("' .
                $_L['are_you_sure'] .
                '", function(result) {
           if(result){
               var _url = $("#_url").val();
               window.location.href = _url + "delete/quote/" + id;
           }
        });
    });



 '
        );
        $ui->display('quotes.tpl');
        break;

    case 'list-recurring':
        Event::trigger('quotes/list-recurring/');
        $d = ORM::for_table('sys_invoices')
            ->where_not_equal('r', '0')
            ->order_by_desc('id')
            ->find_many();
        $ui->assign('d', $d);
        $ui->assign(
            'xjq',
            '
$(".cdelete").click(function (e) {
        e.preventDefault();
        var id = this.id;
        bootbox.confirm("' .
                $_L['are_you_sure'] .
                '", function(result) {
           if(result){
               var _url = $("#_url").val();
               window.location.href = _url + "delete/invoice/" + id;
           }
        });
    });

     $(".cstop").click(function (e) {
        e.preventDefault();
        var id = this.id;
        bootbox.confirm("Are you sure? This will prevent future invoice generation from this invoice.", function(result) {
           if(result){
               var _url = $("#_url").val();
               window.location.href = _url + "invoices/stop_recurring/" + id;
           }
        });
    });

 '
        );
        $ui->display('list-recurring-invoices.tpl');
        break;

    case 'edit-post':
        Event::trigger('quotes/edit-post/');

        $cid = _post('cid');
        $iid = _post('qid');
        $un = $_POST['un'];

        //find user with cid
        $u = ORM::for_table('crm_accounts')->find_one($cid);

        $msg = '';
        if ($cid == '') {
            $msg .= $_L['select_a_contact'] . ' <br> ';
        }

        //        $notes = _post('notes');

        $subject = $_POST['subject'];
        $proposal_text = $_POST['proposal_text'];
        $customer_notes = $_POST['customer_notes'];

        if ($subject == '') {
            $msg .= $_L['Subject is Required'] . ' <br> ';
        }

        if (isset($_POST['amount'])) {
            $amount = $_POST['amount'];
        } else {
            $msg .= $_L['at_least_one_item_required'] . ' <br> ';
        }

        $idate = _post('idate');
        $its = strtotime($idate);
        $edate = _post('edate');
        $dd = '';
        $searchString = " ";
        $replaceString = "";         

        if ($msg == '') {
            $qty = $_POST['qty'];
            $itemcodess = $_POST['id'];

            if (isset($_POST['taxed'])) {
                $taxed = $_POST['taxed'];
            } else {
                $taxed = false;
            }

            $sTotal = '0';
            $taxTotal = '0';
            $i = '0';
            $a = [];

            $taxval = '0.00';
            $taxname = '';
            $taxrate = '0.00';
            $tax = _post('tid');
            $taxed_type = _post('taxed_type');
            if ($tax != '') {
                $dt = ORM::for_table('sys_tax')->find_one($tax);
                $taxrate = $dt['rate'];
                $taxname = $dt['name'];
                $taxtype = $dt['type'];
                //
            }
            $itemcodes = str_replace($searchString, $replaceString, $itemcodess); 

            $taxed_amount = 0.0;

            $lamount = 0.0;

            foreach ($amount as $samount) {
                $samount = Finance::amount_fix($samount);
                $a[$i] = $samount;
                /* @since v 2.0 */
                $sqty = $qty[$i];

                $sqty = Finance::amount_fix($sqty);

                $sTotal += $samount * $sqty;
                $lamount = $samount * $sqty;

                if ($taxed) {
                    $c_tax = $taxed[$i];
                } else {
                    $c_tax = 'No';
                }

                if ($c_tax == 'Yes') {
                    $taxed_amount += $lamount;
                } else {
                    $a_tax = 0.0;
                }

                $i++;
            }

            $invoicenum = _post('invoicenum');
            $cn = _post('cn');

            $fTotal = $sTotal;
             // find currency

        $currency_id = _post('currency');

        $currency_find = Model::factory('Models_Currency')->find_one(
            $currency_id
        );

        if ($currency_find) {
            $currency = $currency_id;
            $currency_symbol = $currency_find->symbol;
            $currency_rate = $currency_find->rate;
        } else {
            $currency = 0;
            $currency_symbol = $config['currency_code'];
            $currency_rate = 1.0;
        }

            
            // calculate discount

            $discount_amount = _post('discount_amount');
            $discount_type = _post('discount_type');
            $discount_value = '0.00';

            if ($discount_amount == '0' or $discount_amount == '') {
                $actual_discount = '0.00';
            } else {
                if ($discount_type == 'f') {
                    $actual_discount = $discount_amount;
                    $discount_value = $discount_amount;
                } else {
                    $discount_type = 'p';
                    $actual_discount = ($sTotal * $discount_amount) / 100;
                    $discount_value = $discount_amount;
                }
            }

            $actual_discount = number_format(
                (float) $actual_discount,
                2,
                '.',
                ''
            );

            $fTotal = $fTotal - $actual_discount;

            $actual_taxed_amount = $taxed_amount - $actual_discount;

            if ($actual_taxed_amount > 0) {
                $taxval = ($actual_taxed_amount * $taxrate) / 100;
            }

            if ($taxed_type != 'individual' and $tax != '') {
                $taxval = ($fTotal * $taxrate) / 100;
            }

            $fTotal = $fTotal + $taxval;

            //

            $today = date('Y-m-d');

            $vtoken = _raid(10);

            $d = ORM::for_table('sys_quotes')->find_one($iid);
            if ($d) {
                $d->subject = $subject;
                $d->stage = _post('stage');
                $d->validuntil = _post('edate');
                $d->userid = $cid;
                $d->account = $u['account'];
                $d->invoicenum = $invoicenum;
                $d->cn = $cn;
                $d->firstname = '';
                $d->lastname = '';
                $d->companyname = '';
                $d->email = '';
                $d->address1 = '';
                $d->address2 = '';
                $d->city = '';
                $d->state = '';
                $d->postcode = '';
                $d->country = '';
                $d->phonenumber = '';
                $d->subtotal = $sTotal;
                $d->discount_type = $discount_type;
                $d->discount_value = $discount_value;
                $d->discount = $actual_discount;
                $d->taxname = $taxname;
                $d->taxrate = $taxrate;
                $d->tax1 = $taxval;
                $d->tax2 = '0.00';
                $d->total = $fTotal;
                $d->proposal = $proposal_text;
                $d->customernotes = $customer_notes;
                $d->adminnotes = '';
                $d->datecreated = $idate;
                $d->lastmodified = $today;
                $d->datesent = $today;
                $d->dateaccepted = $today;
                $d->vtoken = $vtoken;

                $d->currency = $currency;
                $d->currency_symbol = $currency_symbol;
                $d->currency_rate = $currency_rate;


                $d->save();

                $qid = $d->id();

                $description = $_POST['desc'];

                $i = '0';
                $x = ORM::for_table('sys_quoteitems')
                    ->where('qid', $iid)
                    ->delete_many();
                foreach ($description as $item) {
                    $samount = $a[$i];
                    /* @since v 2.0 */
                    $sqty = $qty[$i];
                    $itemcode = $itemcodes[$i];
                    $sun = $un[$i];
                    $sqty = Finance::amount_fix($sqty);
                    $samount = Finance::amount_fix($samount);

                    $ltotal = $samount * $sqty;

                    $d = ORM::for_table('sys_quoteitems')->create();

                    $d->qid = $qid;
                    $d->itemcode = $itemcode;
                    $d->description = $item;
                    $d->un = $sun;
                    $d->qty = $sqty;
                    $d->amount = $samount;
                    $d->discount = '0.00';
                    $d->total = $ltotal;
                    //  $d->taxable = '0';

                    if ($taxed) {
                        if ($taxed[$i] == 'Yes') {
                            $d->taxable = '1';
                        } else {
                            $d->taxable = '0';
                        }
                    } else {
                        $d->taxable = '0';
                    }
                    
                    $d->save();
                    $i++;
                }

                echo $qid;
            } else {
                $msg .= 'Quote Not Found';
            }
        } else {
            echo $msg;
        }

        break;
    case 'delete':
        Event::trigger('quotes/delete/');
        $id = $routes['2'];
        if ($_app_stage == 'Demo') {
            r2(
                U . 'accounts/list',
                'e',
                'Sorry! Deleting Account is disabled in the demo mode.'
            );
        }
        $d = ORM::for_table('crm_accounts')->find_one($id);
        if ($d) {
            $d->delete();
            r2(U . 'accounts/list', 's', $_L['account_delete_successful']);
        }

        break;

    case 'print':
        Event::trigger('quotes/print/');
        $id = $routes['2'];
        $d = ORM::for_table('sys_invoices')->find_one($id);
        if ($d) {
            //find all activity for this user
            $items = ORM::for_table('sys_invoiceitems')
                ->where('invoiceid', $id)
                ->order_by_asc('id')
                ->find_many();

            //find the user
            $a = ORM::for_table('crm_accounts')->find_one($d['userid']);

            require 'application/lib/invoices/render.php';
        } else {
            r2(U . 'customers/list', 'e', $_L['Account_Not_Found']);
        }

        break;

    case 'pdf':
        Event::trigger('quotes/pdf/');
        $id = $routes['2'];

        $d = ORM::for_table('sys_quotes')->find_one($id);
        if ($d) {
            //find all activity for this user
            $items = ORM::for_table('sys_quoteitems')
                ->where('qid', $id)
                ->order_by_asc('id')
                ->find_many();

            $a = ORM::for_table('crm_accounts')->find_one($d['userid']);

            $cf = ORM::for_table('crm_customfields')
                ->where('showinvoice', 'Yes')
                ->order_by_asc('id')
                ->find_many();

            define('_MPDF_PATH', 'application/lib/mpdf/');

            require 'application/lib/mpdf/mpdf.php';

            $pdf_c = '';
            $ib_w_font = 'dejavusanscondensed';
            if ($config['pdf_font'] == 'default') {
                $pdf_c = 'c';
                $ib_w_font = 'Helvetica';
            }

            $mpdf = new mPDF($pdf_c, 'A4', '', '', 20, 15, 15, 25, 10, 10);
            $mpdf->SetProtection(['print']);
            $mpdf->SetTitle($config['CompanyName'] . ' Invoice');
            $mpdf->SetAuthor($config['CompanyName']);
            $mpdf->SetWatermarkText($d['status']);
            $mpdf->showWatermarkText = false;
            $mpdf->watermark_font = $ib_w_font;
            $mpdf->watermarkTextAlpha = 0.1;
            $mpdf->SetDisplayMode('fullpage');

            if ($config['pdf_font'] == 'AdobeCJK') {
                $mpdf->useAdobeCJK = true;
                $mpdf->autoScriptToLang = true;
                $mpdf->autoLangToFont = true;
            }

            ob_start();

            require 'application/lib/invoices/q-x2.php';

            $html = ob_get_contents();

            ob_end_clean();

            $mpdf->WriteHTML($html);

            if (isset($routes['3']) and $routes['3'] == 'dl') {
                $mpdf->Output(date('Y-m-d') . _raid(4) . '.pdf', 'D'); # D
            } else {
                $mpdf->Output(date('Y-m-d') . _raid(4) . '.pdf', 'I'); # D
            }
            // $mpdf->Output();
        }

        break;

    case 'mark_draft':
        Event::trigger('quotes/mark_draft/');
        $iid = _post('iid');
        $d = ORM::for_table('sys_quotes')->find_one($iid);
        if ($d) {
            $d->stage = 'Pendiente de envío';
            $d->save();
            //   _msglog('s', 'Invoice marked as Draft');
        } else {
            _msglog('e', 'Invoice not found');
        }
        break;

    case 'mark_delivered':
        Event::trigger('quotes/mark_delivered/');
        $iid = _post('iid');
        $d = ORM::for_table('sys_quotes')->find_one($iid);
        if ($d) {
            $d->stage = 'Enviado';
            $d->save();
            //    _msglog('s', 'Invoice marked as Delivered');
        } else {
            _msglog('e', 'Invoice not found');
        }
        break;

    case 'mark_on_hold':
        Event::trigger('quotes/mark_on_hold/');
        $iid = _post('iid');
        $d = ORM::for_table('sys_quotes')->find_one($iid);
        if ($d) {
            $d->stage = 'On Hold';
            $d->save();
            //     _msglog('s', 'Invoice marked as On Hold');
        } else {
            _msglog('e', 'Invoice not found');
        }
        break;

    case 'mark_accepted':
        Event::trigger('quotes/mark_accepted/');
        $iid = _post('iid');
        $d = ORM::for_table('sys_quotes')->find_one($iid);
        if ($d) {
            $d->stage = 'Parcial';
            $d->save();
            //    _msglog('s', 'Invoice marked as Accepted');
        } else {
            _msglog('e', 'Invoice not found');
        }
        break;

    case 'mark_lost':
        Event::trigger('quotes/mark_lost/');
        $iid = _post('iid');
        $d = ORM::for_table('sys_quotes')->find_one($iid);
        if ($d) {
            $d->stage = 'Lost';
            $d->save();
            //    _msglog('s', 'Invoice marked as Lost');
        } else {
            _msglog('e', 'Invoice not found');
        }
        break;

    case 'mark_dead':
        Event::trigger('quotes/mark_dead/');
        $iid = _post('iid');
        $d = ORM::for_table('sys_quotes')->find_one($iid);
        if ($d) {
            $d->stage = 'Dead';
            $d->save();
            //            _msglog('s', 'Invoice marked as Dead');
        } else {
            _msglog('e', 'Invoice not found');
        }
        break;

    case 'mail_invoice_':
        $sid = $routes['2'];
        $etpl = $routes['3'];

        $d = ORM::for_table('sys_quotes')->find_one($sid);

        if ($etpl == 'created') {
            $e = ORM::for_table('sys_email_templates')
                ->where('tplname', 'Quote:Quote Created')
                ->find_one();
        } elseif ($etpl == 'reminder') {
            $e = ORM::for_table('sys_email_templates')
                ->where('tplname', 'Invoice:Invoice Payment Reminder')
                ->find_one();
        } elseif ($etpl == 'overdue') {
            $e = ORM::for_table('sys_email_templates')
                ->where('tplname', 'Invoice:Invoice Overdue Notice')
                ->find_one();
        } elseif ($etpl == 'confirm') {
            $e = ORM::for_table('sys_email_templates')
                ->where('tplname', 'Invoice:Invoice Payment Confirmation')
                ->find_one();
        } elseif ($etpl == 'refund') {
            $e = ORM::for_table('sys_email_templates')
                ->where('tplname', 'Invoice:Invoice Refund Confirmation')
                ->find_one();
        } else {
            $d = false;
            $e = false;
        }

        if ($d) {
            $a = ORM::for_table('crm_accounts')->find_one($d['userid']);

            $subject = new Template($e['subject']);
            $subject->set('business_name', $config['CompanyName']);
            $subject->set('quote_subject', $d['subject']);
            $subj = $subject->output();
            $message = new Template($e['message']);
            $message->set('contact_name', $a['account']);
            $message->set('business_name', $config['CompanyName']);
            $message->set(
                'quote_url',
                U . 'client/q/' . $d['id'] . '/token_' . $d['vtoken']
            );

            $message->set(
                'valid_until',
                date($config['df'], strtotime($d['validuntil']))
            );

            $message_o = $message->output();

            echo '
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h3>Quote #' .
                $d['id'] .
                '</h3>
</div>
<div class="modal-body">

<form class="form-horizontal" role="form" id="email_form" method="post">


<div class="form-group">
    <label for="subject" class="col-sm-2 control-label">' .
                $_L['To'] .
                '</label>
    <div class="col-sm-10">
      <input type="text" id="toemail" name="toemail" class="form-control" value="' .
                $a['email'] .
                '">
    </div>
  </div>

   <div class="form-group">
    <label for="ccemail" class="col-sm-2 control-label">' .
                $_L['Cc'] .
                '</label>
    <div class="col-sm-10">
      <input type="email" id="ccemail" name="ccemail" class="form-control" value="">
    </div>
  </div>

  <div class="form-group">
    <label for="bccemail" class="col-sm-2 control-label">' .
                $_L['Bcc'] .
                '</label>
    <div class="col-sm-10">
      <input type="email" id="bccemail" name="bccemail" class="form-control" value="">
      <span class="help-block"><a href="#" id="send_bcc_to_admin">' .
                $_L['Send Bcc to Admin'] .
                '</a></span>
    </div>
  </div>

    <div class="form-group">
    <label for="subject" class="col-sm-2 control-label">' .
                $_L['Subject'] .
                '</label>
    <div class="col-sm-10">
      <input type="text" id="subject" name="subject" class="form-control" value="' .
                $subj .
                '">
    </div>
  </div>

  <div class="form-group">
    <label for="subject" class="col-sm-2 control-label">' .
                $_L['Message Body'] .
                '</label>
    <div class="col-sm-10">
      <textarea class="form-control sysedit" rows="3" name="message" id="message">' .
                $message_o .
                '</textarea>
      <input type="hidden" id="toname" name="toname" value="' .
                $a['account'] .
                '">
      <input type="hidden" id="i_cid" name="i_cid" value="' .
                $a['id'] .
                '">
      <input type="hidden" id="i_iid" name="i_iid" value="' .
                $d['id'] .
                '">
    </div>
  </div>

<div class="form-group">
    <label for="attach_pdf" class="col-sm-2 control-label">Attach PDF?</label>
    <div class="col-sm-10">
      <div class="checkbox c-checkbox">
                          <label>
                            <input type="checkbox" name="attach_pdf" id="attach_pdf" value="Yes" checked><span class="fa fa-check"></span>  <i class="fa fa-paperclip"></i> Presup_' .
                $sid .
                '.pdf
                          </label>
                        </div>
    </div>
  </div>

</form>

</div>
<div class="modal-footer">
	<button id="send" class="btn btn-primary">' .
                $_L['Send'] .
                '</button>

		<button type="button" data-dismiss="modal" class="btn">' .
                $_L['Close'] .
                '</button>
</div>';
        } else {
            exit('Invoice Not Found');
        }

        break;

    case 'send_email':
        Event::trigger('quotes/send_email/');

        $msg = '';
        $email = _post('toemail');
        $cc = _post('ccemail');
        $bcc = _post('bccemail');
        $subject = _post('subject');
        $toname = _post('toname');
        $cid = _post('i_cid');
        $iid = _post('i_iid');

        $d = ORM::for_table('sys_quotes')->find_one($iid);

        if ($d['cn'] != '') {
            $dispid = $d['cn'];
        } else {
            $dispid = $d['id'];
        }

        $in = $d['invoicenum'] . $dispid;

        $message = $_POST['message'];

        $attach_pdf = _post('attach_pdf');

        $attachment_path = '';
        $attachment_file = '';

        if ($attach_pdf == 'Yes') {
            Quote::pdf($iid, 'store');

            $attachment_path = 'application/storage/temp/quote_' . $in . '.pdf';
            $attachment_file = 'quote_' . $in . '.pdf';
        }

        if (!Validator::Email($email)) {
            $msg .= 'Invalid Email <br>';
        }

        if (!Validator::Email($cc)) {
            $cc = '';
        }

        if (!Validator::Email($bcc)) {
            $bcc = '';
        }

        if ($subject == '') {
            $msg .= 'Subject is Required <br>';
        }

        if ($message == '') {
            $msg .= 'Message is Required <br>';
        }

        if ($msg == '') {
            //now send email

            Notify_Email::_send(
                $toname,
                $email,
                $subject,
                $message,
                $cid,
                '0',
                $cc,
                $bcc,
                $attachment_path,
                $attachment_file
            );

            // Now check for

            echo '<div class="alert alert-success fade in">Mail Sent!</div>';
        } else {
            echo '<div class="alert alert-danger fade in">' . $msg . '</div>';
        }

        break;

    case 'convert_invoice':
        Event::trigger('quotes/convert_invoice/');
        $iid = _post('iid');
        $q = ORM::for_table('sys_quotes')->find_one($iid);

        if ($q) {
            $cid = $q['userid'];
            //find user with cid
            $u = ORM::for_table('crm_accounts')->find_one($cid);

            $msg = '';
            if ($cid == '') {
                $msg .= $_L['select_a_contact'] . ' <br> ';
            }


            $currency_id =  $q['currency'];

            $currency_find = Model::factory('Models_Currency')->find_one(
                $currency_id
            );
    
            if ($currency_find) {
                $currency = $currency_id;
                $currency_symbol = $currency_find->symbol;
                $currency_rate = $currency_find->rate;
            } else {
                $currency = 0;
                $currency_symbol = $config['currency_code'];
                $currency_rate = 1.0;
            }
    
            $notes = _post('notes');

            $today = date('Y-m-d');

            $idate = $today;
            $its = strtotime($idate);
            $duedate = $today;

            $dd = $today;

            $nd = $idate;
            $r = '0';

            if ($msg == '') {
                $invoicenum = '';

                $vtoken = _raid(10);
                $ptoken = _raid(10);
                $d = ORM::for_table('sys_invoices')->create();
                $d->userid = $q['userid'];
                $d->account = $u['account'];
                $d->date = $idate;
                $d->duedate = $dd;
                $d->subtotal = $q['subtotal'];
                $d->discount_type = $q['discount_type'];
                $d->discount_value = $q['discount_value'];
                $d->discount = $q['discount'];
                $d->total = $q['total'];
                $d->tax = $q['tax1'];
                $d->taxname = $q['taxname'];
                $d->taxrate = $q['taxrate'];
                $d->vtoken = $vtoken;
                $d->ptoken = $ptoken;
                $d->status = 'Unpaid';
                // $d->currency = 1;
                $d->notes = 'Origen: Cotización N° '.$iid.'<br>';
                $d->r = $r;
                $d->nd = $nd;
                //others
                $d->invoicenum = $invoicenum;
                $d->tax2 = '0.00';
                $d->taxrate2 = '0.00';
                $d->paymentmethod = '';
                //

                $d->currency = $currency;
                $d->currency_symbol = $currency_symbol;
                $d->currency_rate = $currency_rate;
    
                $d->save();


                $invoiceid = $d->id();
                $i = '0';


                $u2 = ORM::for_table('sys_quotes')->find_one($iid);
                $u2->stage = 'delivered';
                $u2->save();


                $items = ORM::for_table('sys_quoteitems')
                    ->where('qid', $iid)
                    ->order_by_asc('id')
                    ->find_many();

                foreach ($items as $item) {
                    $d = ORM::for_table('sys_invoiceitems')->create();
                    $d->invoiceid = $invoiceid;
                    $d->userid = $cid;
                    $d->description = $item['description'];
                    $d->qty = $item['qty'];
                    $d->amount = $item['amount'];
                    $d->total = $item['total'];
                    $d->taxed = $item['taxable'];

                    //others
                    $d->type = '';
                    $d->relid = '0';
                    $d->itemcode = '';
                    $d->taxamount = '0.00';
                    $d->duedate = date('Y-m-d');
                    $d->paymentmethod = '';
                    $d->notes = '';

                    $d->save();
                    $i++;
                }

                _msglog('s', $_L['Invoice Created']);

                echo $invoiceid;
            } else {
                echo $msg;
            }
        } else {
            _msglog('e', 'Invoice not found');
        }

        break;
        case 'edit-form':
    
            $id = $routes['2'];
            $d = ORM::for_table('sys_items')->find_one($id);
            if ($d) {         
                $ui->assign('d', $d);
                $ui->display('modal_edit_ps.tpl');
                                                                                                                                       
                /**echo ' 
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
               <tr> <td> <input type="text" class="form-control" value="' .
                            $d['name'] .
                            '" name="name" id="name">  </td>
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
                             $d['sales_price']  .
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
               <td><textarea id="description" name="description" class="form-control" rows="3">' .
                            $d['description'] .
                            '</textarea></td></tr>
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
            </div>';**/

                    } else {
                        echo 'not found';
                    }
            
                    break; 

                   case 'add-form':
                    $ui->display('modal_add_ps.tpl');
                                                                                                                               
                      /*/  echo '
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
                           <tr> <td> <input type="text" class="form-control" value="" name="name" id="name">  </td>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="rate" class="col-sm-2 control-label">' .
                                        $_L['Item Number'] .
                                        '</label>
                            <div class="col-sm-2">
                              <input type="text" class="form-control" name="item_number" value="" id="item_number">                                                                                                                                                                
                              <input type="hidden" name="id" value="">
                            </div>
                          </div>
                          <div class="form-group">
                          <label for="c1" class="col-sm-2 control-label">Norma de fabricación</label><div class="col-sm-10">
            
                          <input type="text" class="form-control" name="c1" value=""></div></div>
                          <div class="form-group">
                          <label for="c2" class="col-sm-2 control-label">Material de Construcción</label><div class="col-sm-10">
                          <input type="text" class="form-control" name="c2" value="" id="c2"></div></div>
                          <div class="form-group">
                          <label for="c3" class="col-sm-2 control-label">Coeficiente de Seguridad</label><div class="col-sm-10">
                          <input type="text" class="form-control" name="c3" value="" id="c3"></div></div>
                          <div class="form-group">
                          <label for="c4" class="col-sm-2 control-label">Carga de trabajo</label><div class="col-sm-10">
                          <input type="text" class="form-control" name="c4" value="" id="c4"></div></div>
                          <div class="form-group">
                          <label for="c5" class="col-sm-2 control-label">Carga de rotura</label><div class="col-md-4">
                          <input type="text" class="form-control" name="c5" value="" id="c5"></div>
                        </div>
            
                          <div class="form-group">
                            <label for="rate" class="col-sm-2 control-label">' .
                                        $_L['Price'] .
                                        '</label>
                            <div class="col-sm-2">
                              <input type="text" class="form-control" name="sales_price" value="" id="sales_price">
                              <input type="hidden" name="id" value="">
                            </div>
                          </div>
                            <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">' .
                                        $_L['Description'] .
                                        '</label>
                            <div class="col-sm-10">
                           <td><textarea id="description" name="description" class="form-control" rows="3"></textarea></td></tr>
                                        
                            </div>
                          </div>
                        </form>
                        
                        </div>
                        <div class="modal-footer">
                        
                            <button type="button" data-dismiss="modal" class="btn">' .
                                        $_L['Close'] .
                                        '</button>
                            <button id="add_item" class="btn btn-primary">' .
                                        $_L['Update'] .
                                        '</button>
                        </div>';

                        
                                break;*/     
            

    default:
        echo 'action not defined';
}
