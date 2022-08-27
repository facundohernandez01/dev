

<div class="modal-header">

<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h3>{$_L['Products n Services']}</h3
</div>
<div class="modal-body">

<table class="table table-striped">
         <tr>
        <thead>
        <tr>
          <th width="10%">#</th>
          <th width="20%">{$_L['Item Code']}</th>
          <th width="55%">{$_L['Item Name']}</th>
          <th width="15%">{$_L['Price']}</th>
        </tr>
      </thead>
      <tbody>      
      {foreach $d as $ds}
        <tr data-id="{$ds['id']}">
          <td><input type="checkbox" class="si"></td>
          <td>{$ds['item_number']}</td>
          <td>{$ds['name']}</td>
          <td class="price"></td>
        </tr>
        

      {/foreach}

      </tbody>

           </tr>
  </table>
 

</div>
<div class="modal-footer">
                            <tr>
                                <td colspan="7">
                                    <ul class="pagination">
                                    </ul>
                                </td>
                            </tr>
	<button type="button" data-dismiss="modal" class="btn">{$_L['Close']}</button>
	<button class="btn btn-primary update">{$_L['Select']}</button>
</div>
