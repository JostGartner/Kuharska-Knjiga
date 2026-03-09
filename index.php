<!doctype html>
<html>
	<head>
		<title>Kuharska Knjiga</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
		<link rel="icon" type="image/png" href="icon.png">
		<link href='https://fonts.googleapis.com/css?family=JetBrains+Mono' rel='stylesheet'>
		<link href="stylesheet.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		<div id="wrapper" class="index">
			<section id="toc">
				<h1 id="mainTitle">Kuharska Knjiga</h1>
				<p id="adminLink"><a href="admin/">🛠 Nadzorna Plošča</a></p>
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
