create database `PlayRoom`;
use `PlayRoom`;

create table `CustomerTypes`(
`id` int(11) NOT NULL auto_increment,
`name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`));
 
 create table `GameTypes`(
`id` int NOT NULL auto_increment,
`name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`));
 
 create table `Customers`(
`code` int(10) not null auto_increment,
`id` int(9) NOT NULL,
`password` varchar(10) NOT NULL,
`name` varchar(50) NOT NULL,
`city` varchar(50) NOT NULL,
`phone` varchar(10) NOT NULL,
`gamesNumber` int NOT NULL ,
`status` int(1) not null default 0,
`id_Type` int(2) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_id_Type` (`id_Type`),
  CONSTRAINT `FK_id_Type` FOREIGN KEY (`id_Type`) REFERENCES `CustomerTypes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
 );
 
create table `Games`(
`id` int NOT NULL auto_increment,
`name` varchar(50) NOT NULL,
`minimalAge` int not null default 0,
`maximalAge` int not null default 99,
`company` varchar(50) NOT NULL,
`id_Type` int(4) NOT NULL,
`minutesDuration` int not null default 0,
`existingNumber` int not null default 1,
PRIMARY KEY (`id`),
CONSTRAINT valid_age check (minimalAge <= 99 and maximalAge>=0),
KEY `FK_id_TypeG` (`id_Type`),
CONSTRAINT `FK_id_TypeG` FOREIGN KEY (`id_Type`) REFERENCES `GameTypes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

create table `BorrowedGame`(
`id` int NOT NULL auto_increment,
`customer_code` int NOT NULL,
`game_id` int not null,
`status` int(1) not null default 0,
`borrowDate` date not null default (CURRENT_DATE()),
`returnDate` date,
PRIMARY KEY (`id`),
KEY `FK_customer_code` (`customer_code`),
CONSTRAINT `FK_customer_code` FOREIGN KEY (`customer_code`) REFERENCES `Customers` (`code`) ON DELETE RESTRICT ON UPDATE CASCADE,
KEY `FK_game_id` (`game_id`),
CONSTRAINT `FK_game_id` FOREIGN KEY (`game_id`) REFERENCES `Games` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);


insert into playroom.games (id,name,minimalAge,maximalAge, company, id_Type,minutesDuration,existingNumber)
values(1,'play ja',1,7,'ghj',1,15,1)
insert into playroom.gametypes (id,name)
values(1,'effort')