export class ConsultaController {
    constructor({ consultaModel }){
        this.consultaModel = consultaModel;
    }

    crearConsulta = async (req, res) => {
        const {id_paciente, id_turno} = req.body;
        const fecha = '2024-10-19'
        const consulta = await this.consultaModel.crearConsulta(id_paciente, id_turno, fecha);
        console.log(consulta);
        res.json(consulta);
    }

    mostrarDatosConsulta = async (req, res) => {
        const { id_paciente, id_turno } = req.body;
        const paciente = await this.consultaModel.obtenerDatosPaciente(id_paciente);
        console.log(paciente);
        res.json(paciente);
    }

}