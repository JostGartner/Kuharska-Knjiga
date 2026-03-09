<?php
// ============================================================
//  Database connection – adjust credentials if needed
// ============================================================
define('DB_HOST', 'localhost');
define('DB_NAME', 'db_name');
define('DB_USER', 'username');
define('DB_PASS', 'password');          // XAMPP default is empty

try {
    $pdo = new PDO(
        'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4',
        DB_USER,
        DB_PASS,
        [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]
    );
} catch (PDOException $e) {
    http_response_code(500);
    header('Content-Type: application/json');
    die(json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]));
}
