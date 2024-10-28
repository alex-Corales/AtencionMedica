function agregarFilaConsulta() {
    let contadorConsulta = 0;

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

    fila.appendChild(columnaNumero);
    fila.appendChild(columnaDescripcion);
    fila.appendChild(columnaEstadoTipo);

    document.getElementById('tablaDiagnosticos').querySelector('tbody').appendChild(fila);

    document.getElementById('inputDescripcion').value = '';
    document.getElementById('selectEstado').value = '';
}


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

    fila.appendChild(columnaNombreAlergia);
    fila.appendChild(columnaFechaAlergia);
    fila.appendChild(columnaImportanciaAlergia);

    document.getElementById('tablaAlergias').querySelector('tbody').appendChild(fila); 

    document.getElementById('inputNombreAlergia').value = '';
    document.getElementById('fechaAlergia').value = '';
    document.getElementById('selectImportancia').value = '';
}

function agregarFilaAntecedentePatologico() {
    const descripcionAntecedente = document.getElementById('inputDescripcionAntecedente').value;
    const fechaDesde = document.getElementById('fechaDesde').value;
    const fechaHasta = document.getElementById('fechaHasta').value;

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

    filaAntecedentes.appendChild(columnaDescripcion);
    filaAntecedentes.appendChild(columnaFechaDesde);
    filaAntecedentes.appendChild(columnaFechaHasta);

    document.getElementById('tablaAntecedentes').querySelector('tbody').appendChild(filaAntecedentes);

    document.getElementById('inputDescripcionAntecedente').value = '';
    document.getElementById('fechaDesde').value = '';
    document.getElementById('fechaHasta').value = '';
}
