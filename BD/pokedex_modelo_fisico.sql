--/*
create schema pokedex;

--create domain lo as oid;

create table pokedex.PESSOA(
ID integer,
NOME varchar,
primary key (ID)
);

create table pokedex.TREINADOR(
ID integer,
CLASSE varchar, 
MESTRE boolean,
foreign key (ID) references pokedex.PESSOA (ID)
);

create table pokedex.PROFESSOR (
ID integer,
LOCAL varchar,
AREA_DE_ESTUDO varchar,
foreign key (ID) references pokedex.PESSOA (ID)
);

create table pokedex.TIPO(
NOME varchar,
DESCRICAO text,
primary key (NOME)
);

create table pokedex.GINASIO (
NOME varchar,
LIDER varchar, 
LOCAL varchar, 
TIPO varchar, 
BADGE varchar,
Foreign Key (TIPO) references pokedex.TIPO (NOME)
);

create table pokedex.MOVIMENTO(
ID integer,
NOME varchar, 
TIPO varchar, 
CATEGORIA varchar,
CONTEST varchar,
POWER integer, 
DANO integer,
ACURACIA real,
Primary key (ID),
Foreign Key (TIPO) references pokedex.TIPO(NOME)
);

create table pokedex.EFETIVIDADE (
TIPO varchar, 
NORMAL real,
FIRE real,
WATER real,
ELECTRIC real,
GRASS real,
ICE real,
FIGHTING real,
POISON real,
GROUND real,
FLYING real,
PSYCHIC real,
BUG real,
ROCK real,
GHOST real,
DRAGON real,
Foreign Key (TIPO) references pokedex.TIPO (NOME)
);

create table pokedex.POKEMON(
NUMERO integer, 
NOME varchar, 
URL varchar, --NOME_IMAGEM varchar,
--IMAGEM lo,
DESCRICAO text, 
ALTURA real, 
PESO real, 
HP integer,
ATK integer, 
DEF integer,
SPEED integer, 
SPECIAL integer,
CATEGORIA varchar, 
TIPO_1 varchar, 
TIPO_2 varchar, 
EVOLUI_DE integer, 
EVOLUI_PARA integer,
primary key (NUMERO),
Foreign Key (TIPO_1) references pokedex.TIPO(NOME),
Foreign Key (TIPO_2) references pokedex.TIPO(NOME),
FOREIGN KEY (EVOLUI_DE) references pokedex.POKEMON (NUMERO),
FOREIGN KEY (EVOLUI_PARA) references pokedex.POKEMON (NUMERO)
);

create table pokedex.POSSUI (
ID_PESSOA integer,
ID_POKEMON integer,
Foreign Key (ID_PESSOA) references pokedex.PESSOA (ID),
Foreign Key (ID_POKEMON) references pokedex.POKEMON (NUMERO)
);

--INSERT--

insert into pokedex.PESSOA values (1, 'Ash Ketchum');
insert into pokedex.PESSOA values (2, 'Misty');
insert into pokedex.PESSOA values (3, 'Brock');
insert into pokedex.PESSOA values (4, 'Jessie');
insert into pokedex.PESSOA values (5, 'James');
insert into pokedex.PESSOA values (6, 'Professor Oak');
insert into pokedex.PESSOA values (7, 'Professor Elm');
insert into pokedex.PESSOA values (8, 'Professor Birch');
insert into pokedex.PESSOA values (9, 'Professor Rowan');
insert into pokedex.PESSOA values (10, 'Professor Juniper');
insert into pokedex.PESSOA values (11, 'Professor Sycamore');
insert into pokedex.PESSOA values (12, 'Professor Kukui');

insert into pokedex.TREINADOR values (1, 'Trainer', true);
insert into pokedex.TREINADOR values (2, 'Swimmer', false);
insert into pokedex.TREINADOR values (3, 'Hiker', false);
insert into pokedex.TREINADOR values (4, 'Team Rocket', false);
insert into pokedex.TREINADOR values (5, 'Team Rocket', false);

insert into pokedex.PROFESSOR values (6, 'Kanto', 'Relationships between Pokémon and humans.');
insert into pokedex.PROFESSOR values (7, 'Johto', 'Pokémon breeding patterns.');
insert into pokedex.PROFESSOR values (8, 'Hoenn', 'Pokémon habitats.');
insert into pokedex.PROFESSOR values (9, 'Sinnoh', 'Pokémon Evolution.');
insert into pokedex.PROFESSOR values (10, 'Unova', 'The origins of Pokémon.');
insert into pokedex.PROFESSOR values (11, 'Kalos', 'Mega Evolution and change.');
insert into pokedex.PROFESSOR values (12, 'Alola', 'Pokémon attacks.');

insert into pokedex.TIPO values ('Normal');
insert into pokedex.TIPO values ('Fire');
insert into pokedex.TIPO values ('Fighting');
insert into pokedex.TIPO values ('Water');
insert into pokedex.TIPO values ('Flying');
insert into pokedex.TIPO values ('Grass');
insert into pokedex.TIPO values ('Poison');
insert into pokedex.TIPO values ('Electric');
insert into pokedex.TIPO values ('Ground');
insert into pokedex.TIPO values ('Psychic');
insert into pokedex.TIPO values ('Rock');
insert into pokedex.TIPO values ('Ice');
insert into pokedex.TIPO values ('Bug');
insert into pokedex.TIPO values ('Dragon');
insert into pokedex.TIPO values ('Ghost');

insert into pokedex.GINASIO values ('Pewter Gym', 'Brock', 'Pewter City', 'Rock', 'Boulder Badge');
insert into pokedex.GINASIO values ('Cerulean Gym', 'Misty', 'Cerulean City', 'Water', 'Cascade Badge');
insert into pokedex.GINASIO values ('Vermilion Gym', 'Lt. Surge', 'Vermilion City', 'Electric', 'Thunder Badge');
insert into pokedex.GINASIO values ('Celadon Gym', 'Erika', 'Celadon City', 'Grass', 'Rainbow Badge');
insert into pokedex.GINASIO values ('Fuchsia Gym', 'Koga', 'Fuchsia City', 'Poison', 'Soul Badge');
insert into pokedex.GINASIO values ('Saffron Gym', 'Sabrina', 'Saffron City', 'Psychic', 'Marsh Badge');
insert into pokedex.GINASIO values ('Cinnabar Gym', 'Blaine', 'Cinnabar City', 'Fire', 'Volcano Badge');
insert into pokedex.GINASIO values ('Viridian Gym', 'Giovanni', 'Viridian City', 'Ground', 'Earth Badge');

insert into pokedex.MOVIMENTO values (1,'Pound','Normal','Physical','Tough',35,40, 1);
insert into pokedex.MOVIMENTO values (2,'Karate Chop','Normal','Physical','Tough',25,50, 1);
insert into pokedex.MOVIMENTO values (3,'Double Slap','Normal','Physical','Cute',10,15, 0.85);
insert into pokedex.MOVIMENTO values (4,'Comet Punch','Normal','Physical','Tough',15,18, 0.85);
insert into pokedex.MOVIMENTO values (5,'Mega Punch','Normal','Physical','Tough',20,80, 0.85);
insert into pokedex.MOVIMENTO values (6,'Pay Day','Normal','Physical','Clever',20,40, 1);
insert into pokedex.MOVIMENTO values (7,'Fire Punch','Fire','Physical','Tough',15,75, 1);
insert into pokedex.MOVIMENTO values (8,'Ice Punch','Ice','Physical','Beautiful',15,75, 1);
insert into pokedex.MOVIMENTO values (9,'Thunder Punch','Electric','Physical','Cool',15,75, 1);
insert into pokedex.MOVIMENTO values (10,'Scratch','Normal','Physical','Tough',35,40, 1);
insert into pokedex.MOVIMENTO values (11,'Vice Grip','Normal','Physical','Tough',30,55, 1);
insert into pokedex.MOVIMENTO values (12,'Guillotine','Normal','Physical','Cool',5,0, 0.3);
insert into pokedex.MOVIMENTO values (13,'Razor Wind','Normal','Special','Cool',10,80, 0.75);
insert into pokedex.MOVIMENTO values (14,'Swords Dance','Normal','Status','Beautiful',30,0, 0);
insert into pokedex.MOVIMENTO values (15,'Cut','Normal','Physical','Cool',30,50, 0.95);
insert into pokedex.MOVIMENTO values (16,'Gust','Normal','Special','Clever',35,40, 1);
insert into pokedex.MOVIMENTO values (17,'Wing Attack','Flying','Physical','Cool',35,35, 1);
insert into pokedex.MOVIMENTO values (18,'Whirlwind','Normal','Status','Clever',20,0, 0.85);
insert into pokedex.MOVIMENTO values (19,'Fly','Flying','Physical','Clever',15,70, 0.95);
insert into pokedex.MOVIMENTO values (20,'Bind','Normal','Physical','Tough',20,15, 0.75);
insert into pokedex.MOVIMENTO values (21,'Slam','Normal','Physical','Tough',20,80, 0.75);
insert into pokedex.MOVIMENTO values (22,'Vine Whip','Grass','Physical','Cool',10,35, 1);
insert into pokedex.MOVIMENTO values (23,'Stomp','Normal','Physical','Tough',20,65, 1);
insert into pokedex.MOVIMENTO values (24,'Double Kick','Fighting','Physical','Cool',30,30, 1);
insert into pokedex.MOVIMENTO values (25,'Mega Kick','Normal','Physical','Cool',5,120, 0.75);
insert into pokedex.MOVIMENTO values (26,'Jump Kick','Fighting','Physical','Cool',25,70, 0.95);
insert into pokedex.MOVIMENTO values (27,'Rolling Kick','Fighting','Physical','Cool',15,60, 0.85);
insert into pokedex.MOVIMENTO values (28,'Sand Attack','Normal','Status','Cute',15,0, 1);
insert into pokedex.MOVIMENTO values (29,'Headbutt','Normal','Physical','Tough',15,70, 1);
insert into pokedex.MOVIMENTO values (30,'Horn Attack','Normal','Physical','Cool',25,65, 1);
insert into pokedex.MOVIMENTO values (31,'Fury Attack','Normal','Physical','Cool',20,15, 0.85);
insert into pokedex.MOVIMENTO values (32,'Horn Drill','Normal','Physical','Cool',5,0, 0.3);
insert into pokedex.MOVIMENTO values (33,'Tackle','Normal','Physical','Tough',35,35, 0.95);
insert into pokedex.MOVIMENTO values (34,'Body Slam','Normal','Physical','Tough',15,85, 1);
insert into pokedex.MOVIMENTO values (35,'Wrap','Normal','Physical','Tough',20,15, 0.85);
insert into pokedex.MOVIMENTO values (36,'Take Down','Normal','Physical','Tough',20,90, 0.85);
insert into pokedex.MOVIMENTO values (37,'Thrash','Normal','Physical','Tough',20,90, 1);
insert into pokedex.MOVIMENTO values (38,'Double-Edge','Normal','Physical','Tough',15,100, 1);
insert into pokedex.MOVIMENTO values (39,'Tail Whip','Normal','Status','Cute',30,0, 1);
insert into pokedex.MOVIMENTO values (40,'Poison Sting','Poison','Physical','Clever',35,15, 1);
insert into pokedex.MOVIMENTO values (41,'Twineedle','Bug','Physical','Cool',20,25, 1);
insert into pokedex.MOVIMENTO values (42,'Pin Missile','Bug','Physical','Cool',20,14, 0.85);
insert into pokedex.MOVIMENTO values (43,'Leer','Normal','Status','Cool',30,0, 1);
insert into pokedex.MOVIMENTO values (44,'Bite','Normal','Physical','Tough',25,60, 1);
insert into pokedex.MOVIMENTO values (45,'Growl','Normal','Status','Cute',40,0, 1);
insert into pokedex.MOVIMENTO values (46,'Roar','Normal','Status','Cool',20,0, 1);
insert into pokedex.MOVIMENTO values (47,'Sing','Normal','Status','Cute',15,0, 0.55);
insert into pokedex.MOVIMENTO values (48,'Supersonic','Normal','Status','Clever',20,0, 0.55);
insert into pokedex.MOVIMENTO values (49,'Sonic Boom','Normal','Special','Cool',20,20, 0.9);
insert into pokedex.MOVIMENTO values (50,'Disable','Normal','Status','Clever',20,0, 0.55);
insert into pokedex.MOVIMENTO values (51,'Acid','Poison','Special','Clever',30,40, 1);
insert into pokedex.MOVIMENTO values (52,'Ember','Fire','Special','Cute',25,40, 1);
insert into pokedex.MOVIMENTO values (53,'Flamethrower','Fire','Special','Beautiful',15,95, 1);
insert into pokedex.MOVIMENTO values (54,'Mist','Ice','Status','Beautiful',30,0, 0);
insert into pokedex.MOVIMENTO values (55,'Water Gun','Water','Special','Cute',25,40, 1);
insert into pokedex.MOVIMENTO values (56,'Hydro Pump','Water','Special','Beautiful',5,120, 0.8);
insert into pokedex.MOVIMENTO values (57,'Surf','Water','Special','Beautiful',15,95, 1);
insert into pokedex.MOVIMENTO values (58,'Ice Beam','Ice','Special','Beautiful',10,95, 1);
insert into pokedex.MOVIMENTO values (59,'Blizzard','Ice','Special','Beautiful',5,120, 0.895);
insert into pokedex.MOVIMENTO values (60,'Psybeam','Psychic','Special','Beautiful',20,65, 1);
insert into pokedex.MOVIMENTO values (61,'Bubble Beam','Water','Special','Beautiful',20,65, 1);
insert into pokedex.MOVIMENTO values (62,'Aurora Beam','Ice','Special','Beautiful',20,65, 1);
insert into pokedex.MOVIMENTO values (63,'Hyper Beam','Normal','Special','Cool',5,150, 0.9);
insert into pokedex.MOVIMENTO values (64,'Peck','Flying','Physical','Cool',35,35, 1);
insert into pokedex.MOVIMENTO values (65,'Drill Peck','Flying','Physical','Cool',20,80, 1);
insert into pokedex.MOVIMENTO values (66,'Submission','Fighting','Physical','Cool',25,80, 0.8);
insert into pokedex.MOVIMENTO values (67,'Low Kick','Fighting','Physical','Tough',20,50, 0.9);
insert into pokedex.MOVIMENTO values (68,'Counter','Fighting','Physical','Tough',20,0, 1);
insert into pokedex.MOVIMENTO values (69,'Seismic Toss','Fighting','Physical','Tough',20,0, 1);
insert into pokedex.MOVIMENTO values (70,'Strength','Normal','Physical','Tough',15,80, 1);
insert into pokedex.MOVIMENTO values (71,'Absorb','Grass','Special','Clever',20,20, 1);
insert into pokedex.MOVIMENTO values (72,'Mega Drain','Grass','Special','Clever',10,40, 1);
insert into pokedex.MOVIMENTO values (73,'Leech Seed','Grass','Status','Clever',10,0, 0.9);
insert into pokedex.MOVIMENTO values (74,'Growth','Normal','Status','Beautiful',40,0, 0);
insert into pokedex.MOVIMENTO values (75,'Razor Leaf','Grass','Physical','Cool',25,55, 0.95);
insert into pokedex.MOVIMENTO values (76,'Solar Beam','Grass','Special','Cool',10,120, 1);
insert into pokedex.MOVIMENTO values (77,'Poison Powder','Poison','Status','Clever',35,0, 0.75);
insert into pokedex.MOVIMENTO values (78,'Stun Spore','Grass','Status','Clever',30,0, 0.75);
insert into pokedex.MOVIMENTO values (79,'Sleep Powder','Grass','Status','Clever',15,0, 0.75);
insert into pokedex.MOVIMENTO values (80,'Petal Dance','Grass','Special','Beautiful',20,70, 1);
insert into pokedex.MOVIMENTO values (81,'String Shot','Bug','Status','Clever',40,0, 0.95);
insert into pokedex.MOVIMENTO values (82,'Dragon Rage','Dragon','Special','Cool',10,40, 1);
insert into pokedex.MOVIMENTO values (83,'Fire Spin','Fire','Special','Beautiful',15,15, 0.7);
insert into pokedex.MOVIMENTO values (84,'Thunder Shock','Electric','Special','Cool',30,40, 1);
insert into pokedex.MOVIMENTO values (85,'Thunderbolt','Electric','Special','Cool',15,95, 1);
insert into pokedex.MOVIMENTO values (86,'Thunder Wave','Electric','Status','Cool',20,0, 1);
insert into pokedex.MOVIMENTO values (87,'Thunder','Electric','Special','Cool',10,120, 0.7);
insert into pokedex.MOVIMENTO values (88,'Rock Throw','Rock','Physical','Tough',15,50, 0.65);
insert into pokedex.MOVIMENTO values (89,'Earthquake','Ground','Physical','Tough',10,100, 1);
insert into pokedex.MOVIMENTO values (90,'Fissure','Ground','Physical','Tough',5,0, 0.3);
insert into pokedex.MOVIMENTO values (91,'Dig','Ground','Physical','Tough',10,100, 1);
insert into pokedex.MOVIMENTO values (92,'Toxic','Poison','Status','Clever',10,0, 0.85);
insert into pokedex.MOVIMENTO values (93,'Confusion','Psychic','Special','Clever',25,50, 1);
insert into pokedex.MOVIMENTO values (94,'Psychic','Psychic','Special','Clever',10,90, 1);
insert into pokedex.MOVIMENTO values (95,'Hypnosis','Psychic','Status','Clever',20,0, 0.6);
insert into pokedex.MOVIMENTO values (96,'Meditate','Psychic','Status','Beautiful',40,0, 0);
insert into pokedex.MOVIMENTO values (97,'Agility','Psychic','Status','Cool',30,0, 0);
insert into pokedex.MOVIMENTO values (98,'Quick Attack','Normal','Physical','Cool',30,40, 1);
insert into pokedex.MOVIMENTO values (99,'Rage','Normal','Physical','Tough',20,20, 1);
insert into pokedex.MOVIMENTO values (100,'Teleport','Psychic','Status','Cool',20,0, 0);
insert into pokedex.MOVIMENTO values (101,'Night Shade','Ghost','Special','Clever',15,0, 1);
insert into pokedex.MOVIMENTO values (102,'Mimic','Normal','Status','Cute',10,0, 1);
insert into pokedex.MOVIMENTO values (103,'Screech','Normal','Status','Clever',40,0, 0.85);
insert into pokedex.MOVIMENTO values (104,'Double Team','Normal','Status','Cool',15,0, 0);
insert into pokedex.MOVIMENTO values (105,'Recover','Normal','Status','Clever',20,0, 0);
insert into pokedex.MOVIMENTO values (106,'Harden','Normal','Status','Tough',30,0, 0);
insert into pokedex.MOVIMENTO values (107,'Minimize','Normal','Status','Cute',20,0, 0);
insert into pokedex.MOVIMENTO values (108,'Smokescreen','Normal','Status','Clever',20,0, 1);
insert into pokedex.MOVIMENTO values (109,'Confuse Ray','Ghost','Status','Clever',10,0, 1);
insert into pokedex.MOVIMENTO values (110,'Withdraw','Water','Status','Cute',40,0, 0);
insert into pokedex.MOVIMENTO values (111,'Defense Curl','Normal','Status','Cute',40,0, 0);
insert into pokedex.MOVIMENTO values (112,'Barrier','Psychic','Status','Cool',30,0, 0);
insert into pokedex.MOVIMENTO values (113,'Light Screen','Psychic','Status','Beautiful',30,0, 0);
insert into pokedex.MOVIMENTO values (114,'Haze','Ice','Status','Beautiful',30,0, 0);
insert into pokedex.MOVIMENTO values (115,'Reflect','Psychic','Status','Clever',20,0, 0);
insert into pokedex.MOVIMENTO values (116,'Focus Energy','Normal','Status','Cool',30,0, 0);
insert into pokedex.MOVIMENTO values (117,'Bide','Normal','Physical','Tough',10,0, 1);
insert into pokedex.MOVIMENTO values (118,'Metronome','Normal','Status','Cute',10,0, 0);
insert into pokedex.MOVIMENTO values (119,'Mirror Move','Flying','Status','Clever',20,0, 0);
insert into pokedex.MOVIMENTO values (120,'Self-Destruct','Normal','Physical','Beautiful',5,130, 1);
insert into pokedex.MOVIMENTO values (121,'Egg Bomb','Normal','Physical','Cute',10,100, 0.75);
insert into pokedex.MOVIMENTO values (122,'Lick','Ghost','Physical','Cute',30,20, 1);
insert into pokedex.MOVIMENTO values (123,'Smog','Poison','Special','Tough',20,20, 0.7);
insert into pokedex.MOVIMENTO values (124,'Sludge','Poison','Special','Tough',20,65, 1);
insert into pokedex.MOVIMENTO values (125,'Bone Club','Ground','Physical','Tough',20,65, 0.85);
insert into pokedex.MOVIMENTO values (126,'Fire Blast','Fire','Special','Beautiful',5,120, 0.85);
insert into pokedex.MOVIMENTO values (127,'Waterfall','Water','Physical','Tough',15,80, 1);
insert into pokedex.MOVIMENTO values (128,'Clamp','Water','Physical','Tough',10,35, 0.75);
insert into pokedex.MOVIMENTO values (129,'Swift','Normal','Special','Cool',20,60, 0);
insert into pokedex.MOVIMENTO values (130,'Skull Bash','Normal','Physical','Tough',15,100, 1);
insert into pokedex.MOVIMENTO values (131,'Spike Cannon','Normal','Physical','Cool',15,20, 1);
insert into pokedex.MOVIMENTO values (132,'Constrict','Normal','Physical','Tough',35,10, 1);
insert into pokedex.MOVIMENTO values (133,'Amnesia','Psychic','Status','Cute',20,0, 0);
insert into pokedex.MOVIMENTO values (134,'Kinesis','Psychic','Status','Clever',15,0, 0.8);
insert into pokedex.MOVIMENTO values (135,'Soft-Boiled','Normal','Status','Cute',10,0, 0);
insert into pokedex.MOVIMENTO values (136,'High Jump Kick','Fighting','Physical','Cool',20,85, 0.9);
insert into pokedex.MOVIMENTO values (137,'Glare','Normal','Status','Tough',30,0, 0.75);
insert into pokedex.MOVIMENTO values (138,'Dream Eater','Psychic','Special','Clever',15,100, 1);
insert into pokedex.MOVIMENTO values (139,'Poison Gas','Poison','Status','Clever',40,0, 0.55);
insert into pokedex.MOVIMENTO values (140,'Barrage','Normal','Physical','Cute',20,15, 0.85);
insert into pokedex.MOVIMENTO values (141,'Leech Life','Bug','Physical','Clever',15,20, 1);
insert into pokedex.MOVIMENTO values (142,'Lovely Kiss','Normal','Status','Beautiful',10,0, 0.75);
insert into pokedex.MOVIMENTO values (143,'Sky Attack','Flying','Physical','Cool',5,140, 0.9);
insert into pokedex.MOVIMENTO values (144,'Transform','Normal','Status','Clever',10,0, 0);
insert into pokedex.MOVIMENTO values (145,'Bubble','Water','Special','Cute',30,20, 1);
insert into pokedex.MOVIMENTO values (146,'Dizzy Punch','Normal','Physical','Cute',10,70, 1);
insert into pokedex.MOVIMENTO values (147,'Spore','Grass','Status','Beautiful',15,0, 1);
insert into pokedex.MOVIMENTO values (148,'Flash','Normal','Status','Beautiful',20,0, 0.7);
insert into pokedex.MOVIMENTO values (149,'Psywave','Psychic','Special','Clever',15,0, 0.8);
insert into pokedex.MOVIMENTO values (150,'Splash','Normal','Status','Cute',40,0, 0);
insert into pokedex.MOVIMENTO values (151,'Acid Armor','Poison','Status','Tough',40,0, 0);
insert into pokedex.MOVIMENTO values (152,'Crabhammer','Water','Physical','Tough',10,90, 0.85);
insert into pokedex.MOVIMENTO values (153,'Explosion','Normal','Physical','Beautiful',5,170, 1);
insert into pokedex.MOVIMENTO values (154,'Fury Swipes','Normal','Physical','Tough',15,18, 0.8);
insert into pokedex.MOVIMENTO values (155,'Bonemerang','Ground','Physical','Tough',10,50, 0.9);
insert into pokedex.MOVIMENTO values (156,'Rest','Psychic','Status','Cute',10,0, 0);
insert into pokedex.MOVIMENTO values (157,'Rock Slide','Rock','Physical','Tough',10,75, 0.9);
insert into pokedex.MOVIMENTO values (158,'Hyper Fang','Normal','Physical','Cool',15,80, 0.9);
insert into pokedex.MOVIMENTO values (159,'Sharpen','Normal','Status','Cute',30,0, 0);
insert into pokedex.MOVIMENTO values (160,'Conversion','Normal','Status','Beautiful',30,0, 0);
insert into pokedex.MOVIMENTO values (161,'Tri Attack','Normal','Special','Beautiful',10,80, 1);
insert into pokedex.MOVIMENTO values (162,'Super Fang','Normal','Physical','Tough',10,0, 0.9);
insert into pokedex.MOVIMENTO values (163,'Slash','Normal','Physical','Cool',20,70, 1);
insert into pokedex.MOVIMENTO values (164,'Substitute','Normal','Status','Cute',10,0, 0);
insert into pokedex.MOVIMENTO values (165,'Struggle','Normal','Physical','Tough',10,50, 1);

insert into pokedex.EFETIVIDADE values ('Normal', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 0, 1);
insert into pokedex.EFETIVIDADE values ('Fire', 1, 0.5, 0.5, 1, 2, 2, 1, 1, 1, 1, 1, 2, 0.5, 1, 0.5);
insert into pokedex.EFETIVIDADE values ('Water', 1, 2, 0.5, 1, 0.5, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0.5); 
insert into pokedex.EFETIVIDADE values ('Electric', 1, 1, 2, 0.5, 0.5, 1, 1, 1, 0, 2, 1, 1, 1, 1, 0.5) ;
insert into pokedex.EFETIVIDADE values ('Grass', 1, 0.5, 2, 1, 0.5, 1, 1, 0.5, 2, 0.5, 1, 0.5, 2, 1, 0.5) ;
insert into pokedex.EFETIVIDADE values ('Ice', 1, 1, 0.5, 1, 2, 0.5, 1, 1, 2, 2, 1, 1, 1, 1, 2) ;
insert into pokedex.EFETIVIDADE values ('Fighting', 2, 1, 1, 1, 1, 2, 1, 0.5, 1, 0.5, 0.5, 0.5, 2, 0, 1) ;
insert into pokedex.EFETIVIDADE values ('Poison', 1, 1, 1, 1, 2, 1, 1, 0.5, 0.5, 1, 1, 2, 0.5, 0.5, 1) ;
insert into pokedex.EFETIVIDADE values ('Ground', 1, 2, 1, 2, 0.5, 1, 1, 2, 1, 0, 1, 0.5, 2, 1, 1);
insert into pokedex.EFETIVIDADE values ('Flying', 1, 1, 1, 0.5, 2, 1, 2, 1, 1, 1, 1, 2, 0.5, 1, 1) ;
insert into pokedex.EFETIVIDADE values ('Psychic', 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0.5, 1, 1, 1, 1) ;
insert into pokedex.EFETIVIDADE values ('Bug', 1, 0.5, 1, 1, 2, 1, 0.5, 2, 1, 0.5, 2, 1, 1, 1, 1) ;
insert into pokedex.EFETIVIDADE values ('Rock', 1, 2, 1, 1, 1, 2, 0.5, 1, 0.5, 2, 1, 2, 1, 1, 1) ;
insert into pokedex.EFETIVIDADE values ('Ghost', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1) ;
insert into pokedex.EFETIVIDADE values ('Dragon', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2);

insert into pokedex.POKEMON values (1, 'Bulbasaur', 'G:\2017.1\Pokedex\imagens\001.png', --'001.png', lo_import('/home/jvmr1/Pokedex/imagens/001.png'), 
'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun"s rays, the seed grows progressively larger.',
0.7, 6.9, 45,49,49,45,65, 'Seed', 'Grass', 'Poison', null, null);

insert into pokedex.POKEMON values (2, 'Ivysaur', 'G:\2017.1\Pokedex\imagens\002.png',--'002.png', lo_import('/home/jvmr1/Pokedex/imagens/002.png'), 
'There is a bud on this Pokémon"s back. To support its weight, Ivysaur"s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it"s a sign that the bud will bloom into a large flower soon.',
1, 12, 60,62,63,60,80, 'Seed', 'Grass', 'Poison', 1, null);

insert into pokedex.POKEMON values (3, 'Venusaur', 'G:\2017.1\Pokedex\imagens\003.png', --'003.png', lo_import('/home/jvmr1/Pokedex/imagens/003.png'), 
'There is a large flower on Venusaur"s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower"s aroma soothes the emotions of people.',
2, 100, 80,82,83,80,100, 'Seed', 'Grass', 'Poison', null, null);

insert into pokedex.POKEMON values (4, 'Charmander', 'G:\2017.1\Pokedex\imagens\004.png',--'004.png', lo_import('/home/jvmr1/Pokedex/imagens/004.png'), 
'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.',
0.6, 8.5, 39,52,43,65,50, 'Lizard', 'Fire', null, null, null);

insert into pokedex.POKEMON values (5, 'Charmeleon', 'G:\2017.1\Pokedex\imagens\005.png',--'005.png', lo_import('/home/jvmr1/Pokedex/imagens/005.png'), 
'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.',
1.1, 19, 58,64,58,80,65, 'Flame', 'Fire', null, null, null);

insert into pokedex.POKEMON values (6, 'Charizard', 'G:\2017.1\Pokedex\imagens\006.png',--'006.png', lo_import('/home/jvmr1/Pokedex/imagens/006.png'), 
'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.',
1.7, 90.5, 78,84,78,100,85, 'Flame', 'Fire', 'Flying', null, null);

insert into pokedex.POKEMON values (7, 'Squirtle', 'G:\2017.1\Pokedex\imagens\007.png',--'007.png', lo_import('/home/jvmr1/Pokedex/imagens/007.png'),
'Squirtle"s shell is not merely used for protection. The shell"s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.',
0.5, 9, 44,48,65,43,50, 'Tiny Turtle', 'Water', null, null, null);

insert into pokedex.POKEMON values (8, 'Wartortle', 'G:\2017.1\Pokedex\imagens\008.png',--'008.png', lo_import('/home/jvmr1/Pokedex/imagens/008.png'),
'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon"s toughness as a battler.',
1, 22.5, 59,63,80,58,65, 'Turtle', 'Water', null, null, null);

insert into pokedex.POKEMON values (9, 'Blastoise', 'G:\2017.1\Pokedex\imagens\009.png',--'009.png', lo_import('/home/jvmr1/Pokedex/imagens/009.png'),
'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.',
1.6, 85.5, 79,83,100,78,85, 'Shellfish', 'Water', null, null, null);

insert into pokedex.POKEMON values (25, 'Pikachu', 'G:\2017.1\Pokedex\imagens\025.png',--'025.png', lo_import('/home/jvmr1/Pokedex/imagens/025.png'),
'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it"s evidence that this Pokémon mistook the intensity of its charge.',
0.4, 6, 35,55,30,90,50, 'Mouse', 'Electric', null, null, null);

insert into pokedex.POKEMON values (26, 'Raichu', 'G:\2017.1\Pokedex\imagens\026.png',--'026.png', lo_import('/home/jvmr1/Pokedex/imagens/026.png'),
'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon"s nest.',
0.8, 30, 60,90,55,100,90, 'Mouse', 'Electric', null, null, null);

insert into pokedex.POKEMON values (52, 'Meowth', 'G:\2017.1\Pokedex\imagens\052.png',--'052.png', lo_import('/home/jvmr1/Pokedex/imagens/052.png'),
'Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.',
0.4, 4.2, 40,45,35,90,40, 'Scratch Cat', 'Normal', null, null, null);

insert into pokedex.POKEMON values (53, 'Persian', 'G:\2017.1\Pokedex\imagens\053.png',--'053.png', lo_import('/home/jvmr1/Pokedex/imagens/053.png'),
'Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon"s surrounding vicinity. It becomes docile if grabbed by the whiskers.',
1, 32, 65,70,60,115,65, 'Classy Cat', 'Normal', null, null, null);

insert into pokedex.POKEMON values (74, 'Geodude', 'G:\2017.1\Pokedex\imagens\074.png',--'074.png', lo_import('/home/jvmr1/Pokedex/imagens/074.png'),
'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon"s heart will remain hard, craggy, and rough always.',
0.4, 20, 40,80,100,20,30, 'Rock', 'Rock', 'Ground', null, null);

insert into pokedex.POKEMON values (75, 'Graveler', 'G:\2017.1\Pokedex\imagens\075.png',--'075.png', lo_import('/home/jvmr1/Pokedex/imagens/075.png'),
'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.',
1, 105, 55,95,115,35,45, 'Rock', 'Rock', 'Ground', null, null);

insert into pokedex.POKEMON values (076, 'Golem', 'G:\2017.1\Pokedex\imagens\076.png',--'076.png', lo_import('/home/jvmr1/Pokedex/imagens/076.png'),
'Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.',
1.4, 300, 80,110,130,45,55, 'Megaton', 'Rock', 'Ground', null, null);

insert into pokedex.POKEMON values (95, 'Onix', 'G:\2017.1\Pokedex\imagens\095.png',--'095.png', lo_import('/home/jvmr1/Pokedex/imagens/095.png'),
'Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.',
8.8, 210, 35,45,160,70,30, 'Rock Snake', 'Rock', 'Ground', null, null);

insert into pokedex.POKEMON values (109, 'Koffing', 'G:\2017.1\Pokedex\imagens\109.png',--'109.png', lo_import('/home/jvmr1/Pokedex/imagens/109.png'),
'If Koffing becomes agitated, it raises the toxicity of its internal gases and jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.',
0.6, 1, 40,65,95,35,60, 'Poison Gas', 'Poison', null, null, null);

insert into pokedex.POKEMON values (110, 'Weezing', 'G:\2017.1\Pokedex\imagens\110.png',--'110.png', lo_import('/home/jvmr1/Pokedex/imagens/110.png'),
'Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.',
1.2, 9.5, 65,90,120,60,85, 'Poison Gas', 'Poison', null, null, null);

insert into pokedex.POKEMON values (116, 'Horsea', 'G:\2017.1\Pokedex\imagens\116.png',--'116.png', lo_import('/home/jvmr1/Pokedex/imagens/116.png'),
'Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.',
0.4, 8, 30,40,70,60,70, 'Dragon', 'Water', null, null, null);

insert into pokedex.POKEMON values (117, 'Seadra', 'G:\2017.1\Pokedex\imagens\117.png',--'117.png', lo_import('/home/jvmr1/Pokedex/imagens/117.png'),
'Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon"s poison barbs if they fail to notice it.',
1.2, 25, 55,65,95,85,95, 'Dragon', 'Water', null, null, null);

insert into pokedex.POKEMON values (120, 'Staryu', 'G:\2017.1\Pokedex\imagens\120.png',--'120.png', lo_import('/home/jvmr1/Pokedex/imagens/120.png'),
'Staryu"s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.',
0.8, 34.5, 30,45,55,85,70, 'Star Shape', 'Water', null, null, null);

insert into pokedex.POKEMON values (121, 'Starmie', 'G:\2017.1\Pokedex\imagens\121.png',--'121.png', lo_import('/home/jvmr1/Pokedex/imagens/121.png'),
'Starmie"s center section—the core—glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname “the gem of the sea."',
1.1, 80, 60,75,85,115,100, 'Mysterious', 'Water', 'Psychic', null, null);

update pokedex.POKEMON set evolui_de=1 where numero=2;
update pokedex.POKEMON set evolui_de=2 where numero=3;
update pokedex.POKEMON set evolui_para=2 where numero=1;
update pokedex.POKEMON set evolui_para=3 where numero=2;

update pokedex.POKEMON set evolui_de=4 where numero=5;
update pokedex.POKEMON set evolui_de=5 where numero=6;
update pokedex.POKEMON set evolui_para=5 where numero=4;
update pokedex.POKEMON set evolui_para=6 where numero=5;

update pokedex.POKEMON set evolui_de=7 where numero=8;
update pokedex.POKEMON set evolui_de=8 where numero=9;
update pokedex.POKEMON set evolui_para=8 where numero=7;
update pokedex.POKEMON set evolui_para=9 where numero=8;

update pokedex.POKEMON set evolui_de=25 where numero=26;
update pokedex.POKEMON set evolui_para=26 where numero=25;

update pokedex.POKEMON set evolui_de=52 where numero=53;
update pokedex.POKEMON set evolui_para=53 where numero=52;

update pokedex.POKEMON set evolui_de=74 where numero=75;
update pokedex.POKEMON set evolui_de=75 where numero=76;
update pokedex.POKEMON set evolui_para=75 where numero=74;
update pokedex.POKEMON set evolui_para=76 where numero=75;

update pokedex.POKEMON set evolui_de=109 where numero=110;
update pokedex.POKEMON set evolui_para=110 where numero=109;

update pokedex.POKEMON set evolui_de=116 where numero=117;
update pokedex.POKEMON set evolui_para=117 where numero=118;

update pokedex.POKEMON set evolui_de=120 where numero=121;
update pokedex.POKEMON set evolui_para=121 where numero=120;

insert into pokedex.POSSUI values (1, 1);
insert into pokedex.POSSUI values (1, 4);
insert into pokedex.POSSUI values (1, 7);
insert into pokedex.POSSUI values (1, 25);
insert into pokedex.POSSUI values (2, 116);
insert into pokedex.POSSUI values (2, 120);
insert into pokedex.POSSUI values (3, 74);
insert into pokedex.POSSUI values (3, 95);
insert into pokedex.POSSUI values (4, 52);
insert into pokedex.POSSUI values (5, 109);
--*/

