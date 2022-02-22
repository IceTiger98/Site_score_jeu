<!DOCTYPE html>
<html lang="fr">
	<head>
		<title>Login</title>
		<meta charset="utf-8"/>
		<link rel="shortcut icon" type="image/x-icon" href="../images/manette.png"/>
		<link rel="stylesheet" type="text/css" href="../css/login.css">
	</head>
	<body>
        <header>
                        <a href="Login.php">Login </a>
        </header>

    <?php
        session_start();
        include('FonctionsSQL.php');

        if(isset($_POST["newpseudo"]) && (isset($_POST["newpassword"])) && (isset($_POST["newpseudo"])) && (isset($_POST["newprenom"])) && (isset($_POST["newnom"]))){
            $newpseudo = $_POST["newpseudo"];
            $newpassword = $_POST["newpassword"];
            $newpseudo = $_POST["newpseudo"];
            $newprenom = $_POST["newprenom"];
            $newnom = $_POST["newnom"];
            $newrole = $_POST["role"];
            $newmail = $_POST["newmail"];

            if($newpseudo && $newpassword && $newpseudo && $newprenom && $newnom){
            
                try{
                    $connexion = connect_bd();
                    $newusers="INSERT INTO utilisateurs(Nom, Prenom, Pseudo, MotDePasse, Mail, Type) VALUES('$newnom', '$newprenom', '$newpseudo', '$newpassword', '$newmail', \"$newrole)";
                    $connexion->exec($newusers);
                }
                catch(PDOException $e) {
                    echo $newusers . "<br>" . $e->getMessage();
                }
            }
        }
        
        
    ?>

        <div id="loginPanel">
            <form id="loginForm" method="post" action="#">
                <h1>Création de compte</h1>

                <input type="text" id="newnom" name="newnom" placeholder="Nom" required><br>
                <input type="text" id="newprenom" name="newprenom" placeholder="Prénom" required><br>
                <input type="text" id="newpseudo" name="newpseudo" placeholder="Pseudo" required><br>
                <input type="password" id="newpassword" name="newpassword" placeholder="Mot de passe" required><br>
                <input type="email" name="newmail" placeholder="E-mail" required><br>
                <label for="role">Vous êtes : </label>
                <select name="role" id="role">
                <?php
                    $roles="SELECT type from types;";
                    foreach($connexion->query($roles) as $row){
                        echo '<option value='.$row['type'].'">'.$row['type'].'</option>';
                    }

                ?>
                </select><br>


                <input type="submit" name="Create" id="Create" value="Créer son compte">
            </form>
        </div>
    </body>
</html>