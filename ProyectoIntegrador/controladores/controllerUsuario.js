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

    register: (req, res, next) => {
        res.render('register', { });
    },
    profileedit: (req, res, next) => {
        res.render('profile-edit');
    },
    searchresults: (req, res, next) => {
        res.render(`search-results`)
    },


//PERFIL 
    perfil: (req,res,next)=> {

     db.Usuario.findByPk(req.params.id).then(resultado => {
        //console.log(resultado.toJSON());
        res.render('profile', {usuario: resultado});
    })
    .catch((error) => {
        console.log("Error de conexion: " + error.message);

        res.render('error', { error: "Error de conexion: " + error.message });
    })
    },   
      

//REGISTRAR USUARIO
    registrarUsuario: (req, res) => {

        //console.log("antes de registrar")
        let contraseñaEncriptada = bcrypt.hashSync(req.body.contraseña);
        let errors = {}

        //aunque muestre el error y las validaciones y no se creen los perfiles se suben las fotos de perfil de los usuarios
        //no funciona el register x las validaciones

        if (req.body.nombre == "") {
            errors.message = "El nombre de usuario es obligatorio"; //lo valida bien
            res.locals.errors = errors;
            res.render('register');
        } else if (req.body.mail == "") {
            errors.message = "El email es obligatorio"; //cuando lo mando vacio dice q no hay fecha de nacimiento
            res.locals.errors = errors;
            res.render('register');
        } else if (req.body.nacimiento = null) {
            errors.message = "La fecha de nacimiento es obligatoria"; //cuando lo mando vacio dice que el email es obligatorio
            res.locals.errors = errors;
            res.render('register');
        } else if (req.body.contraseña == "") {
            errors.message = "La contraseña es obligatorio"; //cuando la mando vacia dice que no hay email
            res.locals.errors = errors;
            res.render('register');
        } else {
            db.Usuario.findOne({
                where: [{mail: req.body.mail}]
            })
            .then(resultado => {
                if (resultado != undefined) {
                    errors.message = "Ya existe un usuario con ese email";
                    res.locals.errors = errors;
                } else {
                    db.Usuario.findOne({
                        where: [{nombre: req.body.nombre}]
                    })
                    .then(resultado => {
                        if (resultado != undefined) {
                            errors.message = "Ya existe un usuario con este nombre";
                            res.locals.errors = errors;
                        } else {
                            db.Usuario.create({
                                nombre: req.body.nombre,
                                celular: req.body.celular,
                                mail: req.body.mail,
                                fotoPerfil: req.file.filename,
                                contraseña: contraseñaEncriptada,
                                nacimiento: req.body.nacimiento
                            }).then(usuario => {
                                res.redirect('/login');
                            })
                            .catch((error) => {
                                console.log("Error de conexion: " + error.message);
                    
                                res.render('error', {error: "Error de conexion: " + error.message});
                            });
                }    })   }
            })
        }        
       
    },


//LOG IN
    loginUsuario: (req, res) => {
        let filtro = {  
            where: {
                nombre: req.body.nombre
            }
        }  
        db.Usuario.findOne(filtro).then(usuario => {
            //console.log(usuario.nombre);
            //console.log(req.body.contraseña);
            //console.log(usuario.contraseña);
            //console.log(usuario.id);

          
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

//LOG OUT
    logout: (req, res, next) => {
        req.session.destroy();
        res.clearCookie('usuarios_id');
        res.redirect('/');
    }
}

module.exports = controladorUsuario;


