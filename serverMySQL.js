import { createApp } from "./app.js";

import { UsuarioModel } from "./models/usuario.js";
import { AgendaModel } from "./models/agenda.js";

createApp({ usuarioModel: UsuarioModel, agendaModel: AgendaModel })
