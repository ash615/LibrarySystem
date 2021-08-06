<?php 
require_once("includes/config.php");
if(!empty($_POST["studentid"])) {
  $studentid= strtoupper($_POST["studentid"]);
 
    $sql ="SELECT FullName,Status,TotalIssued FROM tblstudents WHERE StudentId=:studentid";
$query= $dbh -> prepare($sql);
$query-> bindParam(':studentid', $studentid, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query -> rowCount() > 0)
{
foreach ($results as $result) {

if($result->Status==0)
{
echo "<span style='color:red'> Student ID Blocked </span>"."<br />";
echo "<b>Student Name-</b>" .$result->FullName;
 echo "<script>$('#submit').prop('disabled',true);</script>";
} elseif($result->TotalIssued>=3){
  echo "<span style='color:red'> Student ID Max Issued. Don't Issue the book </span>"."<br />";
echo "<b>Total Issued: </b>" .$result->TotalIssued;
echo "<br>";
 echo "<script>$('#submit').prop('disabled',true);</script>";
} else {
?>


<?php 

echo "<b>Student Name: </b>" .$result->FullName;
// echo htmlentities($result->FullName);
echo "<br>";
echo "<b>Total Issued: </b>" .$result->TotalIssued;

 echo "<script>$('#submit').prop('disabled',false);</script>";
}
}
}
 else{
  
  echo "<span style='color:red'> Invaid Student Id. Please Enter Valid Student id .</span>";
 echo "<script>$('#submit').prop('disabled',true);</script>";
}
}



?>
