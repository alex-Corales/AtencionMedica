export class UsuarioController {
    constructor ({ usuarioModel }) {
        this.usuarioModel = usuarioModel
    }

    login = async (req, res) => {
        const { mail, password } = req.body
        const [user] = await this.usuarioModel.obtenerUsuarioContraseña({ mail, password })

        if(user && user.email === mail && user.password === password){
            req.session.loggedIn = true
            req.session.username = mail
            req.session.userID = user.id_usuario
            return res.redirect('/usuario/dashboard')
        } else {
            res.render('login/login', { error: 'Usuario o contraseña incorrectos' })
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
