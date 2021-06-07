var express = require('express');
var router = express.Router();

let controladorProducto = require('../controladores/controllerProducto');

router.get('/', controladorProducto.home);  

router.get('/product/:id', controladorProducto.porId);

router.get('/productadd', controladorProducto.productadd);

router.get('/searchresults', controladorProducto.buscador);
 
router.post('/productadd', controladorProducto.crear);

router.post('/borrar', controladorProducto.borrar);

router.get('/todos', controladorProducto.todos); 


module.exports = router;
