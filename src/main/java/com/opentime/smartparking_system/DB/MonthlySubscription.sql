create table MonthlySubscription
(
    subscriptionId INT primary key AUTO_INCREMENT,
    memberId INT	NOT NULL,
    fee	INT	NOT NULL  default 120000,
    startDate DATE NOT NULL,
    endDate DATE,
   status ENUM ('active', 'inactive', 'paused', 'cancelled') DEFAULT 'active'
);
