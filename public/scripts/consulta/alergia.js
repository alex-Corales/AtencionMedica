let alergias = [];

function agregarFilaAlergia() {
    const nombreAlergia = document.getElementById('inputNombreAlergia').value;
    const fechaAlergia = document.getElementById('fechaAlergia').value;
    const importanciaAlergia = document.getElementById('selectImportancia').value;

    if (!nombreAlergia || !fechaAlergia || !importanciaAlergia) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    const fila = document.createElement('tr'); 

    const columnaNombreAlergia = document.createElement('td');
    columnaNombreAlergia.textContent = nombreAlergia;

    const columnaFechaAlergia = document.createElement('td');
    columnaFechaAlergia.textContent = fechaAlergia;

    const columnaImportanciaAlergia = document.createElement('td');
    columnaImportanciaAlergia.textContent = importanciaAlergia;

    const columnaAcciones = document.createElement('td');

    // Crear botón de Editar
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFila(fila, index);

    // Crear botón de Eliminar
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';
    btnEliminar.classList.add('btn', 'btn-danger', 'btn-sm');
    btnEliminar.onclick = () => eliminarAlergia(fila, index);

    columnaAcciones.appendChild(btnEditar);
    columnaAcciones.appendChild(btnEliminar);

    fila.appendChild(columnaNombreAlergia);
    fila.appendChild(columnaFechaAlergia);
    fila.appendChild(columnaImportanciaAlergia);
    fila.appendChild(columnaAcciones);

    const index = alergias.push({ nombreAlergia, fechaAlergia, importanciaAlergia }) - 1;
    document.getElementById('tablaAlergias').querySelector('tbody').appendChild(fila); 

    document.getElementById('inputNombreAlergia').value = '';
    document.getElementById('fechaAlergia').value = '';
    document.getElementById('selectImportancia').value = '';
}

function editarFila(fila, index) {
    const alergia = alergias[index];

    // Convertir celdas en campos de entrada
    fila.children[0].innerHTML = `<input type="text" value="${alergia.nombreAlergia}" class="form-control">`;
    fila.children[1].innerHTML = `<input type="date" value="${alergia.fechaAlergia}" class="form-control">`;
    fila.children[2].innerHTML = `
      <select class="form-select">
        <option value="Leve" ${alergia.importanciaAlergia === 'Leve' ? 'selected' : ''}>Leve</option>
        <option value="Normal" ${alergia.importanciaAlergia === 'Normal' ? 'selected' : ''}>Normal</option>
        <option value="Alta" ${alergia.importanciaAlergia === 'Alta' ? 'selected' : ''}>Alta</option>
      </select>
    `;

    // Cambiar el botón de "Editar" por "Guardar"
    const btnGuardar = document.createElement('button');
    btnGuardar.textContent = 'Guardar';
    btnGuardar.classList.add('btn', 'btn-success', 'btn-sm', 'me-2');
    btnGuardar.onclick = () => guardarEdicion(fila, index);

    const btnEliminar = fila.children[3].querySelector('.btn-danger');
    fila.children[3].replaceChild(btnGuardar, fila.children[3].querySelector('.btn-warning'));
}

function guardarEdicion(fila, index) {
    // Obtener valores editados de los inputs
    const nuevoNombre = fila.children[0].querySelector('input').value;
    const nuevaFecha = fila.children[1].querySelector('input').value;
    const nuevaImportancia = fila.children[2].querySelector('select').value;

    // Actualizar la fila con los nuevos valores
    fila.children[0].textContent = nuevoNombre;
    fila.children[1].textContent = nuevaFecha;
    fila.children[2].textContent = nuevaImportancia;

    // Actualizar el array
    alergias[index] = { nombreAlergia: nuevoNombre, fechaAlergia: nuevaFecha, importanciaAlergia: nuevaImportancia };

    // Cambiar el botón de "Guardar" de vuelta a "Editar"
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFila(fila, index);

    fila.children[3].replaceChild(btnEditar, fila.children[3].querySelector('.btn-success'));
}

function eliminarAlergia(fila, index) {
    if (confirm('¿Estás seguro de que quieres eliminar esta alergia?')) {
        fila.remove();
        alergias.splice(index, 1);
    }
}







