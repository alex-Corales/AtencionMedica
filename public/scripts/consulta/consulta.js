let diagnosticos = [];
let alergias = [];
let antecedentesPatologicos = [];
let habitos = [];
let medicamentos = [];

/**
 * Esta funcion es de los diagnosticos, se debe cambiar el nombre
 * @returns {void}
 */
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

    diagnosticos.push({ descripcion, estado })

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

    alergias.push({ nombreAlergia, fechaAlergia, importanciaAlergia });

    document.getElementById('tablaAlergias').querySelector('tbody').appendChild(fila); 

    document.getElementById('inputNombreAlergia').value = '';
    document.getElementById('fechaAlergia').value = '';
    document.getElementById('selectImportancia').value = '';
}

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

    filaAntecedentes.appendChild(columnaDescripcion);
    filaAntecedentes.appendChild(columnaFechaDesde);
    filaAntecedentes.appendChild(columnaFechaHasta);

    antecedentesPatologicos.push({ descripcionAntecedente, fechaDesde, fechaHasta });  

    document.getElementById('tablaAntecedentes').querySelector('tbody').appendChild(filaAntecedentes);

    document.getElementById('inputDescripcionAntecedente').value = '';
    document.getElementById('fechaDesde').value = '';
    document.getElementById('fechaHasta').value = '';
}

function agregarFilaHabito(){
    const descripcionHabito = document.getElementById('inputDescripcionHabito').value;
    const fechaDesde = document.getElementById('fechaDesdeHabito').value;
    const fechaHasta = document.getElementById('fechaHastaHabito').value;

    console.log(descripcionHabito, fechaDesde, fechaHasta)

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

    fila.appendChild(columnaDescripcion);
    fila.appendChild(columnaFechaDesde);
    fila.appendChild(columnaFechaHasta);

    habitos.push({ descripcionHabito, fechaDesde, fechaHasta });

    document.getElementById('tablaHabitos').querySelector('tbody').appendChild(fila);

    document.getElementById('inputDescripcionHabito').value = '';
    document.getElementById('fechaDesdeHabito').value = '';
    document.getElementById('fechaHastaHabito').value = '';
}

function agregarFilaMedicamento(){
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

    fila.appendChild(columnaNombre);
    fila.appendChild(columnaDosis);
    fila.appendChild(columnaFrecuencia);

    medicamentos.push({ nombreMedicamento, dosisMedicamento, frecuenciaMedicamento });

    document.getElementById('tablaMedicamentos').querySelector('tbody').appendChild(fila);

    document.getElementById('inputNombreMedicamento').value = '';
    document.getElementById('inputDosisMedicamento').value = '';
    document.getElementById('inputFrecuenciaMedicamento').value = '';
}
