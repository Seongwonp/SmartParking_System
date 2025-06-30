create table car
(
    carId     int auto_increment
        primary key,
    userId    int                      null,
    carNumber varchar(20)              null,
    carModel varchar(30) not null,
    carType   enum ('일반', '경차', '장애인') not null,
    constraint carNumber
        unique (carNumber),
    constraint userId
        foreign key (userId) references smartparking.user (userId)
)