let ropa = require(`../productos/ropa`);


let controlador = {
    home: (req,res,next)=> {
        res.render('home', {ropa: ropa });
    },

    porId: (req,res,next)=> {
        let id= req.params.id;
        let respuesta = []
        ropa.novedades.forEach(element => {
            if (element.id == id) {
                respuesta.push(element) 
            }
        
        });
        ropa.jeans.forEach(element => {
            if (element.id == id) {
                respuesta.push(element) 
            }
        
        });
        ropa.remeras.forEach(element => {
            if (element.id == id) {
                respuesta.push(element) 
            }
        
        });
        ropa.zapatos.forEach(element => {
            if (element.id == id) {
                respuesta.push(element) 
            }
        
        });
        ropa.vestidos.forEach(element => {
            if (element.id == id) {
                respuesta.push(element) 
            }
        
        });
        res.render('product',{ropa: respuesta})


    },

    login: (req, res, next) => {
        res.render('login', { title: 'login' });
    },

    product: (req, res, next) => {
        res.render('product', { title: 'product' });
    },

    profile: (req, res, next) => {
        res.render('profile', { ropa: ropa });
    },

    register: (req, res, next) => {
        res.render('register', { title: 'register' });
    },

    search: (req, res, next) => {
        res.render('search-results', { title: 'search' });
    },

    productadd: (req, res, next) => {
        res.render('product-add', { title: 'productadd' });
    },

    headerlogueado: (req, res, next) => {
        res.render('headerLogueado', { title: 'headerlogueado' });
    },

    profileedit: (req, res, next) => {
        res.render('profile-edit', { title: 'profileedit' });
    },
}

module.exports= controlador;