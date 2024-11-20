<?php

    $database= new mysqli("localhost","root","","OLApoint");
    if ($database->connect_error){
        die("Conexión Fallida:  ".$database->connect_error);
    }

?>