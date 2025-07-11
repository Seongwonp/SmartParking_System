-- auto-generated definition
create table subscription
(
    subscriptionId   int auto_increment
        primary key,
    carId            int                                                                  not null,
    fee              int                                                default 120000    not null,
    startDate        date                                                                 not null,
    endDate          date                                                                 null,
    status           enum ('active', 'inactive', 'paused', 'cancelled') default 'active'  not null,
    subscriptionType enum ('annual', 'monthly')                         default 'monthly' not null,
    constraint fk_car
        foreign key (carId) references smartparking.car (carId)
);

