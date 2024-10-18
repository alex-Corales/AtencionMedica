import { Router } from "express";

import { ProfesionalController } from "../controllers/profesional";

export const crearProfesionalRouter = ({ profesionalModel }) => {
    
    const profesionalRouter = Router();

    const profesionalController = new ProfesionalController({ profesionalModel });

    profesionalRouter.get('/');

    return profesionalRouter;
}