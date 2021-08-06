<?php
 require_once("includes/config.php");

 $username= $_POST["username"];
 $sql="SELECT username,comment FROM comments WHERE username=:username";
 
 $query = $dbh -> prepare($sql);

 $query-> bindParam(':username', $username, PDO::PARAM_STR);
 //$query-> bindParam(':comment', $comment, PDO::PARAM_STR);

 $query-> execute();
 $results = $query -> fetchAll(PDO::FETCH_OBJ);
 $cnt=1;
 if($query -> rowCount() > 0)
 {
    foreach ($results as $result) {
        echo "<span style='color:red'> Student User Name:- </span>"."<br />";
        echo "<b>Student UserName:-</b>" .$result->username;
        echo htmlentities($result->username);
        }

 }
 else{
          
    echo "<span style='color:red'> Invaid Student Id. Please Enter Valid Student id .</span>";
   echo "<script>$('#submit').prop('disabled',true);</script>";
  }

?>

 <!------MENU SECTION START-->
 <?php include('includes/header.php');?>
<!-- MENU SECTION END-->
<div class="content-wrapper">
<div class="container">
<div class="row pad-botm">
<div class="col-md-12">
<h4 class="header-line">STUDENT FEEDBACK FORM</h4>
</div>
</div>
             
<!--LOGIN PANEL START-->           
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" >
<div class="panel panel-info">
<div class="panel-heading">
 FEEDBACK FORM
</div>
<div class="panel-body">
<form role="form" method="post">

<div class="form-group">
<label>Enter Username</label>
<input class="form-control" type="text" name="username" required autocomplete="off" />
</div>

 <button type="submit" name="givefeed" class="btn btn-info">GET FEEDBACK</button>
</form>
 </div>
</div>
</div>
</div>  
<!---LOGIN PABNEL END-->            
             
 
    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
 <?php include('includes/footer.php');?>
      <!-- FOOTER SECTION END-->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>

</body>
</html>
