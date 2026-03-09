<?php
require_once __DIR__ . '/../config.php';

// accept either ?id=X or ?slug=X
if (isset($_GET['slug'])) {
  $stmt = $pdo->prepare('SELECT id FROM recipes WHERE slug=?');
  $stmt->execute([$_GET['slug']]);
  $row = $stmt->fetch();
  $id = $row ? (int)$row['id'] : 0;
} else {
  $id = (int)($_GET['id'] ?? 0);
}
if (!$id) { header('Location: index.php'); exit; }

// load existing data
$recipe = $pdo->prepare('SELECT * FROM recipes WHERE id=?');
$recipe->execute([$id]);
$recipe = $recipe->fetch();
if (!$recipe) { header('Location: index.php'); exit; }

function loadLines(PDO $pdo, string $table, int $id): string {
  $col  = $table === 'based_on' ? 'url' : rtrim($table, 's');
  $stmt = $pdo->prepare("SELECT $col FROM $table WHERE recipe_id=? ORDER BY sort_order");
  $stmt->execute([$id]);
  return implode("\n", array_column($stmt->fetchAll(), $col));
}

$errors = [];
$data = [
  'title'       => $recipe['title'],
  'time_text'   => $recipe['time_text']  ?? '',
  'makes_text'  => $recipe['makes_text'] ?? '',
  'ingredients' => loadLines($pdo, 'ingredients', $id),
  'steps'       => loadLines($pdo, 'steps',       $id),
  'notes'       => loadLines($pdo, 'notes',       $id),
  'based_on'    => loadLines($pdo, 'based_on',    $id),
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $data = [
    'title'       => trim($_POST['title']       ?? ''),
    'time_text'   => trim($_POST['time_text']   ?? ''),
    'makes_text'  => trim($_POST['makes_text']  ?? ''),
    'ingredients' => trim($_POST['ingredients'] ?? ''),
    'steps'       => trim($_POST['steps']       ?? ''),
    'notes'       => trim($_POST['notes']       ?? ''),
    'based_on'    => trim($_POST['based_on']    ?? ''),
  ];

  if ($data['title'] === '') $errors[] = 'Naziv je obvezen.';

  if (empty($errors)) {
    $pdo->prepare(
      'UPDATE recipes SET title=?, time_text=?, makes_text=? WHERE id=?'
    )->execute([$data['title'], $data['time_text'] ?: null, $data['makes_text'] ?: null, $id]);

    foreach (['ingredients','steps','notes','based_on'] as $field) {
      $pdo->prepare("DELETE FROM $field WHERE recipe_id=?")->execute([$id]);
      $lines = array_filter(array_map('trim', explode("\n", $data[$field])));
      $col   = $field === 'based_on' ? 'url' : rtrim($field, 's');
      $stmt  = $pdo->prepare("INSERT INTO $field (recipe_id, $col, sort_order) VALUES (?,?,?)");
      $i = 1;
      foreach ($lines as $line) $stmt->execute([$id, $line, $i++]);
    }

    header('Location: index.php?saved=1');
    exit;
  }
}

$pageTitle = 'Uredi recept';
require '_form.php';
