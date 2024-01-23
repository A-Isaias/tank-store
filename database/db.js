const mysql = require('mysql2');

const dbConfig = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
};

// Función para crear una nueva conexión
function createConnection() {
    return mysql.createConnection(dbConfig);
}

module.exports = {
    createConnection,
};