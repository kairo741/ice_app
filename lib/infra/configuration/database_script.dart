const createFlavour = """
CREATE TABLE flavour (
id INTEGER PRIMARY KEY AUTOINCREMENT
,name VARCHAR(150) NOT NULL
,color VARCHAR(150) NOT NULL
,base VARCHAR(150)
,create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
,status CHAR(1) NOT NULL DEFAULT 'A'
);
""";

const createCoverage = """
CREATE TABLE coverage (
id INTEGER PRIMARY KEY AUTOINCREMENT
,name VARCHAR(150) NOT NULL
,id_flavour INT NOT NULL
,type VARCHAR(150) NOT NULL
,create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
,status CHAR(1) NOT NULL DEFAULT 'A'

,FOREIGN KEY (id_flavour) REFERENCES flavour (id)

);
""";

const createHolder = """
CREATE TABLE holder (
id INTEGER PRIMARY KEY AUTOINCREMENT
,name VARCHAR(150) NOT NULL
,amount_of_balls INT NOT NULL
,create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
,status CHAR(1) NOT NULL DEFAULT 'A'
);
""";

const createIceCream = """
CREATE TABLE ice_cream (
id INTEGER PRIMARY KEY AUTOINCREMENT
,id_flavour INT NOT NULL
,id_coverage INT NOT NULL
,id_holder INT NOT NULL
,amount_of_balls INT NOT NULL
,price DECIMAL(6,2) NOT NULL
,create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
,status CHAR(1) NOT NULL DEFAULT 'A'

,FOREIGN KEY (id_flavour) REFERENCES flavour (id)
,FOREIGN KEY (id_holder) REFERENCES holder (id)
);
""";

const createIceCreamFlavour = """
CREATE TABLE ice_cream_flavour(
id INTEGER PRIMARY KEY AUTOINCREMENT
,id_flavour INT NOT NULL
,id_ice_cream INT NOT NULL

,FOREIGN KEY (id_flavour) REFERENCES flavour (id)
,FOREIGN KEY (id_ice_cream) REFERENCES ice_cream (id)
);
""";

const createCoverageHolder = """
CREATE TABLE coverage_ice_cream(
id INTEGER PRIMARY KEY AUTOINCREMENT
,id_coverage INT NOT NULL
,id_ice_cream INT NOT NULL

,FOREIGN KEY (id_coverage) REFERENCES coverage (id)
,FOREIGN KEY (id_ice_cream) REFERENCES ice_cream (id)
);
""";

const userFlavoursInsert = """
INSERT INTO flavour (name, color, base) VALUES 
('chocolate', 'marrom', 'cacau');
INSERT INTO coverage (name, id_flavour, type) VALUES 
('chocolate',1, 'pegajosa');
INSERT INTO holder (name, amount_of_balls) VALUES
('barquinha', 4);
INSERT INTO ice_cream (id_flavour, id_coverage, id_holder, amount_of_balls, price) VALUES
(1, 1, 1, 4, 8.5);
INSERT INTO coverage_ice_cream (id_coverage, id_ice_cream) VALUES
(1, 1);
INSERT INTO ice_cream_flavour (id_flavour, id_ice_cream) VALUES
(1, 1);
""";
