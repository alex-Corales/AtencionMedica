import { Router } from 'express';
import { UsuarioController } from '../controllers/usuario.js';

export const crearUsarioRouter = ({ usuarioModel }) => {
    const usuarioRouter = Router();

    const usuarioController = new UsuarioController({ usuarioModel });

    usuarioRouter.post('/login', usuarioController.login);
    usuarioRouter.get('/dashboard', usuarioController.dashboard);
    usuarioRouter.get('/logout', usuarioController.logout);

    return usuarioRouter;
}

