let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

let controladorProducto = { 
    editarProducto: (req, res, next) => {
        db.Producto.findByPk(req.params.id).then(resultado => {
            res.render('editarProducto', {libro: resultado});
        })
    },

   
        home: (req,res,next)=> {
            
            let filtro = { 
                include: [
                    { association: 'usuario' }
                ],
                order: [ 
                        ['createdAt', 'DESC']
                      ],
                limit: 4,
                }

            db.Producto.findAll(filtro).then(resultado => {
                
                filtro ={
                    include: [
                        { association: 'usuario' }
                    ],
                    where: {
                        genero:'Terror'
                    },
        
                    limit: 4,
                }
            db.Producto.findAll(filtro).then(resultado2 => { 
                    
                filtro ={
                    include: [
                        { association: 'usuario' }
                    ],
                    where: {
                        genero:'Romance'
                    },
        
                    limit: 4,
                }  
            db.Producto.findAll(filtro).then(resultado3 => {

                filtro ={
                    include: [
                        { association: 'usuario' }
                    ],
                    where: {
                        genero:'Thriller'
                    },  
            
                    limit: 4,  
                }        
            db.Producto.findAll(filtro).then(resultado4 => {

                filtro ={
                    include: [
                        { association: 'usuario' }
                    ],
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

//DETALLE 
        porId: (req,res,next)=> {
            let filtro = {    
                include: [
                    {association: 'comentarios', include: 'usuario'}, 
                    {association: 'usuario'}   
                ],
                order: [ 
                    ['createdAt', 'DESC'],
                  ]
            }
        
         db.Producto.findByPk(req.params.id, filtro).then(resultado => {
             console.log(resultado.usuario);
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
            include: [
                { association: 'usuario' }
            ],
            where: {
                nombre: { [Op.like]: '%' + req.query.search + '%' }, 
            }
        }  
        db.Producto.findAll(filtro).then(resultado => {
            let filtro = {
                include: [
                    { association: 'usuario' }
                ],
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
    productadd: (req, res) => {
        res.render('product-add');
    },

    crear: (req, res) => {
        db.Producto.create({ 
            nombre: req.body.nombre,
            autor: req.body.autor,
            foto: req.file.filename,
            genero: req.body.genero, 
            resumen: req.body.resumen,
            anio: req.body.anio,
            usuarios_id: req.session.idUsuario //se ve mientra el usuario este logueado
        }).then(libroCreado => {
            res.redirect('/product/' + libroCreado.id);   
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
                    id: req.params.id
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
//EDITAR PRODUCTO 

    editar: (req,res) => {
        db.Producto.update({
            nombre: req.body.nombre,
            autor: req.body.autor,
            genero: req.body.genero,
            foto: req.file.filename,
            resumen: req.body.resumen,
            anio: req.body.anio,
            usuarios_id: req.session.idUsuario

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
    
    
    },



//AGREGAR COMENTARIO
        /*crearComentario:  (req, res)=> {
            db.Comentario.create({ 
                texto: req.body.texto,
                usuarios_id: req.session.idUsuario,
                productos_id: res.session.libro
            }).then(comentarioNuevo => {
                res.redirect();   
            })
            .catch((error) => {
                console.log("Error de conexion: " + error.message);
    
                res.render('error', {error: "Error de conexion: " + error.message});
            });
        },*/

        //Hay que hacer un associate con el libro al que le estoy creando el comentario, pero no se como hacerlo con un create


//PAGINA DE TODOS
        todos: (req, res)=> {

            let filtro = { 
                include: [
                    { association: 'usuario' }
                ],
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