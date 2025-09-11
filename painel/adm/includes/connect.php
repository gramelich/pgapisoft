<?php
error_reporting(0);
ini_set('display_errors', 1);
    $host = "localhost";
    $port = "5432";
    $dbname = "apipg17";
    $user = "apipg17";
    $password = "nrUMO8QY0hXrxkEiLXtY";

    $conn_string = "host=$host port=$port dbname=$dbname user=$user password=$password";
    $conn = pg_connect($conn_string);

    if (!$conn) {
        die("Connection failed: " . pg_last_error());
    }

    // Definir o conjunto de caracteres para utf8
    pg_set_client_encoding($conn, "UTF8");
?>