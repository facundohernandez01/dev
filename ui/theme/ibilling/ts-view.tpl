{extends file="$tpl_admin_layout"}

{block name="content"}

    <div class="row">
        <div class="col-lg-12">
            
            <form class="form-horizontal" role="form" id="edit_form" method="post">
              <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Nombre</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" value="{$d['nombre_transporte']}" name="nombre_transporte" id="nombre_transporte">
                </div>
              </div>

              <div class="form-group">
              <label for="name" class="col-sm-2 control-label">Tel</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" value="{$d['telefono_transporte']}" name="telefono_transporte" id="telefono_transporte">
              </div>
            </div>

              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label">Direccion</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="direccion_transporte" value="{$d['direccion_transporte']}" id="direccion_transporte">
                  <input type="hidden" name="id" value="{$d['id']}">
                </div>
              </div>
              <div class="form-group">
                <label for="rate" class="col-sm-2 control-label">Horarios</label>
                <div class="col-sm-2">
                  <input type="text" class="form-control" name="horario_transporte" value="{$d['horario_transporte']}" id="horario_transporte">

                </div>
              </div>
                <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Desc</label>
                <div class="col-sm-10">
                  <textarea id="alcance_transporte" name="alcance_transporte" class="form-control" rows="3">{$d['alcance_transporte']}</textarea>
                </div>
              </div>
            </form>
            
     
          
          
          
          </div>
          </div>


{/block}