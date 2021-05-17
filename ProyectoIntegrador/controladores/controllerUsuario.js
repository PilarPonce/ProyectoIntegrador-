let libros = require(`../libros/libros`);

let controlador = {
    home: (req, res, next) => {
        res.render('home', { libros: libros });
    },
    login: (req, res, next) => {
        res.render('login');
    },

    product: (req, res, next) => {
        res.render('product');
    },

    profile: (req, res, next) => {
        res.render('profile', { libros: libros });
    },

    register: (req, res, next) => {
        res.render('register');
    },

    search: (req, res, next) => {
        res.render('search-results');
    },

    profileedit: (req, res, next) => {
        res.render('profile-edit');
    },
    searchresults: (req, res, next) => {
        res.render(`search-results`)
    }
}

module.exports = controlador;