-- auto-generated definition
create table parkingrecord
(
    recordId  int auto_increment
        primary key,
    carId     int                  null,
    entryTime datetime             not null,
    exitTime  timestamp            null,
    fee       int                  null,
    isExited  tinyint(1) default 0 null
);

