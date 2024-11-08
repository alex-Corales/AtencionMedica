import connectDB from "../connection/connectionBD.js";

const connection = await connectDB();

export class HistoriaClinicaModel {

    static async obtenerEvolucionPorIDHistoriaClinica(id_historia_clinica) {
        const [evolucion] = await connection.query(`SELECT evoluciones.descripcion
                                                    FROM historias_clinicas
                                                    INNER JOIN evoluciones ON evoluciones.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                    WHERE historias_clinicas.id_historia_clinica = ?`, [id_historia_clinica]);
        return evolucion;
    }

    static async obtenerDiagnosticoPorIDHistoriaClinica(id_historia_clinica) {
        const [diagnostico] = await connection.query(`SELECT diagnosticos.descripcion, diagnosticos.tipo
                                                        FROM historias_clinicas
                                                        INNER JOIN diagnosticos ON diagnosticos.id_historia_clinica = historias_clinicas.id_historia_clinica
                                                        WHERE historias_clinicas.id_historia_clinica =  ?`, [id_historia_clinica]);
        return diagnostico;
    }

}