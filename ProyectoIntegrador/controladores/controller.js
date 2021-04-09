let ropa = require(`../productos/ropa`);


let controlador = {
    home: (req,res,next)=> {
        res.render('home', {ropa: ropa });
    },

    login: (req, res, next) => {
        res.render('login', { title: 'login' });
    },

    product: (req, res, next) => {
        res.render('product', { title: 'product' });
    },

    profile: (req, res, next) => {
        res.render('profile', { title: 'profile' });
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