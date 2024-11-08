import { Router } from "express";

import { HistoriaClinicaController } from "../controllers/historiaClinica.js";

export const crearHistoriaClinicaRouter = ({ historiaClinicaModel }) => {
    const historiaClinicaRouter = Router();

    const historiaClinicaController = new HistoriaClinicaController({ historiaClinicaModel });

    historiaClinicaRouter.post('/', historiaClinicaController.mostrarHistoriaClinica);

    return historiaClinicaRouter;
}