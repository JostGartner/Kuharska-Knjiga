<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title><?= $pageTitle ?></title>
  <link href='https://fonts.googleapis.com/css?family=JetBrains+Mono' rel='stylesheet'>
  <link href="../stylesheet.css" rel="stylesheet">
  <link rel="icon" type="image/png" href="../icon.png">
  <style>
    body   { padding: 2em; max-width: 860px; }
    label  { display:block; font-weight:700; text-transform:uppercase; font-size:0.8em; margin: 1.2em 0 0.3em; }
    input[type=text], textarea {
      width: 100%; font-family: inherit; font-size: 0.9em;
      padding: 0.4em 0.6em; border: 1px solid #999; box-sizing: border-box;
    }
    textarea { resize: vertical; }
    .hint  { font-size: 0.75em; color: #888; margin-top: 0.2em; }
    .btn   { display:inline-block; margin-top:1.5em; padding:0.5em 1.2em; font-family:inherit;
             font-size:1em; cursor:pointer; border:1px solid #333; background:#fff; }
    .btn:hover { background: rgba(120,200,255, 0.45); }
    .error { background:rgba(255,0,0,0.1); padding:0.5em 1em; margin-bottom:1em; border:1px solid #c00; color:#c00; }
    .row2  { display:grid; grid-template-columns:1fr 1fr; gap:1em; }
    h1     { margin-bottom:0.3em; }
  </style>
</head>
<body>

<h1><?= $pageTitle ?></h1>
<p><a href="index.php">← Nazaj na seznam</a></p>

<?php if (!empty($errors)): ?>
  <div class="error">
    <?php foreach ($errors as $e): ?><div><?= htmlspecialchars($e) ?></div><?php endforeach; ?>
  </div>
<?php endif; ?>

<form method="POST">
  <label>Naziv recepta</label>
  <input type="text" name="title" value="<?= htmlspecialchars($data['title'] ?? '') ?>" required>

  <div class="row2">
    <div>
      <label>Čas priprave</label>
      <input type="text" name="time_text" value="<?= htmlspecialchars($data['time_text'] ?? '') ?>">
      <p class="hint">npr. "45 minut"</p>
    </div>
    <div>
      <label>Količina</label>
      <input type="text" name="makes_text" value="<?= htmlspecialchars($data['makes_text'] ?? '') ?>">
      <p class="hint">npr. "4 porcije"</p>
    </div>
  </div>

  <label>Sestavine</label>
  <textarea name="ingredients" rows="8"><?= htmlspecialchars($data['ingredients'] ?? '') ?></textarea>
  <p class="hint">Vsaka sestavina v svoji vrstici. V oklepaju je možna opomba, npr. <code>Česen (po okusu)</code></p>

  <label>Koraki priprave</label>
  <textarea name="steps" rows="8"><?= htmlspecialchars($data['steps'] ?? '') ?></textarea>
  <p class="hint">En korak na vrstico.</p>

  <label>Opombe</label>
  <textarea name="notes" rows="4"><?= htmlspecialchars($data['notes'] ?? '') ?></textarea>
  <p class="hint">Ena opomba na vrstico. Za ležeče besedilo: <code>*beseda*</code></p>

  <label>Viri</label>
  <textarea name="based_on" rows="3"><?= htmlspecialchars($data['based_on'] ?? '') ?></textarea>
  <p class="hint">En URL na vrstico.</p>

  <button type="submit" class="btn">Shrani recept</button>
</form>

</body>
</html>
