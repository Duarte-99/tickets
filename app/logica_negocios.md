# Lógica de Negocios ENTRENA TU GLAMOUR  


## Glosario:

* ***PK*** - Primary Key / Llave Primaria
* ***FK*** - Foreign Key / Llave Foranea
* ***UQ*** - Unique / Unico
* ***CAT*** - Catalog / Catalogo de la empresa que ofrece
* ***1 - 1*** - One to One / uno a uno 
* ***1 - M*** - One to Many / uno a muchos
* ***M - M*** - Many to Many / muchos a muchos

## Reglas de Negocio:

* Registrar participantes para el evento Entrena tu Glamour.
* El evento tendrá 4 disciplinas:
  * KickBoxing
  * Pilates
  * Yoga
  * Zumba
  * Karate
* Cada disciplina tendrá 3 bloques de horarios:
  * Bloque 1 de 9:00 a 12:00
  * Bloque 2 de 13:00 a 16:00
  * Bloque 3 de 17:00 a 20:00
  * Bloque 4 de 21:00 a 24:00
* Cada actividad tendrá un máximo de 10 participantes, excepto los de Yoga que tendrán 20 y Karate 15.
* Cada participante sólo se podrá registrar a una sóla actividad.

## Entidades

### Actividades (***CAT***) 

* actividad_id (***PK***)
* bloque
* disciplina
* horario
* cupo
* costo

### Participantes

* email (***PK***) y (***UQ***)
* nombre 
* apellidos
* nacimiento

### Registros

* registro_id (***PK***)
* email (***FK***)
* actividad (***FK***)
* fecha


## Relaciones del Modelo

1. Los **Participantes** crean un **Registro** (*1 - 1*).
1. Las **Actividades** se asignan a un  **Registro** (*1 - 1*).

## Información de catálogo de actividades

* ('1K', 'Bloque 1', 'KICK BOXING', '9:00 a 12:00', '10', $25)
* ('1Y', 'Bloque 1', 'YOGA', '9:00 a 12:00', '20', $20)
* ('1P', 'Bloque 1', 'PILATES', '9:00 a 12:00', '10', $15)
* ('1Z', 'Bloque 1', 'ZUMBA', '9:00 a 12:00', '10', $30)
* ('1KT', 'Bloque 1', 'KARATE', '21:00 a 24:00', '15', $25)

* ('2K', 'Bloque 2', 'KICK BOXING', '14:00 a 17:00', '10', $25)
* ('2Y', 'Bloque 2', 'YOGA', '14:00 a 17:00', '20', $20)
* ('2P', 'Bloque 2', 'PILATES', '14:00 a 17:00', '10', $15)
* ('2Z', 'Bloque 2', 'ZUMBA', '14:00 a 17:00', '10', $30)
* ('2KT', 'Bloque 2', 'KARATE', '21:00 a 24:00', '15', $25)

* ('3K', 'Bloque 3', 'KICK BOXING', '18:00 a 21:00', '10', $25)
* ('3Y', 'Bloque 3', 'YOGA', '18:00 a 21:00', '20', $20)
* ('3P', 'Bloque 3', 'PILATES', '18:00 a 21:00', '10', $15)
* ('3Z', 'Bloque 3', 'ZUMBA', '18:00 a 21:00', '10', $25)
* ('3KT', 'Bloque 3', 'KARATE', '21:00 a 24:00', '15')

* ('4K', 'Bloque 4', 'KICK BOXING', '18:00 a 21:00', '10', $25)
* ('4Y', 'Bloque 4', 'YOGA', '9:00 a 12:00', '20', $20)
* ('4P', 'Bloque 4', 'PILATES', '9:00 a 12:00', 10', $15)
* ('4Z', 'Bloque 4', 'ZUMBA', '9:00 a 12:00', '10', $30)
* ('4KT', 'Bloque 4', 'KARATE', '21:00 a 24:00', '15', $25)

## Operaciones CRUD:

* Registrar Participantes:
  * Validar cupo de la actividad.
  * Insertar datos a las entidades Participantes y Registros.
* Listar Registro.
* Eliminar Participante:
  * Eliminar datos a las entidades Participantes y Registros.