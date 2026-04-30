DROP TABLE IF EXISTS pass_in_trip;
DROP TABLE IF EXISTS trip;
DROP TABLE IF EXISTS passenger;
DROP TABLE IF EXISTS company;

CREATE TABLE company (
    id_comp INTEGER NOT NULL,
    name CHAR(10) NOT NULL,
    CONSTRAINT company_pkey PRIMARY KEY (id_comp)
);
COPY company(id_comp, name)
FROM '/data/airport/Company'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE trip (
    trip_no INTEGER NOT NULL,
    id_comp INTEGER NOT NULL,
    plane CHAR(10) NOT NULL,
    town_from CHAR(25) NOT NULL,
    town_to CHAR(25) NOT NULL,
    time_out TIMESTAMP NOT NULL,
    time_in TIMESTAMP NOT NULL,
    CONSTRAINT trip_pkey PRIMARY KEY (trip_no),
    CONSTRAINT trip_id_comp_fkey FOREIGN KEY (id_comp) REFERENCES company(id_comp)
);
COPY trip(trip_no, id_comp, plane, town_from, town_to, time_out, time_in)
FROM '/data/airport/Trip'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE passenger (
    id_psg INTEGER NOT NULL,
    name CHAR(20) NOT NULL,
    CONSTRAINT passenger_pkey PRIMARY KEY (id_psg)
);
COPY passenger(id_psg, name)
FROM '/data/airport/Passenger'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE pass_in_trip (
    trip_no INTEGER NOT NULL,
    "date" TIMESTAMP NOT NULL,
    id_psg INTEGER NOT NULL,
    place CHAR(10) NOT NULL,
    CONSTRAINT pass_in_trip_pkey PRIMARY KEY (trip_no, "date", id_psg),
    CONSTRAINT pass_in_trip_trip_no_fkey FOREIGN KEY (trip_no) REFERENCES trip(trip_no),
    CONSTRAINT pass_in_trip_id_psg_fkey FOREIGN KEY (id_psg) REFERENCES passenger(id_psg)
);
COPY pass_in_trip(trip_no, "date", id_psg, place)
FROM '/data/airport/Pass_in_trip'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');
