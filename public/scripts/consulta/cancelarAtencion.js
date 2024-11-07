document.getElementById('cancelarConsulta').addEventListener('click', async function () {
    const confirmacion = confirm("¿Está seguro de que desea cancelar esta consulta?");
    
    if (confirmacion) {
        try {

            const response = await fetch('/consulta/cancelarConsulta', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            if (response.ok) {
                window.location.href = '/agenda';
            } else {
                alert('Error al cancelar la consulta. Por favor, intente nuevamente.');
            }
        } catch (error) {
            console.error("Error al cancelar la consulta:", error);
            alert('Error al cancelar la consulta. Por favor, intente nuevamente.');
        }
    }
});
