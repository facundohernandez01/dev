{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="row">
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    {if $view_type == 'filter'}
                        <h5>{$_L['Total']} : {$total_transporte}</h5>
                    {else}
                        <h5>{$paginator['found']} {$_L['Records']}. {if $paginator['found'] > 0}{$_L['Page']} {$paginator['page']} {$_L['of']} {$paginator['lastpage']}.{/if}</h5>
                    {/if}
                    <div class="ibox-tools">
                        {if $view_type neq 'filter'}
                            <a href="{$_url}transporte/list/filter/" class="btn btn-primary btn-xs"><i class="fa fa-search"></i> {$_L['Filter']}</a>
                        {else}
                            <a href="{$_url}transporte/list/" class="btn btn-primary btn-xs"><i class="fa fa-arrow-left"></i> {$_L['Back']}</a>
                        {/if}
                        <a href="{$_url}transporte/add/" class="btn btn-primary btn"><i class="fa fa-plus"></i> {$_L['Add Invoice']}</a>

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
                            <th>{$_L['Transporte']}</th>
                            <th>{$_L['Address']}</th>
                            <th>Horario</th>
                            <th>
                                {$_L['Phone']}
                            </th>
                            <th>Alcance</th>
                            <th class="text-right">{$_L['Manage']}</th>
                        </tr>
                        </thead>
                        <tbody>

                        {foreach $d as $ds}
                            <tr>
                                <td  data-value="{$ds['id']}"><a href="{$_url}transportes/view/{$ds['id']}/">{$ds['id']}</a> </td>
                                <td><a href="{$_url}transportes/view/{$ds['id']}/">{$ds['nombre_transporte']}</a> </td>                                
                                <td><a href="">{$ds['direccion_transporte']}</a> </td>                                
                                <td><a href="">{$ds['horario_transporte']}</a> </td>                                
                                <td><a href="">{$ds['telefono_transporte']}</a> </td>                                
                                <td><a href="">{$ds['alcance_transporte']}</a> </td>                                

                    
                    
                                <td class="text-right">

                                    <a href="{$_url}recibos/view/{$ds['id']}/" class="btn btn-primary btn-xs" data-toggle="tooltip" data-placement="top" title="{$_L['View']}"><i class="fa fa-file-text-o"></i></a>
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
