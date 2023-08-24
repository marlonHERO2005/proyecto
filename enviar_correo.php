<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Obtener datos del formulario
  $nombre = $_POST["nombre"];
  $correo = $_POST["correo"];
  $mensaje = $_POST["mensaje"];

  // Configurar el correo
  $to = "marlonsamir2005@gmail.com"; 
  $subject = "Nuevo mensaje de contacto desde el sitio web";
  $message = "Nombre: $nombre\nCorreo: $correo\nMensaje:\n$mensaje";
  $headers = "From: $correo";

  // Enviar el correo
  $mailSuccess = mail($to, $subject, $message, $headers);

  if ($mailSuccess) {
    $response = array("message" => "¡Gracias por tu mensaje! Te contactaremos pronto.");
  } else {
    $response = array("message" => "Ha ocurrido un error al enviar el mensaje. Por favor, intenta nuevamente más tarde.");
  }

  echo json_encode($response);
} else {
  header("HTTP/1.0 403 Forbidden");
  echo "Acceso denegado.";
}
?>
