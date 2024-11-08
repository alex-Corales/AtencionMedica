export class HistoriaClinicaController {
    constructor({historiaClinicaModel}) {
        this.historiaClinicaModel = historiaClinicaModel;
    }

    mostrarHistoriaClinica = async (req, res) => {
        const { id_historia_clinica } = req.body;
        console.log(id_historia_clinica);
        res.json(id_historia_clinica);
    }

}