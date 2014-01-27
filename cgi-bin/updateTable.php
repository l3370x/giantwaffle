<?php
$con = new mysqli("db492851746.db.1and1.com", "dbo492851746", "wafflepassword", "db492851746");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$result = mysqli_query($con,'UPDATE `theTable` SET name="'.$_POST['name'].'" WHERE id="'.$_POST["id"].'"');

echo 'updateTable';
echo 'name = '.$_POST['name'];
echo 'id = '.$_POST['id'];
echo $result;

mysqli_close($con);
?>