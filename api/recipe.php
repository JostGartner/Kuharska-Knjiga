<?php
// api/recipe.php?slug=aloo-matar  –  returns full recipe as JSON
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config.php';

$slug = isset($_GET['slug']) ? trim($_GET['slug']) : '';
if ($slug === '') {
    http_response_code(400);
    die(json_encode(['error' => 'Missing slug parameter']));
}

// fetch main recipe row
$stmt = $pdo->prepare('SELECT * FROM recipes WHERE slug = ?');
$stmt->execute([$slug]);
$recipe = $stmt->fetch();

if (!$recipe) {
    http_response_code(404);
    die(json_encode(['error' => 'Recipe not found']));
}

$id = $recipe['id'];

// fetch related rows helper
function fetchRelated(PDO $pdo, string $table, int $recipeId): array {
    $col   = rtrim($table, 's');           // e.g. "ingredients" -> "ingredient"
    // special case: based_on
    if ($table === 'based_on') $col = 'url';
    $stmt  = $pdo->prepare(
        "SELECT $col FROM $table WHERE recipe_id = ? ORDER BY sort_order ASC"
    );
    $stmt->execute([$recipeId]);
    return array_column($stmt->fetchAll(), $col);
}

$recipe['ingredients'] = fetchRelated($pdo, 'ingredients', $id);
$recipe['steps']       = fetchRelated($pdo, 'steps',       $id);
$recipe['notes']       = fetchRelated($pdo, 'notes',       $id);
$recipe['based_on']    = fetchRelated($pdo, 'based_on',    $id);

echo json_encode($recipe);
