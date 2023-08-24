<?php
// Obtén los datos del formulario
$correo = $_POST['correo'];
$contraseña = $_POST['password'];

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

// Realiza la consulta para verificar las credenciales
$query = "SELECT * FROM usuario WHERE correo = '$correo' AND contraseña = '$contraseña'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    // Inicio de sesión exitoso
    header("Location: paginaPrincipal.html");
    exit;
} else {
    // Inicio de sesión fallido
    echo "Credenciales incorrectas.";
}

$conn->close();
?>
