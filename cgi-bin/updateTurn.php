<?php
$con = new mysqli("db492851746.db.1and1.com", "dbo492851746", "wafflepassword", "db492851746");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$result = mysqli_query($con,'UPDATE `theTurn` SET turn="'.$_POST['name'].'" WHERE 1');

echo 'name = '.$_POST['name'];
echo $result;


mysqli_close($con);
?>