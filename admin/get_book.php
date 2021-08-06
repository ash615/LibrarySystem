<?php 
require_once("includes/config.php");
if(!empty($_POST["bookid"])) {

$qty = 0;
$bookid=$_POST['bookid'];
$sql5 = "SELECT * FROM tblbooks WHERE (ISBNNumber=:bookid)";
$query5 = $dbh->prepare($sql5);
$query5->bindParam(':bookid',$bookid,PDO::PARAM_STR);
$query5->execute();

while($row = $query5->fetch(PDO::FETCH_ASSOC)){
$qty = $row['BookCopies'];
}
if($qty==0){
  echo '<script>alert("This Book is Not Available Right Now")</script>';
  echo "<script>$('#submit').prop('disabled',true);</script>";

}



else



{
  $bookid=$_POST["bookid"];
  $studentid=$_POST["studentid"];
 
$sql ="SELECT BookName,id, BookCopies FROM tblbooks WHERE (ISBNNumber=:bookid)";
$query= $dbh -> prepare($sql);
$query-> bindParam(':bookid', $bookid, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;







if($query -> rowCount() > 0)
{
  foreach ($results as $result) {?>
<option value="<?php echo htmlentities($result->id);?>"><?php echo htmlentities($result->BookName);?></option>
<b>Book Name :</b> 

<?php  

$sql1 ="SELECT StudentId,TotalIssued FROM tblstudents WHERE (StudentId=:studentid)";
$query1= $dbh -> prepare($sql1);
$query1-> bindParam(':studentid', $studentid, PDO::PARAM_STR);
$query1-> execute();
$results1 = $query1 -> fetchAll(PDO::FETCH_OBJ);

foreach ($results1 as $result1) {


if($result1->TotalIssued>=3){
  echo htmlentities($result1->TotalIssued);
echo "<script>$('#submit').prop('disabled',true);</script>";
} else {
 echo "<script>$('#submit').prop('disabled',false);</script>";
}

}

}

}
 else{?>
  
<option class="others"> Invalid ISBN Number</option>
<?php
 echo "<script>$('#submit').prop('disabled',true);</script>";
}
}
}



?>
