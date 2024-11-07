import { Router } from "express";

import { PacienteController } from "../controllers/paciente.js";

export const crearPacienteRouter = ({ pacienteModel }) => {
    const pacienteRouter = Router();

    const pacienteController = new PacienteController({ pacienteModel });

    pacienteRouter.get('/', pacienteController.paciente);
    pacienteRouter.post('/dni', pacienteController.obtenerPacientesPorDNI); 

    return pacienteRouter;
};