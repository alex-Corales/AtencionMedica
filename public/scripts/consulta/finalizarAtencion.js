document.getElementById('finalizarConsulta').addEventListener('click', function () {
    
    let evolucion = "";
    evolucion = document.getElementById('idEvoluciones').value;

    let diagnosticos = [];
    document.querySelectorAll('#tablaDiagnosticos tbody tr').forEach(row => {
        let descripcion = row.cells[1].innerText;
        let estado = row.cells[2].innerText;
        diagnosticos.push({ descripcion, estado });
    });

    let alergias = [];
    document.querySelectorAll('#tablaAlergias tbody tr');

    let antecedentesPatologicos = [];

    let habitos = [];
    document.querySelectorAll('#tablaHabitos tbody tr').forEach(row => {
      let descripcion = row.cells[0].innerText;
      let fechaDesde = row.cells[1].innerText;
      let fechaHasta = row.cells[2].innerText;
      habitos.push({ descripcion, fechaDesde, fechaHasta });
    });

    console.log(auxHabitos);

    let medicamentos = [];

    let datosPaciente = {
      id_consulta: "ID_DE_LA_CONSULTA",
      evolucion: evolucion,
      diagnosticos: diagnosticos,
      alergias: alergias,
      antecedentesPatologicos: antecedentesPatologicos,
      habitos: habitos,
      medicamentos: medicamentos
    };

    console.log("Datos enviados:", datosPaciente);

    fetch('/consulta/finalizarConsulta', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(datosPaciente)
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Atención finalizada correctamente');
      } else {
        alert('Hubo un problema al finalizar la atención');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('Hubo un error al enviar los datos');
    });
  });