export class ConsultaController {
    constructor({ consultaModel }){
        this.consultaModel = consultaModel;
    }

    crearConsulta = async (req, res) => {
        const {id_paciente, id_turno} = req.body;
        const fecha = '2024-10-19'
        const consulta = await this.consultaModel.crearConsulta(id_paciente, id_turno, fecha);
        const actuzalizacionEstado = await this.consultaModel.actualizarEstadoTurno(id_turno);
        res.redirect(`/consulta?id_paciente=${id_paciente}`);
    }

    mostrarDatosConsulta = async (req, res) => {
        const { id_paciente } = req.query;
        const paciente = await this.consultaModel.obtenerDatosPaciente(id_paciente);
        const historiaClinica = await this.consultaModel.obtenerHistoriaClinicaPaciente(id_paciente);
        console.log(historiaClinica)
        res.render('consulta/consulta', { paciente, historiaClinica });
    }

}