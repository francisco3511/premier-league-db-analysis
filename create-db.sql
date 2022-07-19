DROP DATABASE IF EXISTS football_stats;
CREATE DATABASE football_stats;

-- connect to the new database
\c football_stats

-- create a table for EPL clubs
DROP TABLE IF EXISTS pl_clubs CASCADE;
CREATE TABLE pl_clubs (
	team VARCHAR(50) NOT NULL PRIMARY KEY,
	location VARCHAR(100) NOT NULL,
	stadium VARCHAR(50) NOT NULL,
	capacity INT NOT NULL,
    manager VARCHAR(100) NOT NULL,
    captain VARCHAR(100) NOT NULL,
    kit VARCHAR(50) NOT NULL,
    shirt_sponsor VARCHAR(50) NOT NULL,
    sleeve_sponsor VARCHAR(50) NOT NULL
);

-- create a table for EPL players, which includes data from the 21/22 season
DROP TABLE IF EXISTS pl_players CASCADE;
CREATE TABLE pl_players (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    player VARCHAR(50) NOT NULL,
    team VARCHAR(50) NOT NULL, 
    nation VARCHAR(50), 
    position VARCHAR(50), 
    age INT, 
    mp INT, 
    starts INT, 
    min VARCHAR(50), 
    full_times NUMERIC(5, 2), 
    goals INT, 
    assists INT,
    FOREIGN KEY(team) REFERENCES pl_clubs(team)
);

COPY pl_clubs(team, location, stadium, capacity, manager, captain, kit, shirt_sponsor, sleeve_sponsor)
FROM '/Users/franciscosilva/Desktop/projects/football-stats/data/epl_teams.csv' 
DELIMITER ',' 
CSV HEADER;

COPY pl_players(player, team, nation, position, age, mp, starts, min, full_times, goals, assists)
FROM '/Users/franciscosilva/Desktop/projects/football-stats/data/epl_players.csv' 
DELIMITER ';' 
CSV HEADER;

