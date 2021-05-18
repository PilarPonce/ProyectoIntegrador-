module.exports = (sequelize, dataTypes) => {

    const persona = sequelize.define('Usuario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING
        },
        celular: {
            type: dataTypes.INTEGER
        },
        mail: {
            type: dataTypes.STRING
        },
        contraseña: {
            type: dataTypes.STRING
        },
        nacimiento: {
            type: dataTypes.DATE
        }
    },
        {   tableName: "usuarios",
            timestamps: false
        });

    return persona;
}

