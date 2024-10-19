import connectDB from "../connection/connectionBD.js";

const connection = await connectDB();

export class ConsultaModel {

    static async crearConsulta(id_paciente, id_turno, fecha){
        const [consulta] = await connection.query(`INSERT INTO consultas (id_turno, id_paciente, fecha)
                                                    VALUES (?, ?, ?)`, [id_turno, id_paciente, fecha]);
        return consulta;
    }

    static async obtenerDatosPaciente(id_paciente){
        const [paciente] = await connection.query(`SELECT personas.nombre, personas.apellido, personas.fecha_nacimiento, personas.documento, pacientes.genero, turnos.estado, turnos.motivo
                                                    FROM consultas
                                                    INNER JOIN turnos ON consultas.id_turno = turnos.id_turno
                                                    INNER JOIN pacientes ON pacientes.id_paciente = turnos.id_paciente
                                                    INNER JOIN personas ON pacientes.id_persona = personas.id_persona
                                                    WHERE consultas.id_paciente = ?`, [id_paciente]);
        return paciente;
    }

}