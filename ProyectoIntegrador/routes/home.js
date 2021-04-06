var express = require('express');
var router = express.Router();

var controlador = require(`../controladores/controlador`);

router.get('/', controlador.index);

module.exports = router;