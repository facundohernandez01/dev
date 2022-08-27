{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="row">
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    {if $view_type == 'filter'}
                        <h5>{$_L['Total']} : {$total_invoice}</h5>
                    {else}
                        <h5>{$paginator['found']} {$_L['Records']}. {if $paginator['found'] > 0}{$_L['Page']} {$paginator['page']} {$_L['of']} {$paginator['lastpage']}.{/if}</h5>
                    {/if}
                    <div class="ibox-tools">
                        {if $view_type neq 'filter'}
                            <a href="{$_url}recibos/list/filter/" class="btn btn-primary btn-xs"><i class="fa fa-search"></i> {$_L['Filter']}</a>
                        {else}
                            <a href="{$_url}recibos/list/" class="btn btn-primary btn-xs"><i class="fa fa-arrow-left"></i> {$_L['Back']}</a>
                        {/if}
                        <a href="{$_url}recibos/add/" class="btn btn-primary btn"><i class="fa fa-plus"></i> {$_L['Add recibo']}</a>

                    </div>
                </div>
                <div class="ibox-content">

                    {if $view_type == 'filter'}
                        <form class="form-horizontal" method="post" action="{$_url}customers/list/">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <span class="fa fa-search"></span>
                                        </div>
                                        <input type="text" name="name" id="foo_filter" class="form-control" placeholder="{$_L['Search']}..."/>

                                    </div>
                                </div>

                            </div>
                        </form>
                    {/if}

                    <table class="table table-bordered table-hover sys_table footable" {if $view_type == 'filter'} data-filter="#foo_filter" data-page-size="50" {/if}>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>{$_L['Account']}</th>
                            <th>{$_L['Amount']}</th>
                            <th>{$_L['Invoice Date']}</th>
                            <th>{$_L['Due Date']}</th>
                            <th>
                                {$_L['Status']}
                            </th>
                            <th>{$_L['Credit']}</th>
                            <th class="text-right">{$_L['Manage']}</th>
                        </tr>
                        </thead>
                        <tbody>

                        {foreach $d as $ds}
                            <tr>
                                <td  data-value="{$ds['id']}"><a href="{$_url}recibos/view/{$ds['id']}/">{$ds['invoicenum']}{if $ds['cn'] neq ''}{$ds['cn']}{else}{$ds['id']}{/if}</a> </td>
                                <td><a href="{$_url}contacts/view/{$ds['userid']}/">{$ds['account']}</a> </td>
                                <td class="amount" data-a-sign="{if $ds['currency_symbol'] eq ''} {$_c['currency_code']} {else} {$ds['currency_symbol']}{/if} ">{$ds['total']}</td>
                                <td data-value="{strtotime($ds['date'])}">{date( $_c['df'], strtotime($ds['date']))}</td>
                                <td data-value="{strtotime($ds['duedate'])}">{date( $_c['df'], strtotime($ds['duedate']))}</td>
                                <td>

                                    {if $ds['status'] eq 'Unpaid'}
                                        <span class="label label-danger">{ib_lan_get_line($ds['status'])}</span>
                                    {elseif $ds['status'] eq 'Paid'}
                                        <span class="label label-success">{ib_lan_get_line($ds['status'])}</span>
                                    {elseif $ds['status'] eq 'Pago parcial'}
                                        <span class="label label-info">{ib_lan_get_line($ds['status'])}</span>
                                    {elseif $ds['status'] eq 'Cancelled'}
                                        <span class="label">{ib_lan_get_line($ds['status'])}</span>
                                    {else}
                                        {ib_lan_get_line($ds['status'])}
                                    {/if}



                                </td>
                                <td>

                                        {if $ds['total'] - $ds['credit'] neq $ds['total']}                                       
                                            {$ds['total'] - $ds['credit']}
                                                 {else} <span class="label label-danger">Imputar pago</span>
                                        
                                          {/if}  
                                            
        
                                </td>
                                <td class="text-right">

                                    <a href="{$_url}recibos/view/{$ds['id']}/" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="{$_L['View']}"><i class="fa fa-file-text-o"></i></a>
                                    <a href="{$_url}recibos/clone/{$ds['id']}/" class="btn btn-success btn-xs" data-toggle="tooltip" data-placement="top" title="{$_L['Clone']}"><i class="fa fa-files-o"></i></a>
                                    <a href="{$_url}recibos/edit/{$ds['id']}/" class="btn btn-info btn-xs" data-toggle="tooltip" data-placement="top" title="{$_L['Edit']}"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="btn btn-danger btn-xs cdelete" id="iid{$ds['id']}" data-toggle="tooltip" data-placement="top" title="{$_L['Delete']}"><i class="fa fa-trash"></i></a>


                                </td>
                            </tr>
                        {/foreach}

                        </tbody>

                        {if $view_type == 'filter'}
                            <tfoot>
                            <tr>
                                <td colspan="8">
                                    <ul class="pagination">
                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        {/if}

                    </table>
                    {$paginator['contents']}
                </div>
            </div>
        </div>
    </div>

{/block}