/*
--DROP FUNCTION calcular_dano(integer,integer);
CREATE OR REPLACE FUNCTION calcular_dano(id_golpe integer, id_vitima integer)--, tipo_golpe varchar, tipo_vitima varchar)
RETURNS double precision AS
'select case
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Normal'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Normal from pokedex.EFETIVIDADE e where e.tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Fire'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Fire from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Fighting'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Fighting from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Water'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Water from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Flying'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Flying from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Grass'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Grass from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Poison'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Poison from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Electric'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Electric from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Ground'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Ground from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Psychic'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Psychic from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Rock'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Rock from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Ice'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Ice from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Bug'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Bug from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Dragon'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Dragon from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
when (select p.tipo_1 from pokedex.POKEMON p where p.numero = $2) = ''Ghost'' then (select m.dano from pokedex.MOVIMENTO m where m.id = $1) * (select e.Ghost from pokedex.EFETIVIDADE e where tipo = (select m.tipo from pokedex.MOVIMENTO m where m.id = $1))
end'
LANGUAGE sql;
--*/

--Algumas pesquisas:
--Listar os nomes de treinadores os pokemons que ele possui
--select pes.nome, pok.nome from pokedex.PESSOA pes join pokedex.POSSUI p on pes.id = p.id_pessoa join pokedex.POKEMON pok on p.id_pokemon = pok.numero;

