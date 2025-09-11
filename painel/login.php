<?php
// Bypass authentication and redirect directly to the panel

setcookie('admin_id', '1');
setcookie('admin_pass', 'demo');
setcookie('auth', 'admin_in');

header('Location: /painel.php');
exit;

