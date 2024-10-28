import connectDB from "../connection/connectionBD.js";

const connection = await connectDB();

export class ConsultaModel {

    static async crearConsulta(id_paciente, id_turno, fecha) {
        const [consulta] = await connection.query(`INSERT INTO consultas (id_turno, id_paciente, fecha)
                                                    VALUES (?, ?, ?)`, [id_turno, id_paciente, fecha]);
        return consulta;
    }

    static async obtenerDatosPaciente(id_paciente) {
        const [result] = await connection.query(`SELECT personas.nombre, personas.apellido, personas.fecha_nacimiento, personas.documento, pacientes.genero, turnos.estado, turnos.motivo
                                                 FROM consultas
                                                 INNER JOIN turnos ON consultas.id_turno = turnos.id_turno
                                                 INNER JOIN pacientes ON pacientes.id_paciente = turnos.id_paciente
                                                 INNER JOIN personas ON pacientes.id_persona = personas.id_persona
                                                 WHERE consultas.id_paciente = ? LIMIT 1`, [id_paciente]);
    
        return result.length > 0 ? result[0] : null;
    }
    

    static async actualizarEstadoTurno(id_turno) {
        const [update] = await connection.query(`UPDATE consultas
                                                INNER JOIN turnos ON turnos.id_turno = consultas.id_turno
                                                SET turnos.estado = "Atendido"
                                                WHERE turnos.id_turno = ?`, [id_turno]);
        return update;
    }

    static async obtenerHistoriasClinicasPaciente(id_paciente){
        const [historiaClinica] = await connection.query(`SELECT consultas.fecha, 
                                                        personas.nombre, 
                                                        personas.apellido, 
                                                        historias_clinicas.motivo_consulta, 
                                                        d.descripcion_diagnosticos, 
                                                        d.tipos_diagnosticos
                                                        FROM consultas
                                                        INNER JOIN historias_clinicas ON historias_clinicas.id_paciente = consultas.id_paciente
                                                        INNER JOIN profesionales ON historias_clinicas.id_profesional = profesionales.id_profesional
                                                        INNER JOIN personas ON profesionales.id_persona = personas.id_persona
                                                        LEFT JOIN (
                                                            SELECT id_historia_clinica, 
                                                                GROUP_CONCAT(descripcion SEPARATOR ', ') AS descripcion_diagnosticos, 
                                                                GROUP_CONCAT(tipo SEPARATOR ', ') AS tipos_diagnosticos
                                                            FROM diagnosticos
                                                            GROUP BY id_historia_clinica
                                                        ) d ON historias_clinicas.id_historia_clinica = d.id_historia_clinica
                                                        WHERE consultas.id_paciente = ?
                                                        GROUP BY consultas.fecha, personas.nombre, personas.apellido, historias_clinicas.motivo_consulta, 
                                                        d.descripcion_diagnosticos, d.tipos_diagnosticos;`, [id_paciente]);
        return historiaClinica;
    }

    static async obtenerAlergiasPaciente(id_paciente){
        const [alergias] = await connection.query(`SELECT alergias.nombre, alergias.fecha_desde, alergias.fecha_hasta, alergias.importancia
                                                    FROM consultas 
                                                    INNER JOIN historias_clinicas ON historias_clinicas.id_consulta = consultas.id_consulta
                                                    LEFT JOIN alergias ON alergias.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                    WHERE consultas.id_paciente = ?`, [id_paciente]);
        return alergias;
    }

    /**
     * 
     * @param {number} id_paciente 
     * @param {number} id_profesional 
     * @returns {array} Un array de objetos
     */
    static async obtenerAntecentesPatologicosPaciente(id_paciente, id_profesional){
        const [antecedentesPatologicos] = await connection.query(``);
        return antecedentesPatologicos;
    }

}