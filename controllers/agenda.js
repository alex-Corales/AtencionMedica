export class AgendaController {
    constructor({ agendaModel }) {
        this.agendaModel = agendaModel;
    }

    // Controlador para manejar la carga de la página /agenda
    obtenerAgendaCompleta = async (req, res) => {
        try {
            const id_profesional = req.session.userID;
            // Usar la fecha en la query string si está presente, si no, usar la fecha actual
            const fechaSeleccionada = req.query.fecha || new Date().toISOString().split('T')[0]; // Fecha actual por defecto si no se selecciona otra

            // Obtener los turnos correspondientes a la fecha
            const turnos = await this.agendaModel.obtenerTurnosPorFecha(fechaSeleccionada, id_profesional);

            // Renderizar la vista con la fecha seleccionada y los turnos
            res.render('agenda/agendaIndex', { turnos, fechaSeleccionada });
        } catch (error) {
            console.error('Error al obtener la agenda completa:', error);
            res.status(500).send('Error al obtener la agenda.');
        }
    }

    // Controlador para manejar el envío del formulario
    obtenerTurnosPorFecha = async (req, res) => {
        try {
            const fechaSeleccionada = req.body.fecha; // Captura la fecha enviada por el formulario
            const id_profesional = req.session.userID; // Captura el ID del profesional

            // Redirigir a /agenda con la fecha seleccionada en la query string
            res.redirect(`/agenda?fecha=${fechaSeleccionada}`);
        } catch (error) {
            console.error('Error al obtener los turnos por fecha:', error);
            res.status(500).send('Error al obtener los turnos por fecha.');
        }
    }

}
