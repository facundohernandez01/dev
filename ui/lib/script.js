//Getting value from "ajax.php".



function fill(Value) {

   //Assigning value to "search" div in "search.php" file.

   $('#search').val(Value);

   //Hiding "display" div in "search.php" file.

   $('#display').hide();

}

$(document).ready(function() {

   //On pressing a key on "Search box" in "search.php" file. This function will be called.

   $("#search").keyup(function() {

       //Assigning search box value to javascript variable named as "name".

       var name = $('#search').val();

       //Validating, if "name" is empty.

       if (name == "") {

           //Assigning empty value to "display" div in "search.php" file.

           $("#display").html("");

       }

       //If name is not empty.

       else {

           //AJAX is called.

           $.ajax({

               //AJAX type is "Post".

               type: "POST",

               //Data will be sent to "ajax.php".

               url: "http://192.168.1.10:80/qa/ajax/4/ajax.php",

               //Data, that will be sent to "ajax.php".

               data: {

                   //Assigning value of "name" into "search" variable.

                   search: name

               },

               //If result found, this funtion will be called.

               success: function(html) {

                   //Assigning result to "display" div in "search.php" file.

                   $("#body_table").html(html).show();

               }

           });

       }

   });

});
 row_OnClick("items_table")
   function row_OnClick(items_table) {
    try {
        var rows = document.getElementById(items_table).rows;
        for (i = 0; i < rows.length; i++) {
            var _row = rows[i];
            _row.onclick = null;
            _row.onclick = function () {
                return function () {selectRow(this);};
            }(_row);
        }
    }
    catch (err) { }
}
function selectRow(row) {
   row.cells[0].firstChild.checked = !row.cells[0].firstChild.checked;
} 