-- auto-generated definition
create table user
(
    userId            int auto_increment
        primary key,
    userName          varchar(50)                                        not null,
    password          varchar(255)                                       not null,
    name              varchar(50)                                        not null,
    phone             varchar(20)                                        not null,
    role              enum ('USER', 'ADMIN') default 'USER'              null,
    isSubscription    tinyint(1)             default 0                   null,
    subscriptionStart date                                               null,
    subscriptionEnd   date                                               null,
    joinDate          datetime               default current_timestamp() null,
    constraint userName
        unique (userName)
);

