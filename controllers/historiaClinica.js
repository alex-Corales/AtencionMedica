import striptags from 'striptags';

export class HistoriaClinicaController {
    constructor({ historiaClinicaModel }) {
        this.historiaClinicaModel = historiaClinicaModel;
    }

    mostrarHistoriaClinica = async (req, res) => {
        const { id_historia_clinica } = req.body;

        const paciente = await this.historiaClinicaModel.obtenerPacientePorIDHistoriaClinica(id_historia_clinica);
        const evolucion = await this.historiaClinicaModel.obtenerEvolucionPorIDHistoriaClinica(id_historia_clinica);
        const diagnosticos = await this.historiaClinicaModel.obtenerDiagnosticoPorIDHistoriaClinica(id_historia_clinica);
        const alergias = await this.historiaClinicaModel.obtenerAlergiasPorIDHistoriaClinica(id_historia_clinica);
        const antecedentes = await this.historiaClinicaModel.obtenerAntecedentesPatologicosPorIDHistoriaClinica(id_historia_clinica);
        const habitos = await this.historiaClinicaModel.obtenerHabitosPorIDHistoriaClinica(id_historia_clinica);
        const medicamentos = await this.historiaClinicaModel.obtenerMedicamentosPorIDHistoriaClinica(id_historia_clinica);

        res.render('historiaClinica/historiaClinica', { paciente, evolucion, diagnosticos, alergias, antecedentes, habitos, medicamentos });

    }

}
