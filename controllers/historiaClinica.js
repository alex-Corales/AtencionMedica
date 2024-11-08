export class HistoriaClinicaController {
    constructor({ historiaClinicaModel }) {
        this.historiaClinicaModel = historiaClinicaModel;
    }

    mostrarHistoriaClinica = async (req, res) => {
        const { id_historia_clinica } = req.body;
        const historiaClinica = [];

        const paciente = await this.historiaClinicaModel.obtenerPacientePorIDHistoriaClinica(id_historia_clinica);
        const evolucion = await this.historiaClinicaModel.obtenerEvolucionPorIDHistoriaClinica(id_historia_clinica);
        const diagnostico = await this.historiaClinicaModel.obtenerDiagnosticoPorIDHistoriaClinica(id_historia_clinica);
        const alergias = await this.historiaClinicaModel.obtenerAlergiasPorIDHistoriaClinica(id_historia_clinica);
        const antecedentes = await this.historiaClinicaModel.obtenerAntecedentesPatologicosPorIDHistoriaClinica(id_historia_clinica);
        const habitos = await this.historiaClinicaModel.obtenerHabitosPorIDHistoriaClinica(id_historia_clinica);
        const medicamentos = await this.historiaClinicaModel.obtenerMedicamentosPorIDHistoriaClinica(id_historia_clinica);

        console.log(paciente);
        //res.json(paciente)
        res.render('historiaClinica/historiaClinica', { paciente });

        //historiaClinica.push({evolucion, diagnostico, alergias, antecedentes, habitos, medicamentos});
    }

}