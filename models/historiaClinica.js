import connectDB from "../connection/connectionBD.js";

const connection = await connectDB();

export class HistoriaClinicaModel {

    static async obtenerPacientePorIDHistoriaClinica(id_historia_clinica) {
        const [pacientes] = await connection.query(`SELECT personas.nombre, personas.apellido, personas.fecha_nacimiento, personas.documento, pacientes.genero, historias_clinicas.motivo_consulta
                                                    FROM pacientes
                                                    INNER JOIN personas ON personas.id_persona = pacientes.id_persona
                                                    INNER JOIN historias_clinicas ON historias_clinicas.id_paciente = pacientes.id_paciente
                                                    WHERE historias_clinicas.id_historia_clinica = ?`, [id_historia_clinica]);
        
        return pacientes.length > 0 ? pacientes[0] : null;
    }

    static async obtenerEvolucionPorIDHistoriaClinica(id_historia_clinica) {
        const [evolucion] = await connection.query(`SELECT evoluciones.descripcion
                                                    FROM historias_clinicas
                                                    INNER JOIN evoluciones ON evoluciones.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                    WHERE historias_clinicas.id_historia_clinica = ?`, [id_historia_clinica]);
        return evolucion.length > 0 ? evolucion[0] : null;
    }

    static async obtenerDiagnosticoPorIDHistoriaClinica(id_historia_clinica) {
        const [diagnostico] = await connection.query(`SELECT diagnosticos.descripcion, diagnosticos.tipo
                                                        FROM historias_clinicas
                                                        INNER JOIN diagnosticos ON diagnosticos.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                        WHERE historias_clinicas.id_historia_clinica =  ?`, [id_historia_clinica]);
        return diagnostico;
    }

    static async obtenerAlergiasPorIDHistoriaClinica(id_historia_clinica) {
        const [alergias] = await connection.query(`SELECT alergias.nombre, alergias.fecha_desde, alergias.fecha_hasta, alergias.importancia
                                                    FROM historias_clinicas
                                                    INNER JOIN alergias ON alergias.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                    WHERE historias_clinicas.id_historia_clinica =  ?`, [id_historia_clinica]);
        return alergias;
    }

    static async obtenerAntecedentesPatologicosPorIDHistoriaClinica(id_historia_clinica) {
        const [antecedentes] = await connection.query(`SELECT antecedentes_patologicos.descripcion, antecedentes_patologicos.fecha_desde, antecedentes_patologicos.fecha_hasta
                                                        FROM historias_clinicas
                                                        INNER JOIN antecedentes_patologicos ON antecedentes_patologicos.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                        WHERE historias_clinicas.id_historia_clinica =  ?`, [id_historia_clinica]);
        return antecedentes;
    }

    static async obtenerHabitosPorIDHistoriaClinica(id_historia_clinica) {
        const [habitos] = await connection.query(`SELECT habitos.descripcion, habitos.fecha_desde, habitos.fecha_hasta
                                                    FROM historias_clinicas
                                                    INNER JOIN habitos ON habitos.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                    WHERE historias_clinicas.id_historia_clinica =  ?`, [id_historia_clinica]);
        return habitos;
    }

    static async obtenerMedicamentosPorIDHistoriaClinica(id_historia_clinica) {
        const [medicamentos] = await connection.query(`SELECT medicamentos.nombre, medicamentos.dosis, medicamentos.frecuencia
                                                        FROM historias_clinicas
                                                        INNER JOIN medicamentos ON medicamentos.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                        WHERE historias_clinicas.id_historia_clinica =  ?`, [id_historia_clinica]);
        return medicamentos;
    }
}