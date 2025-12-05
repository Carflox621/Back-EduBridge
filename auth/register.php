<?php
header("Content-Type: application/json");

require_once "../config/database.php";

$input = json_decode(file_get_contents("php://input"));

$required = ["matricula", "nombre", "correo", "rol", "firebase_uid"];

foreach ($required as $field) {
    if (!isset($input->$field)) {
        echo json_encode(["ok" => false, "error" => "Falta campo: $field"]);
        exit;
    }
}

$db = new Database();
$conn = $db->getConnection();

$query = "INSERT INTO usuario (matricula, nombre, correo, rol, firebase_uid, grado, grupo, materia, area)
          VALUES (:matricula, :nombre, :correo, :rol, :uid, :grado, :grupo, :materia, :area)";

$stmt = $conn->prepare($query);

$stmt->execute([
    ":matricula" => $input->matricula,
    ":nombre" => $input->nombre,
    ":correo" => $input->correo,
    ":rol" => $input->rol,
    ":uid" => $input->firebase_uid,
    ":grado" => $input->grado ?? null,
    ":grupo" => $input->grupo ?? null,
    ":materia" => $input->materia ?? null,
    ":area" => $input->area ?? null,
]);

echo json_encode(["ok" => true, "mensaje" => "Usuario registrado"]);
