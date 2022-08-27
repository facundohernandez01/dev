
                            <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h3>{$_L['Edit']}
                                        </h3>
                        </div>
                        <div class="modal-body">
                        
                        <form class="form-horizontal" role="form" id="edit_form" method="post">
                          <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">
                                        {$_L['Name']} 
                                        </label>
                            <div class="col-sm-10">
                           <tr> <td> <input type="text" class="form-control" value="" name="name" id="name">  </td>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="rate" class="col-sm-2 control-label">
                                        {$_L['Item Number']}
                                        </label>
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
                            <label for="rate" class="col-sm-2 control-label">
                                        {$_L['Price']} 
                                        </label>
                            <div class="col-sm-2">
                              <input type="text" class="form-control" name="sales_price" value="" id="sales_price">
                              <input type="hidden" name="id" value="">
                            </div>
                          </div>
                            <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">
                                        {$_L['Description']} 
                                        </label>
                            <div class="col-sm-10">
                           <td><textarea id="description" name="description" class="form-control" rows="3"></textarea></td></tr>
                                        
                            </div>
                          </div>
                        </form>
                        
                        </div>
                        <div class="modal-footer">
                        
                            <button type="button" data-dismiss="modal" class="btn">
                                        {$_L['Close']} 
                                        </button>
                            <button id="add_item" class="btn btn-primary">
                                        {$_L['Save']}
                                        </button>
                        </div>