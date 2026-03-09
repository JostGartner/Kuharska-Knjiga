<?php
require_once __DIR__ . '/../config.php';

$recipes = $pdo->query('SELECT id, slug, title, time_text, makes_text, updated_at FROM recipes ORDER BY title ASC')->fetchAll();

$deleted = isset($_GET['deleted']) ? (int)$_GET['deleted'] : 0;
?>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Nadzorna Plošča</title>
  <link href='https://fonts.googleapis.com/css?family=JetBrains+Mono' rel='stylesheet'>
  <link href="../stylesheet.css" rel="stylesheet">
  <link rel="icon" type="image/png" href="../icon.png">
  <style>
    body { padding: 2em; }
    table { width: 100%; border-collapse: collapse; margin-top: 1.5em; font-size: 0.85em; }
    th, td { text-align: left; padding: 0.5em 0.8em; border-bottom: 1px solid #ddd; }
    th { font-weight: 700; text-transform: uppercase; }
    .btn { display:inline-block; padding:0.3em 0.7em; font-family:inherit; font-size:0.85em; cursor:pointer; border:1px solid #333; background:#fff; text-decoration:none; color:#333; }
    .btn:hover { background: rgba(120,200,255, 0.45); }
    .btn-danger { border-color: #c00; color: #c00; }
    .btn-danger:hover { background: rgba(255,0,0,0.1); }
    .notice { background: rgba(255,255,0,0.4); padding: 0.5em 1em; margin-bottom: 1em; }
    h1 { margin-bottom: 0.3em; }
    .header-row { display:flex; justify-content:space-between; align-items:center; }
  </style>
</head>
<body>

<div class="header-row">
  <h1>Nadzorna Plošča</h1>
  <a class="btn" href="add.php">+ Dodaj Recept</a>
</div>
<p><a href="../index.php">← Domov</a></p>

<?php if ($deleted): ?>
  <p class="notice">Recept je bil izbrisan.</p>
<?php endif; ?>

<table>
  <tr>
    <th>Naziv</th>
    <th>Čas</th>
    <th>Količina</th>
    <th>Posodobljeno</th>
    <th></th>
  </tr>
  <?php foreach ($recipes as $r): ?>
  <tr>
    <td><a href="../recipe.php#<?= htmlspecialchars($r['slug']) ?>"><?= htmlspecialchars($r['title']) ?></a></td>
    <td><?= htmlspecialchars($r['time_text'] ?? '–') ?></td>
    <td><?= htmlspecialchars($r['makes_text'] ?? '–') ?></td>
    <td><?= date('d.m.Y', strtotime($r['updated_at'])) ?></td>
    <td>
      <a class="btn" href="edit.php?id=<?= $r['id'] ?>">Uredi</a>
      <a class="btn btn-danger" href="delete.php?id=<?= $r['id'] ?>"
         onclick="return confirm('Res izbriši ta recept?')">Izbriši</a>
    </td>
  </tr>
  <?php endforeach; ?>
</table>

<?php if (empty($recipes)): ?>
  <p style="margin-top:1em;color:#999">Ni receptov. <a href="add.php">Dodaj prvega →</a></p>
<?php endif; ?>

</body>
</html>
