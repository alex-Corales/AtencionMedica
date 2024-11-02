let diagnosticos = [];
let contadorConsulta = 0;

function agregarFilaConsulta() {
    const descripcion = document.getElementById('inputDescripcion').value;
    const estado = document.getElementById('selectEstado').value;

    if (!descripcion || !estado) {
        alert('Tiene que llenar todos los campos');
        return;
    }

    contadorConsulta++;

    const fila = document.createElement('tr');
    
    const columnaNumero = document.createElement('td');
    columnaNumero.textContent = contadorConsulta;

    const columnaDescripcion = document.createElement('td');
    columnaDescripcion.textContent = descripcion;

    const columnaEstadoTipo = document.createElement('td');
    columnaEstadoTipo.textContent = estado;

    const columnaAcciones = document.createElement('td');

    // Crear botón de Editar
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaDiagnostico(fila, index);

    // Crear botón de Eliminar
    const btnEliminar = document.createElement('button');
    btnEliminar.textContent = 'Eliminar';
    btnEliminar.classList.add('btn', 'btn-danger', 'btn-sm');
    btnEliminar.onclick = () => eliminarDiagnostico(fila, index);

    columnaAcciones.appendChild(btnEditar);
    columnaAcciones.appendChild(btnEliminar);

    fila.appendChild(columnaNumero);
    fila.appendChild(columnaDescripcion);
    fila.appendChild(columnaEstadoTipo);
    fila.appendChild(columnaAcciones);

    const index = diagnosticos.push({ descripcion, estado }) - 1;
    document.getElementById('tablaDiagnosticos').querySelector('tbody').appendChild(fila);

    document.getElementById('inputDescripcion').value = '';
    document.getElementById('selectEstado').value = '';
}

function editarFilaDiagnostico(fila, index) {
    const diagnostico = diagnosticos[index];

    // Convertir celdas en campos de entrada
    fila.children[1].innerHTML = `<input type="text" value="${diagnostico.descripcion}" class="form-control">`;
    fila.children[2].innerHTML = `
      <select class="form-select">
        <option value="Preliminar" ${diagnostico.estado === 'Preliminar' ? 'selected' : ''}>Preliminar</option>
        <option value="Confirmado" ${diagnostico.estado === 'Confirmado' ? 'selected' : ''}>Confirmado</option>
      </select>
    `;

    // Cambiar el botón de "Editar" por "Guardar"
    const btnGuardar = document.createElement('button');
    btnGuardar.textContent = 'Guardar';
    btnGuardar.classList.add('btn', 'btn-success', 'btn-sm', 'me-2');
    btnGuardar.onclick = () => guardarEdicionDiagnostico(fila, index);

    fila.children[3].replaceChild(btnGuardar, fila.children[3].querySelector('.btn-warning'));
}

function guardarEdicionDiagnostico(fila, index) {
    // Obtener valores editados de los inputs
    const nuevaDescripcion = fila.children[1].querySelector('input').value;
    const nuevoEstado = fila.children[2].querySelector('select').value;

    // Actualizar la fila con los nuevos valores
    fila.children[1].textContent = nuevaDescripcion;
    fila.children[2].textContent = nuevoEstado;

    // Actualizar el array
    diagnosticos[index] = { descripcion: nuevaDescripcion, estado: nuevoEstado };

    // Cambiar el botón de "Guardar" de vuelta a "Editar"
    const btnEditar = document.createElement('button');
    btnEditar.textContent = 'Editar';
    btnEditar.classList.add('btn', 'btn-warning', 'btn-sm', 'me-2');
    btnEditar.onclick = () => editarFilaDiagnostico(fila, index);

    fila.children[3].replaceChild(btnEditar, fila.children[3].querySelector('.btn-success'));
}

function eliminarDiagnostico(fila, index) {
    if (confirm('¿Estás seguro de que quieres eliminar este diagnóstico?')) {
        fila.remove();
        diagnosticos.splice(index, 1);
    }
}
