var express = require('express');
var router = express.Router();

let controlador = require('../controladores/controller');

router.get('/', controlador.home);

router.get('/product/:id', controlador.porId);
   
router.get('/login', controlador.login);  

router.get('/register', controlador.register);
                   
router.get('/search', controlador.search); 

router.get('/profile', controlador.profile);

router.get('/productadd', controlador.productadd);

router.get('/headerlogueado', controlador.headerlogueado);

router.get('/profileedit', controlador.profileedit);


module.exports = router;


//cambiando rutas 
//var controlador = require(`../controladores/controlador`);
//router.get('/', controlador.index);