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
      <p class="flow-text  lime-text  Header-phrase">¡No pierdas la oportunidad de formar parte del movimiento!</p>
    </header>
    <article class="center  u-m1p1  white">
      <p class="flow-text  grey-text  text-darken-2">
        REGÍSTRATE CUANTO ANTES, EL CUPO A LAS CLASES ES LIMITADO.
      </p>
      <p class="flow-text">
        El evento se llevará a cabo el día <b>13</b> de <b>OCTUBRE</b> de <b>2016</b> en el <b>HOTEL W</b>, ubicado en <b>CAMPOS ELÍSEOS 252</b>, <b>COLONIA POLANCO IV SECCIÓN</b>, en la Ciudad de México.
      </p>
      <p class="flow-text  grey-text  text-darken-2">
        NO OLVIDES VESTIR UN ¡TOTAL LOOK DE ADIDAS!
      </p>
    </article>
    <article class="u-m1p1  white  Disciplines">
      <h4 class="center  grey-text  text-darken-2">DISCIPLINAS</h4>
      <div class="lime">
        <figure>
          <img src="./assets/img/ico_kick.png" class="responsive-img">
          <figcaption>
            <h5>KICK BOXING</h5>
            <p>PARA QUEMAR CALORÍAS DE MANERA RÁPIDA Y DURADERA</p>
          </figcaption>
        </figure>
        <figure>
          <img src="./assets/img/ico_pilates.png" class="responsive-img">
          <figcaption>
            <h5>PILATES</h5>
            <p>RECUPERA EL CONTROL DE TU CUERPO Y TUS MOVIMIENTOS</p>
          </figcaption>
        </figure>
        <figure>
          <img src="./assets/img/ico_yoga.png" class="responsive-img">
          <figcaption>
            <h5>YOGA</h5>
            <p>MEJORA TU ESTADO FÍSICO, MENTAL Y ESPIRITUAL</p>
          </figcaption>
        </figure>
        <figure>
          <img src="./assets/img/ico_zumba.png" class="responsive-img">
          <figcaption>
            <h5>ZUMBA</h5>
            <p>MUEVE TU CUERPO MIENTRAS ACTIVAS TU MENTE</p>
          </figcaption>
        </figure>
         <figure>
          <img src="./assets/img/ico_kick.png" class="responsive-img">
          <figcaption>
            <h5>KARATE</h5>
            <p>APRENDE A PELEAR COMO JACKIE CHAN</p>
          </figcaption>
        </figure>
      </div>
    </article>
    <article class="center  u-m1p1  white">
      <h4 class="center  grey-text  text-darken-2">REGISTRO</h4>
      <p class="flow-text">
        <b>LUCY LARA </b>, Directora Editorial de Glamour México y Latinoamérica, y <b>KARINA SALAZAR</b>, nutrióloga de adidas, presentarán una ponencia que no debes perderte.
      </p>
      <p class="flow-text  grey-text  text-darken-2">
        ADEMÁS, RECIBIRÁS CONSEJOS POR PARTE DE LOS INSTRUCTORES DE ADIDAS Y PODRÁS INGRESAR A UNA DE LAS CUATRO CLASES EN EL HORARIO DE TU PREFERENCIA.
      </p>
    </article>
    <article class="center  Schedule">
      <figure class="u-m1p1">
        <i class="medium  material-icons">access_time</i>
        <figcaption class="white">
          <h6 class="grey-text  text-darken-2">BLOQUE 1</h6>
          <p class="flow-text">9:00 a 12:00</p>
        </figcaption>
      </figure>
      <figure class="u-m1p1">
        <i class="medium  material-icons">access_time</i>
        <figcaption class="white">
          <h6 class="grey-text  text-darken-2">BLOQUE 2</h6>
          <p class="flow-text">14:00 a 17:00</p>
        </figcaption>
      </figure>
      <figure class="u-m1p1">
        <i class="medium  material-icons">access_time</i>
        <figcaption class="white">
          <h6 class="grey-text  text-darken-2">BLOQUE 3</h6>
          <p class="flow-text">18:00 a 21:00</p>
        </figcaption>
      </figure>
      <figure class="u-m1p1">
        <i class="medium  material-icons">access_time</i>
        <figcaption class="white">
          <h6 class="grey-text  text-darken-2">BLOQUE 4</h6>
          <p class="flow-text">21:00 a 24:00</p>
        </figcaption>
      </figure>
    </article>
    <article class="center  u-m1p1  grey  darken-2">
      <p class="flow-text  white-text">
        Completa tu registro a continuación con datos reales y comprobables mediante identificación oficial, ésta se te solicitará para poder ingresar al evento.
      </p>
    </article>
    <form class="u-m1p1  white">
      <h1 class="center  lime-text">Entrena tu Glamour</h1>
      <h5 class="grey-text  text-darken-2">DATOS PERSONALES</h5>
      <div class="input-field">
        <input id="nombre" name="nombre" type="text" class="validate" required>
        <label for="nombre">NOMBRE (S)</label>
      </div>
      <div class="input-field">
        <input id="apellidos" name="apellidos" type="text" class="validate" required>
        <label for="apellidos">APELLIDOS</label>
      </div>
      <div class="input-field">
        <input id="email" name="email" type="email" class="validate" required>
        <label for="email">EMAIL</label>
      </div>
      <div class="input-field">
        <input id="nacimiento" name="nacimiento" type="text" class="datepicker  validate" required>
        <label for="nacimiento">FECHA DE NACIMIENTO</label>
      </div>
      <div class="input-field">
        <h5 class="grey-text  text-darken-2">ACTIVIDADES</h5>
        <select id="actividad" name="actividad" required>
          <option value="" disabled selected>SELECCIONA UNA DISCIPLINA</option>
          <option value="KICK BOXING">KICK BOXING</option>
          <option value="YOGA">YOGA</option>
          <option value="PILATES">PILATES</option>
          <option value="ZUMBA">ZUMBA</option>
          <option value="KARATE">KARATE</option>
        </select>
      </div>
      <div id="horario"></div>
      <button class="btn waves-effect waves-light btn-large" type="submit" name="action">
        Enviar
        <i class="material-icons right">send</i>
      </button>
      <div class="Response"></div>
    </form>
  </main>

    <footer class="main-footer">
        <strong>Copyright &copy;<?php echo date(" Y ")?> <a href="#">IDIVE</a>.</strong> All rights reserved. <strong>Carlos Duarte López</strong>
    </footer>
  <script src="./assets/js/materialize.min.js"></script>
  <script src="./assets/js/script.js"></script>
</body>
</html>
