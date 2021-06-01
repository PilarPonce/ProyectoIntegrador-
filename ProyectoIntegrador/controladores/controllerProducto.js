let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

let controladorProducto = {
        home: (req,res,next)=> {
            res.render('home', {libros: libros });
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
                genero: req.body.genero,
                resumen: req.body.resumen,
                publicacion: req.body.publi,
                fecha: req.body.fecha,
                usuarios_id: req.body.id //se ve mientra el usuario este logueado
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