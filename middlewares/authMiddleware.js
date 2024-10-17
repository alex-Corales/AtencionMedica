export const isAuthenticated = (req, res, next) => {
    try {
        if (req.session && req.session.loggedIn) { 
            next(); 
        } else {
            console.log('Estoy aqui');
            res.redirect('/login'); 
        }
    } catch (error) {
        console.error("Error al verificar la autenticación: ", error);
        res.status(500).send('Ocurrió un error en el servidor'); 
    }
};
