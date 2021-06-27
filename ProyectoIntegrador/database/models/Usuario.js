module.exports = (sequelize, dataTypes) => {

    const Usuario = sequelize.define('Usuario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING,
        },
        celular: {
            type: dataTypes.INTEGER,
        },
        mail: {
            type: dataTypes.STRING,
        },
        fotoPerfil: {
            type: dataTypes.STRING,
        },
        contraseña: {
            type: dataTypes.STRING,
        },
        nacimiento: {
            type: dataTypes.DATE,
        }
    },  
        {   tableName: "usuarios",
        });

        //RELACIONES DE LA TABLA USUARIOS
        Usuario.associate = (db) => {
            Usuario.hasMany(db.Producto, {
                as: 'productos', 
                foreignKey: 'usuarios_id'
            });
            Usuario.hasMany(db.Comentario, {
                as: 'comentarios',
                foreignKey: 'usuarios_id'
            });
        };

    return Usuario;
}

