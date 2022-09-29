CREATE DATABASE famous_people;
USE famous_people;
CREATE TABLE personal (fullname TEXT, stagename TEXT, age INTEGER, city TEXT, country TEXT);
INSERT INTO personal VALUES ('Kirk Dewayne Franklin', 'kirk franklin', 52  , 'texas', 'USA');
INSERT INTO personal VALUES ('Onika Tanya Maraj-Petty', 'Nicki Minaj' ,39 , 'port of spain', 'trinidad and tobago');
INSERT INTO personal VALUES ('Natasha Tameika Cobbs Leonard' ,'Tasha Cobbs', 41 , 'georgia','USA');
INSERT INTO personal VALUES ('Dwayne Michael Carter Jr.','Lil Wayne', 40  , 'New Orleans', 'USA');
INSERT INTO personal VALUES ('Taylor Alison Swift', 'Taylor Swift' ,32,  'Pennsylvania', 'USA' );
INSERT INTO personal VALUES ('Edward Christopher Sheeran', 'Ed Sheeran' ,31 ,'West Yorkshire', 'England');

CREATE TABLE music_career (fullname TEXT, record_label TEXT, main_genre TEXT, networth_mil_dol INTEGER, featured_with TEXT);
INSERT INTO music_career VALUES ( 'Kirk Dewayne Franklin',  'rca records', 'gospel', 8.5, 'Stevie Wonder');
INSERT INTO music_career VALUES ('Onika Tanya Maraj-Petty',  'Young Money Entertainment', 'hip pop',100, 'Natasha Tameika Cobbs Leonard');
INSERT INTO music_career VALUES ('Natasha Tameika Cobbs Leonard'  ,'capitol christian music group' ,'gospel', 4,'Onika Tanya Maraj-Petty');
INSERT INTO music_career VALUES ('Dwayne Michael Carter Jr.' , 'Young Money Entertainment' ,'hip pop', 175,'Onika Tanya Maraj-Petty');
INSERT INTO music_career VALUES ('Taylor Alison Swift' , 'Republic Records' ,'Pop',400 , 'Edward Christopher Sheeran');
INSERT INTO music_career VALUES ('Edward Christopher Sheeran' , 'Gingerbread Man Records', 'pop', 200,'Taylor Alison Swift' );

CREATE TABLE family_life (fullname TEXT, spouse_2022 TEXT, children_number INTEGER);
INSERT INTO family_life VALUES ( 'Kirk Dewayne Franklin', 'tammy collins',4);
INSERT INTO family_life VALUES ('Onika Tanya Maraj-Petty' , 'kenneth petty',1);
INSERT INTO family_life VALUES ('Natasha Tameika Cobbs Leonard', 'kenneth leonard',3);
INSERT INTO family_life VALUES ('Dwayne Michael Carter Jr.' , 'Divorced',4);
INSERT INTO family_life VALUES ('Taylor Alison Swift', 'Not married',0);
INSERT INTO family_life VALUES ('Edward Christopher Sheeran', 'Cherry Seaborn',2);

SELECT * FROM family_life;
SELECT * FROM music_career;
SELECT * FROM personal;

SELECT music_career.main_genre,sum(family_life.children_number) as genre_breedrate
FROM music_career
JOIN family_life
GROUP BY music_career.main_genre;