--Listar os pokemons, seus tipos e seus possíveis golpes
--select p.nome, p.tipo_1, p.tipo_2, m.nome as golpe, m.tipo from pokedex.MOVIMENTO m join pokedex.POKEMON p on (m.tipo = p.tipo_1 or m.tipo = p.tipo_2) order by p.numero;

--Listar os ginásios, as cidades onde estão localizados e seus líderes
--select g.nome, g.local, g.lider from pokedex.ginasio g;

--Listar os pokemons, seus tipos e os ginásios onde podem treinar
--select p.nome, p.tipo_1, p.tipo_2, g.nome, g.tipo from pokedex.GINASIO g join pokedex.TIPO t on g.tipo = t.nome join pokedex.POKEMON p on p.tipo_1 = t.nome or p.tipo_2 = t.nome order by p.numero;

--Pesquisa usando EXISTS/NOT EXISTS: Listar pokemons que têm/não têm dono
--SELECT p.nome FROM pokedex.POKEMON p  WHERE EXISTS (select * from pokedex.POSSUI pos where pos.id_pokemon = p.numero) order by p.numero;

--Pesquisa usando HAVING: Listar Tipos de pokemons e seu número de movimentos, exceto do tipo 'Normal'
--SELECT t.nome, count(m.nome) FROM pokedex.TIPO t join pokedex.MOVIMENTO m on t.nome = m.tipo GROUP BY t.nome HAVING t.nome <> 'Normal' order by count(m.nome) desc

