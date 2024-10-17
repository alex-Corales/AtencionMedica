import { Router } from "express";
import { AgendaController } from "../controllers/agenda.js";

export const crearAgendaRouter = ({ agendaModel }) => {
    const agendaRouter = Router();

    const agendaController = new AgendaController({ agendaModel });

    agendaRouter.get('/', agendaController.obtenerAgendaCompleta);
    agendaRouter.post('/fecha', agendaController.obtenerTurnosPorFecha);


    return agendaRouter;
}