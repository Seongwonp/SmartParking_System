CREATE TABLE user (
                      userId INT AUTO_INCREMENT PRIMARY KEY,
                      userName VARCHAR(50) UNIQUE NOT NULL,
                      password VARCHAR(255) NOT NULL,
                      name VARCHAR(50) NOT NULL,
                      phone VARCHAR(20) NOT NULL,
                      role ENUM('USER','ADMIN') DEFAULT 'USER',
                      isSubscription BOOLEAN DEFAULT FALSE,
                      subscriptionStart DATE NULL,
                      subscriptionEnd DATE NULL,
                      joinDate DATETIME DEFAULT CURRENT_TIMESTAMP
);