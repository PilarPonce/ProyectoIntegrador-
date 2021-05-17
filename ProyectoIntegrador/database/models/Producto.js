module.exports = (sequelize, dataTypes) => {

    const libreria = sequelize.define('Producto', {

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
        }
    },
        {
            tableName: "productos",
            timestamps: false
        });

    return libreria;
}

