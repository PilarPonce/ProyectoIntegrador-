var express = require('express');
var router = express.Router();
          
let controladorUsuario = require('../controladores/controllerUsuario');

router.get('/login', controladorUsuario.login); 

router.post('/login', controladorUsuario.loginUsuario);  

router.get('/register', controladorUsuario.register);    

router.post('/register', controladorUsuario.registrarUsuario);

router.get('/profile', controladorUsuario.profile); 

router.get('/profileedit', controladorUsuario.profileedit);

router.get('/logout', controladorUsuario.logout);

router.get('/perfilOtro/:id', controladorUsuario.porId);



module.exports = router;
