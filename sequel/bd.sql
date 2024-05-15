CREATE TABLE IF NOT EXISTS funcionario(
	id_func SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	cpf VARCHAR(11),
	dt_nasc DATE,
	cargo VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS cliente(
	id_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	cpf VARCHAR(11)
);

CREATE TABLE IF NOT EXISTS pedido(
	id_pedido SERIAL PRIMARY KEY,
	id_cliente INTEGER,
	id_func INTEGER,
	data_pedido DATE,
	valor_total NUMERIC(10,2)
	pagamento VARCHAR,
	status VARCHAR(20),
	
	CONSTRAINT fk_func FOREIGN KEY (id_func) 
	REFERENCES funcionario (id_func),
	CONSTRAINT fk_cliente FOREIGN KEY (id_cliente)
	REFERENCES cliente (id_cliente)
);

CREATE TABLE IF NOT EXISTS prato(
	id_prato SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	preco NUMERIC(10,2),
	descricao VARCHAR(255),
	avaliacao NUMERIC (10,2)
);

CREATE TABLE IF NOT EXISTS itemPedido(
	id_itemPedido SERIAL PRIMARY KEY,
	id_prato INTEGER,
	qtd INTEGER,
	id_pedido INTEGER,
	CONSTRAINT fk_id_prato FOREIGN KEY (id_prato)
	REFERENCES prato (id_prato),
	CONSTRAINT fk_id_pedido FOREIGN KEY (id_pedido)
	REFERENCES pedido (id_pedido)
);
