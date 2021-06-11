var express = require('express');
var router = express.Router();

let controladorProducto = require('../controladores/controllerProducto');


const multer = require('multer');
const path = require('path');
 
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      let rutaDirectorio = 'public/images/productos';
      cb(null, rutaDirectorio);
    },
    filename: (req, file, cb) => {
      let fotodeProducto = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, fotodeProducto);
    }
  }); 
  
  const upload = multer({
    storage: storage
  });  
 
router.get('/', controladorProducto.home);  
 
router.get('/product/:id', controladorProducto.porId);
 
router.get('/productadd', controladorProducto.productadd);

router.get('/searchresults', controladorProducto.buscador);
 
router.post('/productadd', upload.single('foto'), controladorProducto.crear);
 
router.post('/borrar/:id', controladorProducto.borrar);

router.get('/editarProducto/:id', controladorProducto.editarProducto);

router.post('/editarProducto/:id', upload.single('foto'), controladorProducto.editar);
 
router.get('/todos', controladorProducto.todos); 
 
 
module.exports = router;
