DROP TABLE IF EXISTS CLIENTE, RESTAURANTE, EMPREGADO, PRATO, NUM_TELEF, INGREDIENTE, EMP_CLI;

CREATE TABLE IF NOT EXISTS
PRATO
(
  IdPra INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(128) NOT NULL,
  Preco DECIMAL(4,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS
INGREDIENTE
(
  IdPra INT NOT NULL,
  Ingredientes VARCHAR(128) NOT NULL,
  PRIMARY KEY (IdPra, Ingredientes),
  FOREIGN KEY (IdPra) REFERENCES PRATO(IdPra)
);

CREATE TABLE IF NOT EXISTS
RESTAURANTE
(
  IdRes INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(128) NOT NULL,
  Responsavel INT NOT NULL,
  Horario VARCHAR(64) NOT NULL,
  Especialidade INT NOT NULL,
  MCp VARCHAR(20) NOT NULL,
  MAndar INT DEFAULT NULL,
  MRua VARCHAR(128) NOT NULL,
  MLocalidade VARCHAR(128) NOT NULL,
  FOREIGN KEY (Especialidade) REFERENCES PRATO(IdPra)
);

CREATE TABLE IF NOT EXISTS 
CLIENTE
(
  IdCli INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(128) NOT NULL,
  Localidade VARCHAR(128) DEFAULT NULL,
  Prato INT NOT NULL,
  Restaurante INT NOT NULL,
  FOREIGN KEY (Prato) REFERENCES PRATO(IdPra),
  FOREIGN KEY(Restaurante) REFERENCES RESTAURANTE(IdRes)
);

CREATE TABLE IF NOT EXISTS
NUM_TELEF
(
  IdCli INT NOT NULL,
  Telemovel INT NOT NULL,
  PRIMARY KEY(IdCli,Telemovel),
  FOREIGN KEY(IdCli) REFERENCES CLIENTE(IdCli)
);

CREATE TABLE IF NOT EXISTS
EMPREGADO
(
  IdEmp INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(128) NOT NULL,
  Ordenado INT NOT NULL,
  Restaurante INT NOT NULL,
  Funcao ENUM('Responsável', 'Cozinheiro', 'Empregado de mesa', 'Chefe', 'Empregado de balcão', 'Ajudante de cozinha', 'Copeiro') NOT NULL,
  DataNasc DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS
EMP_CLI
(
  IdEmp INT NOT NULL,
  IdCli INT NOT NULL,
  PRIMARY KEY(IdEmp,IdCli),
  FOREIGN KEY(IdEmp) REFERENCES EMPREGADO(IdEmp),
  FOREIGN KEY(IdCli) REFERENCES CLIENTE(IdCli)
);


INSERT INTO 
    PRATO(Nome, Preco)
VALUES
 ('Francesinha', 10.90), -- 1
 ('Morcegos Acobreados', 19.00), -- 2
 ('Barata Caramelizada', 7.90), -- 3
 ('Porco Sichuan', 15.00), -- 4
 ('Chow Mein', 21.90), -- 5
 ('Frango Kung Pao', 19.90), -- 6
 ('Ma Po Tofu', 29.90), -- 7
 ('Arroz', 5.00), -- 8
 ('Cão Frito', 35.50), -- 9
 ('Yangchow', 20.50); -- 10
 
INSERT INTO 
    INGREDIENTE(IdPra, Ingredientes)
VALUES
 (1, 'Pão'), (1, 'Queijo'), (1, 'Bife de gato'), (1, 'Saliva de cobra'), (1, 'Tripa de porco'),
 (1, 'Pata de barata'), (2, 'Morcego'), (2, 'Cobra piton'), (2, 'Molho variado'),
 (2, 'Oregãos'), (2, 'Batata doce'), (3, 'Barata'), (3, 'Açucar'), (3, 'Alecrim'),
 (4, 'Porco'), (4, 'Pimenta preta'), (4, 'Queijo'), (4, 'Saliva de cobra'), (4, 'Batata branca'),
 (5, 'Esparguete'), (5, 'Pimenta preta'), (5, 'Sal'), (5, 'Cogumelo'), (5, 'Pimento Vermelho'),
 (5, 'Espargos'), (6, 'Rato'), (6, 'Ovo'), (6, 'Pimento Vermelho'), (6, 'Vinagre'),
 (6, 'Cebola'), (7, 'Gato'), (7, 'Alho'), (7, 'Molho variado'), (7, 'Cebola'), (7, 'Feijão'),
 (7, 'Tofu'), (8, 'Água'), (8, 'Alho'), (8, 'Arroz'), (9, 'Cão'), (9, 'Óleo'), (9, 'Batata branca'),
 (9, 'Oregãos'), (9, 'Ovo'), (10, 'Arroz');
 
INSERT INTO
    RESTAURANTE(Nome, Responsavel, Horario, Especialidade, MCp, MAndar, MRua, MLocalidade)
VALUES
 ('Covid-19', 1, '19:00 - 23:00', 2, '1919-420', NULL, 'Travessa de Santa Máscara', 'Wuhan'), -- 1
 ('Chang Cheng Ching', 6, '12:30 - 22:30', 8, '1904-628', 2, 'Praça do Ninja', 'Benfica'), -- 2
 ('Mi Yung Cha', 15, '12:00 - 23:00', 8, '1906-666', NULL, 'Rua do Dragão', 'Olival'); -- 3 

 INSERT INTO 
    CLIENTE(Nome, Localidade, Prato, Restaurante)
VALUES
 ('Augusto Corona da Costa', 'Porto', 9, 1), -- 1
 ('Rita Rodrigues', 'Rio Tinto', 5, 1), -- 2
 ('Luis Filipe Varandas', 'Alvalade', 7, 2), -- 3
 ('Joaquim Alberto', 'Sandim', 1, 1), -- 4
 ('Joacine Katar', 'Seixal', 9, 1), -- 5
 ('Cristiano Aveiro', 'Turim', 3, 2), -- 6
 ('Jessica Jones', 'Nova Iorque', 8, 2), -- 7
 ('Carolina Loureiro', 'Cascais', 10, 3), -- 8
 ('Fernando de Mendes', 'Elvas', 2, 1), -- 9
 ('Olivia Ortiz', 'Estarreja', 4, 2), -- 10
 ('Rodrigo Guedes de Carvalho', 'Ponta Delgada', 5, 3), -- 11
 ('José Castelo Branco', 'Sintra', 1, 3), -- 12
 ('Maria Leal', 'Caxinas', 6, 3), -- 13
 ('Luís Manuel Goucha', 'Oreias', 7, 1), -- 14
 ('Antonio Cavaco Coelho', 'Maia', 6, 3); -- 15

INSERT INTO 
    NUM_TELEF(IdCli, Telemovel)
VALUES
 (1, 921852595), (1, 961522814), (2, 961798940), (3, 922612466), (4, 912990732), (4, 961096746),
 (5, 934251361), (6, 935673849), (7, 917587651), (7, 969534860), (8, 933642080), (9, 967042535),
 (10, 914053326), (10, 912481935), (11, 923715845), (12, 916294854), (13, 937258152), (14, 915764599),
 (14, 912647855), (15, 962146561);

INSERT INTO 
    EMPREGADO(Nome, Ordenado, Restaurante, Funcao, DataNasc)
VALUES
 ('Yang Li Ho', 666, 3, 'Responsável', '1960-05-19'), -- 1
 ('Jackie Chan', 1000, 1, 'Empregado de balcão', '1985-12-07'), -- 2
 ('Stan Lee', 850, 3, 'Empregado de balcão', '1985-03-30'), -- 3
 ('Alfredo José', 700, 1, 'Chefe', '1976-12-24'), -- 4
 ('Volde Morte', 666, 2, 'Chefe', '1984-08-13'), -- 5
 ('Kit Kat', 800, 1, 'Responsável', '1974-01-08'), -- 6
 ('Arlindo Sem Ar', 700, 1, 'Empregado de mesa', '1979-07-01'), -- 7
 ('Harry Potter', 900, 3, 'Chefe', '1968-04-06'), -- 8
 ('Gigle Catabriga', 650, 3, 'Cozinheiro', '1979-11-20'), -- 9
 ('Zip Me', 650, 2, 'Ajudante de cozinha', '1974-12-15'), -- 10
 ('Jack Daniels', 1000, 1, 'Ajudante de cozinha', '1998-03-11'), -- 11
 ('Ha He Hi Chi', 700, 2, 'Empregado de mesa', '1997-06-01'), -- 12
 ('Kinder Bueno', 720, 1, 'Copeiro', '1970-03-24'), -- 13
 ('Milka Nestle', 690, 3, 'Cozinheiro', '1981-07-27'), -- 14
 ('Alface do Lidl', 750, 2, 'Responsável', '1968-02-02'), -- 15
 ('Bata Toon', 730, 3, 'Copeiro', '1982-01-07'), -- 16
 ('Holi Uid', 800, 2, 'Empregado de balcão', '1981-05-31'), -- 17
 ('Rute Marlene', 1200, 3, 'Ajudante de cozinha', '1975-08-13'), -- 18
 ('Horigami Tamagoshi', 750, 2, 'Cozinheiro', '1985-09-16'), -- 19
 ('Kim For Ma Xao', 660, 1, 'Empregado de mesa', '2001-06-27'), -- 20
 ('Em Plo Yi', 670, 3, 'Empregado de mesa', '1971-03-24'); -- 21

INSERT INTO 
    EMP_CLI(IdEmp, IdCli)
VALUES
 (2, 1), (2, 2), (12, 3), (7, 4), (20, 5), (12, 6), (17, 7), (3, 8), (20, 9), (12, 10), (21, 11),
 (3, 12), (21, 13), (7, 14), (21, 15);

ALTER TABLE RESTAURANTE
ADD FOREIGN KEY (Responsavel) REFERENCES EMPREGADO(IdEmp);

ALTER TABLE EMPREGADO
ADD FOREIGN KEY (Restaurante) REFERENCES RESTAURANTE(IdRes);