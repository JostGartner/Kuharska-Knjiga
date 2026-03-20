<?php
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/image_helper.php';

$errors = [];
$data   = [];

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
    // generate slug from title
    $slug = strtolower($data['title']);
    $slug = preg_replace('/[^a-z0-9]+/', '-', $slug);
    $slug = trim($slug, '-');

    // make slug unique
    $base = $slug; $i = 2;
    $check = $pdo->prepare('SELECT id FROM recipes WHERE slug = ?');
    $check->execute([$slug]);
    while ($check->fetch()) {
      $slug = $base . '-' . $i++;
      $check->execute([$slug]);
    }

    $pdo->prepare(
      'INSERT INTO recipes (slug, title, time_text, makes_text) VALUES (?,?,?,?)'
    )->execute([$slug, $data['title'], $data['time_text'] ?: null, $data['makes_text'] ?: null]);
    $id = (int)$pdo->lastInsertId();

    saveRelated($pdo, $id, $data);
    saveRecipeImage($slug);

    header('Location: index.php?added=1');
    exit;
  }
}

function saveRelated(PDO $pdo, int $id, array $data): void {
  foreach (['ingredients','steps','notes','based_on'] as $field) {
    $pdo->prepare("DELETE FROM $field WHERE recipe_id=?")->execute([$id]);
    $lines = array_filter(array_map('trim', explode("\n", $data[$field])));
    $col   = $field === 'based_on' ? 'url' : rtrim($field, 's');
    $stmt  = $pdo->prepare("INSERT INTO $field (recipe_id, $col, sort_order) VALUES (?,?,?)");
    $i = 1;
    foreach ($lines as $line) {
      $stmt->execute([$id, $line, $i++]);
    }
  }
}

$pageTitle = 'Dodaj recept';
$recipeSlug = null;
require '_form.php';