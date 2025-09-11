<?php
    // TEMPORARY DEVELOPMENT LOGIN
    // This script intentionally bypasses credential checks so you can access
    // the panel without a valid user. Do NOT use in production.

    $admin_senha = $_POST['senha'] ?? '';
    $auth = 'admin_in';

    setcookie('admin_id', 1);
    setcookie('admin_pass', $admin_senha);
    setcookie('auth', $auth);

    http_response_code(200);
    echo json_encode([
        'message' => 'logado com sucesso',
        'redirect' => '/painel.php'
    ]);
?>
