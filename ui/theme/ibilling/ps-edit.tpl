{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="row">
        <div class="widget-1 col-md-6 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{$_L['Edit_Account']}</h3>
                </div>
                <div class="panel-body">
                    <form role="form" name="accadd" method="post" action="{$_url}ps/edit-post">
                        <div class="form-group">
                            <label for="name">{$_L['Account_Title']}</label>
                            <input type="text" class="form-control" id="name" name="name" value="{$d->name}">
                        </div>
                        <div class="form-group">
                            <label for="description">{$_L['Description']}</label>
                            <input type="text" class="form-control" id="description" name="description" value="{$d->description}">
                        </div>

                        <div class="form-group">
                            <label for="sales_price">{$_L['Account Number']}</label>
                            <input type="text" class="form-control" id="sales_price" name="sales_price" value="{$d->sales_price}">
                        </div>

                        <div class="form-group">
                            <label for="tags">{$_L['Contact Person']}</label>
                            <input type="text" class="form-control" id="tags" name="tags" value="{$d->tags}">
                        </div>

    


                        <input type="hidden" name="id" value="{$d['id']}">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> {$_L['Submit']}</button>
                    </form>
                </div>
            </div>
        </div> <!-- Widget-1 end-->

        <!-- Widget-2 end-->
    </div>


{/block}
