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
CREATE TABLE holder (
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
,amount_OfBalls INT NOT NULL
,create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
,status CHAR(1) NOT NULL DEFAULT 'A'
);
""";

const createIceCream = """
CREATE TABLE ice_cream (
id INTEGER PRIMARY KEY AUTOINCREMENT
,id_flavour INT NOT NULL
,id_holder INT NOT NULL
,amount_OfBalls INT NOT NULL
,price DECIMAL(6,2) NOT NULL
,create_date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
,status CHAR(1) NOT NULL DEFAULT 'A'

,FOREIGN KEY (id_flavour) REFERENCES flavour (id)
,FOREIGN KEY (id_holder) REFERENCES holder (id)
);
""";

const createIceCreamFlavour = """
CREATE TABLE ice_cream_flavour
id INTEGER PRIMARY KEY AUTOINCREMENT
,id_flavour INT NOT NULL
,id_ice_cream INT NOT NULL

,FOREIGN KEY (id_flavour) REFERENCES flavour (id)
,FOREIGN KEY (id_ice_cream) REFERENCES ice_cream (id)
);
""";

const createCoverageHolder = """
CREATE TABLE coverage_holder
id INTEGER PRIMARY KEY AUTOINCREMENT
,id_coverage INT NOT NULL
,id_holder INT NOT NULL

,FOREIGN KEY (id_coverage) REFERENCES coverage (id)
,FOREIGN KEY (id_holder) REFERENCES holder (id)
);
""";
