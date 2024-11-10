import connectDB from "../connection/connectionBD.js";

export class ConsultaModel {

    static async crearConsulta(id_paciente, id_turno, fecha) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [consulta] = await connection.query(
                `INSERT INTO consultas (id_turno, id_paciente, fecha) VALUES (?, ?, ?)`, 
                [id_turno, id_paciente, fecha]
            );
            return consulta;
        } finally {
            connection.release();
        }
    }

    static async obtenerDatosPaciente(id_paciente) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [result] = await connection.query(
                `SELECT personas.nombre, personas.apellido, personas.fecha_nacimiento, personas.documento, pacientes.genero, turnos.estado, turnos.motivo
                 FROM consultas
                 INNER JOIN turnos ON consultas.id_turno = turnos.id_turno
                 INNER JOIN pacientes ON pacientes.id_paciente = turnos.id_paciente
                 INNER JOIN personas ON pacientes.id_persona = personas.id_persona
                 WHERE consultas.id_paciente = ? LIMIT 1`, 
                [id_paciente]
            );
            return result.length > 0 ? result[0] : null;
        } finally {
            connection.release();
        }
    }

    static async actualizarEstadoTurno(id_turno, estado) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [update] = await connection.query(
                `UPDATE consultas
                 INNER JOIN turnos ON turnos.id_turno = consultas.id_turno
                 SET turnos.estado = ?
                 WHERE turnos.id_turno = ?`, 
                [estado, id_turno]
            );
            return update;
        } finally {
            connection.release();
        }
    }

    static async obtenerHistoriasClinicasPaciente(id_paciente) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [historiaClinica] = await connection.query(
                `SELECT consultas.fecha, 
                        personas.nombre, 
                        personas.apellido, 
                        historias_clinicas.motivo_consulta, 
                        d.descripcion_diagnosticos, 
                        d.tipos_diagnosticos,
                        profesionales.id_profesional
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
                          d.descripcion_diagnosticos, d.tipos_diagnosticos;`, 
                [id_paciente]
            );

            return historiaClinica.map(entry => {
                const descripciones = entry.descripcion_diagnosticos ? entry.descripcion_diagnosticos.split(', ') : [];
                const tipos = entry.tipos_diagnosticos ? entry.tipos_diagnosticos.split(', ') : [];

                const diagnosticos = descripciones.map((descripcion, index) => ({
                    descripcion,
                    tipo: tipos[index] || 'No especificado'
                }));

                return {
                    id_profesional: entry.id_profesional,
                    fecha: entry.fecha,
                    nombre: entry.nombre,
                    apellido: entry.apellido,
                    motivo_consulta: entry.motivo_consulta,
                    diagnosticos
                };
            });
        } finally {
            connection.release();
        }
    }

    static async obtenerAlergiasPaciente(id_paciente) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [alergias] = await connection.query(
                `SELECT alergias.nombre, alergias.fecha_desde, alergias.fecha_hasta, alergias.importancia
                 FROM consultas 
                 INNER JOIN historias_clinicas ON historias_clinicas.id_consulta = consultas.id_consulta
                 LEFT JOIN alergias ON alergias.id_historia_clinica = historias_clinicas.id_historia_clinica
                 WHERE consultas.id_paciente = ?`, 
                [id_paciente]
            );
            return alergias;
        } finally {
            connection.release();
        }
    }

    static async crearHistoriaClinica(id_paciente, id_consulta, id_profesional, motivo_consulta) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [historiaClinica] = await connection.query(
                `INSERT INTO historias_clinicas (id_paciente, id_consulta, id_profesional, motivo_consulta)
                 VALUES (?, ?, ?, ?)`, 
                [id_paciente, id_consulta, id_profesional, motivo_consulta]
            );
            return historiaClinica;
        } finally {
            connection.release();
        }
    }

    static async guardarEvolucionesPaciente(evolucion, id_historia_clinica) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            await connection.query(
                `INSERT INTO evoluciones (descripcion, id_historia_clinica)
                 VALUES (?, ?)`, 
                [evolucion, id_historia_clinica]
            );
        } finally {
            connection.release();
        }
    }

    static async guardarDiagnosticoPaciente(descripcion, tipo, id_historia_clinica) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            await connection.query(
                `INSERT INTO diagnosticos (descripcion, tipo, id_historia_clinica)
                 VALUES (?, ?, ?)`, 
                [descripcion, tipo, id_historia_clinica]
            );
        } finally {
            connection.release();
        }
    }

    static async guardarAlergiasPaciente(nombre, fecha_desde, importancia, id_historia_clinica) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            await connection.query(
                `INSERT INTO alergias (nombre, fecha_desde, importancia, id_historia_clinica)
                 VALUES (?, ?, ?, ?)`, 
                [nombre, fecha_desde, importancia, id_historia_clinica]
            );
        } finally {
            connection.release();
        }
    }

    static async guardarAntecedentesPatologicosPaciente(descripcion, fecha_desde, fecha_hasta, id_historia_clinica) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            await connection.query(
                `INSERT INTO antecedentes_patologicos (descripcion, fecha_desde, fecha_hasta, id_historia_clinica)
                 VALUES (?, ?, ?, ?)`, 
                [descripcion, fecha_desde, fecha_hasta, id_historia_clinica]
            );
        } finally {
            connection.release();
        }
    }

    static async guardarHabitosPaciente(descripcion, fecha_desde, fecha_hasta, id_historia_clinica) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            await connection.query(
                `INSERT INTO habitos (descripcion, fecha_desde, fecha_hasta, id_historia_clinica)
                 VALUES (?, ?, ?, ?)`, 
                [descripcion, fecha_desde, fecha_hasta, id_historia_clinica]
            );
        } finally {
            connection.release();
        }
    }

    static async guardarMedicamentosPaciente(nombre, dosis, frecuencia, id_historia_clinica) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            await connection.query(
                `INSERT INTO medicamentos (nombre, dosis, frecuencia, id_historia_clinica)
                 VALUES (?, ?, ?, ?)`, 
                [nombre, dosis, frecuencia, id_historia_clinica]
            );
        } finally {
            connection.release();
        }
    }
}
