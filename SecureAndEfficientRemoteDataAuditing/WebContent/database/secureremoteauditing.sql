/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.5.42 : Database - identitybasedremotedata
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`identitybasedremotedata` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `identitybasedremotedata`;

/*Table structure for table `aa` */

DROP TABLE IF EXISTS `aa`;

CREATE TABLE `aa` (
  `idaa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `mailid` varchar(45) NOT NULL DEFAULT '',
  `phoneno` varchar(45) NOT NULL DEFAULT '',
  `status` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idaa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `aa` */

insert  into `aa`(`idaa`,`username`,`password`,`mailid`,`phoneno`,`status`) values 
(3,'pkg','pkg','','','yes');

/*Table structure for table `access` */

DROP TABLE IF EXISTS `access`;

CREATE TABLE `access` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `access` */

insert  into `access`(`id`,`username`,`filename`) values 
(1,'nagasrinu.projects@gmail.com','xyz.txt'),
(2,'nagasrinu.projects@gmail.com','2021 New Collected.txt');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `idadmin` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`idadmin`,`adminid`,`password`) values 
(1,'auditor','auditor');

/*Table structure for table `auditingresults` */

DROP TABLE IF EXISTS `auditingresults`;

CREATE TABLE `auditingresults` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filekey` varchar(100) DEFAULT NULL,
  `isDownloaded` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `auditingresults` */

insert  into `auditingresults`(`id`,`username`,`filename`,`filekey`,`isDownloaded`) values 
(1,'nagasrinu482@gmail.com','27-02-2022.txt','DhrNB41W8','yes'),
(2,'nagasrinu482@gmail.com','27-02-2022.txt','DhrNB41W8','yes'),
(3,'nagasrinu482@gmail.com','27-02-2022.txt','7RuJHwUL5','yes'),
(4,'nagasrinu482@gmail.com','27-02-2022.txt','7RuJHwUL5','yes'),
(5,'nagasrinu482@gmail.com','27-02-2022.txt','7RuJHwUL5','yes'),
(6,'nagasrinu482@gmail.com','27-02-2022.txt','7RuJHwUL5','yes'),
(7,'nagasrinu482@gmail.com','27-02-2022.txt','7RuJHwUL5','yes'),
(8,'nagasrinu482@gmail.com','27-02-2022.txt','7RuJHwUL5','yes'),
(9,'nagasrinu.projects@gmail.com','2021 New Collected.txt','aurlydYzu','yes'),
(10,'nagasrinu.projects@gmail.com','2021 New Collected.txt','aurlydYzu','yes'),
(11,'nagasrinu.projects@gmail.com','2021 New Collected1.txt','YWxS2HJ2t','no'),
(12,'nagasrinu.projects@gmail.com','2021 New Collected1.txt','YWxS2HJ2t','no'),
(13,'nagasrinu.projects@gmail.com','2021 New Collected1.txt','YWxS2HJ2t','no'),
(14,'nagasrinu.projects@gmail.com','2021 New Collected1.txt','YWxS2HJ2t','no'),
(15,'nagasrinu.projects@gmail.com','xyz.txt','YWxS2HJ2t','yes');

/*Table structure for table `ca` */

DROP TABLE IF EXISTS `ca`;

CREATE TABLE `ca` (
  `idca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `caid` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ca` */

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `idowner` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `mailid` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `phoneno` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idowner`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`idowner`,`username`,`mailid`,`password`,`phoneno`) values 
(1,'prasad','nagasrinu482@gmail.com','prasad','9989273669'),
(2,'vijay','vijay@gmail.com','vijay','9989273669');

/*Table structure for table `upload_file` */

DROP TABLE IF EXISTS `upload_file`;

CREATE TABLE `upload_file` (
  `idupload_file` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `file` longblob NOT NULL,
  `filename` varchar(45) NOT NULL DEFAULT '',
  `skey` varchar(45) NOT NULL DEFAULT '',
  `status` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`idupload_file`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `upload_file` */

insert  into `upload_file`(`idupload_file`,`userid`,`file`,`filename`,`skey`,`status`) values 
(1,'prasad','Documentation\r\n------------------------------------------\r\n76750 17571	---Dynamic Receprocol UMLS\r\n98512 12777	---On the security of Class   9381489617\r\n85001 53343	---Ecommerce Product Review and Rating\r\n93815 68102     ---Multidocument summarization,93815 68102\r\n9121576983	---Big data through cloud\r\n8448195240	---Airtel\r\n8688608298	---New Enquiry Need to Call\r\nAndroid Covid-19 Uml\'s\r\n\r\n\r\n7330688232	---Crypto Currency Price Prediction Abstract Resend\r\n70958 30908	---Modules Description Cloud Project Bojireddy\r\n97030 12016	---Email Spam Document Verification\r\n\r\n99512 40186	---Telecom Fraud detection  talk on phone or zoom\r\n93814 63833	---Traffic Voilation\r\n\r\nBoji Reddy UML\'s\r\n\r\n78930 81918	---DDOS Attack Class\r\n93981 68844	---Spelling Correction\r\n\r\n(779) 910-3650	---MS Assignment\r\n96030 92000	---Power Thefet Mobile App\r\n6303 003 356	---Athidi devo bava\r\n76749 48942	---Brain tumor Area Calculation 6302 137 516\r\n96030 92000	---Power Theft\r\n\r\n\r\n6281567882  -- licience plate detection \r\n\r\n\r\nCode\r\n------------------------------------------\r\n8465978251  --- railway reservation system\r\n2 US projects\r\n\r\n6301297471---real time voice automation and text display for the college department\r\n7675017571-----Dynamic reciprocal(new enquiry)(bhojireddy)\r\n93814 29356 -- Prediction of knee osteo arthritis\r\n96182 26752  -- Flight Delay\r\n91827 58223  -- New Enquiry\r\n\r\n80089 56974  -- Rice Grain Classification\r\n9391949633   --- E-farmer marketing (need-basepaper and functional requirements)\r\n-----------------------------------------------------------------------------------------\r\n77992 72632   -- New Enquiry Need a Java Project\r\n83675 57593   -- Certificate\r\n9597783770   --  new enquiry price discussion\r\n96406 40355  -- Brain Tumor Need to Call\r\n','27-02-2022.txt','7RuJHwUL5','yes'),
(2,'vijay','A decision tree based recommendation system for tourists  USING Machine Learning\r\nConsumer spending prediction using Machine Learning\r\nPredict influencers in the social network detection system using Machine Learning\r\nUsing Deep Learning to Predict Plant Growth and Yield in Greenhouse Environments','2021 New Collected.txt','aurlydYzu','yes'),
(3,'vijay','A decision tree based recommendation system for tourists  USING Machine Learning\r\nConsumer spending prediction using Machine Learning\r\nPredict influencers in the social network detection system using Machine Learning\r\nUsing Deep Learning to Predict Plant Growth and Yield in Greenhouse Environments','xyz.txt','YWxS2HJ2t','yes');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `iduser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `phoneno` varchar(45) NOT NULL DEFAULT '',
  `status` varchar(45) NOT NULL DEFAULT '',
  `rights` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`iduser`,`userid`,`password`,`phoneno`,`status`,`rights`) values 
(1,'nagasrinu482@gmail.com','srinu','7989743392','yes','all'),
(2,'nagasrinu.projects@gmail.com','srinu','9874562301','yes','all');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
