const mysql = require('mysql2');

// Configuración de la conexión
const dbConfig = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
};

// Función para crear una nueva conexión
function createConnection() {
    return mysql.createConnection(dbConfig);
}

// Función para realizar la conexión inicial
function connect() {
    const connection = createConnection();
    connection.connect((error) => {
        if (error) {
            console.error('Error de conexión:', error.message);
            // Intentar reconexión en caso de error de conexión
            handleDisconnect(connection);
        } else {
            console.log('Conexión a la base de datos exitosa!');
        }
    });

    // Manejo de eventos de error para reconexión
    connection.on('error', (err) => {
        if (err.code === 'PROTOCOL_CONNECTION_LOST' || err.code === 'ECONNRESET') {
            console.error('Se perdió la conexión con la base de datos. Intentando reconectar...');
            handleDisconnect(connection);
        } else {
            throw err;
        }
    });

    return connection;
}

// Función para manejar la reconexión
function handleDisconnect(connection) {
    connection.destroy();
    connect();
}

// Inicializar la conexión
const connection = connect();

module.exports = connection;
