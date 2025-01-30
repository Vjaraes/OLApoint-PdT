
    <?php
    
    

    //import database
    include("../connection.php");



    if($_POST){
        //print_r($_POST);
        $result= $database->query("select * from webuser");
        $name=$_POST['name'];
        $rut=$_POST['rut'];
        $oldemail=$_POST["oldemail"];
        $spec=$_POST['spec'];
        $email=$_POST['email'];
        $tele=$_POST['Tele'];
        $password=$_POST['password'];
        $cpassword=$_POST['cpassword'];
        $id=$_POST['id00'];
        
        if ($password==$cpassword){
            $error='3';
            $result= $database->query("select specialist.speid from specialist inner join webuser on specialist.spemail=webuser.email where webuser.email='$email';");
            //$resultqq= $database->query("select * from specialist where speid='$id';");
            if($result->num_rows==1){
                $id2=$result->fetch_assoc()["speid"];
            }else{
                $id2=$id;
            }
            
            echo $id2."speid";
            if($id2!=$id){
                $error='1';
                //$resultqq1= $database->query("select * from specialist where spemail='$email';");
                //$did= $resultqq1->fetch_assoc()["speid"];
                //if($resultqq1->num_rows==1){
                    
            }else{

                //$sql1="insert into specialist(spemail,spename,spepassword,sperut,spetel,specialties) values('$email','$name','$password','$rut','$tele',$spec);";
                $sql1="update specialist set spemail='$email',spename='$name',spepassword='$password',sperut='$rut',spetel='$tele',specialties=$spec where speid=$id ;";
                $database->query($sql1);
                
                $sql1="update webuser set email='$email' where email='$oldemail' ;";
                $database->query($sql1);
                //echo $sql1;
                //echo $sql2;
                $error= '4';
                
            }
            
        }else{
            $error='2';
        }
    
    
        
        
    }else{
        //header('location: signup.php');
        $error='3';
    }
    

    header("location: specialists.php?action=edit&error=".$error."&id=".$id);
    ?>
    
   

</body>
</html>