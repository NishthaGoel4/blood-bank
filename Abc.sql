/*
SQLyog Community v10.51 
MySQL - 5.5.11 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `account_demo` */

DROP TABLE IF EXISTS `account_demo`;

CREATE TABLE `account_demo` (
  `accHolderName` varchar(30) NOT NULL,
  `accNumber` double NOT NULL,
  `panNumber` varchar(9) NOT NULL,
  `address` varchar(20) NOT NULL,
  `balance` float NOT NULL,
  `accOpeningDate` date NOT NULL,
  PRIMARY KEY (`accNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account_demo` */

insert  into `account_demo`(`accHolderName`,`accNumber`,`panNumber`,`address`,`balance`,`accOpeningDate`) values ('xyz',45600,'243jhghuf','mnpa',500,'2017-04-04'),('bbb',45685,'12345aass','Nagpur',500,'2017-04-11'),('Anmol',123456,'abc12345','pune',12346,'2017-04-11'),('Jaswini',458796,'123Abcr','Nagpur',58963,'2017-04-02');

/*Table structure for table `dummy_bb` */

DROP TABLE IF EXISTS `dummy_bb`;

CREATE TABLE `dummy_bb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Blood_Bank_id` int(11) DEFAULT NULL,
  `A_p` int(11) NOT NULL,
  `A_n` int(11) NOT NULL,
  `B_p` int(11) NOT NULL,
  `B_n` int(11) NOT NULL,
  `O_p` int(11) NOT NULL,
  `O_n` int(11) NOT NULL,
  `AB_p` int(11) NOT NULL,
  `AB_n` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Blood_Bank_id` (`Blood_Bank_id`),
  CONSTRAINT `Blood_Bank_id` FOREIGN KEY (`Blood_Bank_id`) REFERENCES `tbl_blood_bank` (`Blood_Bank_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dummy_bb` */

/*Table structure for table `tbl_blood_bank` */

DROP TABLE IF EXISTS `tbl_blood_bank`;

CREATE TABLE `tbl_blood_bank` (
  `Blood_Bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `Blood_Bank_Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Blood_Bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_blood_bank` */

insert  into `tbl_blood_bank`(`Blood_Bank_id`,`Blood_Bank_Name`,`Address`,`Username`,`Password`) values (1,'Kamya','Pimpri','kamya','kamya@123'),(2,'Aarushi','Wagholi','aarushi','aarushi@123'),(3,'Soumya','Nigdi','soumya','soumya@123');

/*Table structure for table `tbl_blood_camp` */

DROP TABLE IF EXISTS `tbl_blood_camp`;

CREATE TABLE `tbl_blood_camp` (
  `Blood_Camp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Camp_name` varchar(45) NOT NULL,
  `Held_By` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Pincode` double NOT NULL,
  `Date` date NOT NULL,
  `Contact_Number` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Blood_Camp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_blood_camp` */

insert  into `tbl_blood_camp`(`Blood_Camp_id`,`Camp_name`,`Held_By`,`Address`,`Pincode`,`Date`,`Contact_Number`,`Username`,`Password`) values (1,'GiveLife','Abc','Pune',411001,'2016-12-12','9898989898','givelife','givelife@123'),(2,'DonateLife','XYZ','Chinchwad',411012,'2016-11-22','7845256354','donatelife','donatelife@123'),(3,'LifeSaver','Kimaya','Pimpri',411019,'2016-12-16','9741203657','lifesaver','lifesaver@123');

/*Table structure for table `tbl_donor` */

DROP TABLE IF EXISTS `tbl_donor`;

CREATE TABLE `tbl_donor` (
  `Donor_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Blood_Camp_Id` int(10) unsigned NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Blood_Group` varchar(3) NOT NULL,
  `Contact_Number` varchar(45) NOT NULL,
  `Date_of_Donation` date DEFAULT NULL,
  PRIMARY KEY (`Donor_Id`),
  KEY `FK_BCI_Tbl_Donation_1` (`Blood_Camp_Id`),
  CONSTRAINT `FK_BCI_Tbl_Donation_1` FOREIGN KEY (`Blood_Camp_Id`) REFERENCES `tbl_blood_camp` (`Blood_Camp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_donor` */

insert  into `tbl_donor`(`Donor_Id`,`Blood_Camp_Id`,`First_Name`,`Last_Name`,`Address`,`Blood_Group`,`Contact_Number`,`Date_of_Donation`) values (1,1,'Anmol','Gadhave','Pune','A+','8149044904','2017-01-09'),(2,1,'Jaswini','Paunikar','Pune','B+','7276877332','2016-01-01'),(3,2,'Rashmi','Mungse','Pune','B-','7895462130','2017-01-29'),(4,2,'Nikhil','Bhilare','Mumbai','O+','9874563210','2016-11-16'),(5,3,'Sheya','L','Pune','O-','8745213698','2017-01-06'),(6,3,'Fiza','Sheikh','Pune','AB-','8964751203','2016-05-05'),(8,1,'Jaswini','gadhave','Chinchwad','B+','7276877332','2017-01-26'),(9,3,'nn','mmm','nnnnn','ap','9088558901','2016-02-03');

/*Table structure for table `tbl_hospital` */

DROP TABLE IF EXISTS `tbl_hospital`;

CREATE TABLE `tbl_hospital` (
  `Hospital_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name_of_Hospital` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Pincode` double NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`Hospital_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_hospital` */

insert  into `tbl_hospital`(`Hospital_Id`,`Name_of_Hospital`,`Address`,`Pincode`,`username`,`password`) values (1,'Life Saver','Pune',411001,'lifesaver','lifesaver@123'),(2,'Morya Hospital','Chicnchwad',411033,'morya','morya@123'),(3,'Shree Hospital','Bavdhan',411023,'shree','shree@123'),(4,'Aditya Birla Hospital','Thergaon',411019,'adityabirla','adityabirla@123'),(5,'ycm','pimpri',411019,'ycm','ycm@123'),(6,'Sasun Hospital','Shivajinagar',411001,'sasun','sasun@123'),(7,'Anwini','S.B. Road',411016,'anwini','anwini@123'),(8,'Shashvat','karve nagar',411013,'shashvat','shashvat@123'),(9,'Shashi','Nagpur',440034,'Shashi','Shashi@123');

/*Table structure for table `tbl_login` */

DROP TABLE IF EXISTS `tbl_login`;

CREATE TABLE `tbl_login` (
  `Sr.no` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`Sr.no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_login` */

insert  into `tbl_login`(`Sr.no`,`Username`,`Password`,`Role`) values (1,'admin','admin','admin'),(2,'abc','abc','Hospital'),(3,'Kamaya','Kamaya','Blood Bank'),(4,'GiveLife','GiveLife','Bloodcamp');

/*Table structure for table `tbl_order_details` */

DROP TABLE IF EXISTS `tbl_order_details`;

CREATE TABLE `tbl_order_details` (
  `Sr.no` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Order_Id` int(10) unsigned NOT NULL,
  `Blood_Group` varchar(45) NOT NULL,
  `Quantity` int(10) unsigned NOT NULL,
  `Total` double NOT NULL,
  `Order_Date` date NOT NULL,
  PRIMARY KEY (`Sr.no`),
  KEY `FK_Tbl_Order_id_order_details_1` (`Order_Id`),
  CONSTRAINT `FK_Tbl_Order_id_order_details_1` FOREIGN KEY (`Order_Id`) REFERENCES `tbl_orders` (`Order_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_order_details` */

insert  into `tbl_order_details`(`Sr.no`,`Order_Id`,`Blood_Group`,`Quantity`,`Total`,`Order_Date`) values (1,1,'A+',12,100,'2016-12-12'),(2,1,'O-',3,100,'2016-01-31'),(3,2,'B+',23,100,'2016-02-28'),(4,3,'AB-',3,100,'2016-03-25'),(5,4,'AB+',6,100,'2016-06-09'),(6,240,'B_p',1,400,'2017-01-30'),(7,360,'B_p',2,800,'2017-01-30'),(8,534,'O_p',1,400,'2017-01-30'),(9,231,'B_n',1,400,'2017-01-30'),(10,945,'O_p',1,400,'2017-01-30'),(11,880,'A_p',1,400,'2017-01-30'),(12,26,'O_p',1,400,'2017-01-30'),(13,762,'B_n',2,800,'2017-01-31'),(14,372,'B_n',2,800,'2017-01-31'),(15,696,'B_n',1,400,'2017-01-31'),(16,677,'A_p',1,400,'2017-01-31'),(17,834,'B_p',3,1200,'2017-01-31');

/*Table structure for table `tbl_orders` */

DROP TABLE IF EXISTS `tbl_orders`;

CREATE TABLE `tbl_orders` (
  `Order_Id` int(10) unsigned NOT NULL,
  `Hospital_Id` int(10) unsigned NOT NULL,
  `Total_Price` double NOT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `FK_Hospital_Id_Tbl_Orders_1` (`Hospital_Id`),
  CONSTRAINT `FK_Hospital_Id_Tbl_Orders_1` FOREIGN KEY (`Hospital_Id`) REFERENCES `tbl_hospital` (`Hospital_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_orders` */

insert  into `tbl_orders`(`Order_Id`,`Hospital_Id`,`Total_Price`) values (1,1,121212),(2,2,78452),(3,3,4126),(4,3,78545),(5,4,2314),(26,5,400),(41,1,400),(46,5,400),(49,5,800),(54,4,400),(56,3,400),(92,1,400),(148,1,400),(153,1,400),(171,5,1200),(176,5,800),(192,5,400),(199,2,400),(209,2,400),(231,5,400),(240,4,400),(244,1,400),(338,1,400),(346,2,400),(360,5,800),(372,5,800),(426,3,400),(466,1,400),(479,5,400),(500,1,400),(534,5,400),(541,6,400),(618,3,400),(677,9,400),(682,2,800),(696,8,400),(762,5,800),(765,1,400),(834,5,1200),(851,5,400),(852,6,400),(880,5,400),(945,5,400),(952,5,4800);

/*Table structure for table `tbl_stock` */

DROP TABLE IF EXISTS `tbl_stock`;

CREATE TABLE `tbl_stock` (
  `Stock_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Blood_Bank_ID` int(11) NOT NULL,
  `A_p` int(11) NOT NULL,
  `A_n` int(11) NOT NULL,
  `B_p` int(11) NOT NULL,
  `B_n` int(11) NOT NULL,
  `O_p` int(11) NOT NULL,
  `O_n` int(11) NOT NULL,
  `AB_p` int(11) NOT NULL,
  `AB_n` int(11) NOT NULL,
  PRIMARY KEY (`Stock_ID`),
  KEY `FK_BBI_tbl_stock_1` (`Blood_Bank_ID`),
  CONSTRAINT `FK_BBI_tbl_stock_1` FOREIGN KEY (`Blood_Bank_ID`) REFERENCES `tbl_blood_bank` (`Blood_Bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_stock` */

insert  into `tbl_stock`(`Stock_ID`,`Blood_Bank_ID`,`A_p`,`A_n`,`B_p`,`B_n`,`O_p`,`O_n`,`AB_p`,`AB_n`) values (1,1,28,25,20,26,24,29,26,20),(2,2,22,20,16,10,13,20,11,12),(3,3,22,14,17,21,18,18,23,16);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
