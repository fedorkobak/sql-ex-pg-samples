DROP TABLE IF EXISTS outcomes;
DROP TABLE IF EXISTS ships;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS battles;

CREATE TABLE classes (
    class VARCHAR(50) NOT NULL,
    type VARCHAR(2) NOT NULL,
    country VARCHAR(20) NOT NULL,
    numGuns SMALLINT,
    bore REAL,
    displacement INTEGER,
    CONSTRAINT classes_pkey PRIMARY KEY (class)
);
COPY classes(class, type, country, numGuns, bore, displacement)
FROM '/data/ships/classes'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE ships (
    name VARCHAR(50) NOT NULL,
    class VARCHAR(50) NOT NULL,
    launched SMALLINT,
    CONSTRAINT ships_pkey PRIMARY KEY (name),
    CONSTRAINT ships_class_fkey FOREIGN KEY (class) REFERENCES classes(class)
);
COPY ships(name, class, launched)
FROM '/data/ships/ships'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE battles (
    name VARCHAR(20) NOT NULL,
    "date" TIMESTAMP NOT NULL,
    CONSTRAINT battles_pkey PRIMARY KEY (name)
);
COPY battles(name, "date")
FROM '/data/ships/battles'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE outcomes (
    ship VARCHAR(50) NOT NULL,
    battle VARCHAR(20) NOT NULL,
    result VARCHAR(10) NOT NULL,
    CONSTRAINT outcomes_pkey PRIMARY KEY (ship, battle),
    CONSTRAINT outcomes_battle_fkey FOREIGN KEY (battle) REFERENCES battles(name)
);
COPY outcomes(ship, battle, result)
FROM '/data/ships/outcomes'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');
