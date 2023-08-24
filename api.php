<?php
// Conexión a la base de datos
$servidor = "localhost";
$usuario = "root";
$password = "6745<>";
$nombrebd = "skinstore";

$conn = new mysqli($servidor, $usuario, $password, $nombrebd);
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Rutas de la API
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Crear una cita
    $data = json_decode(file_get_contents("php://input"), true);
    $fecha = $data['fecha'];
    $hora = $data['hora'];
    $nombreCliente = $data['nombreCliente'];
    $servicio = $data['servicio'];

    $sql = "INSERT INTO citas (fecha, hora, nombre_cliente, servicio) VALUES ('$fecha', '$hora', '$nombreCliente', '$servicio')";
    if ($conn->query($sql) === TRUE) {
        echo "Cita creada exitosamente";
    } else {
        echo "Error al crear la cita: " . $conn->error;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Obtener la lista de citas
    $sql = "SELECT * FROM citas";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $citas = array();
        while ($row = $result->fetch_assoc()) {
            $citas[] = $row;
        }
        echo json_encode($citas);
    } else {
        echo "No se encontraron citas";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    // Actualizar una cita
    $data = json_decode(file_get_contents("php://input"), true);
    $id = $data['id'];
    $fecha = $data['fecha'];
    $hora = $data['hora'];
    $nombreCliente = $data['nombreCliente'];
    $servicio = $data['servicio'];

    $sql = "UPDATE citas SET fecha='$fecha', hora='$hora', nombre_cliente='$nombreCliente', servicio='$servicio' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo "Cita actualizada exitosamente";
    } else {
        echo "Error al actualizar la cita: " . $conn->error;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Eliminar una cita
    $data = json_decode(file_get_contents("php://input"), true);
    $id = $data['id'];

    $sql = "DELETE FROM citas WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo "Cita eliminada exitosamente";
    } else {
        echo "Error al eliminar la cita: " . $conn->error;
    }
}

$conn->close();
?>
