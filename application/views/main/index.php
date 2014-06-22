<?php 
	$this->load->library("session");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Pagina principal</title>
</head>
<body>
	<h1>Bienvenido <?php echo $this->session->userdata("idUser") ?></h1>
</body>
</html>