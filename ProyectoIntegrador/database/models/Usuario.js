module.exports = (sequelize, dataTypes) => {

    const Usuario = sequelize.define('Usuario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING,
            field:"nombre"
        },
        celular: {
            type: dataTypes.INTEGER,
            field:"celular"
        },
        mail: {
            type: dataTypes.STRING,
            field:"mail"
        },
        contraseña: {
            type: dataTypes.STRING,
            field:"contraseña"
        },
        nacimiento: {
            type: dataTypes.DATE,
            field:"nacimiento"
        }
    },
        {   tableName: "usuarios",
        });

        Usuario.associate = (db) => {
            Usuario.hasMany(db.Producto, {
                as: 'productos',
                foreignKey: 'usuario_id'
            });
        };

        Usuario.associate = (db) => {
            Usuario.hasMany(db.Comentario, {
                as: 'comentarios',
                foreignKey: 'usuarios_id'
            });
        };

    return Usuario;
}

