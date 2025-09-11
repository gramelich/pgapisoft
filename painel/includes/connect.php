<?php
    $host = "localhost";
    $port = "5432";
    $dbname = "joaov";
    $user = "postgres";
    $password = "root123";

    $conn = false;

    if (function_exists('pg_connect')) {
        $conn_string = "host=$host port=$port dbname=$dbname user=$user password=$password";
        $conn = @pg_connect($conn_string);
        if ($conn) {
            pg_set_client_encoding($conn, "UTF8");
        } else {
            error_log('Connection failed: '.pg_last_error());
        }
    } else {
        error_log('PostgreSQL extension is not enabled; enable extension=pgsql in php.ini');
    try {
        $conn = new PDO(
            "pgsql:host=$host;port=$port;dbname=$dbname",
            $user,
            $password,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
        $conn->exec("SET NAMES 'UTF8'");
    } catch (PDOException $e) {
        die("Connection failed: " . $e->getMessage());
    }
?>
