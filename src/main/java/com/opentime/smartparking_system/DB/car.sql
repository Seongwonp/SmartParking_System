create table car
(
    carId	INT AUTO_INCREMENT primary key,
    userId	INT,
    carNumber VARCHAR(20)	UNIQUE,
    carType	ENUM('일반','경차','장애인')	NOT NULL
)