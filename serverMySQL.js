import { createApp } from "./app.js";

import { UsuarioModel } from "./models/usuario.js";
import { AgendaModel } from "./models/agenda.js";
import { ConsultaModel } from "./models/consulta.js"
import { ProfesionalModel } from "./models/profesional.js"

createApp({ usuarioModel: UsuarioModel, 
            agendaModel: AgendaModel, 
            consultaModel: ConsultaModel,
            profesionalModel: ProfesionalModel
         })
