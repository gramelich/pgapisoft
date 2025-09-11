<?php
    $host = "localhost";
    $port = "5432";
    $dbname = "joaov";
    $user = "postgres";
    $password = "root123";

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
