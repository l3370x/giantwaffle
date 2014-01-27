<?php
$con = new mysqli("db492851746.db.1and1.com", "dbo492851746", "wafflepassword", "db492851746");
// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$result = mysqli_query($con,'SELECT * FROM theTable WHERE id='.$_POST['id']);

while($row = mysqli_fetch_array($result))
  {
  if ($row['name'] != '-'){
	print "taken";
  } else {
	print "avail";
  }
  }
mysqli_close($con);
?>