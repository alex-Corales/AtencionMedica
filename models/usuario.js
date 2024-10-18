import connectDB from "../connection/connectionBD.js";

const connecion = await connectDB();

export class UsuarioModel {
    // Obertener un usuario de la base de datos para autenticarse
    static async obtenerUsuarioContraseña({ mail, password } ){
        const [usuario] = await connecion.query(`SELECT * 
                                                FROM usuarios 
                                                WHERE email = ? AND password = ?`, [mail, password]);
        return usuario
    }

    static async obtenerIdProfesionalAsociadoUsuario(id_usuario){
        const [usuario] = await connecion.query(`SELECT id_profesional 
                                                FROM usuarios
                                                INNER JOIN profesionales ON profesionales.id_usuario = usuarios.id_usuario
                                                WHERE usuarios.id_usuario = ?`, [id_usuario]);
        return usuario;
    }
}
