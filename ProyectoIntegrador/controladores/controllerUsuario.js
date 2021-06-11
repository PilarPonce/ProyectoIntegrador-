let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

const bcrypt = require('bcryptjs');
const { resolveInclude } = require('ejs');

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
   
    searchresults: (req, res, next) => {
        res.render(`search-results`)
    },


//PERFIL 
    perfil: (req,res,next)=> {
        let filtro = {
            include: [
                {association: 'productos', include: 'usuario'}, 
            ]
        }

 //despues del req.params.id falta el filtro 
     db.Usuario.findByPk(req.params.id, filtro)
     .then(resultado => {
        res.render('profile', {usuario: resultado});
    })
    .catch((error) => {
        console.log("Error de conexion: " + error.message);

        res.render('error', { error: "Error de conexion: " + error.message });
    })
    },   

    
      
  //REGISTRAR  
    registrarUsuario: (req, res) => {
        let contraseñaEncriptada = bcrypt.hashSync(req.body.contraseña);
        let errors = {}

        if (req.body.nombre == "") {
            errors.message = "El nombre de usuario es obligatorio"; 
            res.locals.errors = errors;
            res.render('register');
        } else if (req.body.mail == "") {
            errors.message = "El email es obligatorio"; 
            res.locals.errors = errors;
            res.render('register');
        } else if (req.file == null) {
            errors.message = "La foto es obligatoria";
            res.locals.errors = errors; //La foto es lo que nos causa problemas, sin esto carga sinfin y con no la toma, pone como si no tuviesemos foto aunque si. 
            res.render('register');
        } else if (req.body.celular == "") {
            errors.message = "El celular es obligatorio";
            res.locals.errors = errors;
            res.render('register');
        }
            else if (req.body.nacimiento == null) {
            errors.message = "La fecha de nacimiento es obligatoria"; 
            res.locals.errors = errors;
            res.render('register');
        } else if (req.body.contraseña == "" ) {
            errors.message = "La contraseña es obligatoria";
            res.locals.errors = errors;
            res.render('register');
        }                                                           /*else if (req.body.contraseña <3 ){
                                                                    errors.message = "La contraseña es muy corta";
                                                                    res.locals.errors = errors;
                                                                    res.render('register');
                                                                } */
        else {
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
                            console.log(req.body.nacimiento);
                            db.Usuario.create({
                                
                                nombre: req.body.nombre,
                                celular: req.body.celular,
                                mail: req.body.mail,
                                fotoPerfil: req.file.filename,
                                contraseña: contraseñaEncriptada,
                                nacimiento: req.body.nacimiento
                            })
                            .then(usuario => {
                                res.redirect('/login');
                            })
                                .catch((error) => {
                                    console.log("Error de conexion: " + error.message);

                                    res.render('error', { error: "Error de conexion: " + error.message });
                                })
                }    })   }
            })
        }        
    },
    
//VALIDACION LOGIN
 //LOG IN
    loginUsuario: (req, res) => {
        let filtro = {
            where: {
                nombre: req.body.nombre
            }
        }
        db.Usuario.findOne(filtro)
        .then(usuario => {

            if (bcrypt.compareSync(req.body.contraseña, usuario.contraseña)) {
                req.session.usuario = usuario.nombre;
                req.session.idUsuario = usuario.id;
                req.session.foto = usuario.fotoPerfil;
                req.session.contraseña = usuario.contraseña;

                if (req.body.recordarme) {
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

                res.render('error', { error: "Error de conexion: " + error.message });
            });
    },

    //EDITAR PERFIL 
    editarPerfil: (req, res) => {
        db.Usuario.findByPk(req.params.id)
        .then(resultado => {
            res.render('editarPerfil', { usuario: resultado });
        })
       
    },

    editar: (req, res) => {
        if (req.body.contraseña == ""){
            req.body.contraseña = req.session.contraseña
        } else {
            req.body.contraseña = bcrypt.hashSync(req.body.contraseña);
        }

        if (req.file != undefined) {
            let imagen = req.file.filename;
            db.Usuario.update({
                nombre: req.body.nombre,
                celular: req.body.celular,
                mail: req.body.mail,
                fotoPerfil: imagen,
                contraseña: req.body.contraseña,
                nacimiento: req.body.nacimiento
    
            }, {
                where: {
                    id: req.params.id
                }
            }
            )
                .then(() => {
                    res.redirect('/');
                })
                .catch((error) => {
                    console.log("Error de conexion: " + error.message);
    
                    res.render('error', { error: "Error de conexion: " + error.message });
                });
        } else {
            let imagen = req.session.foto;
            db.Usuario.update({
                nombre: req.body.nombre,
                celular: req.body.celular,
                mail: req.body.mail,
                fotoPerfil: imagen,
                contraseña: req.body.contraseña,
                nacimiento: req.body.nacimiento
    
            }, {
                where: {
                    id: req.params.id
                }
            }
            )
                .then(() => {
                    res.redirect('/');
                })
                .catch((error) => {
                    console.log("Error de conexion: " + error.message);
    
                    res.render('error', { error: "Error de conexion: " + error.message });
                });
        }
        
        
    },




//LOG OUT
    logout: (req, res, next) => {
        req.session.destroy();
        res.clearCookie('usuarios_id');
        res.redirect('/');
    }
}
module.exports = controladorUsuario;


