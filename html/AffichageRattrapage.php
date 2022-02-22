<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>PageUser</title>
		<meta charset="utf-8"/>
		<link rel="shortcut icon" type="image/x-icon" href="../images/manette.png"/>
		<link rel="stylesheet" type="text/css" href="../css/pageUser.css">
	</head>
	<header>
		<a href="Login.php"> Déconnexion</a>
	</header>
	<body>
		<!----------------------------------------Coté joueur-------------------------------------------------------------------------->
        <?php
            session_start();
            include('FonctionsSQL.php');
            $utilisateur = "SELECT * FROM utilisateurs WHERE pseudo ='".$_SESSION['pseudo']."';";
			$type="SELECT type FROM utilisateurs WHERE pseudo ='".$_SESSION['pseudo']."';";
			foreach($connexion->query($type) as $row){

				if($row['type'] == "Joueur"){

					foreach($connexion->query($utilisateur) as $row){
						echo "<h1> Bonjour ".$row['Pseudo']."</h1>";
						echo "<div> Voici vos scores : </div>";
						echo "<table cellpadding='0' cellspacing='0' border='0'>
					<thead><tr><td>Pseudo</td><td>Jeu</td><td>Score</td></tr></thead>";

					$reqJeux="SELECT * FROM scores where Pseudo='".$_SESSION['pseudo']."';";

					foreach($connexion->query($reqJeux)as $row){
						echo "<tr>";
						echo "<td>".$row['Pseudo']."</td>";
						echo "<td>".$row['Nom']."</td>";
						echo "<td>".$row['Score']."</td>";
						echo "</tr>";
					}
					
					echo"</table>";

					}
				}else{


		/*----------------------------------------Coté superviseur--------------------------------------------------------------------------*/




					foreach($connexion->query($utilisateur) as $row){
						echo "<h1> Bonjour ".$row['Pseudo']."</h1>";
						echo "<div> Voici les scores des joueurs : </div>";
						echo "<table cellpadding='0' cellspacing='0' border='0'>
								<thead>
									<tr>
										<td>Pseudo</td>
										<td>Jeu</td>
										<td>Score</td>
									</tr>
								</thead>";

					$reqSuperviseur="SELECT * FROM scores;";

					foreach($connexion->query($reqSuperviseur)as $row){
						echo "<tr>";
						echo "<td>".$row['Pseudo']."</td>";
						echo "<td>".$row['Nom']."</td>";
						echo "<td>".$row['Score']."</td>";
						echo "</tr>";
					}
					echo "</table>";
				}?>


				<form id="choix" name="choix" action="#" method="post">
					<label for="rechercheJoueur">Personne recherchée</label>					
					<select name="rechercheJoueur" id="rechercheJoueur">
								<?php
									$PseudoScore="SELECT DISTINCT Pseudo from scores;";
									foreach($connexion->query($PseudoScore) as $row){
										echo '<option value='.$row['Pseudo'].'>'.$row['Pseudo'].'</option>';
									}
								?>
					</select>					
					<input type="submit" value="rechercher">					
				</form>
					
						<?php
							if(isset($_POST['rechercheJoueur'])){
								if($_POST['rechercheJoueur']){
									$rechercheJoueur="SELECT * FROM Scores where Pseudo = '".$_POST['rechercheJoueur']."';";

									echo "<div> Voici les scores des joueurs recherchés: </div>";
									echo "<table>
												<tr><td>Pseudo</td><td>Jeu</td><td>Score</td></tr>";



									foreach($connexion->query($rechercheJoueur)as $row){
										echo "<tr>";
										echo "<td>".$row['Pseudo']."</td>";
										echo "<td>".$row['Nom']."</td>";
										echo "<td>".$row['Score']."</td>";
										echo "</tr>";
									}
								}
							}
							
						?>
					
				</form>
				<?php
				}
			}
			
        ?>

		
    </body>
</html>