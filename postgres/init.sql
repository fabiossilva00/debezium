CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL,
    cpf VARCHAR(11) PRIMARY KEY NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    apelido VARCHAR(100),
    celular VARCHAR(11),
    data_nascimento DATE,
    nota_mercado REAL DEFAULT 0.0,
    ativo BOOLEAN NOT NULL DEFAULT false,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    alterado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE FUNCTION insert_criado_em_cliente()
RETURNS TRIGGER AS $$
BEGIN
    NEW.criado_em = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER insert_cliente_alterado_em
    BEFORE INSERT
    ON
        cliente
    FOR EACH ROW
EXECUTE PROCEDURE insert_criado_em_cliente();

CREATE FUNCTION update_alterado_em_cliente()
RETURNS TRIGGER AS $$
BEGIN
    NEW.alterado_em = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_cliente_alterado_em
    BEFORE UPDATE
    ON
        cliente
    FOR EACH ROW
EXECUTE PROCEDURE update_alterado_em_cliente();
