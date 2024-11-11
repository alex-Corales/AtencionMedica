export class PacienteController {
    constructor({ pacienteModel }) {
        this.pacienteModel = pacienteModel;
    }

    paciente = async (req, res) => {
        try {
            res.render('paciente/pacienteIndex');
        } catch (error) {
            
        }
    }

    obtenerPacientesPorDNI = async (req, res) => {
        try {
            const dni = req.body.dni;
            const pacientes = await this.pacienteModel.obtenerPacientesPorDNI(dni);

            console.log(pacientes);
            
            res.render('paciente/paciente', { pacientes, id_profesional: req.session.profesionalID });
        } catch (error) {

        }
    }    
}