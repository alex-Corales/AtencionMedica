let antecedentesPatologicos = [];

function agregarFilaAntecedentePatologico() {
    const descripcionAntecedente = document.getElementById('inputDescripcionAntecedente').value;
    const fechaDesde = document.getElementById('fechaDesdeAntecedente').value;
    const fechaHasta = document.getElementById('fechaHastaAntecedente').value;

    if (!descripcionAntecedente || !fechaDesde || !fechaHasta) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    const filaAntecedentes = document.createElement('tr');

    const columnaDescripcion = document.createElement('td');
    columnaDescripcion.textContent = descripcionAntecedente;

    const columnaFechaDesde = document.createElement('td');
    columnaFechaDesde.textContent = fechaDesde;

    const columnaFechaHasta = document.createElement('td');
    columnaFechaHasta.textContent = fechaHasta;

    const columnaAcciones = document.createElement('td');

    // Crear botón de Editar
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaAntecedente(filaAntecedentes, index);

    // Crear botón de Eliminar
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';
    btnEliminar.classList.add('btn', 'btn-danger', 'btn-sm');
    btnEliminar.onclick = () => eliminarAntecedente(filaAntecedentes, index);

    columnaAcciones.appendChild(btnEditar);
    columnaAcciones.appendChild(btnEliminar);

    filaAntecedentes.appendChild(columnaDescripcion);
    filaAntecedentes.appendChild(columnaFechaDesde);
    filaAntecedentes.appendChild(columnaFechaHasta);
    filaAntecedentes.appendChild(columnaAcciones);

    const index = antecedentesPatologicos.push({ descripcionAntecedente, fechaDesde, fechaHasta }) - 1;
    document.getElementById('tablaAntecedentes').querySelector('tbody').appendChild(filaAntecedentes);

    document.getElementById('inputDescripcionAntecedente').value = '';
    document.getElementById('fechaDesdeAntecedente').value = '';
    document.getElementById('fechaHastaAntecedente').value = '';
}

function editarFilaAntecedente(fila, index) {
    const antecedente = antecedentesPatologicos[index];

    // Convertir celdas en campos de entrada
    fila.children[0].innerHTML = `<input type="text" value="${antecedente.descripcionAntecedente}" class="form-control">`;
    fila.children[1].innerHTML = `<input type="date" value="${antecedente.fechaDesde}" class="form-control">`;
    fila.children[2].innerHTML = `<input type="date" value="${antecedente.fechaHasta}" class="form-control">`;

    // Cambiar el botón de "Editar" a "Guardar"
    const btnGuardar = document.createElement('button');
    btnGuardar.textContent = 'Guardar';
    btnGuardar.classList.add('btn', 'btn-success', 'btn-sm', 'me-2');
    btnGuardar.onclick = () => guardarEdicionAntecedente(fila, index);

    const btnEliminar = fila.children[3].querySelector('.btn-danger');
    fila.children[3].replaceChild(btnGuardar, fila.children[3].querySelector('.btn-warning'));
}

function guardarEdicionAntecedente(fila, index) {
    // Obtener los valores editados de los inputs
    const nuevaDescripcion = fila.children[0].querySelector('input').value;
    const nuevaFechaDesde = fila.children[1].querySelector('input').value;
    const nuevaFechaHasta = fila.children[2].querySelector('input').value;

    // Actualizar la fila con los nuevos valores
    fila.children[0].textContent = nuevaDescripcion;
    fila.children[1].textContent = nuevaFechaDesde;
    fila.children[2].textContent = nuevaFechaHasta;

    // Actualizar el array
    antecedentesPatologicos[index] = { descripcionAntecedente: nuevaDescripcion, fechaDesde: nuevaFechaDesde, fechaHasta: nuevaFechaHasta };

    // Cambiar el botón de "Guardar" de vuelta a "Editar"
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaAntecedente(fila, index);

    fila.children[3].replaceChild(btnEditar, fila.children[3].querySelector('.btn-success'));
}

function eliminarAntecedente(fila, index) {
    if (confirm('¿Estás seguro de que quieres eliminar este antecedente patológico?')) {
        fila.remove();
        antecedentesPatologicos.splice(index, 1);
    }
}
    