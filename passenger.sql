-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: PASSENGER_SCHEMA
-- ------------------------------------------------------
-- Server version       10.1.48-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `PASSENGER`
--

DROP TABLE IF EXISTS `PASSENGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PASSENGER` (
  `PASSENGER_NAME` varchar(30) NOT NULL,
  `BUS_CATEGORY` varchar(10) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `ROUTE_ID` varchar(10) NOT NULL,
  `BUS_TYPE` varchar(10) NOT NULL,
  KEY `ROUTE_ID` (`ROUTE_ID`),
  CONSTRAINT `PASSENGER_ibfk_1` FOREIGN KEY (`ROUTE_ID`) REFERENCES `ROUTES` (`ROUTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSENGER`
--

LOCK TABLES `PASSENGER` WRITE;
/*!40000 ALTER TABLE `PASSENGER` DISABLE KEYS */;
INSERT INTO `PASSENGER` VALUES ('Sejal','AC','F','Route1','Sleeper'),('Khusboo','AC','F','Route2','Sleeper'),('Manish','Non-AC','M','Route3','Sitting'),('Anmol','Non-AC','M','Route4','Sitting'),('Ankur','AC','M','Route5','Sitting'),('Pallavi','AC','F','Route6','Sleeper'),('Hemant','Non-AC','M','Route7','Sleeper'),('Piyush','AC','M','Route8','Sitting'),('Udit','Non-AC','M','Route9','Sleeper');
/*!40000 ALTER TABLE `PASSENGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRICE`
--

DROP TABLE IF EXISTS `PRICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRICE` (
  `ROUTE_ID` varchar(10) NOT NULL,
  `BUS_TYPE` varchar(10) NOT NULL,
  `SEASON` varchar(10) NOT NULL,
  `PRICE` int(11) NOT NULL,
  KEY `ROUTE_ID` (`ROUTE_ID`),
  CONSTRAINT `PRICE_ibfk_1` FOREIGN KEY (`ROUTE_ID`) REFERENCES `ROUTES` (`ROUTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRICE`
--

LOCK TABLES `PRICE` WRITE;
/*!40000 ALTER TABLE `PRICE` DISABLE KEYS */;
INSERT INTO `PRICE` VALUES ('Route1','Sleeper','Festive',770),('Route1','Sleeper','Normal',434),('Route3','Sitting','Normal',620),('Route3','Sleeper','Festive',1100),('Route5','Sitting','Normal',620),('Route5','Sleeper','Festive',1240),('Route6','Sleeper','Festive',1320),('Route6','Sitting','Normal',744),('Route7','Sleeper','Festive',1540),('Route7','Sitting','Normal',1488),('Route8','Sitting','Normal',868),('Route8','Sleeper','Festive',2640),('Route9','Sleeper','Festive',2200),('Route9','Sitting','Normal',1860);
/*!40000 ALTER TABLE `PRICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROUTES`
--

DROP TABLE IF EXISTS `ROUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROUTES` (
  `ROUTE_ID` varchar(10) NOT NULL,
  `BOARDING_CITY` varchar(20) NOT NULL,
  `DESTINATION_CITY` varchar(20) NOT NULL,
  `DISTANCE` int(11) NOT NULL,
  PRIMARY KEY (`ROUTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROUTES`
--

LOCK TABLES `ROUTES` WRITE;
/*!40000 ALTER TABLE `ROUTES` DISABLE KEYS */;
INSERT INTO `ROUTES` VALUES ('Route1','Bengaluru','Chennai',350),('Route2','Chennai','Mumbai',1500),('Route3','Hyderabad','Bengaluru',500),('Route4','Mumbai','Hyderabad',700),('Route5','Nagpur','Hyderabad',500),('Route6','Panaji','Bengaluru',600),('Route7','panaji','Mumbai',700),('Route8','Pune','Nagpur',700),('Route9','Trivandrum','panaji',1000);
/*!40000 ALTER TABLE `ROUTES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

3) How many females and how many male passengers travelled for a minimum distance of 
600 KM s?

SELECT
    -> P.GENDER ,
    -> COUNT(P.PASSENGER_NAME)
    -> FROM
    -> PASSENGER P
    -> JOIN ROUTES R ON
    -> P.ROUTE_ID = R.ROUTE_ID
    -> WHERE
    -> R.DISTANCE >= 600
    -> GROUP BY
    -> P.GENDER ;

OUTPUT
+--------+-------------------------+
| GENDER | COUNT(P.PASSENGER_NAME) |
+--------+-------------------------+
| F      |                       2 |
| M      |                       4 |
+----------------------------------+

4) Find the minimum ticket price for Sleeper Bus.

 SELECT
    -> MIN(PRICE)
    -> FROM
    -> PRICE p
    -> WHERE
    -> p.BUS_TYPE = 'Sleeper';
OUTPUT
+------------+
| MIN(PRICE) |
+------------+
|        434 |
+------------+

5) Select passenger names whose names start with character 'S'  

SELECT
    -> PASSENGER_NAME
    -> FROM
    -> PASSENGER p
    -> WHERE
    -> p.PASSENGER_NAME like 'S%';
OUTPUT
+----------------+
| PASSENGER_NAME |
+----------------+
| Sejal          |
+----------------+

6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
Destination City, Bus_Type, Price in the output

SELECT
    -> PA.PASSENGER_NAME ,
    -> R.BOARDING_CITY ,
    -> R.DESTINATION_CITY ,
    -> PR.SEASON ,
    -> PR.BUS_TYPE ,
    -> PR.PRICE
    -> FROM
    -> PASSENGER PA
    -> JOIN ROUTES R ON
    -> PA.ROUTE_ID = R.ROUTE_ID
    -> JOIN PRICE PR ON
    -> R.ROUTE_ID = PR.ROUTE_ID
    -> WHERE
    -> PR.SEASON = 'Festive';
OUTPUT
+----------------+---------------+------------------+---------+----------+-------+
| PASSENGER_NAME | BOARDING_CITY | DESTINATION_CITY | SEASON  | BUS_TYPE | PRICE |
+----------------+---------------+------------------+---------+----------+-------+
| Sejal          | Bengaluru     | Chennai          | Festive | Sleeper  |   770 |
| Manish         | Hyderabad     | Bengaluru        | Festive | Sleeper  |  1100 |
| Ankur          | Nagpur        | Hyderabad        | Festive | Sleeper  |  1240 |
| Pallavi        | Panaji        | Bengaluru        | Festive | Sleeper  |  1320 |
| Hemant         | panaji        | Mumbai           | Festive | Sleeper  |  1540 |
| Piyush         | Pune          | Nagpur           | Festive | Sleeper  |  2640 |
| Udit           | Trivandrum    | panaji           | Festive | Sleeper  |  2200 |
+----------------+---------------+------------------+---------+----------+-------+

7) What is the passenger name and his/her ticket price who travelled in Sitting bus  for a 
distance of 1000 KM s 

SELECT
    -> PA.PASSENGER_NAME ,
    -> PR.PRICE
    -> FROM
    -> PASSENGER PA
    -> JOIN ROUTES R ON
    -> PA.ROUTE_ID = R.ROUTE_ID
    -> JOIN PRICE PR ON
    -> R.ROUTE_ID = PR.ROUTE_ID
    -> WHERE
    -> R.DISTANCE = 1000
    -> AND PR.BUS_TYPE = 'Sitting';
OUTPUT
+----------------+-------+
| PASSENGER_NAME | PRICE |
+----------------+-------+
| Udit           |  1860 |
+----------------+-------+


8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
Panaji? 

SELECT
    -> PA.PASSENGER_NAME ,
    -> R.DESTINATION_CITY AS `BOARDING CITY`,
    -> R.BOARDING_CITY AS `DESTINATION CITY`,
    -> R.DISTANCE ,
    -> PR.BUS_TYPE ,
    -> PR.PRICE
    -> FROM
    -> PASSENGER PA
    -> JOIN ROUTES R ON
    -> PA.ROUTE_ID = R.ROUTE_ID
    -> JOIN PRICE PR ON
    -> R.ROUTE_ID = PR.ROUTE_ID
    -> WHERE
    -> PA.PASSENGER_NAME = 'Pallavi' ;
OUTPUT
+----------------+---------------+------------------+----------+----------+-------+
| PASSENGER_NAME | BOARDING CITY | DESTINATION CITY | DISTANCE | BUS_TYPE | PRICE |
+----------------+---------------+------------------+----------+----------+-------+
| Pallavi        | Bengaluru     | Panaji           |      600 | Sleeper  |  1320 |
| Pallavi        | Bengaluru     | Panaji           |      600 | Sitting  |   744 |
+----------------+---------------+------------------+----------+----------+-------+

9)  List the distances from the "Passenger" table which are unique (non-repeated 
distances) in descending order. 
SELECT
    -> DISTINCT DISTANCE
    -> FROM
    -> PASSENGER P
    -> JOIN ROUTES R ON
    -> P.ROUTE_ID = R.ROUTE_ID
    -> ORDER BY
    -> R.DISTANCE DESC;
OUTPUT
+----------+
| DISTANCE |
+----------+
|     1500 |
|     1000 |
|      700 |
|      600 |
|      500 |
|      350 |
+----------+

10) Display the passenger name and percentage of distance travelled by that passenger 
from the total distance travelled by all passengers without using user variables

SELECT
	P.PASSENGER_NAME ,
	R.DISTANCE ,
	( R.DISTANCE / (
	SELECT
		SUM(R2.DISTANCE)
	FROM
		ROUTES R2)) * 100 AS 'TAGE DIST. BY PASSENGER'
FROM
	PASSENGER P
JOIN ROUTES R ON
	P.ROUTE_ID = R.ROUTE_ID ;
OUTPUT
+-----------------------------------------------------+
|PASSENGER_NAME|DISTANCE|PERCENTAGE DIST. BY PASSENGER|
|--------------|--------|-----------------------------|
|Sejal         |350     |5.3435                       |
|Khusboo       |1500    |22.9008                      |
|Manish        |500     |7.6336                       |
|Anmol         |700     |10.6870                      |
|Ankur         |500     |7.6336                       |
|Pallavi       |600     |9.1603                       |
|Hemant        |700     |10.6870                      |
|Piyush        |700     |10.6870                      |
|Udit          |1000    |15.2672                      |
+-----------------------------------------------------+

11) Display the distance, price in three categories in table Price 
a) Expensive if the cost is more than 1000  
b) Average Cost if the cost is less than 1000 and greater than 500 
c) Cheap otherwise

SELECT
	R.DISTANCE ,
	P.SEASON ,
	P.PRICE,
	CASE
		WHEN P.PRICE > 1000 THEN 'Expensive'
		WHEN P.PRICE <= 1000 AND P.PRICE > 500 THEN 'Average Cost'
		ELSE 'Cheap'
	END AS `VERDICT`
FROM
	ROUTES R
JOIN PRICE P ON
	R.ROUTE_ID = P.ROUTE_ID;

OUTPUT
+-----------------------------------+
|DISTANCE|SEASON |PRICE|VERDICT     |
+-----------------------------------+
|350     |Festive|770  |Average Cost|
|350     |Normal |434  |Cheap       |
|500     |Normal |620  |Average Cost|
|500     |Festive|1100 |Expensive   |
|500     |Normal |620  |Average Cost|
|500     |Festive|1240 |Expensive   |
|600     |Festive|1320 |Expensive   |
|600     |Normal |744  |Average Cost|
|700     |Festive|1540 |Expensive   |
|700     |Normal |1488 |Expensive   |
|700     |Normal |868  |Average Cost|
|700     |Festive|2640 |Expensive   |
|1000    |Festive|2200 |Expensive   |
|1000    |Normal |1860 |Expensive   |
+-----------------------------------+