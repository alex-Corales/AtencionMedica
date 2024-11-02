let medicamentos = [];

function agregarFilaMedicamento() {
    const nombreMedicamento = document.getElementById('inputNombreMedicamento').value;
    const dosisMedicamento = document.getElementById('inputDosisMedicamento').value;
    const frecuenciaMedicamento = document.getElementById('inputFrecuenciaMedicamento').value;

    if (!nombreMedicamento || !dosisMedicamento || !frecuenciaMedicamento) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    const fila = document.createElement('tr');

    const columnaNombre = document.createElement('td');
    columnaNombre.textContent = nombreMedicamento;

    const columnaDosis = document.createElement('td');
    columnaDosis.textContent = dosisMedicamento;

    const columnaFrecuencia = document.createElement('td');
    columnaFrecuencia.textContent = frecuenciaMedicamento;

    const columnaAcciones = document.createElement('td');

    // Crear botón de Editar
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaMedicamento(fila, index);

    // Crear botón de Eliminar
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';
    btnEliminar.classList.add('btn', 'btn-danger', 'btn-sm');
    btnEliminar.onclick = () => eliminarMedicamento(fila, index);

    columnaAcciones.appendChild(btnEditar);
    columnaAcciones.appendChild(btnEliminar);

    fila.appendChild(columnaNombre);
    fila.appendChild(columnaDosis);
    fila.appendChild(columnaFrecuencia);
    fila.appendChild(columnaAcciones);

    const index = medicamentos.push({ nombreMedicamento, dosisMedicamento, frecuenciaMedicamento }) - 1;
    document.getElementById('tablaMedicamentos').querySelector('tbody').appendChild(fila);

    document.getElementById('inputNombreMedicamento').value = '';
    document.getElementById('inputDosisMedicamento').value = '';
    document.getElementById('inputFrecuenciaMedicamento').value = '';
}

function editarFilaMedicamento(fila, index) {
    const medicamento = medicamentos[index];

    // Convertir celdas en campos de entrada
    fila.children[0].innerHTML = `<input type="text" value="${medicamento.nombreMedicamento}" class="form-control">`;
    fila.children[1].innerHTML = `<input type="text" value="${medicamento.dosisMedicamento}" class="form-control">`;
    fila.children[2].innerHTML = `<input type="text" value="${medicamento.frecuenciaMedicamento}" class="form-control">`;

    // Cambiar el botón de "Editar" a "Guardar"
    const btnGuardar = document.createElement('button');
    btnGuardar.textContent = 'Guardar';
    btnGuardar.classList.add('btn', 'btn-success', 'btn-sm', 'me-2');
    btnGuardar.onclick = () => guardarEdicionMedicamento(fila, index);

    fila.children[3].replaceChild(btnGuardar, fila.children[3].querySelector('.btn-warning'));
}

function guardarEdicionMedicamento(fila, index) {
    // Obtener los valores editados de los inputs
    const nuevoNombre = fila.children[0].querySelector('input').value;
    const nuevaDosis = fila.children[1].querySelector('input').value;
    const nuevaFrecuencia = fila.children[2].querySelector('input').value;

    // Actualizar la fila con los nuevos valores
    fila.children[0].textContent = nuevoNombre;
    fila.children[1].textContent = nuevaDosis;
    fila.children[2].textContent = nuevaFrecuencia;

    // Actualizar el array
    medicamentos[index] = { nombreMedicamento: nuevoNombre, dosisMedicamento: nuevaDosis, frecuenciaMedicamento: nuevaFrecuencia };

    // Cambiar el botón de "Guardar" de vuelta a "Editar"
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaMedicamento(fila, index);

    fila.children[3].replaceChild(btnEditar, fila.children[3].querySelector('.btn-success'));
}

function eliminarMedicamento(fila, index) {
    if (confirm('¿Estás seguro de que quieres eliminar este medicamento?')) {
        fila.remove();
        medicamentos.splice(index, 1);
    }
}
