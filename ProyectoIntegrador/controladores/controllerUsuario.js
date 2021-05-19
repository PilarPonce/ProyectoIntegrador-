let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

const bcrypt = require('bcryptjs');

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
    },

    registrarUsuario: (req, res) => {

        let contraseñaEncriptada = bcrypt.hashSync(req.body.contraseña);
        
        db.Usuario.create({
            nombre: req.body.nombre,
            celular: req.body.celular,
            mail: req.body.mail,
            contraseña: contraseñaEncriptada,
            nacimiento: req.body.nacimiento
        }).then(usuario => {
            res.redirect('/');
        });

    },

}

module.exports = controladorUsuario;