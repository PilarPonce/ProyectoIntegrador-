let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

let controladorProducto = {
        /*home1: (req,res,next)=> {
            res.render('home', {libros: libros });
        },*/

        home: (req,res,next)=> {
            
            let filtro = { 
                order: [ 
                        ['createdAt', 'DESC'],
                      ],
                limit: 4,
                }

            db.Producto.findAll(filtro).then(resultado => {
                
                filtro ={
                    where: {
                        genero:'Terror'
                    },
        
                    limit: 4,
                }

            db.Producto.findAll(filtro).then(resultado2 => { 
                    
                filtro ={
                    where: {
                        genero:'Romance'
                    },
        
                    limit: 4,
                }

            db.Producto.findAll(filtro).then(resultado3 => {

                filtro ={
                    where: {
                        genero:'Thriller'
                    },
            
                    limit: 4,
                }

                        
            db.Producto.findAll(filtro).then(resultado4 => {

                filtro ={
                    where: {
                        genero:'Fantasía'
                    },
                           
                    limit: 4,
                }

            db.Producto.findAll(filtro).then(resultado5 => {

        res.render('home', {libros: resultado, libros2: resultado2, libros3: resultado3, libros4: resultado4, libros5: resultado5 });
            });
            });
            });
            });
            });
            
           },

        porId: (req,res,next)=> {
        /*
         db.Producto.findByPk(req.params.id).then(resultado => {
            res.render('product', {libro: resultado});
        });
        */

        let id= req.params.id;

        libros.bestsellers.forEach(element => {
            if (element.id == id) {
                res.render('product', { libro: element })
            }
        
        });
        libros.clasicos.forEach(element => {
            if (element.id == id) {
                res.render('product', { libro: element })
            }
        
        });
        libros.ficcion.forEach(element => {
            if (element.id == id) {
                res.render('product', { libro: element })
            }
        
        });
        libros.romances.forEach(element => {
            if (element.id == id) {
                res.render('product', { libro: element })
            }
        
        });
        libros.terror.forEach(element => {
            if (element.id == id) {
                res.render('product', { libro: element })
            }
        });
        },   
        productadd: (req, res, next) => {
            res.render('product-add');
        }, 
        
        buscador: (req, res) => {
        const filtro = {
            where: {
                nombre: { [Op.like]: '%' + req.query.search + '%' }
            }
        }  
        db.Producto.findAll(filtro).then(resultado => {
            res.render('searchresults', { libro: resultado });
        })
        
        .catch((error) => {
            console.log("Error de conexion: " + error.message);

            res.render('error', {error: "Error de conexion: " + error.message});
        });
        
        },

        crear: (req, res) => {
            db.Producto.create({ 
                nombre: req.body.nombre,
                autor: req.body.autor,
                foto: req.body.foto,
                genero: req.body.genero.value, //creo que se pone asi para ingresar al select
                resumen: req.body.resumen,
                publicacion: req.body.publi,
                usuarios_id: req.session.idUsuario //se ve mientra el usuario este logueado
            }).then(libroCreado => {
                res.redirect('/product/' + libroCreado.id);   
            })
            .catch((error) => {
                console.log("Error de conexion: " + error.message);
    
                res.render('error', {error: "Error de conexion: " + error.message});
            });
        },

        borrar: (req, res)=> {
            db.Producto.destroy({
                where:{
                    id: req.body.id
                }
            })
            .then(()=>{
                res.redirect('/');
            })
            .catch((error) => {
                console.log("Error de conexion: " + error.message);
    
                res.render('error', {error: "Error de conexion: " + error.message});
            });
        }

    }

module.exports = controladorProducto;