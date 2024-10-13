export class PersonaController {
    constructor ({ personaModel }) {
        this.personaModel = personaModel
    }

    obtenerPersonas = async (req, res) => {
        const personas = await this.personaModel.obtenerPersonas();

        res.json(personas);
    }

    insertarPersona = async (req, res) => {
        const persona = {
            documento: '42125791',
            nombre: 'Alex',
            apellido: 'Corales',
            fecha_nacimiento: '2000-01-11',
            email: 'alexcorales2@gmail.com',
            telefono: '2664212760',
            direccion: 'Barrio serranias puntanas mnz 171 casa 18'
        }

        console.log(persona)

        const personaGuardada = await this.personaModel.insertarPersona({ persona });
        res.json(personaGuardada);  
    }
}