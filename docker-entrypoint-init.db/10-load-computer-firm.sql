DROP TABLE IF EXISTS laptop;
DROP TABLE IF EXISTS printer;
DROP TABLE IF EXISTS pc;
DROP TABLE IF EXISTS product;

CREATE TABLE product (
    maker VARCHAR(10) NOT NULL,
    model VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (model)
);
COPY product(maker, model, type)
FROM '/data/computer_firm/product'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE pc (
    code INTEGER NOT NULL,
    model VARCHAR(50) NOT NULL,
    speed SMALLINT,
    ram SMALLINT,
    hd REAL,
    cd VARCHAR(10),
    price MONEY,
    CONSTRAINT pc_pkey PRIMARY KEY (code),
    CONSTRAINT pc_model_fkey FOREIGN KEY (model) REFERENCES product(model)
);
COPY pc(code, model, speed, ram, hd, cd, price)
FROM '/data/computer_firm/pc'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE laptop (
    code INTEGER NOT NULL,
    model VARCHAR(50) NOT NULL,
    speed SMALLINT,
    ram SMALLINT,
    hd REAL,
    price MONEY,
    screen SMALLINT,
    CONSTRAINT laptop_pkey PRIMARY KEY (code),
    CONSTRAINT laptop_model_fkey FOREIGN KEY (model) REFERENCES product(model)
);
COPY laptop(code, model, speed, ram, hd, price, screen)
FROM '/data/computer_firm/laptop'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE printer (
    code INTEGER NOT NULL,
    model VARCHAR(50) NOT NULL,
    color CHAR(1),
    type VARCHAR(10),
    price MONEY,
    CONSTRAINT printer_pkey PRIMARY KEY (code),
    CONSTRAINT printer_model_fkey FOREIGN KEY (model) REFERENCES product(model)
);
COPY printer(code, model, color, type, price)
FROM '/data/computer_firm/printer'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');
