{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="wrapper wrapper-content">
        <div class="row">

            <div class="col-md-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>{$_L['Add Product']}</h5>
                        <div class="ibox-tools">
                    <a href="{$_url}ps/list" class="btn btn-primary btn-xs">{$_L['List Products']}</a>
                        </div>
                    </div>
                    <div class="ibox-content" id="ibox_form">
                    

                        <form class="form-horizontal" id="accadd" method="post" action="{$_url}ps/add-post">

                            <div class="form-group">
                            <div class="col-lg-offset-2 col-md-6">

                                <label class="control-label" for="name">{$_L['Name']}</label>
                                <input type="text" id="name" name="name" class="form-control" autocomplete="off">
                                <label class="control-label" for="sales_price">{$_L['Sales Price']}</label>
                                <input type="text" id="sales_price" name="sales_price" class="form-control amount" autocomplete="off" data-a-sign="{$_c['currency_code']} "  data-a-dec="{$_c['dec_point']}" data-a-sep="{$_c['thousands_sep']}" data-d-group="2">
                                <label class="control-label">Norma de fabricación </label>
                                <input type="text" id="c1" name="c1" class="form-control" autocomplete="off" >
                                <label class="control-label">Material de construcción </label>
                                <input type="text" id="c2" name="c2" class="form-control" autocomplete="off" >
                                <label class="control-label">Coeficiente de Seguridad</label>
                                <input type="text" id="c3" name="c3" class="form-control" autocomplete="off" >
                                <label class="control-label">Carga de Trabajo</label>
                                <input type="text" id="c4" name="c4" class="form-control" autocomplete="off" >
                                <label class="control-label">Carga de Rotura</label>
                                <input type="text" id="c5" name="c5" class="form-control" autocomplete="off" >
                                <label class="control-label" >Cod producto</label>
                                <input type="text" id="item_number"  name="item_number" class="form-control">
                                <label class="control-label" for="description">{$_L['Description']}</label>
                                <textarea id="description" name="description" class="form-control" rows="3"></textarea>
                                <hr>
                  
                                <input type="hidden" id="type" name="type" value="Product">

                                <input type="hidden" id="item_number" name="item_number" value="{$next}">
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