<!doctype html>
<html>
	<head>
		<title>Kuharska Knjiga</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
		<link rel="icon" type="image/png" href="icon.png">
		<link href='https://fonts.googleapis.com/css?family=JetBrains+Mono' rel='stylesheet'>
		<link href="stylesheet.css" rel="stylesheet" type="text/css">
		<!-- dark mode: set on <html> immediately, before body renders -->
		<script>if (localStorage.getItem('darkMode') === '1') document.documentElement.classList.add('dark');</script>
	</head>

	<body>
		<div id="wrapper" class="index">
			<section id="toc">
				<h1 id="mainTitle">Kuharska Knjiga</h1>

				<div id="toprow">
					<p id="adminLink"><a href="admin/">🍜 Administrator</a></p>
					<p id="darkToggleWrap"><a href="#" id="darkToggle" onclick="toggleDark(); return false;">☾ Dark</a></p>
				</div>

				<p id="navigation"></p>
				<ul><!-- recipes inserted by JS --></ul>
			</section>

			<section id="footer">
				<ul>
					<li>Dober tek ❤︎ <a href="https://github.com/JostGartner" target="_blank">Jošt Gartner</a></li>
				</ul>
			</section>
		</div>
	</body>

	<script>
		// ── dark mode ────────────────────────────────────────────────
		function applyDark(on) {
		  document.documentElement.classList.toggle('dark', on);
		  document.getElementById('darkToggle').textContent = on ? '☀️ Light/Dark' : '🌑 Light/Dark';
		}
		function toggleDark() {
		  const next = !document.documentElement.classList.contains('dark');
		  localStorage.setItem('darkMode', next ? '1' : '0');
		  applyDark(next);
		}
		applyDark(localStorage.getItem('darkMode') === '1');

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

		// ── list-recipes ─────────────────────────────────────────────
		document.addEventListener('DOMContentLoaded', () => {
		  fetch('api/recipes.php')
		    .then(r => r.json())
		    .then(recipes => {
		      let listHtml    = '';
		      let lettersHtml = '';
		      let prevLetter  = '';

		      recipes.forEach(recipe => {
		        const firstLetter = recipe.title.charAt(0).toUpperCase();
		        if (firstLetter !== prevLetter) {
		          listHtml    += `<li id="${firstLetter}">`;
		          lettersHtml += `<a href="#${firstLetter}">${firstLetter}</a>`;
		        } else {
		          listHtml += '<li>';
		        }
		        listHtml += `<a href="recipe.php#${recipe.slug}">${recipe.title}</a></li>`;
		        prevLetter = firstLetter;
		      });

		      document.querySelector('#toc ul').innerHTML      = listHtml;
		      document.getElementById('navigation').innerHTML  = lettersHtml;
		    })
		    .catch(err => {
		      document.querySelector('#toc ul').innerHTML =
		        '<li style="color:red">Napaka pri nalaganju receptov: ' + err + '</li>';
		    });
		});
	</script>
</html>