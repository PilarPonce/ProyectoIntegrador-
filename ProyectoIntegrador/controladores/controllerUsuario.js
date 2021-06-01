let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

const bcrypt = require('bcryptjs');

let controladorUsuario = {
    home: (req, res, next) => {
        res.render('home', { libros: libros });
    },
    login: (req, res, next) => {
        res.render('login', { });
    },

    product: (req, res, next) => {
        res.render('product');
    },

    profile: (req, res, next) => {
        res.render('profile', { libros: libros });
    },

    register: (req, res, next) => {
        res.render('register', { });
    },
    profileedit: (req, res, next) => {
        res.render('profile-edit');
    },
    searchresults: (req, res, next) => {
        res.render(`search-results`)
    },

    home: (req, res) => {
        // Validar si la sesion tiene un usuario cargado (si el usuario hizo login)
        if (req.session.usuario) {
            res.render('index', { usuario: req.session.usuario });
        } else {
            res.render('index', { usuario: "anonimo" });
        }
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
        })
        .catch((error) => {
            console.log("Error de conexion: " + error.message);

            res.render('error', {error: "Error de conexion: " + error.message});
        });
    },

    loginUsuario: (req, res) => {
        const filtro = {  
            where: {
                nombre: req.body.nombre
            }
        }  
        db.Usuario.findOne(filtro).then(usuario => {
            console.log(usuario.nombre);
            console.log(req.body.contraseña);
            console.log(usuario.contraseña);

            if(bcrypt.compareSync(req.body.contraseña, usuario.contraseña)){
                req.session.usuario = usuario.nombre;
                req.session.id = usuario.id;

                if(req.body.recordarme){
                    res.cookie('usuarios_id', usuario.id, { maxAge: 1000 * 60 * 5 });
                }
            }
            else {
                console.log(`contraseñaErronea`);

            }
            res.redirect('/');
        })
        .catch((error) => {
            console.log("Error de conexion: " + error.message);

            res.render('error', {error: "Error de conexion: " + error.message});
        });
    },
    logout: (req, res, next) => {
        req.session.destroy();
        res.clearCookie('usuarios_id');
        res.redirect('/');
    }
}

module.exports = controladorUsuario;