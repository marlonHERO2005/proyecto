
  document.addEventListener('DOMContentLoaded', function() {
    var form = document.querySelector('.form-contact');
    var resultado = document.getElementById('resultado');

    form.addEventListener('submit', function(event) {
      event.preventDefault();

      // Obtener valores de los campos
      var nombre = document.getElementById('nombre').value;
      var correo = document.getElementById('correo').value;
      var mensaje = document.getElementById('mensaje').value;

      // Validar campos
      if (nombre === '' || correo === '' || mensaje === '') {
        resultado.innerHTML = 'Por favor, completa todos los campos.';
        return;
      }

      // Enviar datos al servidor usando Fetch API
      fetch('enviar_correo.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ nombre: nombre, correo: correo, mensaje: mensaje })
      })
      .then(function(response) {
        return response.json();
      })
      .then(function(data) {
        resultado.innerHTML = data.message;
      })
      .catch(function(error) {
        resultado.innerHTML = 'Ocurrió un error al enviar el mensaje. Por favor, intenta nuevamente.';
      });
    });
  });


