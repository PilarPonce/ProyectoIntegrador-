var express = require('express');
var router = express.Router();

let controladorComentario = require('../controladores/controllerComentario');

router.get('/product/:id', controladorComentario.comentario);
//seria la segunda vez que usamos esta ruta con el metodo get, no se puede (?)
module.exports = router

