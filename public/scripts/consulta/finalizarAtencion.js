document.addEventListener('DOMContentLoaded', function () {
  var quill = new Quill('#idEvoluciones', {
    theme: 'snow',
    modules: {
      toolbar: [
        [{ header: [1, 2, false] }],
        ['bold', 'italic', 'underline'],
        [{ list: 'ordered' }, { list: 'bullet' }],
        ['link', 'blockquote', 'code-block'],
        [{ align: [] }],
        ['clean']
      ]
    }
  });

  // Función para mostrar la plantilla seleccionada
  function mostrarPlantilla() {
    const select = document.getElementById('selectPlantilla');
    const contenidoPlantilla = select.value; // Obtiene el contenido de la plantilla seleccionada

    // Usa Quill para insertar el contenido de la plantilla
    quill.root.innerHTML = contenidoPlantilla;
  }

  // Asigna el evento 'change' al <select>
  const selectElement = document.getElementById('selectPlantilla');
  if (selectElement) {
    selectElement.addEventListener('change', mostrarPlantilla);
  }

  document.getElementById('finalizarConsulta').addEventListener('click', function () {
    let evolucion = quill.root.innerHTML;

    let datosPaciente = {
      evolucion: evolucion,
      diagnosticos: diagnosticos,
      alergias: alergias,
      antecedentesPatologicos: antecedentesPatologicos,
      habitos: habitos,
      medicamentos: medicamentos
    };

    console.log(datosPaciente);

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
