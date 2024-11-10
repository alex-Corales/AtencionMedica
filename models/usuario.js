import connectDB from "../connection/connectionBD.js";

export class UsuarioModel {

    // Obtener un usuario de la base de datos para autenticarse
    static async obtenerUsuarioContraseña({ mail, password }) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [usuario] = await connection.query(
                `SELECT * 
                 FROM usuarios 
                 WHERE email = ? AND password = ?`, 
                [mail, password]
            );
            return usuario;
        } finally {
            connection.release();
        }
    }

    static async obtenerIdProfesionalAsociadoUsuario(id_usuario) {
        const pool = connectDB();
        const connection = await pool.getConnection();
        try {
            const [usuario] = await connection.query(
                `SELECT id_profesional, id_persona 
                 FROM usuarios
                 INNER JOIN profesionales ON profesionales.id_usuario = usuarios.id_usuario
                 WHERE usuarios.id_usuario = ?`, 
                [id_usuario]
            );
            return usuario;
        } finally {
            connection.release();
        }
    }
}
