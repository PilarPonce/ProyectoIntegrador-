module.exports = (sequelize, dataTypes) => {

    const persona = sequelize.define('Usuario', {

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
            timestamps: false
        });

    return persona;
}

