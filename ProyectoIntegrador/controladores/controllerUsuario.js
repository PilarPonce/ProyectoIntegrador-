let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

const bcrypt = require('bcryptjs');

let controladorUsuario = {
    
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

    porId: (req,res,next)=> {

     db.Usuario.findByPk(req.params.id).then(resultado => {
        console.log(resultado.toJSON());
        res.render('perfilOtro', {usuario: resultado});
    })
    .catch((error) => {
        console.log("Error de conexion: " + error.message);

        res.render('error', { error: "Error de conexion: " + error.message });
    })
    },   
      

    registrarUsuario: (req, res) => {

        console.log("antes de registrar")
        let contraseñaEncriptada = bcrypt.hashSync(req.body.contraseña);
        
        db.Usuario.create({
            nombre: req.body.nombre,
            celular: req.body.celular,
            mail: req.body.mail,
            fotoPerfil: req.file.filename,
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
        let filtro = {  
            where: {
                nombre: req.body.nombre
            }
        }  
        db.Usuario.findOne(filtro).then(usuario => {
            console.log(usuario.nombre);
            console.log(req.body.contraseña);
            console.log(usuario.contraseña);
            console.log(usuario.id);

          
            if(bcrypt.compareSync(req.body.contraseña, usuario.contraseña)){
                req.session.usuario = usuario.nombre;
                req.session.idUsuario = usuario.id;
                req.session.foto = usuario.fotoPerfil; 

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


