import { Router } from 'express';

import { ConsultaController } from '../controllers/consulta.js'

export const crearConsultaRouter = ({ consultaModel }) => {

    const consultaRouter = Router();

    const consultaController = new ConsultaController({ consultaModel });

    consultaRouter.post('/', consultaController.crearConsulta);
    consultaRouter.get('/', consultaController.mostrarDatosConsulta);
    consultaRouter.post('/finalizarConsulta', consultaController.finalizarConsulta);
    consultaRouter.post('/cancelarConsulta', consultaController.cancelarConsulta);

    return consultaRouter;

} 