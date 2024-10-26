export class ConsultaController {
    constructor({ consultaModel }) {
        this.consultaModel = consultaModel;
    }

    crearConsulta = async (req, res) => {
        try {
            const { id_paciente, id_turno } = req.body;
            const fecha = '2024-10-19'
            const consulta = await this.consultaModel.crearConsulta(id_paciente, id_turno, fecha);
            const id_consulta = consulta.insertId;
            const actuzalizacionEstado = await this.consultaModel.actualizarEstadoTurno(id_turno);
            res.redirect(`/consulta?id_paciente=${id_paciente}&id_consulta=${id_consulta}`);
        } catch (error) {
            console.error(error);
            res.status(500).send('Error al crear la consulta');
        }
    }

    mostrarDatosConsulta = async (req, res) => {
        try {
            const { id_paciente, id_consulta } = req.query;
            const id_profesional = req.session.profesionalID;

            const paciente = await this.consultaModel.obtenerDatosPaciente(id_paciente);

            const historiaClinica = await this.consultaModel.obtenerHistoriasClinicasPaciente(id_paciente);

            const alergias = await this.consultaModel.obtenerAlergiasPaciente(id_paciente);
            
            console.log(alergias);

            res.render('consulta/consulta', { paciente, historiaClinica, id_profesional, alergias });
        }catch(error) {
            console.error(error);
            res.status(500).send('Error al mostrar datos de la consulta');
        }
    }

}