var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var userRouter = require (`./routes/rutaUsuario`); // require modulo home
var productRouter = require(`./routes/rutaProductos`);
var app = express(); //funcion express

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');  

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

const session = require('express-session');

app.use(session( {
  secret: "sistema de login de usuarios",
	resave: false,
	saveUninitialized: true
}));

const db = require('./database/models');

app.use(function(req, res, next) {
  if(req.cookies.usuarios_id && !req.session.usuario) {
    console.log("cookiess?? ");
    db.Usuario.findByPk(req.cookies.usuarios_id).then(resultado => {
      req.session.usuario = resultado.nombre;
      req.session.idUsuario = resultado.id;
      return next();
    });
  } else {
  	return next();
  }}
);

app.use(function (req, res, next) {
  console.log(req.session.usuario);
  console.log(req.session.idUsuario);
  
  if (req.session.usuario) {
    res.locals = {
      logueado: true,
      nombreUsuario: req.session.usuario,
      idUsuario:  req.session.idUsuario, 
      fotoUsuario: req.session.foto
    }
  } else {
    res.locals = {
      logueado: false,
      nombreUsuario: 'anonimo',
      idUsuario: 'no id'
    }
  }
  console.log("funciona locals?" + res.locals);
  return next();
});

app.use (`/`, userRouter); 

app.use(`/`, productRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
