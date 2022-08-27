<form class="form-horizontal" id="rform">

    <div class="form-group"><label class="col-lg-2 control-label" for="account">{$_L['Porducto']}</label>
       <div class="col-lg-10"><input type="text" id="name" name="name" class="form-control" value="{$d['name']}">
       </div>
   </div>
    <div class="form-group"><label class="col-lg-2 control-label" for="description">{$_L['Description']}</label>
        <div class="col-lg-10"><input type="text" id="description" name="description" class="form-control" value="{$d['description']}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-2 control-label" for="sales_price">{$_L['Price']}</label>
  <div class="col-lg-10"><input type="text" id="sales_price" name="sales_price" class="form-control" value="{$d['sales_price']}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-2 control-label">Norma de fabricación </label>
  <div class="col-lg-10"><input type="text" id="c1" name="c1" class="form-control" value="{$d['c1']}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-2 control-label">Material de construcción </label>
  <div class="col-lg-10"><input type="text" id="c2" name="c2" class="form-control" value="{$d['c2']}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-2 control-label">Coeficiente de Seguridad</label>
  <div class="col-lg-10"><input type="text" id="c3" name="c3" class="form-control" value="{$d['c3']}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-2 control-label"> Carga de Trabajo </label>
  <div class="col-lg-10"><input type="text" id="c4" name="c4" class="form-control" value="{$d['c4']}">
        </div>
    </div>
    <div class="form-group"><label class="col-lg-2 control-label" for="sales_price">Carga de Rotura</label>
  <div class="col-lg-10"><input type="text" id="c5" name="c5" class="form-control" value="{$d['c5']}">
        </div>
    </div>

    <div class="form-group"><label class="col-lg-2 control-label" for="tags">{$_L['Tags']}</label>
        <div class="col-lg-10">
            {*<input type="text" id="tags" name="tags" style="width:100%" value="{$d['tags']}">*}
            <select name="tags[]" id="tags"  class="form-control" multiple="multiple">
                {foreach $tags as $tag}
                    <option value="{$tag['text']}" {if in_array($tag['text'],$dtags)}selected="selected"{/if}>{$tag['text']}</option>
                {/foreach}

            </select>

        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">

            <button class="btn btn-primary" type="submit" id="submit"><i class="fa fa-check"></i> {$_L['Submit']}</button>
        </div>
    </div>
    <input type="hidden" name="fcid" id="fcid" value="{$d['id']}">
</form>
