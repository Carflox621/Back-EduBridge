<?php
header("Content-Type: application/json");

require_once "../config/database.php";

$input = json_decode(file_get_contents("php://input"));

if (!isset($input->firebase_uid)) {
    echo json_encode(["ok" => false, "error" => "Falta UID"]);
    exit;
}

$firebase_uid = $input->firebase_uid;

$db = new Database();
$conn = $db->getConnection();

$query = "SELECT * FROM usuario WHERE firebase_uid = :uid LIMIT 1";
$stmt = $conn->prepare($query);
$stmt->bindParam(":uid", $firebase_uid);
$stmt->execute();

if ($stmt->rowCount() === 0) {
    echo json_encode(["ok" => false, "error" => "Usuario no encontrado"]);
    exit;
}

$user = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode([
    "ok" => true,
    "id" => $user["id"],
    "matricula" => $user["matricula"],
    "nombre" => $user["nombre"],
    "correo" => $user["correo"],
    "rol" => $user["rol"],
    "grado" => $user["grado"],
    "grupo" => $user["grupo"],
    "materia" => $user["materia"],
    "area" => $user["area"]
]);