--Uso de Função e Trigger (explicaremos o funcionamento na apresentação)
/*
drop table pokedex.batalha;
create table pokedex.BATALHA(
NUMERO integer, 
NOME varchar, 
HP integer,
TIPO_1 varchar, 
TIPO_2 varchar, 
primary key (NUMERO),
Foreign Key (TIPO_1) references pokedex.TIPO(NOME),
Foreign Key (TIPO_2) references pokedex.TIPO(NOME)
);
insert into pokedex.BATALHA select p.numero, p.nome, p.hp, p.tipo_1, p.tipo_2 from pokedex.POKEMON p where numero = 4;
insert into pokedex.BATALHA select p.numero, p.nome, p.hp, p.tipo_1, p.tipo_2 from pokedex.POKEMON p where numero = 7;
*/

/*
CREATE or replace FUNCTION atualiza_hp() RETURNS trigger AS $atualiza$
BEGIN
IF NEW.hp <= 0 THEN
RAISE EXCEPTION 'Pokemon Fainted!';
END IF;
NEW.hp := OLD.hp;
RETURN NEW;
END;
$atualiza$ LANGUAGE plpgsql;

drop trigger IF EXISTS atualiza on pokedex.batalha;
CREATE TRIGGER atualiza AFTER UPDATE ON pokedex.batalha
FOR EACH ROW EXECUTE PROCEDURE atualiza_hp();
*/

--select m.id, m.nome, m.tipo, m.dano from pokedex.MOVIMENTO m join pokedex.POKEMON p on (m.tipo = p.tipo_1 or m.tipo = p.tipo_2) and p.numero = 4 order by m.dano;
--update pokedex.batalha set hp = (hp-calcular_dano(83, 7)) where numero = 7;
--select * from pokedex.batalha;
