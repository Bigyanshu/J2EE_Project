/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 6.0.8-alpha-community : Database - ossdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ossdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ossdb`;

/*Table structure for table `oss_login` */

DROP TABLE IF EXISTS `oss_login`;

CREATE TABLE `oss_login` (
  `UName` varchar(50) DEFAULT NULL,
  `Pswd` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_login` */

insert  into `oss_login`(`UName`,`Pswd`) values ('1111','0000');

/*Table structure for table `oss_tblcompany` */

DROP TABLE IF EXISTS `oss_tblcompany`;

CREATE TABLE `oss_tblcompany` (
  `Regd` varchar(50) DEFAULT NULL,
  `CName` varchar(50) DEFAULT NULL,
  `HOC` varchar(50) DEFAULT NULL,
  `Loc` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `GST` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblcompany` */

insert  into `oss_tblcompany`(`Regd`,`CName`,`HOC`,`Loc`,`City`,`State`,`Phone`,`Email`,`GST`,`Date`) values ('R001','Apple','Steve Jobs','Navi Mumbai','Mumbai','Maharashtra','7609093906','apple@gmail.com','TXN0000001','2023-12-01'),('R002','Samsung','Sanjeev Kumar','Salepur','Bangalore','Jharkhand','8609093903','samsung@gmail.com','TXN0000002','2023-12-01'),('R003','Sony','Kenichiro Yoshida','Tokyo','Japan','Odisha','9609093903','sony@gmail.com','TXN0000003','2023-12-03'),('R004','IQOO','Saswat Mohapatra','Katakia','Jagatsighpur','Odisha','6372624793','saswat@gmail.com','TXN0000004','2023-12-04'),('R005','LG','Pragyandipti Mohapatra','Bhubaneswar','Jagatshingpur','Odisha','8260605394','pragyan@gmail.com','TXN0000005','2023-12-05'),('R006','BOAT','Lankeswary Jena','Ranchi','Jajpur','Odisha','7865341290','lankeswary@gmail.com','TXN0000006','2023-12-06'),('R007','JBL','Swagatika Sahoo','Bhubaneswar','Khurda','Odisha','9078561234','swagatika@gmail.com','TXN0000007','2023-12-07'),('R008','Mamaearth','Saroswoty Mama','Cape Town','Bangalore','Karnataka','9090786756','mamaearth@gmail.com','TXN0000008','2023-12-08'),('R009','WoodLand','Roman Brother','Area 51','New York','Madhya Pradesh','7889907889','woodland@gmail.com','TXN0000009','2023-12-09'),('R010','Havels','Havel Agarwal','Kochi','Kochi','Kerala','8967312436','havels@gmail.com','TXN0000010','2023-12-10'),('R011','Nilkamaal','Nilamani Gochayat','Salepur','Cuttack','Odisha','8989909078','nilamani@gmail.com','TXN0000011','2023-12-11'),('R012','MRF','Sachin Kohli','Kirmada','Dholakpur','Mizoram','8989786756','mrf@gmail.com','TXN0000012','2023-12-12');

/*Table structure for table `oss_tblcompreq` */

DROP TABLE IF EXISTS `oss_tblcompreq`;

CREATE TABLE `oss_tblcompreq` (
  `ReqNo1` varchar(50) DEFAULT NULL,
  `Date1` varchar(50) DEFAULT NULL,
  `CName1` varchar(50) DEFAULT NULL,
  `CRegdNo1` varchar(50) DEFAULT NULL,
  `Locality1` varchar(50) DEFAULT NULL,
  `City1` varchar(50) DEFAULT NULL,
  `State1` varchar(50) DEFAULT NULL,
  `GST1` varchar(50) DEFAULT NULL,
  `SlNo1` varchar(50) DEFAULT NULL,
  `PCode1` varchar(50) DEFAULT NULL,
  `PName1` varchar(50) DEFAULT NULL,
  `Category1` varchar(50) DEFAULT NULL,
  `Price1` varchar(50) DEFAULT NULL,
  `OQty1` varchar(50) DEFAULT NULL,
  `Amount1` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblcompreq` */

insert  into `oss_tblcompreq`(`ReqNo1`,`Date1`,`CName1`,`CRegdNo1`,`Locality1`,`City1`,`State1`,`GST1`,`SlNo1`,`PCode1`,`PName1`,`Category1`,`Price1`,`OQty1`,`Amount1`) values ('RQ001','2023-12-01','Apple','R001','Navi Mumbai','Mumbai','Maharashtra','TXN0000001','1','1001','iPhone 15 pro max','PC0002','100000','50','5000000'),('RQ002','2023-12-02','Samsung','R002','Salepur','Bangalore','Jharkhand','TXN0000002','2','1002','Samsung Galaxy S24 Ultra','PC0002','100000','50','5000000'),('RQ003','2023-12-03','Sony','R003','Tokyo','Japan','Odisha','TXN0000003','3','1003','Sony Alpha Camera','PC0001','150000','50','7500000'),('RQ004','2023-12-04','IQOO','R004','Katakia','Jagatsighpur','Odisha','TXN0000004','4','1005','IQOO Neo 6','PC0001','24999','100','2499900'),('RQ005','2023-12-05','LG','R005','Bhubaneswar','Jagatshingpur','Odisha','TXN0000005','5','1006','LG Refrigerator ','PC0001','14999','100','1499900'),('RQ006','2023-12-06','BOAT','R006','Ranchi','Jajpur','Odisha','TXN0000006','6','1008','Rockerz 551ANC','PC0001','3000','200','600000'),('RQ007','2023-12-07','JBL','R007','Bhubaneswar','Khurda','Odisha','TXN0000007','7','1009','JBL Sound Bar','PC0001','50000','100','5000000'),('RQ008','2023-12-08','Mamaearth','R008','Cape Town','Bangalore','Karnataka','TXN0000008','8','1004','Oniion Hair Shampoo','PC0006','999','200','199800'),('RQ009','2023-12-09','WoodLand','R009','Area 51','New York','Madhya Pradesh','TXN0000009','9','1010','WL Shoes','PC0003','10000','150','1500000'),('RQ010','2023-12-10','Havels','R010','Kochi','Kochi','Kerala','TXN0000010','10','1011','Havels Fan','PC0007','1500','200','300000'),('RQ011','2023-12-11','Nilkamaal','R011','Salepur','Cuttack','Odisha','TXN0000011','11','1012','Chairs','PC0008','400','200','80000'),('RQ012','2023-12-12','MRF','R012','Kirmada','Dholakpur','Mizoram','TXN0000012','12','1013','Bats','PC0010','9999','100','999900');

/*Table structure for table `oss_tblissuegoods` */

DROP TABLE IF EXISTS `oss_tblissuegoods`;

CREATE TABLE `oss_tblissuegoods` (
  `InvoiceNo` varchar(50) DEFAULT NULL,
  `IDate` varchar(50) DEFAULT NULL,
  `RCode` varchar(50) DEFAULT NULL,
  `RDate` varchar(50) DEFAULT NULL,
  `RName` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Loc` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `GST` varchar(50) DEFAULT NULL,
  `IType` varchar(50) DEFAULT NULL,
  `SlNo` varchar(50) DEFAULT NULL,
  `PCode` varchar(50) DEFAULT NULL,
  `PName` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `PQty` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL,
  `Discountge` varchar(50) DEFAULT NULL,
  `DiscountAmount` varchar(50) DEFAULT NULL,
  `GSTge` varchar(50) DEFAULT NULL,
  `GSTAmount` varchar(50) DEFAULT NULL,
  `NetAmount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblissuegoods` */

insert  into `oss_tblissuegoods`(`InvoiceNo`,`IDate`,`RCode`,`RDate`,`RName`,`City`,`Loc`,`State`,`GST`,`IType`,`SlNo`,`PCode`,`PName`,`Category`,`Price`,`PQty`,`Amount`,`Discountge`,`DiscountAmount`,`GSTge`,`GSTAmount`,`NetAmount`) values ('IGIN001','2023-12-01','R001','2023-12-21','Panda Suppliers','Cuttack','Salepur','Odisha','TXN0000001','Credit','1','1001','iPhone 15 pro max','PC0002','139999','10','1399990','15','209998.5','12.0','142798.98','1332790.48'),('IGIN002','2023-12-01','R002','2023-12-02','Mohapatra Supplier','Jagatshingpur','Ranchi','Odisha','TXN0000002','Credit','2','1002','Samsung Galaxy S24 Ultra','PC0002','129999','12','1559988','15','233998.2','18.0','159118.776','1485108.5760000001'),('IGIN003','2023-12-03','R003','2023-12-03','Mohanty Suppliers','Cuttack','CDA','Odisha','TXN0000003','Credit','3','1003','Sony Alpha Camera','PC0001','200000','12','2400000','12','288000','28.0','253440','2365440'),('IGIN004','2023-12-03','R004','2023-12-04','Sahoo Supplier','Khurda','Bhubaneswar','Odisha','TXN0000004','Credit','4','1004','Sony Alpha Camera','PC0001','200000','12','2400000','12','288000','28.0','591360','2703360'),('IGIN005','2023-12-04','R005','2023-12-05','Pragyan Supplier','Jagatshingpur','Bhubaneswar','Odisha','TXN0000005','Credit','5','1005','Oniion Hair Shampoo','PC0006','1499','12','2400000','11','264000','12.0','256320','2392320'),('IGIN006','2023-12-05','R006','2023-12-06','SS Supliers','Master Canteen','New City ','Assam','TXN0000006','Cash','6','1006','LG Refrigerator ','PC0001','20000','12','2400000','14','336000','8.0','247680','2311680'),('IGIN007','2023-12-07','R007','2023-12-07','FF Supliers','Cuttack','Salepur','Odisha','TXN0000007','Cash','7','1008','Rockerz 551ANC','PC0001','4000','32','128000','20','25600','8.0','12288','114688'),('IGIN008','2023-12-07','R008','2023-12-08','KK Supliers','Cuttack','Bhubaneswar','Punjab','TXN0000008','Cash','8','1009','JBL Sound Bar','PC0001','60000','21','1260000','14','176400','12.0','130032','1213632'),('IGIN009','2023-12-07','R009','2023-12-09','VK Supliers','IceLand','IceLand','Haryana','TXN0000009','Cash','9','1010','WL Shoes','PC0003','13000','13','169000','9','15210','28.0','18454.8','172244.8'),('IGIN010','2023-12-07','R010','2023-12-10','Galaxy Supliers','Mumbai','Navi Mumbai','Maharashtra','TXN0000010','Cash','10','1011','Havels Fan','PC0007','2500','8','20000','8','1600','8.0','2208','20608'),('IGIN011','2023-12-07','R011','2023-12-11','Nebula Supliers','America','New York','Goa','TXN0000011','Cash','11','1012','Chairs','PC0008','600','80','48000','7','3360','8.0','5356.8','49996.8'),('IGIN012','2023-12-07','R012','2023-12-12','Rascle Supliers','Dholera','Lucknow','Gujarat','TXN0000012','Cash','12','1013','Bats','PC0010','1500','20','30000','10','3000','12.0','3240','30240'),('','','','','','','','','','Select Invoice Type','','','','','','60','','','','','','');

/*Table structure for table `oss_tblorderfrom` */

DROP TABLE IF EXISTS `oss_tblorderfrom`;

CREATE TABLE `oss_tblorderfrom` (
  `ONo` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  `RName` varchar(50) DEFAULT NULL,
  `RetCode` varchar(50) DEFAULT NULL,
  `Loc` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `GST` varchar(50) DEFAULT NULL,
  `SlNo` varchar(50) DEFAULT NULL,
  `PCode` varchar(50) DEFAULT NULL,
  `PName` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `OQty` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblorderfrom` */

insert  into `oss_tblorderfrom`(`ONo`,`Date`,`RName`,`RetCode`,`Loc`,`City`,`State`,`GST`,`SlNo`,`PCode`,`PName`,`Category`,`Price`,`OQty`,`Amount`) values ('ON001','2023-12-01','Panda Suppliers','R001','Salepur','Cuttack','Odisha','TXN0000001','1','1001','iPhone 15 pro max','PC0002','139999','12','1679988'),('ON002','2023-12-02','Mohapatra Supplier','R002','Ranchi','Jagatshingpur','Odisha','TXN0000002','2','1002','Samsung Galaxy S24 Ultra','PC0002','129999','21','2729979'),('ON003','2023-12-03','Mohanty Suppliers','R003','CDA','Cuttack','Odisha','TXN0000003','3','1003','Sony Alpha Camera','PC0001','200000','13','2600000'),('ON004','2023-12-04','Sahoo Supplier','R004','Bhubaneswar','Khurda','Odisha','TXN0000004','4','1004','Oniion Hair Shampoo','PC0006','1499','40','59960'),('ON005','2023-12-05','Pragyan Supplier','R005','Bhubaneswar','Jagatshingpur','Odisha','TXN0000005','5','1005','IQOO Neo 6','PC0001','30000','20','600000'),('ON006','2023-12-06','SS Supliers','R006','New City ','Master Canteen','Assam','TXN0000006','6','1006','LG Refrigerator ','PC0001','20000','20','400000'),('ON007','2023-12-07','FF Supliers','R007','Salepur','Cuttack','Odisha','TXN0000007','7','1008','Rockerz 551ANC','PC0001','4000','50','200000'),('ON008','2023-12-08','KK Supliers','R008','Bhubaneswar','Cuttack','Punjab','TXN0000008','8','1009','JBL Sound Bar','PC0001','60000','15','900000'),('ON009','2023-12-09','VK Supliers','R009','IceLand','IceLand','Haryana','TXN0000009','9','1010','WL Shoes','PC0003','13000','50','650000'),('ON010','2023-12-10','Galaxy Supliers','R010','Navi Mumbai','Mumbai','Maharashtra','TXN0000010','10','1011','Havels Fan','PC0007','2500','35','87500'),('ON011','2023-12-11','Nebula Supliers','R011','New York','America','Goa','TXN0000011','11','1012','Chairs','PC0008','600','50','30000'),('ON012','2023-12-12','Rascle Supliers','R012','Lucknow','Dholera','Gujarat','TXN0000012','13','1013','Bats','PC0010','1500','40','60000');

/*Table structure for table `oss_tblpmtvou` */

DROP TABLE IF EXISTS `oss_tblpmtvou`;

CREATE TABLE `oss_tblpmtvou` (
  `VNo` varchar(50) DEFAULT NULL,
  `VDate` varchar(50) DEFAULT NULL,
  `CName` varchar(50) DEFAULT NULL,
  `Locality` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `PMode` varchar(50) DEFAULT NULL,
  `RefNo` varchar(50) DEFAULT NULL,
  `RDate` varchar(50) DEFAULT NULL,
  `BName` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblpmtvou` */

insert  into `oss_tblpmtvou`(`VNo`,`VDate`,`CName`,`Locality`,`City`,`State`,`PMode`,`RefNo`,`RDate`,`BName`,`Amount`) values ('VN001','2023-12-01','Apple','Navi Mumbai','Mumbai','Maharashtra','CASH','R001','2023-12-01','SBI','1500000'),('VN002','2023-12-02','Samsung','Salepur','Bangalore','Jharkhand','CASH','R002','2023-12-02','SBI','1500000'),('VN003','2023-12-03','Sony','Tokyo','Japan','Odisha','CHEQUE','R003','2023-12-03','ICICI','300000'),('VN004','2023-12-04','IQOO','Katakia','Jagatsighpur','Odisha','DRAFT','R004','2023-12-04','HDFC','60000'),('VN005','2023-12-05','LG','Bhubaneswar','Jagatshingpur','Odisha','ONLINE','R005','2023-12-05','BOI','300000');

/*Table structure for table `oss_tblproductcatg` */

DROP TABLE IF EXISTS `oss_tblproductcatg`;

CREATE TABLE `oss_tblproductcatg` (
  `PCCode` varchar(50) DEFAULT NULL,
  `PCName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblproductcatg` */

insert  into `oss_tblproductcatg`(`PCCode`,`PCName`) values ('PC0002','Mobiles'),('PC0003','Fashion'),('PC0004','Toys'),('PC0001','Electronics'),('PC0005','Pharmacy '),('PC0006','Beauty'),('PC0007','Home'),('PC0008','Furniture'),('PC0009','Books'),('PC0010','Sports & Fitness');

/*Table structure for table `oss_tblproductinfo` */

DROP TABLE IF EXISTS `oss_tblproductinfo`;

CREATE TABLE `oss_tblproductinfo` (
  `CName` varchar(50) DEFAULT NULL,
  `CRCode` varchar(50) DEFAULT NULL,
  `PCName` varchar(50) DEFAULT NULL,
  `PCCode` varchar(50) DEFAULT NULL,
  `PCode` varchar(50) DEFAULT NULL,
  `PName` varchar(50) DEFAULT NULL,
  `Unit` varchar(50) DEFAULT NULL,
  `CPrice` varchar(50) DEFAULT NULL,
  `SPrice` varchar(50) DEFAULT NULL,
  `TSlab` varchar(50) DEFAULT NULL,
  `Stock` decimal(8,0) DEFAULT NULL,
  `Photo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblproductinfo` */

insert  into `oss_tblproductinfo`(`CName`,`CRCode`,`PCName`,`PCCode`,`PCode`,`PName`,`Unit`,`CPrice`,`SPrice`,`TSlab`,`Stock`,`Photo`) values ('Apple','R001','Mobiles','PC0002','1001','iPhone 15 pro max','pcs','100000','139999','12.0','50','Apple.jpg'),('Samsung','R002','Mobiles','PC0002','1002','Samsung Galaxy S24 Ultra','50','100000','129999','18.0','89','1.jpg'),('Sony','R003','Electronics','PC0001','1003','Sony Alpha Camera','pcs','150000','200000','28.0','-14','Anant-Bgu.jpg'),('Mamaearth','R008','Beauty','PC0006','1004','Oniion Hair Shampoo','5','999','1499','12.0','216','1.jpg'),('IQOO','R004','Electronics','PC0001','1005','IQOO Neo 6','5','24999','30000','8.0','90','item1.jpg'),('LG','R005','Electronics','PC0001','1006','LG Refrigerator ','2','14999','20000','8.0','40','1.jpg'),('BOAT','R006','Electronics','PC0001','1008','Rockerz 551ANC','2','3000','4000','8.0','208','74750835994.png'),('JBL','R007','Electronics','PC0001','1009','JBL Sound Bar','10','50000','60000','12.0','65','item1.jpg'),('WoodLand','R009','Fashion','PC0003','1010','WL Shoes','30','10000','13000','28.0','140','Anant-Bgu.jpg'),('Havels','R010','Home','PC0007','1011','Havels Fan','4','1500','2500','8.0','127','Dr Strange.png'),('Nilkamaal','R011','Furniture','PC0008','1012','Chairs','100','400','600','8.0','1160','Mighty Thor.jpg'),('MRF','R012','Sports & Fitness','PC0010','1013','Bats','2','9999','1500','12.0','180','1.jpg');

/*Table structure for table `oss_tblpurgoods` */

DROP TABLE IF EXISTS `oss_tblpurgoods`;

CREATE TABLE `oss_tblpurgoods` (
  `InvoiceNo` varchar(50) DEFAULT NULL,
  `IDate` varchar(50) DEFAULT NULL,
  `ReqNo` varchar(50) DEFAULT NULL,
  `RDate` varchar(50) DEFAULT NULL,
  `CName` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Locality` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `GST` varchar(50) DEFAULT NULL,
  `IType` varchar(50) DEFAULT NULL,
  `SlNo` varchar(50) DEFAULT NULL,
  `PCode` varchar(50) DEFAULT NULL,
  `PName` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `PQty` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL,
  `Discountge` varchar(50) DEFAULT NULL,
  `DiscountAmount` varchar(50) DEFAULT NULL,
  `GSTge` varchar(50) DEFAULT NULL,
  `GSTAmount` varchar(50) DEFAULT NULL,
  `NetAmount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblpurgoods` */

insert  into `oss_tblpurgoods`(`InvoiceNo`,`IDate`,`ReqNo`,`RDate`,`CName`,`City`,`Locality`,`State`,`GST`,`IType`,`SlNo`,`PCode`,`PName`,`Category`,`Price`,`PQty`,`Amount`,`Discountge`,`DiscountAmount`,`GSTge`,`GSTAmount`,`NetAmount`) values ('IN001','2023-12-01','RQ001','2023-12-01','Apple','Mumbai','Navi Mumbai','Maharashtra','TXN0000001','Cash','1','1001','iPhone 15 pro max','PC0002','100000','10','1000000','15','150000','12.0','102000','952000'),('IN002','2023-12-02','RQ002','2023-12-02','Samsung','Bangalore','Salepur','Jharkhand','TXN0000002','Cash','2','1002','Samsung Galaxy S24 Ultra','PC0002','100000','15','1500000','12','180000','18.0','158400','1478400'),('IN003','2023-12-03','RQ003','2023-12-03','Sony','Japan','Tokyo','Odisha','TXN0000003','Credit','3','1003','Sony Alpha Camera','PC0001','150000','5','750000','20','150000','28.0','72000','672000'),('IN004','2023-12-04','RQ004','2023-12-04','IQOO','Jagatsighpur','Katakia','Odisha','TXN0000004','Cash','4','1005','IQOO Neo 6','PC0001','24999','20','499980','15','74997','8.0','50997.96','475980.96'),('IN005','2023-12-05','RQ005','2023-12-05','LG','Jagatshingpur','Bhubaneswar','Odisha','TXN0000005','Credit','5','1006','LG Refrigerator ','PC0001','14999','10','149990','13','19498.7','8.0','15658.956','146150.256'),('IN006','2023-12-06','RQ006','2023-12-06','BOAT','Jajpur','Ranchi','Odisha','TXN0000006','Credit','6','1008','Rockerz 551ANC','PC0001','3000','30','90000','15','13500','8.0','9180','85680'),('IN007','2023-12-07','RQ007','2023-12-07','JBL','Khurda','Bhubaneswar','Odisha','TXN0000007','Cash','7','1009','JBL Sound Bar','PC0001','50000','12','600000','12','72000','12.0','63360','591360'),('IN008','2023-12-08','RQ008','2023-12-08','Mamaearth','Bangalore','Cape Town','Karnataka','TXN0000008','Credit','8','1004','Oniion Hair Shampoo','PC0006','999','50','49950','11','5494.5','12.0','5334.66','49790.16'),('IN009','2023-12-09','RQ009','2023-12-09','WoodLand','New York','Area 51','Madhya Pradesh','TXN0000009','Credit','9','1010','WL Shoes','PC0003','10000','10','100000','5','5000','28.0','11400','106400'),('IN010','2023-12-10','RQ010','2023-12-10','Havels','Kochi','Kochi','Kerala','TXN0000010','Cash','10','1011','Havels Fan','PC0007','1500','15','22500','5','1125','8.0','2565','23940'),('IN011','2023-12-11','RQ011','2023-12-11','Nilkamaal','Cuttack','Salepur','Odisha','TXN0000011','Cash','11','1012','Chairs','PC0008','400','50','20000','7','1400','8.0','2232','20832'),('IN012','2023-12-12','RQ012','2023-12-12','MRF','Dholakpur','Kirmada','Mizoram','TXN0000012','Cash','12','1013','Bats','PC0010','9999','20','199980','9','17998.2','12.0','21837.815999999995','203819.61599999998'),('IGIN002','2023-12-02','RQ002','2023-12-02','Samsung','Bangalore','Salepur','Jharkhand','TXN0000002','Cash','2','1002','Samsung Galaxy S24 Ultra','PC0002','100000','15','1500000','15','225000','18.0','153000','1428000'),('IGIN002','2023-12-02','RQ002','2023-12-02','Samsung','Bangalore','Salepur','Jharkhand','TXN0000002','Credit','2','1002','Samsung Galaxy S24 Ultra','PC0002','100000','15','1500000','12','180000','18.0','158400','1478400'),('IGIN004','2023-12-04','RQ004','2023-12-04','IQOO','Jagatsighpur','Katakia','Odisha','TXN0000004','Cash','4','1004','Oniion Hair Shampoo','PC0006','999','20','19980','13','2597.4','12.0','2085.912','19468.512'),('IGIN005','2023-12-05','RQ005','2023-12-05','LG','Jagatshingpur','Bhubaneswar','Odisha','TXN0000005','Credit','5','1005','IQOO Neo 6','PC0001','24999','18','449982','11','49498.02','8.0','48058.0776','448542.0576'),('IGIN004','2023-12-04','RQ004','2023-12-04','IQOO','Jagatsighpur','Katakia','Odisha','TXN0000004','Cash','4','1004','Oniion Hair Shampoo','PC0006','999','12','11988','12','1438.56','12.0','1265.9328','11815.372800000001'),('IN099','2024-01-25','RQ012','2023-12-12','MRF','Dholakpur','Kirmada','Mizoram','TXN0000012','Credit','99','1013','Bats','PC0010','9999','60','599940','14','83991.6','12.0','61913.808000000005','577862.208');

/*Table structure for table `oss_tblreceiptvou` */

DROP TABLE IF EXISTS `oss_tblreceiptvou`;

CREATE TABLE `oss_tblreceiptvou` (
  `VNo` varchar(50) DEFAULT NULL,
  `VDate` varchar(50) DEFAULT NULL,
  `RName` varchar(50) DEFAULT NULL,
  `Loc` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `PMode` varchar(50) DEFAULT NULL,
  `RefNo` varchar(50) DEFAULT NULL,
  `RDate` varchar(50) DEFAULT NULL,
  `BName` varchar(50) DEFAULT NULL,
  `Amount` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblreceiptvou` */

insert  into `oss_tblreceiptvou`(`VNo`,`VDate`,`RName`,`Loc`,`City`,`State`,`PMode`,`RefNo`,`RDate`,`BName`,`Amount`) values ('VN001','2024-01-01','Panda Suppliers','Salepur','Cuttack','Odisha','CASH','R001','2024-01-01','SBI','699995'),('VN002','2024-01-01','Mohapatra Supplier','Jagannathpur','Jagatshingpur','Odisha','CHEQUE','R002','2024-01-01','ICICI','419997');

/*Table structure for table `oss_tblretailer` */

DROP TABLE IF EXISTS `oss_tblretailer`;

CREATE TABLE `oss_tblretailer` (
  `RCode` varchar(50) DEFAULT NULL,
  `RName` varchar(50) DEFAULT NULL,
  `CPerson` varchar(50) DEFAULT NULL,
  `Loc` varbinary(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `GST` varchar(50) DEFAULT NULL,
  `Date` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Photo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `oss_tblretailer` */

insert  into `oss_tblretailer`(`RCode`,`RName`,`CPerson`,`Loc`,`City`,`State`,`Phone`,`Email`,`GST`,`Date`,`Password`,`Photo`) values ('R001','Panda Suppliers','Omnipotent Sekhar Panda ','Salepur','Cuttack','Odisha','9609093905','bigyanshusekhar1999@gmail.com','TXN0000001','2023-12-21','1111','74750835994.png'),('R002','Mohapatra Supplier','Saswat Mohapatra','Ranchi','Jagatshingpur','Odisha','6372624793','saswat@gmail.com','TXN0000002','2023-12-02','2222','MRF.jpg'),('R003','Mohanty Suppliers','Anant Mohanty','CDA','Cuttack','Odisha','7856431290','anant@gmail.com','TXN0000003','2023-12-03','3333','Anant-Bgu.jpg'),('R004','Sahoo Supplier','Suprit Sahoo','Bhubaneswar','Khurda','Odisha','7890012345','supy@gmail.com','TXN0000004','2023-12-04','4444','ShopOpen.avif'),('R005','Pragyan Supplier','Pragyan Pandey','Bhubaneswar','Jagatshingpur','Odisha','8215678909','pragyan@gmail.com','TXN0000005','2023-12-05','55555','LetsShop.avif'),('R006','SS Supliers','Maadan Mohan','New City ','Master Canteen','Assam','8989676756','mm@gmail.com','TXN0000006','2023-12-06','6666','Open.avif'),('R007','FF Supliers','Einstein Panda','Salepur','Cuttack','Odisha','7654321890','einstein@gmail.com','TXN0000007','2023-12-07','7777','Dr Strange.png'),('R008','KK Supliers','Kedarnath Madhaban','Bhubaneswar','Cuttack','Punjab','9879097899','kk@gmail.com','TXN0000008','2023-12-08','8888','item1.jpg'),('R009','VK Supliers','Vinayak Panda','IceLand','IceLand','Haryana','8967452313','vp@gmail.com','TXN0000009','2023-12-09','9999','Mighty Thor.jpg'),('R010','Galaxy Supliers','Mohini Panda','Navi Mumbai','Mumbai','Maharashtra','7897897890','mp@gmail.com','TXN0000010','2023-12-10','1010','weOpen.avif'),('R011','Nebula Supliers','Nebula Stark','New York','America','Goa','9090807060','ns@gmail.com','TXN0000011','2023-12-11','1111','PowerW.avif'),('R012','Rascle Supliers','Anticipation Sahoo','Lucknow','Dholera','Gujarat','8090708090','as@gmail.com','TXN0000012','2023-12-12','1212','Power.avif');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
