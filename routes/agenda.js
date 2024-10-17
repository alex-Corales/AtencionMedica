import { Router } from "express";
import { AgendaController } from "../controllers/agenda.js";

export const crearAgendaRouter = ({ agendaModel }) => {
    const agendaRouter = Router();

    const agendaController = new AgendaController({ agendaModel });

    agendaRouter.get('/', agendaController.obtenerAgendaCompleta);

    // POST para cuando se selecciona una nueva fecha
    agendaRouter.post('/fecha', agendaController.obtenerTurnosPorFecha);


    return agendaRouter;
}