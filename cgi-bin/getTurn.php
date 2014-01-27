<?php
$con = new mysqli("db492851746.db.1and1.com", "dbo492851746", "wafflepassword", "db492851746");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$result = mysqli_query($con,"SELECT * FROM theTurn");

$rows = array();
while($r = mysqli_fetch_assoc($result)) {
    $rows[] = $r;
}
print json_encode($rows);

mysqli_close($con);
?>