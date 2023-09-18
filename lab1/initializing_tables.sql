INSERT INTO planet(name, square, is_hidden_from_eyes)
VALUES ('Земля', 510072 , false ),
       ('МАРС', 14400, true),
       ('ВЕНЕРА', 81156, false);

INSERT INTO atmosphere(weight)
VALUES (1000),
       (3000),
       (1000);


INSERT INTO researcher(planet_id, atmosphere_id, name, age, number)
VALUES (1, 2, 'John', 32, 1),
       (1, 1, 'Marie', 25, 2),
       (2, 3, 'Bob', 54, 5);

INSERT INTO location(name, square)
VALUES ('Таинственное море', 12312),
       ('Поверхность планеты', 123123);

INSERT INTO probe(location_id, type, speed, height, can_reach_them)
VALUES (1, 'Гладиатор', 10000, 3000, true),
       (2, 'Венатор', 10000, 10000, true),
       (1, 'Имперский 1', 1000000, 20000, true);

INSERT INTO pressure(probe_id, value)
VALUES (1, 10000),
       (2, 1),
       (3, 343433);

INSERT INTO gas_density(probe_id, value)
VALUES (1, 12312),
       (2, 1212);

INSERT INTO atmosphere_pressure(atmosphere_id, pressure_id)
VALUES (1, 1),
       (2, 3),
       (3, 2);

INSERT INTO atmosphere_gas_density(atmosphere_id, gas_density_id)
VALUES (1, 2),
       (2, 1),
       (3, 1),
       (1, 1)

