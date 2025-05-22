CREATE TABLE types (
    type_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(20),
    PRIMARY KEY(type_id)
);
CREATE TABLE pokemon (
    pokemon_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    pokemon_weight DECIMAL(5,1) NOT NULL COMMENT 'kg',
    pokemon_height DECIMAL(4,1) NOT NULL COMMENT 'm',
    pokemon_evolution INT UNSIGNED,
    PRIMARY KEY(pokemon_id),
    FOREIGN KEY(pokemon_evolution) REFERENCES pokemon(pokemon_id)
);
CREATE TABLE pokemon_types (
    pokemon_id INT UNSIGNED NOT NULL,
    type_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(pokemon_id, type_id),
    FOREIGN KEY(pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY(type_id) REFERENCES types(type_id)
);
