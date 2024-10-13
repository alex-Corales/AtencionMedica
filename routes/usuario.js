import { Router } from 'express';
import { UsuarioController } from '../controllers/usuarios.js';

export const crearUsarioRouter = ({ usuarioModel }) => {
    const usuarioRouter = Router();

    const usuarioController = new UsuarioController({ usuarioModel });

    // Simulando una base de datos de usuarios
    const users = {
        'admin': 'password123',
    };

    // Ruta para manejar el inicio de sesión
    usuarioRouter.post('/login', (req, res) => {
        const { username, password } = req.body;

        // Validar usuario y contraseña
        if (users[username] && users[username] === password) {
            req.session.loggedIn = true;
            req.session.username = username;
            return res.redirect('/auth/dashboard');
        } else {
            res.render('login/login', { error: 'Usuario o contraseña incorrectos' });
        }
    });

    // Ruta para el dashboard (requiere estar autenticado)
    usuarioRouter.get('/dashboard', (req, res) => {
        if (req.session.loggedIn) {
            res.render('index', { username: req.session.username });
        } else {
            res.redirect('/');
        }
    });

    // Ruta para cerrar sesión
    usuarioRouter.get('/logout', (req, res) => {
        req.session.destroy();
        res.redirect('/');
    });

    return usuarioRouter;
}

