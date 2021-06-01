module.exports = (sequelize, dataTypes) => {

    const Producto = sequelize.define('Producto', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING
        },
        url: {
            type: dataTypes.STRING
        },
        anio: {
            type: dataTypes.INTEGER
        },
        creacion: {
            type: dataTypes.DATE
        },
        autor: {
            type: dataTypes.STRING
        },
        genero: {
            type: dataTypes.STRING
        }, 
        resumen: {
            type: dataTypes.STRING
        },
        usuarios_id: { 
            type: dataTypes.INTEGER,
        }
    },
        {
            tableName: "productos",
        });

        Producto.associate = (db) => {
            Producto.belongsTo(db.Usuario, {
                as: 'usuario',
                foreignKey: 'usuario_id'
            });
        };

        Producto.associate = (db) => {
            Producto.hasMany(db.Comentario, {
                as: 'comentarios',
                foreignKey: 'productos_id'
            });
        };

    return Producto;
}

