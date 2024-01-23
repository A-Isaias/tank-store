// indexController.js

const connection = require('../database/db');
const { createConnection } = require('../database/db');

// Función para obtener cómics de novedad
exports.getFeaturedComics = () => {
    return new Promise((resolve, reject) => {
        const connection = createConnection();

        connection.query('SELECT * FROM comics WHERE novedad = ?', ['si'], (error, results) => {
            connection.end(); // Cierra la conexión después de la consulta
            if (error) {
                reject(error);
            } else {
                // Formatea todas las fechas en "dd/mm/yyyy"
                results.forEach(comic => {
                    comic.fecha_ingreso = new Date(comic.fecha_ingreso).toLocaleDateString('es-AR');
                });
                resolve(results);
            }
        });
    });
};

// Función para buscar cómics
exports.searchComics = (query) => {
    return new Promise((resolve, reject) => {
        const connection = createConnection();

        const searchQuery = `%${query}%`;
        const sql = 'SELECT * FROM comics WHERE nombre LIKE ? OR coleccion LIKE ?';
        
        connection.query(sql, [searchQuery, searchQuery], (error, results) => {
            connection.end(); // Cierra la conexión después de la consulta
            if (error) {
                reject(error);
            } else {
                // Formatea todas las fechas en "dd/mm/yyyy"
                results.forEach(comic => {
                    comic.fecha_ingreso = new Date(comic.fecha_ingreso).toLocaleDateString('es-AR');
                });
                resolve(results);
            }
        });
    });
};

// Vista para la página principal con funcionalidad de búsqueda
exports.indexView = async (req, res) => {
    try {
        const query = req.query.q;
        const comics = query ? await exports.searchComics(query) : await exports.getFeaturedComics();

        res.render('index', { comics });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error interno del servidor');
    }
};

// Función para buscar cómics desde la página de inicio
exports.searchIndexComics = async (req, res) => {
    try {
        const query = req.query.q;

        if (!query) {
            // Si no hay término de búsqueda, redirige a la página principal
            return res.redirect('/');
        }

        // Realiza la búsqueda de cómics
        const comics = await exports.searchComics(query);

        // Renderiza la vista con los resultados de la búsqueda
        res.render('index', { user: req.user, comics, searchQuery: query });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error interno del servidor');
    }
};