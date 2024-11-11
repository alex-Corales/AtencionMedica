import fs from 'fs/promises';
import { validateDatosPaciente } from '../schemas/consulta.js'

let motivoConsulta = "";

const cargarAlergiasJson = async () => {
    try {
        const data = await fs.readFile('alergias.json', 'utf8');
        return JSON.parse(data);
    } catch (error) {
        console.error('Error al cargar el archivo JSON:', error);
        return [];
    }
};

export class ConsultaController {
    constructor({ consultaModel }) {
        this.consultaModel = consultaModel;
    }

    crearConsulta = async (req, res) => {
        try {
            const { id_paciente, id_turno } = req.body;
            const hoy = new Date();
            const fecha = hoy.toISOString().split('T')[0]; 
            const consulta = await this.consultaModel.crearConsulta(id_paciente, id_turno, fecha);
            const id_consulta = consulta.insertId;
            req.session.turnoID = id_turno;
            req.session.consultaID = id_consulta;
            req.session.pacienteID = id_paciente;
            await this.consultaModel.actualizarEstadoTurno(id_turno, 'Atendido');
            res.redirect(`/consulta?id_paciente=${id_paciente}&id_consulta=${id_consulta}`);
        } catch (error) {
            console.error(error);
            res.status(500).send('Error al crear la consulta');
        }
    }

    mostrarDatosConsulta = async (req, res) => {
        try {
            const { id_paciente, id_consulta } = req.query;
            const id_turno = req.session.turnoID;
    
            console.log(id_paciente, id_turno);
            const id_profesional = req.session.profesionalID;
    
            // Obtiene los datos del paciente
            const paciente = await this.consultaModel.obtenerDatosPaciente(id_paciente, id_turno);
            motivoConsulta = paciente.motivo;
    
            // Obtiene la historia clínica del paciente
            const historiaClinica = await this.consultaModel.obtenerHistoriasClinicasPaciente(id_paciente);
    
            // Obtiene las alergias del paciente
            const alergias = await this.consultaModel.obtenerAlergiasPaciente(id_paciente);
    
            // Carga las alergias JSON
            const alergiasJson = await cargarAlergiasJson();
    
            // Obtiene las plantillas médicas
            const plantillas = await this.consultaModel.obtenerPlantillas();
    
            // Renderiza la vista con todos los datos, incluyendo las plantillas
            res.render('consulta/consulta', { paciente, historiaClinica, id_profesional, alergias, alergiasJson, plantillas });
        } catch (error) {
            console.error(error);
            res.status(500).send('Error al mostrar datos de la consulta');
        }
    };
    

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
            
            await this.consultaModel.guardarEvolucionesPaciente(datosValidados.data.evolucion, id_historia_clinica);
            
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
    
    cancelarConsulta = async (req, res) => {
        try {
            
            await this.consultaModel.actualizarEstadoTurno(req.session.turnoID, 'Cancelado');
    
            res.status(200).json({ success: true, message: 'Consulta cancelada exitosamente' });
        } catch (error) {
            console.error("Error en cancelarConsulta:", error);
            res.status(500).json({ success: false, message: 'Error al cancelar la consulta' });
        }
    };
    

}