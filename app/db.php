<?php
function db_connect()
{
    $dsn = DB['dsn'];
    $user = DB['user'];
    $pass = DB['pass'];
    $options = array( PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8' );

    try {
        $db = new PDO($dsn, $user, $pass, $options);
        // echo '<p>¡¡¡Conectado!!!</p>';

        return $db;
    } catch (PDOException $e) {
        echo '<p>¡Error!: <mark>' . $e->getMessage() . '</mark></p>';
        die();
    }
}


//Funcion para evitar ataques de sql injection 
function db_query($sql, $data = array(), $is_search = false, $search_one = false)
{
    $db = db_connect();

    $mysql = $db->prepare($sql);

    $mysql->execute($data);

    if ($is_search) {
        /* Para Consultas de Tipo READ */
        if ($search_one) {
            /* Para buscar un registro */
            $result = $mysql->fetch(PDO::FETCH_ASSOC);
        } else {
            /* Para buscar todos los registros */
            $result = $mysql->fetchAll(PDO::FETCH_ASSOC);
        }
        $db = null;
        return $result;
    } else {
        /* Para Consultas de Tipo CREATE, UPDATE Y DELETE */
        $db = null;
        return true;
    }
}