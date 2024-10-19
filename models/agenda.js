import connectDB from "../connection/connectionBD.js";

const connecion = await connectDB();

export class AgendaModel {

    static async obtenerAgendaCompleta(id_profesional) {
        const [turnos] = await connecion.query(`SELECT * 
                                                FROM agendas 
                                                INNER JOIN turnos ON turnos.id_agenda = agendas.id_agenda 
                                                WHERE id_profesional = ?`, [id_profesional]);
        return turnos;
    }

    static async obtenerTurnosPorFecha(fecha, id_profesional) {
        const [turnos] = await connecion.query(`SELECT turnos.hora, personas.nombre, turnos.motivo, turnos.estado, pacientes.id_paciente, turnos.id_turno
                                                FROM agendas
                                                INNER JOIN turnos ON turnos.id_agenda = agendas.id_agenda
                                                INNER JOIN pacientes ON turnos.id_paciente = pacientes.id_paciente
                                                INNER JOIN personas ON pacientes.id_persona = personas.id_persona
                                                WHERE turnos.fecha = ? AND id_profesional = ?`, [fecha, id_profesional]);
        return turnos;
    }

}
