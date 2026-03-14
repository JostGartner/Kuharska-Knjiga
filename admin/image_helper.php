<?php
// image_helper.php – shared image upload helper (no GD required)

/**
 * Saves an uploaded recipe image to /images/{slug}.{ext}
 * Returns the saved extension on success, null on failure/no upload.
 */
function saveRecipeImage(string $slug): ?string {
  if (empty($_FILES['recipe_image']['tmp_name'])) return null;

  $tmp  = $_FILES['recipe_image']['tmp_name'];
  $type = mime_content_type($tmp);

  $extMap = [
    'image/jpeg' => 'jpg',
    'image/png'  => 'png',
    'image/webp' => 'webp',
    'image/gif'  => 'gif',
  ];

  if (!isset($extMap[$type])) return null;
  $ext = $extMap[$type];

  $dir = __DIR__ . '/../images/';
  if (!is_dir($dir)) mkdir($dir, 0755, true);

  // remove old images for this slug (any extension)
  foreach ($extMap as $e) {
    $old = $dir . $slug . '.' . $e;
    if (file_exists($old)) unlink($old);
  }

  $dest = $dir . $slug . '.' . $ext;
  move_uploaded_file($tmp, $dest);

  return $ext;
}

/**
 * Deletes all image files for a given slug.
 */
function deleteRecipeImage(string $slug): void {
  $dir  = __DIR__ . '/../images/';
  $exts = ['jpg','jpeg','png','webp','gif'];
  foreach ($exts as $e) {
    $f = $dir . $slug . '.' . $e;
    if (file_exists($f)) unlink($f);
  }
}
