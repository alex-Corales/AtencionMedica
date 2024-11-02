let habitos = [];

function agregarFilaHabito() {
    const descripcionHabito = document.getElementById('inputDescripcionHabito').value;
    const fechaDesde = document.getElementById('fechaDesdeHabito').value;
    const fechaHasta = document.getElementById('fechaHastaHabito').value;

    if (!descripcionHabito || !fechaDesde || !fechaHasta) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    const fila = document.createElement('tr');

    const columnaDescripcion = document.createElement('td');
    columnaDescripcion.textContent = descripcionHabito;

    const columnaFechaDesde = document.createElement('td');
    columnaFechaDesde.textContent = fechaDesde;

    const columnaFechaHasta = document.createElement('td');
    columnaFechaHasta.textContent = fechaHasta;

    const columnaAcciones = document.createElement('td');

    // Crear botón de Editar
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaHabito(fila, index);

    // Crear botón de Eliminar
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';
    btnEliminar.classList.add('btn', 'btn-danger', 'btn-sm');
    btnEliminar.onclick = () => eliminarHabito(fila, index);

    columnaAcciones.appendChild(btnEditar);
    columnaAcciones.appendChild(btnEliminar);

    fila.appendChild(columnaDescripcion);
    fila.appendChild(columnaFechaDesde);
    fila.appendChild(columnaFechaHasta);
    fila.appendChild(columnaAcciones);

    const index = habitos.push({ descripcionHabito, fechaDesde, fechaHasta }) - 1;
    document.getElementById('tablaHabitos').querySelector('tbody').appendChild(fila);

    document.getElementById('inputDescripcionHabito').value = '';
    document.getElementById('fechaDesdeHabito').value = '';
    document.getElementById('fechaHastaHabito').value = '';
}

function editarFilaHabito(fila, index) {
    const habito = habitos[index];

    // Convertir celdas en campos de entrada
    fila.children[0].innerHTML = `<input type="text" value="${habito.descripcionHabito}" class="form-control">`;
    fila.children[1].innerHTML = `<input type="date" value="${habito.fechaDesde}" class="form-control">`;
    fila.children[2].innerHTML = `<input type="date" value="${habito.fechaHasta}" class="form-control">`;

    // Cambiar el botón de "Editar" a "Guardar"
    const btnGuardar = document.createElement('button');
    btnGuardar.textContent = 'Guardar';
    btnGuardar.classList.add('btn', 'btn-success', 'btn-sm', 'me-2');
    btnGuardar.onclick = () => guardarEdicionHabito(fila, index);

    fila.children[3].replaceChild(btnGuardar, fila.children[3].querySelector('.btn-warning'));
}

function guardarEdicionHabito(fila, index) {
    // Obtener los valores editados de los inputs
    const nuevaDescripcion = fila.children[0].querySelector('input').value;
    const nuevaFechaDesde = fila.children[1].querySelector('input').value;
    const nuevaFechaHasta = fila.children[2].querySelector('input').value;

    // Actualizar la fila con los nuevos valores
    fila.children[0].textContent = nuevaDescripcion;
    fila.children[1].textContent = nuevaFechaDesde;
    fila.children[2].textContent = nuevaFechaHasta;

    // Actualizar el array
    habitos[index] = { descripcionHabito: nuevaDescripcion, fechaDesde: nuevaFechaDesde, fechaHasta: nuevaFechaHasta };

    // Cambiar el botón de "Guardar" de vuelta a "Editar"
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaHabito(fila, index);

    fila.children[3].replaceChild(btnEditar, fila.children[3].querySelector('.btn-success'));
}

function eliminarHabito(fila, index) {
    if (confirm('¿Estás seguro de que quieres eliminar este hábito?')) {
        fila.remove();
        habitos.splice(index, 1);
    }
}
