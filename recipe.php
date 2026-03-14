<!doctype html>
<html>
	<head>
		<title>Kuharska Knjiga</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
		<link rel="icon" type="image/png" href="icon.png">
		<link href='https://fonts.googleapis.com/css?family=JetBrains+Mono' rel='stylesheet'>
		<link href="stylesheet.css" rel="stylesheet" type="text/css">

		<script>
			// ── options ──────────────────────────────────────────────────
			let helpUrls = [
			  { label: 'Slikovno iskanje',url: 'https://www.google.com/search?q=<name>&tbm=isch' },
			  { label: 'Več receptov',   url: 'https://www.google.com/search?q=<name>+recipe' }
			];
			let lookForHeroImage = true;
			let shortenURLs      = false;
		</script>
	</head>

	<body>
		<div id="wrapper" class="recipe">

			<!-- back button + edit button -->
			<div id="topbar">
				<p id="back">
					<a href="index.php">
						<svg aria-hidden="true" focusable="false" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
							<path fill="currentColor" d="M257.5 445.1l-22.2 22.2c-9.4 9.4-24.6 9.4-33.9 0L7 273c-9.4-9.4-9.4-24.6 0-33.9L201.4 44.7c9.4-9.4 24.6-9.4 33.9 0l22.2 22.2c9.5 9.5 9.3 25-.4 34.3L136.6 216H424c13.3 0 24 10.7 24 24v32c0 13.3-10.7 24-24 24H136.6l120.5 114.8c9.8 9.3 10 24.8.4 34.3z"></path>
						</svg>
					</a>
				</p>
				<p id="pdfLink"><a href="#" onclick="window.print(); return false;">🡻 Prenos PDF</a></p>
			</div>

			<section id="heroimage"></section>
			<section id="title"></section>
			<section id="info"></section>
			<section id="ingredients"></section>
			<section id="steps"></section>
			<hr />
			<section id="notes"></section>
			<section id="help"></section>
			<section id="basedon"></section>
		</div>
	</body>

	<script>
		// ── utils ────────────────────────────────────────────────────
		function linkify(str) {
		  const httpPattern = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim;
		  str = str.replace(httpPattern, '<a href="$1" target="_blank">$1</a>');
		  const wwwPattern = /(^|[^\/])(www\.[\S]+(\b|$))/gim;
		  str = str.replace(wwwPattern, '$1<a href="http://$2" target="_blank">$2</a>');
		  const emailPattern = /(([a-zA-Z0-9\-\_\.])+@[a-zA-Z\_]+?(\.[a-zA-Z]{2,6})+)/gim;
		  str = str.replace(emailPattern, '<a href="mailto:$1">$1</a>');
		  return str;
		}
		function getDomain(url) {
		  try { return new URL(url).hostname; }
		  catch (_) { return url; }
		}

		// ── create-recipe ────────────────────────────────────────────
		document.addEventListener('DOMContentLoaded', () => {

		  const slug = window.location.hash.replace('#', '');
		  if (!slug) { window.location.href = 'index.php'; return; }

		  // hero image – try jpg, png, webp
		  if (lookForHeroImage) {
		    const exts = ['jpg','png','webp','gif'];
		    let tried = 0;
		    function tryNext() {
		      if (tried >= exts.length) return;
		      const img = new Image();
		      img.src = 'images/' + slug + '.' + exts[tried++];
		      img.onload = () => document.getElementById('heroimage').appendChild(img);
		      img.onerror = tryNext;
		    }
		    tryNext();
		  }

		  // fetch recipe
		  fetch('api/recipe.php?slug=' + encodeURIComponent(slug))
		    .then(r => { if (!r.ok) throw new Error(); return r.json(); })
		    .then(recipe => render(recipe))
		    .catch(() => window.location.href = 'index.php');

		  function render(r) {
		    document.title = r.title + ' | Kuharska Knjiga';
		    document.getElementById('title').innerHTML = `<h1>${r.title}</h1>`;

		    const time  = r.time_text  || '–';
		    const makes = r.makes_text || '–';
		    document.getElementById('info').innerHTML =
		      `<ul>
		        <li><span id="time">ČAS </span>${escHtml(time)}</li>
		        <li><span id="makes">KOL. </span>${escHtml(makes)}</li>
		      </ul>`;

		    if (r.ingredients && r.ingredients.length) {
		      let html = '<h2>Sestavine</h2><ul>';
		      r.ingredients.forEach(ing => {
		        const formatted = escHtml(ing).replace(/\(([^)]+)\)/g, '<span class="paren">($1)</span>');
		        html += `<li>${formatted}</li>`;
		      });
		      document.getElementById('ingredients').innerHTML = html + '</ul>';
		    }

		    if (r.steps && r.steps.length) {
		      let html = '<h2>Navodila</h2><ol>';
		      r.steps.forEach(s => { html += `<li>${escHtml(s)}</li>`; });
		      document.getElementById('steps').innerHTML = html + '</ol>';
		    }

		    if (r.notes && r.notes.length) {
		      let html = '<h2>Opombe</h2><ul>';
		      r.notes.forEach(n => { html += `<li>${renderInline(escHtml(n))}</li>`; });
		      document.getElementById('notes').innerHTML = html + '</ul>';
		    }

		    if (r.based_on && r.based_on.length) {
		      let html = '<h2>Viri</h2><ul>';
		      r.based_on.forEach(url => {
		        const display = shortenURLs ? getDomain(url) : escHtml(url);
		        html += `<li><a href="${escHtml(url)}" target="_blank">${display}</a></li>`;
		      });
		      document.getElementById('basedon').innerHTML = html + '</ul>';
		    }

		    const name = r.title.toLowerCase().replace(/ /g, '+');
		    let help = '<h2>Pomoč</h2><ul>';
		    helpUrls.forEach(h => {
		      help += `<li><a href="${h.url.replace('<name>', name)}" target="_blank">${h.label}</a></li>`;
		    });
		    document.getElementById('help').innerHTML = help + '</ul>';

		    // click step to highlight
		    document.querySelectorAll('#steps li').forEach(li => {
		      li.addEventListener('click', () => {
		        if (li.classList.contains('highlight')) {
		          li.classList.remove('highlight');
		        } else {
		          document.querySelectorAll('.highlight').forEach(el => el.classList.remove('highlight'));
		          li.classList.add('highlight');
		        }
		      });
		    });

		    // arrow keys shift highlight
		    document.addEventListener('keydown', e => {
		      const curr = document.querySelector('.highlight');
		      if (!curr) return;
		      if (e.key === 'ArrowLeft'  && curr.previousElementSibling) {
		        curr.classList.remove('highlight');
		        curr.previousElementSibling.classList.add('highlight');
		      }
		      if (e.key === 'ArrowRight' && curr.nextElementSibling) {
		        curr.classList.remove('highlight');
		        curr.nextElementSibling.classList.add('highlight');
		      }
		    });
		  }

		  function escHtml(str) {
		    return String(str)
		      .replace(/&/g, '&amp;').replace(/</g, '&lt;')
		      .replace(/>/g, '&gt;').replace(/"/g, '&quot;');
		  }
		  function renderInline(str) {
		    return str.replace(/\*([^*]+)\*/g, '<em>$1</em>');
		  }
		});
	</script>
</html>