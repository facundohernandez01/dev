<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {

  $name = $_POST['name'];
  if (empty($name)) {
    echo "Name is empty";
  } else {
    echo $name;
  }
}
?>