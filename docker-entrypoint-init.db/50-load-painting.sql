DROP TABLE IF EXISTS utb;
DROP TABLE IF EXISTS utq;
DROP TABLE IF EXISTS utv;

CREATE TABLE utq (
    q_id INTEGER NOT NULL,
    q_name VARCHAR(35) NOT NULL,
    CONSTRAINT utq_pkey PRIMARY KEY (q_id)
);
COPY utq(q_id, q_name)
FROM '/data/painting/utQ'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE utv (
    v_id INTEGER NOT NULL,
    v_name VARCHAR(35) NOT NULL,
    v_color CHAR(1) NOT NULL,
    CONSTRAINT utv_pkey PRIMARY KEY (v_id)
);
COPY utv(v_id, v_name, v_color)
FROM '/data/painting/utV'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');

CREATE TABLE utb (
    b_datetime TIMESTAMP NOT NULL,
    b_q_id INTEGER NOT NULL,
    b_v_id INTEGER NOT NULL,
    b_vol SMALLINT NOT NULL,
    CONSTRAINT utb_pkey PRIMARY KEY (b_datetime, b_q_id, b_v_id),
    CONSTRAINT utb_b_q_id_fkey FOREIGN KEY (b_q_id) REFERENCES utq(q_id),
    CONSTRAINT utb_b_v_id_fkey FOREIGN KEY (b_v_id) REFERENCES utv(v_id)
);
COPY utb(b_datetime, b_q_id, b_v_id, b_vol)
FROM '/data/painting/utB'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t');
