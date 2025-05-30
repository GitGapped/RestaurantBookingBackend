const swaggerJsdoc = require('swagger-jsdoc');
const path = require('path');
const config = require('./index');

const options = {
    definition: {
        openapi: '3.1.1',
        info: {
            title: 'Books API',
            version: '1.0.0',
            description: 'Simple API for book management'
        },
        servers: [
            { url: `http://localhost:${config.app.port || 3000}` }
        ],
        components: {
            securitySchemes: {
                bearerAuth: {
                    type: 'http',
                    scheme: 'bearer',
                    bearerFormat: 'JWT'
                }
            },
            schemas: {
                Book: {
                    type: 'object',
                    properties: {
                        uuid: { type: 'string', format: 'uuid' },
                        title: { type: 'string' },
                        author: { type: 'string' },
                        published_year: { type: 'integer' },
                        genre: { type: 'string' }
                    },
                    example: {
                        uuid: "123e4567-e89b-12d3-a456-426614174000",
                        title: "The Great Gatsby",
                        author: "F. Scott Fitzgerald",
                        published_year: 1925,
                        genre: "Fiction"
                    }
                },
                BookInput: {
                    type: 'object',
                    required: ['title', 'author', 'published_year', 'genre'],
                    properties: {
                        title: { type: 'string' },
                        author: { type: 'string' },
                        published_year: { type: 'integer' },
                        genre: { type: 'string' }
                    },
                    example: {
                        title: "1984",
                        author: "George Orwell",
                        published_year: 1949,
                        genre: "Dystopian"
                    }
                }
            }
        },
        security: [{ bearerAuth: [] }]
    },
    apis: [
        path.join(__dirname, '../routes/**/*.js'),
    ]
};

const swaggerSpec = swaggerJsdoc(options);

module.exports = swaggerSpec;
