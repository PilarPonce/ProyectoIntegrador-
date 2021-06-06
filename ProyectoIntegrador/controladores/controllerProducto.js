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
        
         db.Producto.findByPk(req.params.id).then(resultado => {
            res.render('product', {libro: resultado});
        })
        .catch((error) => {
            console.log("Error de conexion: " + error.message);

            res.render('error', { error: "Error de conexion: " + error.message });
        })
        },   
          
        productadd: (req, res, next) => {
            res.render('product-add');
        }, 
        
        buscador: (req, res) => {
        let filtro = {
            where: {
                nombre: { [Op.like]: '%' + req.query.search + '%' }, 
            }
        }  
        db.Producto.findAll(filtro).then(resultado => {
            let filtro = {
                where: {
                    resumen: { [Op.like]: '%' + req.query.search + '%' },
                }
            }
            db.Producto.findAll(filtro).then(resultado2 => {
            res.render('searchresults', { libro: resultado, libro2:resultado2 });
            
        })
    
        .catch((error) => {
            console.log("Error de conexion: " + error.message);

            res.render('error', {error: "Error de conexion: " + error.message});
        });
        });
        },

        crear: (req, res) => {
            db.Producto.create({ 
                nombre: req.body.nombre,
                autor: req.body.autor,
                foto: req.body.foto,
                genero: req.body.genero, //creo que se pone asi para ingresar al select
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
        },


        
        comentario: (req,res)  => {
        let id= req.params.id;
        let filtro = {
            where: [
                    { productos_id: id}
            ]} 
            
            db.Comentario.findAll(filtro).then(resultado => {
                res.render ('product', {comentarios: resultado})
                
        })
            .catch((error) => {
                console.log("Error de conexion: " + error.message);

                res.render('error', { error: "Error de conexion: " + error.message });
                });
    }
        
    }
    
    module.exports = controladorProducto;