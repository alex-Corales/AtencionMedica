import express from 'express';
import { createPersonaRouter } from './routes/personas.js';

export const createApp = ({ personaModel }) => {
    const app = express();
    const PORT = process.env.PORT || 3000;

    app.use('/personas', createPersonaRouter({ personaModel }));

    app.listen(PORT, () => {
        console.log(`Servidor corriendo en http://localhost:${PORT}`);
    });
}