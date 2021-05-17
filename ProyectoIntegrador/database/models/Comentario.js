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
        }
    },
        {
            tableName: "comentarios",
            timestamps: false
        });

    return opinion;
}

