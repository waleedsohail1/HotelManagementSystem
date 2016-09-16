<?php
$conn = new mysqli('localhost', 'root');
if(!$conn)
{}
else
{}

mysql_select_db('hotel');
$id=$_POST['Username'];
$pass=$_POST['Password'];


$sql = "SELECT * FROM login where s_id='$id'";
   $retval =  $conn->query($sql);

if ($retval->num_rows > 0 ) {
    // output data of each row
    while(($row = mysql_fetch_array($retval, MYSQL_ASSOC))) {
					if(!strcmp($pass,$row["pass"])){
						echo "You are Logged In ".$row["s_id"]."<br>";				
						header('Refresh:2; url=adminpannel.php');
						}
						else{
						header('Refresh:2; url=admin_signin.php');
						echo "Invalid Staff ID or Password... Try Again";	
						}
    }
} 
?>



