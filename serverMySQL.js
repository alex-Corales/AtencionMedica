import { createApp } from "./app.js";

import { PersonaModel } from "./models/persona.js";
import { UsuarioModel } from "./models/usuario.js";

createApp({ personaModel: PersonaModel, usuarioModel: UsuarioModel })
