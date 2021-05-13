var express = require('express');
var router = express.Router();
          
let controlador = require('../controladores/controller');
let controlador2= require('../controladores/controllerLibro');

router.get('/', controlador.home);      
router.get('/product/:id', controlador.porId); 
router.get('/login', controlador.login);  
router.get('/register', controlador.register);              
router.get('/search', controlador.search); 
router.get('/profile', controlador.profile);
router.get('/productadd', controlador.productadd);
router.get('/profileedit', controlador.profileedit);
router.get (`/searchresults`, controlador2.buscador)


module.exports = router;
