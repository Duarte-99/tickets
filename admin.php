<?php require_once './app.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Entrena tu Glamour</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="./assets/css/materialize.min.css">
  <link rel="icon" href="./assets/img/favicon.ico">
  <link rel="stylesheet" href="./assets/css/style.css">
</head>
<body>
  <main class="container">
    <header class="Header">
      <img src="./assets/img/foto_principal.jpg" class="responsive-img  Header-bg">
      <img src="./assets/img/logo_entrena.png" class="responsive-img  Header-glamour">
      <img src="./assets/img/logos.png" class="responsive-img Header-logos">
      <p class="flow-text  lime-text  Header-phrase">LISTA DE PARTICIPANTES</p>
    </header>
    <article class="center  u-m1p1  white">
      <table class="responsive-table  highlight">
        <tr>
          <th>Email</th>
          <th>Nombre</th>
          <th>Apellidos</th>
          <th>Fecha Nacimiento</th>
          <th>Bloque</th>
          <th>Disciplina</th>
          <th>Horario</th>
          <th>Fecha Registro</th>
          <th></th>
        </tr>
        <?=obtener_registros()?>
      </table>
    </article>
  </main>
  <footer class="main-footer">
        <strong>Copyright &copy;<?php echo date(" Y ")?> <a href="#">IDIVE</a>.</strong> All rights reserved. <strong>Carlos Duarte López</strong>
    </footer>
  <script src="./assets/js/materialize.min.js"></script>
  <script src="./assets/js/script.js"></script>
</body>
</html>