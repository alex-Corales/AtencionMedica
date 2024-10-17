import connectDB from "../connection/connectionBD.js";

const connecion = await connectDB();

export class UsuarioModel {
    // Obertener un usuario de la base de datos para autenticarse
    static async obtenerUsuarioContraseña({ mail, password } ){
        const [usuario] = await connecion.query('SELECT * FROM usuarios WHERE email = ? AND password = ?', [mail, password]);
        return usuario
    }
}
