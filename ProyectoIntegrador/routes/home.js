var express = require('express');
var router = express.Router();

let controlador = require('../controladores/controller');

router.get('/', controlador.home);

router.get('/login', controlador.login);

router.get('/register', controlador.register);

router.get('/product', controlador.product);

router.get('/search', controlador.search);

router.get('/profile', controlador.profile);
 

module.exports = router;




//var controlador = require(`../controladores/controlador`);
//router.get('/', controlador.index);