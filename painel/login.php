<?php
    include("includes/connect.php");

    $admin_agentCode = pg_escape_string($conn, $_POST['agentCode']);
    $admin_senha = pg_escape_string($conn, $_POST['senha']); 
    $auth = 'admin_in';

    $query = pg_query($conn, "SELECT * FROM agents WHERE agentCode = '$admin_agentCode' AND senha = '$admin_senha'");
    if (pg_num_rows($query) == 0) {
        http_response_code(400);
        echo json_encode(['message' => 'Usúario/senha incorretos']);
    } else {
        $row = pg_fetch_array($query);
        setcookie("admin_id", $row["id"]);
        setcookie("admin_pass", $admin_senha);
        setcookie("auth", $auth);
        http_response_code(200);
        echo json_encode(['message' => 'logado com sucesso', 'redirect' => '/painel.php']);
    }
?>