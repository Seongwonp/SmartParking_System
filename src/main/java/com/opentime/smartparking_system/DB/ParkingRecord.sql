create table parkingRecord
(
    recordId INT AUTO_INCREMENT primary key,
    carId    INT,
    entryTime DATETIME NOT NULL,
    exitTime DATETIME not null,
    fee INT not null ,
    isExited BOOLEAN DEFAULT FALSE
);

ALTER TABLE parkingRecord MODIFY exitTime TIMESTAMP NULL;

ALTER TABLE parkingRecord MODIFY fee INT NULL;


