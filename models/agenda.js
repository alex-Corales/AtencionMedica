import connectDB from "../connection/connectionBD.js";

const connecion = await connectDB();

export class AgendaModel {

    static async obtenerAgendaCompleta(id_profesional) {
        const [turnos] = await connecion.query('SELECT * FROM turnos INNER JOIN agendas ON turnos.id_agenda = agendas.id_agenda WHERE id_profesional = ?', [id_profesional]);
        return turnos;
    }

    static async obtenerTurnosPorFecha(fecha, id_profesional) {
        const [turnos] = await connecion.query('SELECT * FROM turnos INNER JOIN agendas ON turnos.id_agenda = agendas.id_agenda WHERE turnos.fecha = ? AND id_profesional = ?', [fecha, id_profesional]);
        return turnos;
    }

}
