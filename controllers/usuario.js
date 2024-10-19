export class UsuarioController {
    constructor({ usuarioModel }) {
        this.usuarioModel = usuarioModel
    }

    login = async (req, res) => {
        try {
            const { mail, password } = req.body
            const [user] = await this.usuarioModel.obtenerUsuarioContraseña({ mail, password })

            if (user && user.email === mail && user.password === password) {
                req.session.loggedIn = true;
                req.session.username = mail;
                req.session.userID = user.id_usuario;
                const [auxUser] = await this.usuarioModel.obtenerIdProfesionalAsociadoUsuario(req.session.userID);
                req.session.profesionalID = auxUser.id_profesional;
                return res.redirect('/usuario/dashboard')
            } else {
                res.render('login/login', { error: 'Usuario o contraseña incorrectos' })
            }
        } catch (error) {
            console.error(error);
            res.status(500).send('Error al iniciar sesion');
        }
    }

    dashboard = (req, res) => {
        if (req.session.loggedIn) {
            res.redirect('/agenda')
        } else {
            res.redirect('/')
        }
    }

    logout = (req, res) => {
        req.session.destroy()
        res.redirect('/')
    }
}
