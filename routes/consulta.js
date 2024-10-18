import { Router } from 'express';

import { ConsultaController } from '../controllers/consulta.js'

export const crearConsultaRouter = ({ consultaModel }) => {

    const consultaRouter = Router();

    const consultaController = new ConsultaController({ consultaModel });

    consultaRouter.post('/', (req, res) => {
        const paciente = {
            nombre: "Juan Pérez",
            edad: 45,
            sexo: "Masculino",
            numeroHistoriaClinica: "123456",
            telefono: "(123) 456-7890",
            email: "juan.perez@example.com",
            direccion: "Calle Falsa 123, Ciudad"
        };
        const evoluciones = [
            { fecha: '2023-09-15', motivo: 'Dolor de cabeza', id: 1, detalle: 'Mejoría con tratamiento' },
            { fecha: '2023-08-20', motivo: 'Control de diabetes', id: 2, detalle: 'Controlado' }
        ];
        const diagnosticos = {
            1: { descripcion: 'Migraña' },
            2: { descripcion: 'Diabetes tipo II' }
        };
        const alergias = [
            { nombre: 'Penicilina', importancia: 'Alta' }
        ];
        const antecedentes = [
            { descripcion: 'Hipertensión' }
        ];
        const habitos = [
            { descripcion: 'Fumador (5 cigarrillos/día)' }
        ];
        const medicamentos = [
            { nombre: 'Losartán' }
        ];
        
        res.render('consulta/consulta', {
            paciente,
            evoluciones,
            diagnosticos,
            alergias,
            antecedentes,
            habitos,
            medicamentos
        });
    });
    

    return consultaRouter;

} 