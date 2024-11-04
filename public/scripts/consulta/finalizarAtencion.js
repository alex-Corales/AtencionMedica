document.getElementById('finalizarConsulta').addEventListener('click', function () {
  let evolucion = document.getElementById('idEvoluciones').value;

  let datosPaciente = {
    evolucion: evolucion,
    diagnosticos: diagnosticos,
    alergias: alergias,
    antecedentesPatologicos: antecedentesPatologicos,
    habitos: habitos,
    medicamentos: medicamentos
  };

  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(datosPaciente)
  };

  fetch('/consulta/finalizarConsulta', options)
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Atención finalizada correctamente');
        window.location.href = '/agenda'; 
      } else {
        if (data.errors) {
          mostrarErroresDeValidacion(data.errors);
        } else {
          alert('Hubo un problema al finalizar la atención');
        }
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('Hubo un error al enviar los datos');
    });


  async function mostrarErroresDeValidacion(errors) {
    const erroresContainer = document.getElementById('erroresContainer');
    erroresContainer.innerHTML = ''; // Limpia cualquier mensaje previo

    await errors.forEach((error) => {
      const errorMessage = document.createElement('div');
      errorMessage.className = 'alert alert-danger';
      errorMessage.setAttribute('role', 'alert');
      errorMessage.textContent = `Error en ${error.path.join('.')}: ${error.message}`;
      erroresContainer.appendChild(errorMessage);
    });

    erroresContainer.scrollIntoView({ behavior: 'smooth' });
  }

});
