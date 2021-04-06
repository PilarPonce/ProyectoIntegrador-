let controlador = {
    home: (req,res,next)=> {
        res.render('home', { title: 'home' });
    },

    login: (req, res, next) => {
        res.render('login', { title: 'login' });
    },

    product: (req, res, next) => {
        res.render('product', { title: 'product' });
    },

    profile: (req, res, next) => {
        res.render('profile', { title: 'profile' });
    },

    register: (req, res, next) => {
        res.render('register', { title: 'register' });
    },

    search: (req, res, next) => {
        res.render('search-results', { title: 'search' });
    },
}

module.exports= controlador;