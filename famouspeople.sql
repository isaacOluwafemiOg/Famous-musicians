/* creating database of famous musicians*/
CREATE DATABASE famous_people;

/* directing queries to the famous_people database*/
USE famous_people;

/* creating table on the personal details of famous musicians*/
CREATE TABLE personal (fullname TEXT, stagename TEXT, age INTEGER, city TEXT, country TEXT);
INSERT INTO personal VALUES ('Kirk Dewayne Franklin', 'kirk franklin', 52  , 'texas', 'USA');
INSERT INTO personal VALUES ('Onika Tanya Maraj-Petty', 'Nicki Minaj' ,39 , 'port of spain', 'trinidad and tobago');
INSERT INTO personal VALUES ('Natasha Tameika Cobbs Leonard' ,'Tasha Cobbs', 41 , 'georgia','USA');
INSERT INTO personal VALUES ('Dwayne Michael Carter Jr.','Lil Wayne', 40  , 'New Orleans', 'USA');
INSERT INTO personal VALUES ('Taylor Alison Swift', 'Taylor Swift' ,32,  'Pennsylvania', 'USA' );
INSERT INTO personal VALUES ('Edward Christopher Sheeran', 'Ed Sheeran' ,31 ,'West Yorkshire', 'England');
INSERT INTO personal VALUES ('Stevland Hardaway Morris', 'Stevie Wonder',72 ,'Michigan', 'USA');
INSERT INTO personal VALUES ('Adele Laurie Blue Adkins', 'Adele',34 ,'London', 'England');
INSERT INTO personal VALUES ('Robyn Rihanna Fenty', 'Rihanna',34 ,'St Michael', 'Barbados');
INSERT INTO personal VALUES ('Aubrey Drake Graham', 'Drake',36 ,'Toronto', 'Canada');


/* creating table containing career details of famous musicians*/
CREATE TABLE music_career (fullname TEXT, record_label TEXT, main_genre TEXT, networth_mil_dol INTEGER, featured_with TEXT);
INSERT INTO music_career VALUES ( 'Kirk Dewayne Franklin',  'rca records', 'gospel', 8.5, 'Stevie Wonder');
INSERT INTO music_career VALUES ('Onika Tanya Maraj-Petty',  'Young Money Entertainment', 'hip hop',100, 'Dwayne Michael Carter Jr.');
INSERT INTO music_career VALUES ('Natasha Tameika Cobbs Leonard'  ,'capitol christian music group' ,'gospel', 4,'Onika Tanya Maraj-Petty');
INSERT INTO music_career VALUES ('Dwayne Michael Carter Jr.' , 'Young Money Entertainment' ,'hip hop', 175,'Aubrey Drake Graham');
INSERT INTO music_career VALUES ('Taylor Alison Swift' , 'Republic Records' ,'Pop',400 , 'Edward Christopher Sheeran');
INSERT INTO music_career VALUES ('Edward Christopher Sheeran' , 'Gingerbread Man Records', 'pop', 200,'Adele Laurie Blue Adkins' );
INSERT INTO music_career VALUES ('Adele Laurie Blue Adkins' , 'Columbia Records', 'RnB', 225,'Robyn Rihanna Fenty' );
INSERT INTO music_career VALUES ('Robyn Rihanna Fenty' , 'ROC Nation', 'hip hop', 1400,'Dwayne Michael Carter Jr.' );
INSERT INTO music_career VALUES ('Aubrey Drake Graham' , 'Young Money Entertainment', 'pop', 180,'Taylor Alison Swift' );


/* creating table on the family life details of famous musicians*/
CREATE TABLE family_life (fullname TEXT, spouse_2022 TEXT, children_number INTEGER);
INSERT INTO family_life VALUES ( 'Kirk Dewayne Franklin', 'tammy collins',4);
INSERT INTO family_life VALUES ('Onika Tanya Maraj-Petty' , 'kenneth petty',1);
INSERT INTO family_life VALUES ('Natasha Tameika Cobbs Leonard', 'kenneth leonard',3);
INSERT INTO family_life VALUES ('Dwayne Michael Carter Jr.' , 'Divorced',4);
INSERT INTO family_life VALUES ('Taylor Alison Swift', 'Not married',0);
INSERT INTO family_life VALUES ('Edward Christopher Sheeran', 'Cherry Seaborn',2);
INSERT INTO family_life VALUES ('Adele Laurie Blue Adkins', 'Divorced',1);
INSERT INTO family_life VALUES ('Robyn Rihanna Fenty', 'Rakim Athelaston Mayers',1);
INSERT INTO family_life VALUES ('Aubrey Drake Graham', 'Not married',1);



/*How fertile are the famous musicians from each main_genre*/
SELECT music_career.main_genre,AVG(family_life.children_number) as genre_breedrate
FROM music_career
JOIN family_life
ON music_career.fullname=family_life.fullname
GROUP BY music_career.main_genre;

/*list of collaborations using their stagenames*/
SELECT personal.stagename as musician_stagename , personal2.stagename as 'stagename of collaborator'
FROM music_career
JOIN personal
ON music_career.fullname=personal.fullname
JOIN personal AS personal2
ON music_career.featured_with=personal2.fullname;


/*comparing networths based on country of birth*/
SELECT personal.country,AVG(music_career.networth_mil_dol) AS avg_networth
FROM personal
JOIN music_career
ON personal.fullname=music_career.fullname
GROUP BY personal.country
ORDER BY avg_networth DESC;


/*avegrage networth based on marriage status*/
SELECT 
(CASE WHEN family_life.spouse_2022 = 'Not married' THEN 'Not married'
		WHEN family_life.spouse_2022 = 'Divorced' THEN 'Divorced'
        ELSE 'married'
        END) AS marriage_status,
AVG(music_career.networth_mil_dol) as avg_networth
FROM music_career
JOIN family_life
ON music_career.fullname=family_life.fullname
GROUP BY marriage_status
ORDER BY avg_networth DESC;
    
/*SELECT * FROM family_life;
SELECT * FROM music_career;
SELECT * FROM personal;
DROP TABLE family_life;
DROP TABLE music_career;
DROP TABLE personal;*/
