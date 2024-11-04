import { validateDatosPaciente } from '../schemas/consulta.js'

let motivoConsulta = "";

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
            req.session.consultaID = id_consulta;
            req.session.pacienteID = id_paciente;
            await this.consultaModel.actualizarEstadoTurno(id_turno);
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

            motivoConsulta = paciente.motivo;

            const historiaClinica = await this.consultaModel.obtenerHistoriasClinicasPaciente(id_paciente);

            const alergias = await this.consultaModel.obtenerAlergiasPaciente(id_paciente);

            res.render('consulta/consulta', { paciente, historiaClinica, id_profesional, alergias });
        } catch (error) {
            console.error(error);
            res.status(500).send('Error al mostrar datos de la consulta');
        }
    }

    finalizarConsulta = async (req, res) => {
        try {
            const datosValidados = validateDatosPaciente(req.body);
    
            if (!datosValidados.success) {
                return res.status(400).json({
                    success: false,
                    errors: datosValidados.error.errors, 
                });
            }    
            
            const id_paciente = req.session.pacienteID;
            const id_consulta = req.session.consultaID;
            const id_profesional = req.session.profesionalID;
            const historiaClinica = await this.consultaModel.crearHistoriaClinica(id_paciente, id_consulta, id_profesional, motivoConsulta);
            req.session.historiaClinicaID = historiaClinica.insertId;
            const id_historia_clinica = req.session.historiaClinicaID;
            
            await this.consultaModel.guardarEvolucionesPaciente(datosValidados.data.evoluciones, id_historia_clinica);
            
            datosValidados.data.diagnosticos.forEach(async (diagnostico) => {
                await this.consultaModel.guardarDiagnosticoPaciente(diagnostico.descripcion, diagnostico.estado, id_historia_clinica);
            });

            datosValidados.data.alergias.forEach(async (alergia) => {
                await this.consultaModel.guardarAlergiasPaciente(alergia.nombreAlergia, alergia.fechaAlergia, alergia.importanciaAlergia, id_historia_clinica);
            }); 

            datosValidados.data.antecedentesPatologicos.forEach(async (antecedente) => {
                await this.consultaModel.guardarAntecedentesPatologicosPaciente(antecedente.descripcionAntecedente, antecedente.fechaDesde, antecedente.fechaHasta, id_historia_clinica);
            });

            datosValidados.data.habitos.forEach(async (habito) => {
                await this.consultaModel.guardarHabitosPaciente(habito.descripcionHabito, habito.fechaDesde, habito.fechaHasta, id_historia_clinica);
            }); 

            datosValidados.data.medicamentos.forEach(async (medicamento) => {
                await this.consultaModel.guardarMedicamentosPaciente(medicamento.nombreMedicamento, medicamento.dosisMedicamento, medicamento.frecuenciaMedicamento, id_historia_clinica);
            }); 


            res.status(200).json({ success: true, message: 'Consulta finalizada exitosamente' });

        } catch (error) {
            console.error("Error en finalizarConsulta:", error);
            res.status(500).json({ success: false, message: 'Error al procesar la solicitud' });
        }
    };
    

}