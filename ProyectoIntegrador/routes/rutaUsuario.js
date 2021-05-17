var express = require('express');
var router = express.Router();
          
let controladorUsuario = require('../controladores/controllerUsuario');

router.get('/login', controladorUsuario.login);  

router.get('/register', controladorUsuario.register);    

router.get('/search', controladorUsuario.search); 

router.get('/profile', controladorUsuario.profile);

router.get('/profileedit', controladorUsuario.profileedit);

  
module.exports = router;
