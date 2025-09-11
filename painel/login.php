<?php
    include("includes/connect.php");

    $admin_agentCode = $_POST['agentCode'] ?? '';
    $admin_senha = $_POST['senha'] ?? '';
    $auth = 'admin_in';

    $stmt = $conn->prepare('SELECT * FROM agents WHERE agentCode = :agentCode AND senha = :senha');
    $stmt->execute([':agentCode' => $admin_agentCode, ':senha' => $admin_senha]);

    if ($stmt->rowCount() === 0) {
        http_response_code(400);
        echo json_encode(['message' => 'Usúario/senha incorretos']);
    } else {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        setcookie("admin_id", $row["id"]);
        setcookie("admin_pass", $admin_senha);
        setcookie("auth", $auth);
        http_response_code(200);
        echo json_encode(['message' => 'logado com sucesso', 'redirect' => '/painel.php']);
    }
?>
