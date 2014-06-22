<!DOCTYPE html>
<html>
<head>
	<title>Pagina principal</title>
	<link rel="stylesheet" type="text/css" href=<?php echo "'".base_url("js/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css")."'" ?>>
	<link rel="stylesheet" type="text/css" href=<?php echo "'".base_url("css/bootstrap/css/bootstrap.css")."'"?>>
	<script type="text/javascript" src=<?php echo "'".base_url("js/jquery-2.1.0.js")."'" ?>></script>
	<script type="text/javascript" src=<?php echo "'".base_url("js/jquery-ui/js/jquery-ui-1.10.4.custom.js")."'" ?>></script>
</head>
<body>
<div class="container" style="margin-top:20px">
		<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" action=<?php echo "'".site_url("main")."'"?> method="POST">
				<fieldset>
					<h2>IBP ELECTRONICS</h2>
					<hr class="colorgraph">
					<div class="form-group">
						<input type="text" name="usuario" class="form-control input-lg" placeholder="Usuario">
					</div>
					<div class="form-group">
						<input type="password" name="pass" class="form-control input-lg" placeholder="password">
					</div>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<input type="submit" class="btn btn-lg btn-success btn-block" value="Iniciar sesion">
						</div>	
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="" class="btn btn-lg btn-primary btn-block">Registrar</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>