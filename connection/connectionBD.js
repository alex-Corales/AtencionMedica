import mysql from 'mysql2/promise';

let pool;

function connectDB() {
    if (!pool) {
        try {
            const poolConfig = {
                host: process.env.DB_HOST || 'localhost',
                user: process.env.DB_USER || 'root',
                password: process.env.DB_PASSWORD || '',
                database: process.env.DB_NAME || 'atencionMedica',
                waitForConnections: true,
                connectionLimit: 5, // Límite de conexiones
                queueLimit: 0
            };

            pool = mysql.createPool(poolConfig);
            console.log('Pool de conexiones creado');
        } catch (err) {
            console.log('Error al crear el pool de conexiones:', err);
            throw err; // Lanza un error si no se puede crear el pool
        }
    }
    return pool;
}

export default connectDB;
