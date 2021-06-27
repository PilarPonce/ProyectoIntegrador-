module.exports = (sequelize, dataTypes) => {

    const Comentario = sequelize.define('Comentario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        texto: {
            type: dataTypes.STRING
        },
        usuarios_id:{
            type: dataTypes.INTEGER
        },
        productos_id:{
            type: dataTypes.INTEGER
        },
        createdAt: {
            type: dataTypes.DATE
        },
        updatedAt: {
            type: dataTypes.DATE
        }

    },
        {
            tableName: "comentarios",
        });


        //RELACIONES DE LA TABLA COMENTARIOS
        Comentario.associate = (db) => {
            Comentario.belongsTo(db.Producto, {
                as: 'producto',
                foreignKey: 'productos_id'
            });
    
            Comentario.belongsTo(db.Usuario, {
                as: 'usuario',
                foreignKey: 'usuarios_id'
            });
        };

    return Comentario;
}

