<?php
    $db = mysqli_connect("localhost","root","","gereja");
    if(!$db){
        echo "Database connection failed";
    }

    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE email='".$email."' AND password='".$password."' AND username='".$username."'";
    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);

    if($count == 1){
        echo json_encode("Error");
    }else{
        $insert = "INSERT INTO akun(username,email,password)VALUES('".$email."',".$username."','".$password."')";
        $query = mysqli_query($db,$insert);
        if($query){
            echo json_encode("Success");
        }
    }

?>