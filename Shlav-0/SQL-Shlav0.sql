-- TZ : 337966642 Name : Avinoam Sebbah
-- For the Int() I did not manage to modify the Data Type Size because ErdPlus does not give me the possibility

CREATE TABLE area
(
  areaId INT NOT NULL,
  areaName VARCHAR(20) NOT NULL,
  PRIMARY KEY (areaId)
);

CREATE TABLE city
(
  cityName VARCHAR(20) NOT NULL,
  areaId INT NOT NULL,
  PRIMARY KEY (cityName),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE agent
(
  agentName VARCHAR(20) NOT NULL,
  Rating INT NOT NULL,
  HireYear INT NOT NULL,
  agentId INT NOT NULL,
  bossID INT NOT NULL,
  salary FLOAT NOT NULL,
  areaId INT NOT NULL,
  PRIMARY KEY (agentId),
  FOREIGN KEY (areaId) REFERENCES area(areaId)
);

CREATE TABLE client
(
  clientId INT NOT NULL,
  clientName VARCHAR(20) NOT NULL,
  phoneNr VARCHAR(10) NOT NULL,
  address VARCHAR(25) NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  agentId INT NOT NULL,
  cityName VARCHAR(20) NOT NULL,
  PRIMARY KEY (clientId),
  FOREIGN KEY (agentId) REFERENCES agent(agentId),
  FOREIGN KEY (cityName) REFERENCES city(cityName)
);

CREATE TABLE shedule
(
  meetingTime DATE NOT NULL,
  clientId INT NOT NULL,
  agentId INT NOT NULL,
  PRIMARY KEY (meetingTime, clientId, agentId),
  FOREIGN KEY (clientId) REFERENCES client(clientId),
  FOREIGN KEY (agentId) REFERENCES agent(agentId)
);
