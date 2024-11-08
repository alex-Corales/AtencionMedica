import express from 'express';
import session from 'express-session';
import bodyParser from 'body-parser';
import path from 'path';
import { fileURLToPath } from 'url';

import dotenv from 'dotenv';
dotenv.config();

import { crearUsarioRouter } from './routes/usuario.js';
import { crearAgendaRouter } from './routes/agenda.js';
import { crearConsultaRouter } from './routes/consulta.js';
import { crearPacienteRouter } from './routes/paciente.js';
import { crearHistoriaClinicaRouter } from './routes/historiaClinica.js';

export const createApp = ({ usuarioModel, agendaModel, consultaModel, profesionalModel, pacienteModel, historiaClinicaModel }) => {
    const app = express();
    const PORT = process.env.PORT || 3000;

    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);;

    app.use(express.static(path.join(__dirname, 'public')));
    app.use(express.static('public'));

    // Confirar pug
    app.set('view engine', 'pug');
    app.set('views', './views');

    // Middlewares
    app.use(express.urlencoded({ extended: true }));
    app.use(bodyParser.urlencoded({ extended: true }));
    app.use(session({
        secret: process.env.SESSION_SECRET || 'defaultSecret',
        resave: false,
        saveUninitialized: false,
        cookie: { secure: false } // Cambia a 'true' si usas HTTPS
    }));    
    app.use(express.json());

    // Pagina principal
    app.get('/', (req, res) => {
        if(req.session.loggedIn) {
            return res.redirect('/agenda');
        }
        res.render('login/login', { title: 'Inicio de Sesion' });
    });

    // Rutas
    app.use('/usuario', crearUsarioRouter({ usuarioModel }));
    app.use('/agenda', crearAgendaRouter({ agendaModel }));
    app.use('/consulta', crearConsultaRouter({ consultaModel }));
    app.use('/paciente', crearPacienteRouter({ pacienteModel }));
    app.use('/historiaClinica', crearHistoriaClinicaRouter({ historiaClinicaModel }));

    // Servidor
    app.listen(PORT, () => {
        console.log(`Servidor corriendo en http://localhost:${PORT}`);
    });
}