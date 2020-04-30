CREATE DATABASE IF NOT EXISTS `fms_sql` ;
USE `fms_sql`;

-- Structure for table fms_sql.airport
CREATE TABLE IF NOT EXISTS `airport` (
  `airport_name` varchar(255) NOT NULL,
  `airport_location` varchar(255) NOT NULL,
  `airport_code` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`airport_code`)
);

-- Data for table fms_sql.airport

INSERT IGNORE INTO `airport` (`airport_name`, `airport_location`, `airport_code`) VALUES
	('Kempegowda International Airport', 'Bengaluru', 'BLR'),
	('Indira Gandhi International Airport', 'Delhi', 'DEL'),
	('Rajiv Gandhi International Airport', 'Hyderabad', 'HYD'),
	('Chandigarh International Airport ', 'Chandigarh', 'IXC'),
	('Chennai International Airport ', 'Chennai', 'MAA'),
	('Chhatrapati Shivaji International Airport', 'Mumbai', 'MUM'),
	('Srinagar International Airport', 'Srinagar', 'SXR');


-- Structure for table fms_sql.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ticket_cost` double NOT NULL,
  `flight_number` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `passenger_count` int(11) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`booking_id`)
) AUTO_INCREMENT=10000000011;


-- Structure for table fms_sql.flight
CREATE TABLE IF NOT EXISTS `flight` (
  `flight_number` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrier_name` varchar(255) NOT NULL,
  `flight_model` varchar(255) NOT NULL,
  `seat_capacity` int(11) NOT NULL,
  PRIMARY KEY (`flight_number`)
) AUTO_INCREMENT=10000;



-- Structure for table fms_sql.passenger
CREATE TABLE IF NOT EXISTS `passenger` (
  `pnr_number` bigint(20) NOT NULL AUTO_INCREMENT,
  `passenger_name` varchar(255) NOT NULL,
  `passenger_age` int(11) NOT NULL,
  `passenger_uin` bigint(20) NOT NULL,
  `booking_id` bigint(20) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pnr_number`)
)  AUTO_INCREMENT=10000001;



-- Structure for table fms_sql.schedule
CREATE TABLE IF NOT EXISTS `schedule` (
  `source_airport` varchar(255) NOT NULL DEFAULT '',
  `destination_airport` varchar(255) NOT NULL DEFAULT '',
  `arrival_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `departure_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `airport_code` varchar(10) DEFAULT NULL,
  `flight_number` bigint(20) NOT NULL,
  PRIMARY KEY (`flight_number`)
);


-- Structure for table fms_sql.scheduled_flight
CREATE TABLE IF NOT EXISTS `scheduled_flight` (
  `flight_number` bigint(20) DEFAULT NULL,
  `available_seats` int(11) NOT NULL,
  `source_airport` varchar(255) DEFAULT NULL,
  `destination_airport` varchar(255) DEFAULT NULL,
  `ticket_cost` double DEFAULT NULL,
  KEY `flight_number` (`flight_number`),
  KEY `source_airport` (`source_airport`,`destination_airport`)
) ;


-- Structure for table fms_sql.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_type` varchar(10) NOT NULL,
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_phone` bigint(20) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) AUTO_INCREMENT=100010;

-- Data for table fms_sql.user
INSERT IGNORE INTO `user` (`user_type`, `user_id`, `user_name`, `user_password`, `user_phone`, `user_email`, `flag`) VALUES
	('admin', 99999, 'ADMIN', 'ADMIN', 9999999999, 'admin@frs.com', 1);
