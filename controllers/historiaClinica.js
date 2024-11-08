export class HistoriaClinicaController {
    constructor({ historiaClinicaModel }) {
        this.historiaClinicaModel = historiaClinicaModel;
    }

    mostrarHistoriaClinica = async (req, res) => {
        const { id_historia_clinica } = req.body;
        const historiaClinica = [];

        const evolucion = await this.historiaClinicaModel.obtenerEvolucionPorIDHistoriaClinica(id_historia_clinica);
        const diagnostico = await this.historiaClinicaModel.obtenerDiagnosticoPorIDHistoriaClinica(id_historia_clinica);

        historiaClinica.push({evolucion, diagnostico});

        res.json(historiaClinica);
    }

}