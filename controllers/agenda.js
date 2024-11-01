export class AgendaController {
    constructor({ agendaModel }) {
        this.agendaModel = agendaModel;
    }

    obtenerAgendaCompleta = async (req, res) => {
        try {
            const id_profesional = req.session.profesionalID;
            const fechaSeleccionada = new Date().toISOString().split('T')[0];

            const turnos = await this.agendaModel.obtenerTurnosPorFecha(fechaSeleccionada, id_profesional);
            
            res.render('agenda/agendaIndex', { turnos, fechaSeleccionada });
        } catch (error) {
            console.error('Error al obtener la agenda completa:', error);
            res.status(500).send('Error al obtener la agenda.');
        }
    }

    obtenerTurnosPorFecha = async (req, res) => {
        try {
            const id_profesional = req.session.profesionalID;
            const fechaSeleccionada = req.body.fecha;
            
            const turnos = await this.agendaModel.obtenerTurnosPorFecha(fechaSeleccionada, id_profesional);

            res.render('agenda/agendaIndex', { turnos, fechaSeleccionada });

        }catch(error) {
            console.error('Error al obtener los turnos por fecha:', error);
            res.status(500).send('Error al obtener los turnos por fecha.');
        }
    }

    /*obtenerTurnosPorFecha = async (req, res) => {
        try {
            const fechaSeleccionada = req.body.fecha;

            res.redirect(`/agenda?fecha=${fechaSeleccionada}`);
        } catch (error) {
            console.error('Error al obtener los turnos por fecha:', error);
            res.status(500).send('Error al obtener los turnos por fecha.');
        }
    }*/
}
