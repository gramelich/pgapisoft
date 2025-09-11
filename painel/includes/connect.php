<?php
    $host = "localhost";
    $port = "5432";
    $dbname = "apimatheus";
    $user = "apimatheus";
    $password = "aCHbdmRdNFbf";

    $conn_string = "host=$host port=$port dbname=$dbname user=$user password=$password";
    $conn = pg_connect($conn_string);

    if (!$conn) {
        die("Connection failed: " . pg_last_error());
    }

    // Definir o conjunto de caracteres para utf8
    pg_set_client_encoding($conn, "UTF8");
?>