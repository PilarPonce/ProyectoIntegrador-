const db = require('../database/models'); 
const Op = db.Sequelize.Op; 

let controlador2 ={
    buscador:(req,res)=>{
        const filtro={
            where:{
                nombre:{[Op.like]: '%' + req.query.filtro + '%'}

            }

        }
        db.Libro.findAll(filtro).then(resultado => {
            res.render('searchresults', {lista: resultado});
        })
    }

}
module.exports= controlador2;