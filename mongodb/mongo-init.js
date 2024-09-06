conn = new Mongo();
db = conn.getDB("sass");

db.createCollection('cliente', {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["cpf", "nome"],
            properties: {
                cpf: {
                    bsonType: "string",
                    minLength: 11,
                    maxLength: 11
                },
                nome: {
                    bsonType: "string",
                    maxLength: 255
                },
                apelido: {
                    bsonType: "string",
                    maxLength: 100
                },
                celular: {
                    bsonType: "string",
                    minLength: 11,
                    maxLength: 11
                },
                data_nascimento: {
                    bsonType: "date"
                },
                nota_mercado: {
                    bsonType: "double"
                },
                ativo: {
                    bsonType: "bool"
                },
                criado_em: {
                    bsonType: "timestamp"
                },
                alterado_em: {
                    bsonType: "timestamp"
                }
            }
        }
    }
});
