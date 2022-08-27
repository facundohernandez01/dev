{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-title">
                    <h5>Transporte</h5>
                    <div class="ibox-tools">
                        <a href="{$_url}transportes/add" class="btn btn-primary btn-xs"><i class="fa fa-plus"></i>Nuevo</a>
                    </div>
                </div>
                <div class="ibox-content" id="ibox_form">
                    <div class="input-group"><input type="text" placeholder="{$_L['Search']}" id="txtsearch" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" id="search" class="btn btn-sm btn-primary"> {$_L['Search']}</button> </span></div>

                    <div class="project-list mt-md">
                        <div id="progressbar">
                        </div>

                        <div id="application_ajaxrender">


                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="_lan_are_you_sure" value="{$_L['are_you_sure']}">

{/block}