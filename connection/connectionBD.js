import mysql from 'mysql2/promise';

let connection;

async function connectDB() {
    if (!connection) {
        try {
            const connectionConfig = {
                host: process.env.DB_HOST || 'localhost',
                user: process.env.DB_USER || 'root',
                password: process.env.DB_PASSWORD || '',
                database: process.env.DB_NAME || 'atencionMedica'
            };

            connection = await mysql.createConnection(connectionConfig);
            console.log('Conectado a la base de datos');
        } catch (err) {
            console.log('Error al conectar a la base de datos:', err);
            throw err; // Lanza un error si no se puede conectar
        }
    }
    return connection;
}

export default connectDB;
