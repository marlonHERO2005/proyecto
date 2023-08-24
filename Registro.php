<?php
// Obtén los datos del formulario
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];
$correo = $_POST['correo'];
$telefono = $_POST['telefono'];
$contraseña = $_POST['password'];
$confirmarcontraseña = $_POST['confirmarcontraseña'];

// Validar que las contraseñas coincidan
if ($contraseña !== $confirmarcontraseña) {
    echo "Las contraseñas no coinciden.";
    exit();
}

// Conexión a la base de datos (ajusta los valores según tu configuración)
$servidor = "localhost";
$usuario = "root";
$contraseñabasedatos = "6745<>";
$nombrebasedatos = "skinstore";

$conn = new mysqli($servidor, $usuario, $contraseñabasedatos, $nombrebasedatos);

// Verifica la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Insertar los datos en la base de datos
$query = "INSERT INTO registro (nombre, apellido, correo, telefono, contraseña) VALUES ('$nombre', '$apellido', '$correo', '$telefono', '$contraseña')";
if ($conn->query($query) === TRUE) {
    header("Location: InicioSesion.html");
    exit;
} else {
    echo "Error en el registro: " . $conn->error;
}

$conn->close();
?>
