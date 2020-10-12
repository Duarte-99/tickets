<?php
function enviar_email($registro)
{
    $asunto = 'ENTRENA TU GLAMOUR';
    $para = $registro['email'];

    $mensaje = "
    <html>
    <head>
      <title>$asunto</title>
      <style>
        html {
          font-family: Arial, sans-serif;
          font-size: 32px;
        }

        hr {
          border: thin solid #58595B;
        }

        .f-green { color: #C3D500; }

        .bold { font-weight: bold; }

        .upper { text-transform: uppercase; }
      </style>
    </head>
    <body>
      <div align='center'>
        <img src='./assets/img/logo_email.jpg'>
        <hr>
        <p>
          GRACIAS POR REGISTRARTE
          <br>
          <span class='f-green  bold  upper'>". $registro['nombre'] . ' ' . $registro['apellidos'] . "</span>
          <br>
          TU REGISTRO SE EFECTÚO CON ÉXITO.
          <br>
          ELEGISTE LA CLASE DE
          <span class='f-green  bold  upper'>" . $registro['disciplina'] . "</span>
          <br>
          EN EL HORARIO DE
          <span class='f-green  bold  upper'>" . $registro['horario'] . "</span>
        </p>
        <hr>
        <p>
          Ahora formas parte del movimiento, es importante que recuerdes que el evento se llevará a cabo el día <b>13</b> de <b>OCTUBRE</b> de <b>2016</b> en el <b>HOTEL W</b>, ubicado en <b>CAMPOS ELÍSEOS 252</b>, <b>COLONIA POLANCO IV SECCIÓN</b>, en la Ciudad de México.
        </p>
        <p>
          No olvides vestir un <b>¡TOTAL LOOK DE ADIDAS!</b>, además de traer tu identificación oficial vigente, ya que ésta se te solicitará para poder ingresar al evento.
        </p>
        <p>
          También es muy importante presentar este correo el día del evento para poder ingresar.
        </p>
        <p>
          <button style='font-size:32px;' onclick='print()'>IMPRIMIR</button>
        </p>
      </div>
    </body>
    </html>
  ";

    $cabeceras= "MIME-Version: 1.0\r\n";
    $cabeceras.= "Content-type: text/html; charset=utf-8\r\n";
    $cabeceras.= "From: Entrena Tu Glamour <no-reply@glamour.mx>\r\n";
    $cabeceras.= "Bcc: Carlos Duarte <carlosd99m@gmail.com>, Valeria Cano <valeria.cano@condenast.com.mx>\r\n";

    //echo $mensaje;
  //mail($para, $asunto, $mensaje, $cabeceras);
}
