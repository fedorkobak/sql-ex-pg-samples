DROP TABLE IF EXISTS lineups;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS players;

CREATE TABLE games (
    game_id INTEGER NOT NULL,
    team VARCHAR(30) NOT NULL,
    city VARCHAR(30),
    goals SMALLINT,
    game_date TIMESTAMP NOT NULL,
    own SMALLINT,
    CONSTRAINT games_pkey PRIMARY KEY (game_id)
);
COPY games(game_id, team, city, goals, game_date, own)
FROM '/data/soccer_club/Games'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t', NULL 'NULL');

CREATE TABLE players (
    player_id INTEGER NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    citizenship VARCHAR(50),
    dob DATE NOT NULL,
    role VARCHAR(20) NOT NULL,
    CONSTRAINT players_pkey PRIMARY KEY (player_id)
);
COPY players(player_id, first_name, last_name, nickname, citizenship, dob, role)
FROM '/data/soccer_club/Players'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t', NULL 'NULL');

CREATE TABLE lineups (
    start CHAR(1) NOT NULL,
    game_id INTEGER NOT NULL,
    player_id INTEGER NOT NULL,
    time_in INTEGER,
    goals SMALLINT,
    cards CHAR(2),
    CONSTRAINT lineups_pkey PRIMARY KEY (game_id, player_id),
    CONSTRAINT lineups_game_id_fkey FOREIGN KEY (game_id) REFERENCES games(game_id),
    CONSTRAINT lineups_player_id_fkey FOREIGN KEY (player_id) REFERENCES players(player_id)
);
COPY lineups(start, game_id, player_id, time_in, goals, cards)
FROM '/data/soccer_club/Lineups'
WITH (FORMAT csv, HEADER true, DELIMITER E'\t', NULL 'NULL');
