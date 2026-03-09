<?php
// api/recipes.php  –  returns JSON array of all recipes (id, slug, title)
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config.php';

$stmt = $pdo->query('SELECT id, slug, title FROM recipes ORDER BY title ASC');
echo json_encode($stmt->fetchAll());
