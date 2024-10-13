import mysql from 'mysql2/promise';

let connection;

async function connectDB() {
    if (!connection) {
        try {
            const DEFAULT_CONFIG = {
                host: 'localhost',
                user: 'root',
                password: '',
                database: 'atencionMedica'
            };

            const connectionConfig = process.env.DATABASE_URL || DEFAULT_CONFIG;

            connection = await mysql.createConnection(connectionConfig);
            console.log('Conectado a la base de datos');
        } catch (err) {
            console.log('Error al conectar a la base de datos:', err);
            throw err;  // Lanzar error si no se puede conectar
        }
    }
    return connection;
}

export default connectDB;