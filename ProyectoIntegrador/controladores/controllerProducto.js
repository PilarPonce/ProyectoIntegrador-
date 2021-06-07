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
            let filtro = {    
                include: [
                    {association: 'comentarios', include: 'usuario'},
                    
                ]
            }
        
         db.Producto.findByPk(req.params.id, filtro).then(resultado => {
            console.log(resultado.toJSON());
            res.render('product', {libro: resultado});
        })
        .catch((error) => {
            console.log("Error de conexion: " + error.message);

            res.render('error', { error: "Error de conexion: " + error.message });
        })
        },   

//BUSCADOR
    
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

//AGREGAR PRODUCTO
    productadd: (req, res, next) => {
        res.render('product-add');
    },

        crear: (req, res) => {
            db.Producto.create({ 
                nombre: req.body.nombre,
                autor: req.body.autor,
                foto: req.body.foto,
                genero: req.body.genero, 
                resumen: req.body.resumen,
                anio: req.body.anio,
                usuarios_id: req.session.idUsuario //se ve mientra el usuario este logueado
            }).then(libroCreado => {
                res.redirect('/product/' + libroCreado.id, {libro: libroCreado});   
            })
            .catch((error) => {
                console.log("Error de conexion: " + error.message);
    
                res.render('error', {error: "Error de conexion: " + error.message});
            });
        },

//BORRAR PRODUCTO     

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

        todos: (req, res)=> {

            let filtro = { 
                order: [ 
                        ['nombre', 'ASC'],
                      ]
                }

            db.Producto.findAll(filtro).then(resultado => {
            
                res.render('todos', {libros: resultado});

            }); 
            } 
    }
    
    module.exports = controladorProducto;