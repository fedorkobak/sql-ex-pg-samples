DROP TABLE IF EXISTS income;
DROP TABLE IF EXISTS outcome;
DROP TABLE IF EXISTS income_o;
DROP TABLE IF EXISTS outcome_o;

CREATE TABLE income (
    code INTEGER NOT NULL,
    point SMALLINT NOT NULL,
    "date" TIMESTAMP NOT NULL,
    inc MONEY NOT NULL,
    CONSTRAINT income_pkey PRIMARY KEY (code)
);
COPY income(code, point, "date", inc)
FROM '/data/recycling_firm/Income'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE outcome (
    code INTEGER NOT NULL,
    point SMALLINT NOT NULL,
    "date" TIMESTAMP NOT NULL,
    out MONEY NOT NULL,
    CONSTRAINT outcome_pkey PRIMARY KEY (code)
);
COPY outcome(code, point, "date", out)
FROM '/data/recycling_firm/Outcome'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE income_o (
    point SMALLINT NOT NULL,
    "date" TIMESTAMP NOT NULL,
    inc MONEY NOT NULL,
    CONSTRAINT income_o_pkey PRIMARY KEY (point, "date")
);
COPY income_o(point, "date", inc)
FROM '/data/recycling_firm/Income_o'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE outcome_o (
    point SMALLINT NOT NULL,
    "date" TIMESTAMP NOT NULL,
    out MONEY NOT NULL,
    CONSTRAINT outcome_o_pkey PRIMARY KEY (point, "date")
);
COPY outcome_o(point, "date", out)
FROM '/data/recycling_firm/Outcome_o'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');
