DROP DATABASE IF EXISTS iditickets;

CREATE DATABASE IF NOT EXISTS iditickets;

USE iditickets;

CREATE TABLE actividades (
    actividad_id CHAR(4) PRIMARY KEY,
	bloque ENUM('Bloque 1', 'Bloque 2', 'Bloque 3', 'Bloque 4') NOT NULL,
	disciplina ENUM('KICK BOXING', 'YOGA', 'PILATES', 'ZUMBA', 'KARATE') NOT NULL,
	horario VARCHAR(30) NOT NULL,
	cupo INTEGER NOT NULL,
	costo VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO actividades (actividad_id, bloque, disciplina, horario, cupo, costo) VALUES

('1K', 'Bloque 1', 'KICK BOXING', '9:00 a 12:00', 10, '$25'),
('1Y', 'Bloque 1', 'YOGA', '9:00 a 12:00', 20, '$20'),
('1P', 'Bloque 1', 'PILATES', '9:00 a 12:00', 10, '$15'),
('1Z', 'Bloque 1', 'ZUMBA', '9:00 a 12:00', 10, '$30'),
('1KT', 'Bloque 1', 'KARATE', '21:00 a 24:00', 15, '$25'),
('2K', 'Bloque 2', 'KICK BOXING', '14:00 a 17:00', 10, '$25'),
('2Y', 'Bloque 2', 'YOGA', '14:00 a 17:00', 20, '$20'),
('2P', 'Bloque 2', 'PILATES', '14:00 a 17:00', 10, '$15'),
('2Z', 'Bloque 2', 'ZUMBA', '14:00 a 17:00', 10, '$30'),
('2KT', 'Bloque 2', 'KARATE', '21:00 a 24:00', 15, '$25'),
('3K', 'Bloque 3', 'KICK BOXING', '18:00 a 21:00', 10, '$25'),
('3Y', 'Bloque 3', 'YOGA', '18:00 a 21:00', 20, '$20'),
('3P', 'Bloque 3', 'PILATES', '18:00 a 21:00', 10, '$15'),
('3Z', 'Bloque 3', 'ZUMBA', '18:00 a 21:00', 10, '$30'),
('3KT', 'Bloque 3', 'KARATE', '21:00 a 24:00', 15, '$25'),
('4K', 'Bloque 4', 'KICK BOXING', '18:00 a 21:00', 10, '$25'),
('4Y', 'Bloque 4', 'YOGA', '9:00 a 12:00', 20, '$20'),
('4P', 'Bloque 4', 'PILATES', '9:00 a 12:00', 10, '$15'),
('4Z', 'Bloque 4', 'ZUMBA', '9:00 a 12:00', 10,  '$30'),
('4KT', 'Bloque 4', 'KARATE', '21:00 a 24:00', 15, '$25');


CREATE TABLE participantes (
  email VARCHAR(50) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  nacimiento DATE NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE registros (
  registro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(50) UNIQUE NOT NULL,
  actividad CHAR(4) NOT NULL,
  fecha DATE NOT NULL,
  FOREIGN KEY (email) REFERENCES participantes(email)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (actividad) REFERENCES actividades(actividad_id)
    ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- Procedimiento almacenado de registro de participantes a sus actividades

DROP PROCEDURE IF EXISTS registrar_participante;

DELIMITER $$

CREATE PROCEDURE registrar_participante(
  IN _email VARCHAR(50),
  IN _nombre VARCHAR(50),
  IN _apellidos VARCHAR(50),
  IN _nacimiento DATE,
  IN _actividad CHAR(4)
)

BEGIN
  DECLARE existe_registro INT DEFAULT 0;
  DECLARE limite INT DEFAULT 0;
  DECLARE registrados INT DEFAULT 0;
  DECLARE respuesta VARCHAR(255) DEFAULT 'ok';

  START TRANSACTION;

    SELECT COUNT(*) INTO existe_registro FROM registros
      WHERE email = _email;

    IF existe_registro = 1 THEN

      SELECT 'Tu correo electronico ya ha sido registrado previamente, sólo puedes registrarte una vez.' AS respuesta;

    ELSE

      SELECT cupo INTO limite FROM actividades
        WHERE actividad_id = _actividad;

      SELECT COUNT(*) INTO registrados FROM registros
        WHERE actividad = _actividad;

      IF registrados < limite THEN

        INSERT INTO participantes (email, nombre, apellidos, nacimiento)
          VALUES (_email, _nombre, _apellidos, _nacimiento);

        INSERT INTO registros (email, actividad, fecha)
          VALUES (_email, _actividad, NOW());

        SELECT respuesta;

      ELSE

        SELECT 'El bloque y actividad seleccionados, ya no tiene lugares disponibles.' AS respuesta;

      END IF;

    END IF;

  COMMIT;

END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS eliminar_participante;

DELIMITER $$

CREATE PROCEDURE eliminar_participante(
  IN _email VARCHAR(50)
)

BEGIN

  DECLARE respuesta VARCHAR(255) DEFAULT 'ok';

  START TRANSACTION;

    DELETE FROM participantes
      WHERE email = _email;

    DELETE FROM registros
      WHERE email = _email;

    SELECT respuesta;

  COMMIT;

END $$

DELIMITER ;


/*
CALL registrar_participante('juana@gmail.com', 'Juana', 'Ramirez', '1984-05-23', '1K');
CALL registrar_participante('maria@gmail.com', 'Maria', 'Chow', '1984-05-23', '1Y');
CALL registrar_participante('paula@gmail.com', 'Paula', 'Lopez', '1984-05-23', '1P');
CALL registrar_participante('dora@gmail.com', 'Dora', 'Torrez', '1984-05-23', '1Z');
CALL registrar_participante('dominga@gmail.com', 'Dominga', 'Castro', '1984-05-23', '1KT');
CALL registrar_participante('doris@gmail.com', 'Doris', 'Duarte', '1984-05-23', '1Y');
CALL registrar_participante('lucia@gmail.com', 'Lucia', 'Casis', '1984-05-23', '1P');
CALL registrar_participante('carlos@gmail.com', 'Carlos', 'Rodriguez', '1984-05-23', '1KT');
CALL registrar_participante('pedro@gmail.com', 'Pedro', 'Martinez', '1984-05-23', '1K');
CALL registrar_participante('juan@gmail.com', 'Juan', 'Francisco', '1984-05-23', '1Y');
CALL registrar_participante('mario@gmail.com', 'Mario', 'Alfred', '1984-05-23', '1P');
CALL registrar_participante('pablo@gmail.com', 'Pablo', 'Ramirez', '1984-05-23', '1Z');
CALL registrar_participante('erik@gmail.com', 'Erik', 'Garcia', '1984-05-23', '1KT');

CALL eliminar_participante('juana@gmail.com');
CALL eliminar_participante('maria@gmail.com');
CALL eliminar_participante('paula@gmail.com');
CALL eliminar_participante('dora@gmail.com');
CALL eliminar_participante('dominga@gmail.com');
CALL eliminar_participante('doris@gmail.com');
CALL eliminar_participante('lucia@gmail.com');
CALL eliminar_participante('carlos@gmail.com');
CALL eliminar_participante('pedro@gmail.com');
CALL eliminar_participante('juan@gmail.com');
CALL eliminar_participante('mario@gmail.com');
CALL eliminar_participante('pablo@gmail.com');
CALL eliminar_participante('erik@gmail.com');
*/