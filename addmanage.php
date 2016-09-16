<?php
echo "<body background='images/terrace.jpg'></body>";
$conn=mysql_connect("localhost","root");
if(!$conn)
{}
else
{}
$selection=mysql_select_db('hotel',$conn);
$id=$_POST['id'];
$pass=$_POST['pass'];
$name=$_POST['name'];
$CNIC=$_POST['CNIC'];
$gender=$_POST['gender'];
$address_id=$_POST['aid'];
$house=$_POST['house_num'];
$block=$_POST['block'];
$streetnum=$_POST['streetnum'];
$areaName=$_POST['areaName'];
$town=$_POST['town'];
$country=$_POST['country'];
$phno=$_POST['phno'];

$qur="insert into addresses values ('$address_id','$house','$block','$streetnum','$areaName','$town','$country');";
if(!mysql_query($qur,$conn))
{
    echo "adresses.";
}
$qur="insert into staff values('$id',2,'$name','$gender','$CNIC',0,'$phno');";
if(!mysql_query($qur,$conn))
{
    echo "staff.";
}
$qur="insert into staff_addresses values('$id','$address_id');";
if(!mysql_query($qur,$conn))
{
    echo "sadress.";
}
$qur="insert into login values ('$id','2','$pass')";
if(mysql_query($qur,$conn))
{
    header('Refresh:2; url=addmanager.php');
}
else 
    echo "login";

echo "$phno";
?>
