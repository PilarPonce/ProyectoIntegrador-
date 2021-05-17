let libros = require(`../libros/libros`);

let controladorUsuario = {
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
    profileedit: (req, res, next) => {
        res.render('profile-edit');
    },
    searchresults: (req, res, next) => {
        res.render(`search-results`)
    }
}

module.exports = controladorUsuario;