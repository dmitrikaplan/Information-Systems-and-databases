--CREATE DATABASE lab1;

CREATE TABLE IF NOT EXISTS planet(
    planet_id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(30) NOT NULL,
    square INTEGER NOT NULL,
    is_hidden_from_eyes BOOLEAN NOT NULL
);

/* Часть атмосферы */
CREATE TABLE IF NOT EXISTS atmosphere(
    atmosphere_id SERIAL PRIMARY KEY,
    weight BIGINT CHECK ( weight >= 0 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS researcher(
    researcher_id SERIAL PRIMARY KEY,
    planet_id INTEGER REFERENCES planet(planet_id) ON DELETE SET NULL,
    atmosphere_id INTEGER REFERENCES atmosphere(atmosphere_id) ON DELETE SET NULL,
    name CHARACTER VARYING(30) NOT NULL,
    age INTEGER NOT NULL DEFAULT 0,
    number INTEGER NOT NULL
);

/* Объединение всех локаций, над которыми может пролететь зонд */
CREATE TABLE IF NOT EXISTS location(
    location_id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(30) NOT NULL,
    square INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS probe(
    probe_id SERIAL PRIMARY KEY,
    location_id INTEGER REFERENCES location(location_id) ON DELETE SET NULL,
    type CHARACTER VARYING(30) NOT NULL,
    speed INTEGER CHECK ( SPEED >= 0 AND SPEED < 1079252848 ) NOT NULL DEFAULT 0,
    height INTEGER NOT NULL DEFAULT 0,
    can_reach_them BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS pressure(
    pressure_id SERIAL PRIMARY KEY,
    probe_id INTEGER REFERENCES probe(probe_id) ON DELETE SET NULL,
    value INTEGER CHECK ( value > 0 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS gas_density(
    gas_density_id SERIAL PRIMARY KEY,
    probe_id INTEGER REFERENCES probe(probe_id) ON DELETE SET NULL,
    value INTEGER CHECK ( value > 0 ) NOT NULL
);

CREATE TABLE IF NOT EXISTS atmosphere_pressure(
    atmosphere_id INTEGER REFERENCES atmosphere(atmosphere_id) ON DELETE SET NULL ,
    pressure_id INTEGER REFERENCES pressure(pressure_id) ON DELETE SET NULL,
    PRIMARY KEY(atmosphere_id, pressure_id)
);

CREATE TABLE IF NOT EXISTS atmosphere_gas_density(
    atmosphere_id INTEGER REFERENCES atmosphere(atmosphere_id) ON DELETE SET NULL,
    gas_density_id INTEGER REFERENCES gas_density(gas_density_id) ON DELETE SET NULL,
    PRIMARY KEY (atmosphere_id, gas_density_id)
);


CREATE TABLE IF NOT EXISTS image_on_screen(
    image_on_screen_id SERIAL PRIMARY KEY,
    probe_id INTEGER REFERENCES probe(probe_id) ON DELETE SET NULL UNIQUE,
    description TEXT NOT NULL,
    exist BOOLEAN NOT NULL,
    did_it_blink BOOLEAN NOT NULL
);
