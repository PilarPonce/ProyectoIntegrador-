module.exports = (sequelize, dataTypes) => {

    const opinion = sequelize.define('Comentario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        fecha: {
            type: dataTypes.DATE
        },
        texto: {
            type: dataTypes.STRING
        },
        usuario_id:{
            type: dataTypes.INTEGER
        },
        productos_id:{
            type: dataTypes.INTEGER
        }
    },
        {
            tableName: "comentarios",
        });

        Comentario.associate = (db) => {
            Comentario.belongsTo(db.Producto, {
                as: 'producto',
                foreignKey: 'productos_id'
            });
    
            Comentario.belongsTo(db.Usuario, {
                as: 'usuario',
                foreignKey: 'usuario_id'
            });
        };

    return opinion;
}

