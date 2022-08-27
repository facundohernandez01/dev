{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="wrapper wrapper-content">
        <div class="row">

            <div class="col-md-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>{$_L['Add Product']}</h5>
                        <div class="ibox-tools">
                    <a href="{$_url}transportes/-tlist" class="btn btn-primary btn-xs">{$_L['List']}</a>
                        </div>
                    </div>
                    <div class="ibox-content" id="ibox_form">
                    

                        <form class="form-horizontal" id="accadd" method="post" action="{$_url}transportes/add-post">

                            <div class="form-group">
                            <div class="col-lg-offset-2 col-md-6">

                                <label class="control-label" for="name">{$_L['Name']}</label>
                                <input type="text" id="nombre_transporte" name="nombre_transporte" class="form-control" autocomplete="off">
                                <label class="control-label" for="sales_price">Dirección </label>
                                <input type="text" id="direccion_transporte" name="direccion_transporte" class="form-control amount" autocomplete="off" data-a-sign="{$_c['currency_code']} "  data-a-dec="{$_c['dec_point']}" data-a-sep="{$_c['thousands_sep']}" data-d-group="2">
                                <label class="control-label">Teléfono </label>
                                <input type="text" id="telefono_transporte" name="telefono_transporte" class="form-control" autocomplete="off" >
                                <label class="control-label">Horario </label>
                                <input type="text" id="horario_transporte" name="horario_transporte" class="form-control" autocomplete="off" >
                                <label class="control-label" for="description">{$_L['Description']}</label>
                                <textarea id="alcance_transporte" name="alcance_transporte" class="form-control" rows="3"></textarea>
                                <hr>
            
                                <button class="btn btn-sm btn-primary" type="submit" id="submit">{$_L['Submit']}</button>
                                </div>
                            </div>





                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>


{/block}