let libros = require(`../libros/libros`);

const db = require('../database/models');
const Op = db.Sequelize.Op;

let controladorComentario = {
    /*comentario: (req, res) => {
        let id = req.params.id;
        let filtro = {
            where: [
                { productos_id: id }
            ]
        }

        db.Comentario.findAll(filtro).then(resultado => {
            res.render('product', { comentarios: resultado })

        })
            .catch((error) => {
                console.log("Error de conexion: " + error.message);

                res.render('error', { error: "Error de conexion: " + error.message });
            });
    }*/

    //intento mediante association xq el id del producto es una FK en el modelo
    /*comentario: (req, res) =>{
        let filtro = {
            include : [
                {association: "producto"}
            ]
        }
        db.Comentario.findAll(filtro).then(resultado => {
            res.render('product', { comentarios: resultado })

        })
    }*/
}

module.exports = controladorComentario
