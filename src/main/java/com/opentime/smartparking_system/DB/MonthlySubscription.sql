CREATE TABLE MonthlySubscription
(
    subscriptionId INT PRIMARY KEY AUTO_INCREMENT,
    memberId       INT  NOT NULL,
    fee            INT  NOT NULL                                      DEFAULT 120000,
    startDate      DATE NOT NULL,
    endDate        DATE,
    status         ENUM ('active', 'inactive', 'paused', 'cancelled') DEFAULT 'active',
    CONSTRAINT fk_member FOREIGN KEY (memberId) REFERENCES user (userId)
);