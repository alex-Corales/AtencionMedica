import { Router } from "express";

import { PacienteController } from "../controllers/paciente.js";

export const crearPacienteRouter = ({ pacienteModel }) => {
    const pacienteRouter = Router();

    const pacienteController = new PacienteController({ pacienteModel });

    pacienteRouter.get('/', pacienteController.paciente);
    pacienteRouter.post('/dni', pacienteController.obtenerPacientesPorDNI);
    pacienteRouter.get('/pacienteAgenda', async (req, res) => {
        const { id_paciente } = req.query;

        const pacientes = await pacienteModel.obtenerPacientePorId(id_paciente);

        const id_profesional = req.session.profesionalID;

        res.render('paciente/pacienteAgenda', { pacientes, id_profesional });
    })

    return pacienteRouter;
};