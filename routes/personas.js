import { Router } from "express";   
import { PersonaController } from "../controllers/personas.js";

export const createPersonaRouter = ({ personaModel }) => {
    const personasRouter = Router();

    const personaController = new PersonaController({ personaModel });

    personasRouter.get('/obtener', personaController.obtenerPersonas);
    personasRouter.get('/insertar', personaController.insertarPersona); 

    return personasRouter;
}