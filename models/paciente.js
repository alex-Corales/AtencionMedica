import connectDB from "../connection/connectionBD.js";

const connection = await connectDB();

export class PacienteModel {

    static async obtenerPacientesPorDNI(dni) {
        const [pacientes] = await connection.query(`SELECT consultas.fecha, 
                                                    historias_clinicas.motivo_consulta, 
                                                    d.descripcion_diagnosticos, 
                                                    d.tipos_diagnosticos, 
                                                    personas_profesional.nombre AS nombre_profesional, 
                                                    personas_profesional.apellido AS apellido_profesional, 
                                                    profesionales.id_profesional,
                                                    historias_clinicas.id_historia_clinica
                                                    FROM pacientes
                                                    INNER JOIN consultas ON consultas.id_paciente = pacientes.id_paciente
                                                    INNER JOIN personas AS personas_paciente ON personas_paciente.id_persona = pacientes.id_persona
                                                    INNER JOIN historias_clinicas ON historias_clinicas.id_paciente = pacientes.id_paciente
                                                    INNER JOIN profesionales ON profesionales.id_profesional = historias_clinicas.id_profesional
                                                    INNER JOIN personas AS personas_profesional ON personas_profesional.id_persona = profesionales.id_persona
                                                    LEFT JOIN (
                                                        SELECT id_historia_clinica, 
                                                            GROUP_CONCAT(descripcion SEPARATOR ', ') AS descripcion_diagnosticos, 
                                                            GROUP_CONCAT(tipo SEPARATOR ', ') AS tipos_diagnosticos
                                                        FROM diagnosticos
                                                        GROUP BY id_historia_clinica
                                                    ) d ON historias_clinicas.id_historia_clinica = d.id_historia_clinica
                                                    WHERE personas_paciente.documento = ?
                                                    GROUP BY consultas.fecha, 
                                                            historias_clinicas.motivo_consulta,
                                                            historias_clinicas.id_historia_clinica, 
                                                            d.descripcion_diagnosticos, 
                                                            d.tipos_diagnosticos, 
                                                            nombre_profesional, 
                                                            apellido_profesional`, [dni]);
        return pacientes.map(entry => {
            const descripciones = entry.descripcion_diagnosticos ? entry.descripcion_diagnosticos.split(', ') : [];
            const tipos = entry.tipos_diagnosticos ? entry.tipos_diagnosticos.split(', ') : [];

            const diagnosticos = descripciones.map((descripcion, index) => ({
                descripcion,
                tipo: tipos[index] || 'No especificado'
            }));

            return {
                id_profesional: entry.id_profesional,
                fecha: entry.fecha,
                nombre: entry.nombre_profesional,
                apellido: entry.apellido_profesional,
                motivo_consulta: entry.motivo_consulta,
                id_historia_clinica: entry.id_historia_clinica,
                diagnosticos
            };
        });
    }

}
