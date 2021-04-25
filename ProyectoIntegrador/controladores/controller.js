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

    login: (req, res, next) => {
        res.render('login');
    },

    product: (req, res, next) => {
        res.render('product');
    },

    profile: (req, res, next) => {
        res.render('profile', { libros: libros });
    },

    register: (req, res, next) => {
        res.render('register');
    },

    search: (req, res, next) => {
        res.render('search-results');
    },

    productadd: (req, res, next) => {
        res.render('product-add');
    },

    profileedit: (req, res, next) => {
        res.render('profile-edit');
    },
    searchresults: (req,res,next) => {
        res.render (`search-results`)
    }
}

module.exports= controlador;