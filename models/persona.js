import connectDB from '../connection/connectionBD.js'

const connecion = await connectDB()

export class PersonaModel {

    // CRUD
    // Obertener todas las personas de la base de datos
    static async obtenerPersonas() {
        const [personas] = await connecion.query('SELECT * FROM personas')
        return personas
    }

    static async insertarPersona({ persona }) {
        const [idPersona] = await connecion.query('INSERT INTO personas SET ?', [persona])
        return idPersona
    }

}