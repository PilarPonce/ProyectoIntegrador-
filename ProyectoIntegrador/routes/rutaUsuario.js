var express = require('express');
var router = express.Router();
          
let controladorUsuario = require('../controladores/controllerUsuario');

//MULTER Y PATH
const multer = require('multer');
const path = require('path');

//MULTER FOTO PERFIL
const storage = multer.diskStorage({
    destination: (req, file, cb) => {


      let rutaDirectorio = 'public/images/usuarios';
      cb(null, rutaDirectorio);
    },
    filename: (req, file, cb) => {
      let fotodePerfil = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, fotodePerfil);
    }
  }); 
  
  const upload = multer({
    storage: storage
  });  

//RUTAS RELACIONADAS CON EL USUARIO
router.get('/login', controladorUsuario.login); 

router.post('/login', controladorUsuario.loginUsuario);  

router.get('/register', controladorUsuario.register);    

router.post('/register', upload.single('fotoPerfil'), controladorUsuario.registrarUsuario);

router.get('/logout', controladorUsuario.logout);

router.get('/profile/:id', controladorUsuario.perfil);

router.get('/editarPerfil/:id', controladorUsuario.editarPerfil);

router.post('/editarPerfil/:id', upload.single('fotoPerfil'), controladorUsuario.editar); 


module.exports = router;
