<?php
require_once __DIR__ . '/../config.php';

$id = (int)($_GET['id'] ?? 0);
if ($id) {
  // CASCADE handles related rows automatically
  $pdo->prepare('DELETE FROM recipes WHERE id=?')->execute([$id]);
}

header('Location: index.php?deleted=1');
exit;
