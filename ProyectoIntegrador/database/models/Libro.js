module.exports = (sequelize, dataTypes) => {

    const Librito = sequelize.define('Libro', { 
         
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
        fecha: {   
            type: dataTypes.DATE
        },
        autor: { 
            type: dataTypes.STRING
        },
        genero:{
            type: dataTypes.STRING
        },
        descripcion:{
            type: dataTypes.STRING
        }
        }, 
        {
        tableName: "productos", 
        timestamps: false
    });

    return Librito;
}
