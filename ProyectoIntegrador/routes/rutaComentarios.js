var express = require('express');
var router = express.Router();

let controladorComentario = require('../controladores/controllerComentario');

router.get('/product', controladorComentario.comentario);

module.exports = router

