const citaForm = document.getElementById('citaForm');
const citasList = document.getElementById('citasList');

// Función para cargar la lista de citas
function cargarCitas() {
    axios.get('api.php')
        .then(response => {
            citasList.innerHTML = '';
            response.data.forEach(cita => {
                const li = document.createElement('li');
                li.textContent = `Fecha: ${cita.fecha}, Hora: ${cita.hora}, Cliente: ${cita.nombre_cliente}, Servicio: ${cita.servicio}`;
                citasList.appendChild(li);
            });
        })
        .catch(error => {
            console.error('Error al cargar las citas:', error);
        });
}

// Manejar el envío del formulario
citaForm.addEventListener('submit', function(event) {
    event.preventDefault();

    const fecha = document.getElementById('fecha').value;
    const hora = document.getElementById('hora').value;
    const nombreCliente = document.getElementById('nombreCliente').value;
    const servicio = document.getElementById('servicio').value;

    const nuevaCita = {
        fecha: fecha,
        hora: hora,
        nombreCliente: nombreCliente,
        servicio: servicio
    };

    axios.post('api.php', nuevaCita)
        .then(response => {
            console.log(response.data);
            cargarCitas();
            citaForm.reset();
        })
        .catch(error => {
            console.error('Error al agendar la cita:', error);
        });
});

// Cargar la lista de citas al cargar la página
cargarCitas();
