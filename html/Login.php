<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Login Rattrapage</title>
		<meta charset="utf-8"/>
		<link rel="shortcut icon" type="image/x-icon" href="../images/manette.png"/>
		<link rel="stylesheet" type="text/css" href="../css/login_rattrapage.css">
	</head>
	<body>

		<?php
			session_start();
			include('FonctionsSQL.php');

			if(isset($_POST["pseudo"]) && (isset($_POST["password"]))){
				$pseudo = $_POST["pseudo"];
				$password = $_POST["password"];

				if($pseudo && $password){
				
					$users="SELECT pseudo, motdepasse from utilisateurs where pseudo='$pseudo' and motdepasse='$password';";
					foreach($connexion->query($users) as $row){
						$_SESSION['pseudo']=$pseudo;
						$_SESSION['MotDePasse']=$password;					
						if($pseudo == $row['pseudo'] && $password == $row['motdepasse']){
							header("location:AffichageRattrapage.php");
							
						}else{
							header("location:Login_rattrapage.php?erreur=1");
						}
					}
				}
			}
			

			
		?>

		<div id="loginPanel">
			<form class ="loginForm" id="loginForm" method="post"  action="#">
				<h1>Connexion</h1>

				<input type="text" id="pseudo" name="pseudo"  placeholder="pseudo" required><br>
				<input type="password" id="password" name="password"  placeholder="mot de passe" required><br>
				<input type="submit" name="submit" id="submit" value="Valider">
				
				<div onclick="creaCompte()"></div>
				<a href="creationCompte.php">Créer un compte</a>
			</form>
		</div>

	</body>
</html>