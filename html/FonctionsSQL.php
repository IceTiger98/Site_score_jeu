<?php
	define('USER',"root");
	define('PASSWD',"");
	define('SERVER',"localhost");
	define('BASE',"scorejeu");

	function connect_bd(){
		$dsn="mysql:dbname=".BASE.";host=".SERVER;
		try{
			$connexion=new PDO($dsn,USER,PASSWD);
		}
		catch(PDOException $e){
			printf("Echec de la connexion : %s\n", $e->getMessage());
			exit();
		}
		$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $connexion;
	}
	$connexion=connect_bd();
?>