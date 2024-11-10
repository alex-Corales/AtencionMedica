import 'dotenv/config';

import { createApp } from "./app.js";


import { UsuarioModel } from "./models/usuario.js";
import { AgendaModel } from "./models/agenda.js";
import { ConsultaModel } from "./models/consulta.js"
import { PacienteModel } from "./models/paciente.js";
import { HistoriaClinicaModel } from "./models/historiaClinica.js";

createApp({ usuarioModel: UsuarioModel, 
            agendaModel: AgendaModel, 
            consultaModel: ConsultaModel,
            pacienteModel: PacienteModel,
            historiaClinicaModel: HistoriaClinicaModel
         })
