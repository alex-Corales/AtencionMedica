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
            return res.redirect('/usuarios/dashboard')
        } else {
            res.render('login/login', { error: 'Usuario o contraseña incorrectos' })
        }
    }

    dashboard = (req, res) => {
        if (req.session.loggedIn) {
            res.render('index', { username: req.session.username })
        } else {
            res.redirect('/')
        }
    }

    logout = (req, res) => {
        req.session.destroy()
        res.redirect('/')
    }
}
