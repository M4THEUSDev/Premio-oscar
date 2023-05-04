-- 1- Quantas vezes Natalie Portman foi indicada ao Oscar? -- 
SELECT *  FROM movies WHERE name = 'Natalie Portman';

-- 2- Quantos Oscars Natalie Portman ganhou? -- 
SELECT COUNT(*), name FROM movies WHERE name = 'Natalie Portman' and winner = '1';

-- 3- Amy Adams já ganhou algum Oscar? -- 
SELECT * FROM movies where `name` LIKE "%Amy Adams%" and winner = 1;

-- 4- A série de filmes Toy Story ganhou um Oscar em quais anos? -- 
SELECT year_ceremony FROM movies where film = 'Toy Story' ORDER BY year_ceremony ASC LIMIT 1;

-- 5- Quem tem mais Oscars: a categoria "Melhor Ator" ou "Melhor Filme"? -- 
SELECT category, COUNT(*) FROM movies WHERE category IN ("ACTOR", "film") AND winner = 1 GROUP BY category ORDER BY winner DESC LIMIT 1;

-- 6- O primeiro Oscar para melhor Atriz foi para quem? Em que ano? -- 
SELECT `name` , year_ceremony FROM movies WHERE category = "ACTRESS" ORDER BY year_ceremony ASC LIMIT 1;

-- 7- Na coluna/campo Winner, altere todos os valores com "True" para 1 e todos os valores "False" para 0. -- 
UPDATE movies SET winner = 1 WHERE winner = "True"; 
UPDATE movies SET winner = 0 WHERE winner = "False"; 

-- 8- Em qual edição do Oscar "Crash" ganhou o prêmio principal? -- 
SELECT year_ceremony FROM movies WHERE film = "Crash";

-- 9- Bom... dê um Oscar para um filme que merece muito, mas não ganhou. -- 
INSERT INTO movies  (`year_film`, `year_ceremony`, `ceremony`, `category`, `name`, `film`, `winner`) VALUES
(1927,1928,1,'ACTOR','Richard Barthelmess','The Noose',1);

-- 10- O filme Central do Brasil aparece no Oscar? -- 
SELECT `film` FROM movies where film = "Central do Brasil";

-- 11- Inclua no banco 3 filmes que nunca nem foram nomeados ao Oscar, mas que na sua opinião, merecem. -- 
INSERT INTO movies (`year_film`, `year_ceremony`, `ceremony`, `category`, `name`, `film`, `winner`, premiacao) VALUES
						(1940,1940,1,'ACTOR','Charles Chaplin','O Grande Ditador ','False', "Filme bom"),
						(1941,1941,1,'ACTOR','Orson Welles','Cidadão Kane','False', "Filme bom"),
                        (1957,1957,1,'ACTOR','Henry Fonda','Doze Homens e uma Sentença','False', "Filme bom");


-- 12- Crie uma nova categoria de premiação. Qualquer prêmio que você queira dar. Agora vamos dar esses prêmios aos filmes que você cadastrou na questão acima.-- 
ALTER TABLE movies ADD COLUMN premiacao varchar(255) NOT NULL;

-- 13- Qual foi o primeiro ano a ter um prêmio do Oscar? -- 
SELECT year_ceremony FROM movies WHERE winner = 1 ORDER BY year_ceremony;


-- 14 - Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor? -- 
SELECT * FROM movies WHERE year_film = 2002 and category IN ('Melhor Filme', 'Melhor Atriz', 'Melhor Diretor');

-- 15- Agora procure 7 atrizes que não sejam americanas, europeias ou brasileiras.  Vamos cadastrá-los no nosso banco, mas eles ainda não ganharam o Oscar. Só foram nomeados. -- 
INSERT INTO movies (`year_film`, `year_ceremony`, `ceremony`, `category`, `name`, `film`, `winner`, premiacao) VALUES
						(2001,2001,1,'ACTRESS','Zhang Ziyi','O Tigre e o Dragão','False', ""),
						(2018 ,2018 ,1,'ACTRESS','Yalitza Aparicio','Roma','False', ""),
                        (2007 ,2007 ,1,'ACTRESS','Rinko Kikuchi','Babel','False', ""),
                        (2003 ,2004,1,'ACTRESS','Shohreh Aghdashloo','Casa de Areia e Névoa','False', ""),
                        (1935,1936,1,'ACTRESS','Merle Oberon','The Dark Angel','False', ""),
                        (2002,2003,1,'ACTRESS','Salma Hayek','Frida','False', ""),
                        (2004,2005,1,'ACTRESS','Catalina Sandino Moreno','Maria Cheia de Graça','False', "");
                        
-- 16- Agora vamos falar da sua vida. Me diga o nome de uma pessoa que você admira e o que ela fez na sua vida. Agora me diz: Quê prêmio essa pessoa merece? -- 
INSERT INTO movies (`year_film`, `year_ceremony`, `ceremony`, `category`, `name`, `film`, `winner`, premiacao) VALUES
				   (1969,2023,1,'ACTOR','Marcelo De Assis','Grande admiração pelo meu pai','True', "Melhor Pai do Mundo!"),
				   (1973 ,2023 ,1,'ACTRESS','Iraneide Pereira Silva','Grande admiração pela minha mãe','True', "Melhor Mãe do Mundo!");