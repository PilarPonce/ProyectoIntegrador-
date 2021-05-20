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

    loginUsuario: (req, res) => {
        const filtro = {  
            where: {
                nombre: req.body.nombre
            }
        }
        db.Usuario.findOne(filtro).then(usuario => {
            console.log(req.body.contraseña);
            console.log(usuario.contraseña);
            if(bcrypt.compareSync(req.body.contraseña, usuario.contraseña)){
                req.session.usuario = usuario.nombre;
                req.session.id = usuario.id;

                if(req.body.recordarme){
                    res.cookie('usuarios_id', usuario.id, { maxAge: 1000 * 60 * 5 });
                }
            }
            res.redirect('/');
        })
        
        .catch(function (error) {
            console.log(error);
    });
    },
    //logout: (req, res) => {
      //  req.session.destroy();
        //res.clearCookie('userId');
       // res.redirect('/');
    //}
}

module.exports = controladorUsuario;