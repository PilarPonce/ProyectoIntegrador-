let libros = require(`../libros/libros`);


let controlador = {
    home: (req,res,next)=> {
        res.render('home', {libros: libros });
    },

    porId: (req,res,next)=> {
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
        }
    }

module.exports = controlador