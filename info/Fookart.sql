-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Fookart
-- ------------------------------------------------------
-- Server version	5.5.46-0+deb8u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `username` varchar(15) DEFAULT NULL,
  `prod_id` varchar(10) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `name` varchar(15) DEFAULT NULL,
  `comp` varchar(150) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `ph_number` varchar(10) DEFAULT NULL,
  `mesgs` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `username` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `ph_number` varchar(15) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(30) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `descript` varchar(300) DEFAULT NULL,
  `img_path` varchar(100) DEFAULT NULL,
  `clicks` int(11) NOT NULL,
  `quant` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (53,'Nikon D3300',39479,'(AF-S 18-55 mm VR Kit Lens II/ AF-S 55-200 mm VR Kit DSLR Camera/ 24.2/ CMOS/ with 3 LCD)','images/products/cameras/53.jpeg',18,81,'camera'),(54,'Nikon D5200',30057,'(AF-S DX NIKKOR 18-55 mm F/3.5-5.6G VR II Lens/ 24.1/ CMOS/with 3 LCD)','images/products/cameras/54.jpeg',16,72,'camera'),(56,'Sony Alpha SLT-A99V',139990,'(24.3/ CMOS/ 3 LCD)','images/products/cameras/56.jpeg',2,85,'camera'),(57,'Sony Alpha ILCA-77M2',109000,'(24.3/ CMOS/ 3 LCD)','images/products/cameras/57.jpeg',2,80,'camera'),(42,'Superlux HD-631',5160,'(Stereo Dynamic Headphone/ Over the Head/ Wired Headphones)','images/products/headphones/42.jpeg',9,80,'headphone'),(43,'Fadedge Beatz Studio',4267,'(Spider High Quality/ Stereo Dynamic Headphone / Wired Headphones)','images/products/headphones/43.jpeg',14,82,'headphone'),(45,'Beyerdynamic T1',81349,'(Over-the-ear Headphone/ Over-the-ear Headphone/ 300 mW Max Power Input/ Wired Connectivity)','images/products/headphones/45.jpeg',0,85,'headphone'),(46,'Beyerdynamic T5p',81349,'(Wired Connectivity/ Over-the-head/ 300 mW Max Power Input/ Over-the-ear Headphone)','images/products/headphones/46.jpeg',4,81,'headphone'),(1,'HP 15-r244TX',34990,'(Notebook) (Core i3 4th Gen/ 8GB/ 1TB/ Free DOS/ 2GB Graphic Card)','images/products/laptops/1.jpg',46,89,'laptop'),(3,'Dell Inspiron 7348',73200,'(2-in-1 Laptop) (Core i7 5th Gen/ 8GB/ 500GB/ Win8.1/ Touch)','images/products/laptops/3.jpg',6,85,'laptop'),(5,'iBall Netbook',13990,'(2-in-1) (Atom Quad Core Processor/ 2GB/ 32GB Built-in Storage/ Win8.1)','images/products/laptops/5.jpg',3,84,'laptop'),(7,'MSI Dominator Pro GT72',220000,'(2QE Notebook) (3rd Gen Core i7/ 8GB/ 1TB/ Win8.1/ 8GB Graph) ( GTX 980M)','images/products/laptops/7.jpg',3,83,'laptop'),(11,'Moto G (2nd Generation)',9999,'(Android v4.4.4 OS/ Dual Sim/ 5 inch HD Screen/ 8 MP Primary Camera)','images/products/mobiles/11.jpeg',2,84,'mobile'),(13,'Moto Turbo',41999,'(Turbo Charging/ Display : 5.2 inch QHD @ 565 ppi/ 3900 mAh Battery/ 21 MP Primary Camera)','images/products/mobiles/13.jpeg',6,83,'mobile'),(16,'Asus Zenfone 6',15999,'(Android v4.3 OS/ Dual Sim / 2 MP Secondary Camera/ 13 MP Primary Camera)','images/products/mobiles/16.jpeg',0,85,'mobile'),(17,'Microsoft Lumia 640',8999,'(2500 mAh Battery/ 8 MP Primary Camera/ 5 inch HD Screen/ Windows Phone 8.1 OS)','images/products/mobiles/17.jpeg',0,85,'mobile'),(31,'LG 55EA9700',409900,'(Full HD, 1920 x 1080/3D TV, Smart TV/4 x HDMI, 3 x USB/Built-in Wi-Fi)','images/products/televisions/31.jpeg',0,85,'television'),(32,'Sony KD-55X8500B',229900,'(Ultra HD 4K 3840 x 2160 /3D TV, Smart TV / 4 x HDMI, 3 x USB/  \nBuilt-in Wi-Fi)','images/products/televisions/32.jpeg',5,85,'television'),(33,'Samsung 55JU6470',169900,'(Ultra HD (4K) 3840 x 2160 / Smart TV/4 x HDMI, 3 x USB / Built-in Wi-Fi)','images/products/televisions/33.jpeg',4,85,'television'),(35,'Samsung 55J6300',149900,'(Full HD, 1920 x 1080 / Smart TV / 4 x HDMI, 3 x USB / Built-in Wi-Fi)','images/products/televisions/35.jpeg',0,85,'television'),(36,'LG 55UF670T',127990,'(Ultra HD (4K), 3840 x 2160 / 2 x HDMI, 1 x USB)','images/products/televisions/36.jpeg',0,85,'television'),(22,'Nomon Analog',160104,'(Wall Clock) (70 cm Diameter/Steel/Round)','images/products/watches/22.jpeg',17,70,'watch'),(24,'Grovana 1703.6111',72739,'(Analog Watch) (Dial Color: Yellow/Dial Shape: Round/Strap Color: Brown)','images/products/watches/24.jpeg',8,85,'watch'),(51,'Nikon D5300',43956,'(Body with AF-S DX NIKKOR 18-55 mm f/ 3.5-5.6G VR II/ 24.2/ CMOS/ with 3.2 LCD)','images/products/cameras/51.jpeg',5,76,'camera'),(52,'Canon EOS 1200D Kit',31445,'(EF S18-55 IS II/ 55-250 mm IS II/ 18/ CMOS/ with 3 LCD)','images/products/cameras/52.jpeg',31,79,'camera'),(55,'Nikon D3200',24559,'(AF-S DX NIKKOR 18-55mm f/3.5-5.6G VR II Lens/ 24.2/ CMOS/ with 3 LCD)','images/products/cameras/55.jpeg',1,85,'camera'),(41,'Skullcandy S2IKDY',1049,'(In-the-ear Headphone/ In-ear-canalphone/ Wired Connectivity/ Built-in Mic)','images/products/headphones/41.jpeg',11,75,'headphone'),(44,'Sennheiser HD 800',85500,'(Wired Headphones/ Circum-aural Headphones/ Over the Ear Headphone/ Over the Head/ 14-44100 Hz Frequency)','images/products/headphones/44.jpeg',0,85,'headphone'),(47,'Sennheiser HD 700',58999,'(Circum-aural Headphones/ Over the Ear Headphone/ Wired Connectivity/ Over the Head)','images/products/headphones/47.jpeg',0,85,'headphone'),(2,'Lenovo G50-70',25989,'(Notebook) (4th Gen Ci3/ 4GB/ 1TB/ Free DOS)','images/products/laptops/2.jpg',18,76,'laptop'),(4,'Acer C720',14858,'(Chromebook Netbook) (Celeron Dual Core 4th Gen/ 2GB/ 16GB/ Chrome OS)','images/products/laptops/4.jpg',5,85,'laptop'),(6,'Acer Aspire E5-551G',33990,'(Notebook) (APU Quad Core A10/ 8GB/ 1TB/ Linux/ 2GB Graph) (NX.MLESI.001)','images/products/laptops/6.jpg',2,85,'laptop'),(12,'Nexus 6',39999,'(Turbo Charging/ 2.7 GHz Processor/ 5.94 inch QHD AMOLED Screen/ Android-Lollipop)','images/products/mobiles/12.jpeg',0,85,'mobile'),(14,'Moto X (2nd Generation)',23999,'(13 MP Primary Camera/ Android v4.4.4 OS/ 5.2 inch Touchscreen/ 2.5 GHz Processor)','images/products/mobiles/14.jpeg',0,85,'mobile'),(15,'Asus Zenfone 2 ZE551ML',19999,'(Android- Lollipop/ 13 MP Primary Camera/ 5 MP Secondary Camera/ Dual Sim)','images/products/mobiles/15.jpeg',1,85,'mobile'),(34,'Sony BRAVIA KDL-55W800C',149900,'(Full HD, 1920 x 1080 / 3D TV, Smart TV / 4 x HDMI, 2 x USB)','images/products/televisions/34.jpeg',0,85,'television'),(37,'Samsung 48JU6470',124900,'(Ultra HD (4K), 3840 x 2160 / Smart TV / 4 x HDMI, 3 x USB / Built-in Wi-Fi)','images/products/televisions/37.jpeg',0,85,'television'),(21,'Formex 900.1.8084',355670,'(Analog Watch) (Dial Color: Black, Gold/Dial Shape: Round/Strap Color: Black)','images/products/watches/21.jpeg',3,85,'watch'),(23,'Formex 15001.8023',88915,'(Analog Watch) (Dial Color: Black/Dial Shape: Round/Strap Color: Multi-colored)','images/products/watches/23.jpeg',0,85,'watch'),(25,'Movado 0605832',68310,'(Analog Watch) (Dial Color: Black/Dial Shape: Round/Strap Color: Silver)','images/products/watches/25.jpeg',1,85,'watch'),(26,'Suunto SS020674000',61950,'(Digital Watch) (Dial Shape: Round/Strap Color: Black)','images/products/watches/26.jpeg',0,85,'watch'),(27,'Nomon Wood Clock',56280,'(Analog Watch) (Wood/Width: 73)','images/products/watches/27.jpeg',0,85,'watch');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `prod_key` varchar(50) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES ('camera',53),('cameras',53),('camera',54),('cameras',54),('camera',56),('cameras',56),('camera',57),('cameras',57),('camera',51),('cameras',51),('camera',52),('cameras',52),('camera',55),('cameras',55),('headphone',42),('headphones',42),('headphone',43),('headphones',43),('headphone',45),('headphones',45),('headphone',46),('headphones',46),('headphone',41),('headphones',41),('headphone',44),('headphones',44),('headphone',47),('headphones',47),('laptop',1),('laptops',1),('laptop',3),('laptops',3),('laptop',5),('laptops',5),('laptop',7),('laptops',7),('laptop',2),('laptops',2),('laptop',4),('laptops',4),('laptop',6),('laptops',6),('mobile',11),('mobiles',11),('mobile',13),('mobiles',13),('mobile',16),('mobiles',16),('mobile',17),('mobiles',17),('mobile',12),('mobiles',12),('mobile',14),('mobiles',14),('mobile',15),('mobiles',15),('television',31),('televisions',31),('television',32),('televisions',32),('television',33),('televisions',33),('television',35),('televisions',35),('television',36),('televisions',36),('television',34),('televisions',34),('television',37),('televisions',37),('watch',22),('watchs',22),('watch',24),('watchs',24),('watch',21),('watchs',21),('watch',23),('watchs',23),('watch',25),('watchs',25),('watch',26),('watchs',26),('watch',27),('watchs',27),('LXi',100),('LXis',100),('nikon d3300',53),('nikon',53),('d3300',53),('nikon d5200',54),('nikon',54),('d5200',54),('sony alpha slt-a99v',56),('sony',56),('alpha',56),('slt-a99v',56),('sony alpha ilca-77m2',57),('sony',57),('alpha',57),('ilca-77m2',57),('superlux hd-631',42),('superlux',42),('hd-631',42),('fadedge beatz studio',43),('fadedge',43),('beatz',43),('studio',43),('beyerdynamic t1',45),('beyerdynamic',45),('t1',45),('beyerdynamic t5p',46),('beyerdynamic',46),('t5p',46),('hp 15-r244tx',1),('hp',1),('15-r244tx',1),('dell inspiron 7348',3),('dell',3),('inspiron',3),('7348',3),('iball netbook',5),('iball',5),('netbook',5),('msi dominator pro gt72',7),('msi',7),('dominator',7),('pro',7),('gt72',7),('moto g (2nd generation)',11),('moto',11),('g',11),('(2nd',11),('generation)',11),('moto turbo',13),('moto',13),('turbo',13),('asus zenfone 6',16),('asus',16),('zenfone',16),('6',16),('microsoft lumia 640',17),('microsoft',17),('lumia',17),('640',17),('lg 55ea9700',31),('lg',31),('55ea9700',31),('sony kd-55x8500b',32),('sony',32),('kd-55x8500b',32),('samsung 55ju6470',33),('samsung',33),('55ju6470',33),('samsung 55j6300',35),('samsung',35),('55j6300',35),('lg 55uf670t',36),('lg',36),('55uf670t',36),('nomon analog',22),('nomon',22),('analog',22),('grovana 1703.6111',24),('grovana',24),('1703.6111',24),('nikon d5300',51),('nikon',51),('d5300',51),('canon eos 1200d kit',52),('canon',52),('eos',52),('1200d',52),('kit',52),('nikon d3200',55),('nikon',55),('d3200',55),('skullcandy s2ikdy',41),('skullcandy',41),('s2ikdy',41),('sennheiser hd 800',44),('sennheiser',44),('hd',44),('800',44),('sennheiser hd 700',47),('sennheiser',47),('hd',47),('700',47),('lenovo g50-70',2),('lenovo',2),('g50-70',2),('acer c720',4),('acer',4),('c720',4),('acer aspire e5-551g',6),('acer',6),('aspire',6),('e5-551g',6),('nexus 6',12),('nexus',12),('6',12),('moto x (2nd generation)',14),('moto',14),('x',14),('(2nd',14),('generation)',14),('asus zenfone 2 ze551ml',15),('asus',15),('zenfone',15),('2',15),('ze551ml',15),('sony bravia kdl-55w800c',34),('sony',34),('bravia',34),('kdl-55w800c',34),('samsung 48ju6470',37),('samsung',37),('48ju6470',37),('formex 900.1.8084',21),('formex',21),('900.1.8084',21),('formex 15001.8023',23),('formex',23),('15001.8023',23),('movado 0605832',25),('movado',25),('0605832',25),('suunto ss020674000',26),('suunto',26),('ss020674000',26),('nomon wood clock',27),('nomon',27),('wood',27),('clock',27),('alto k10',100),('alto',100),('k10',100);
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `trans_id` varchar(10) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ship_add` varchar(150) DEFAULT NULL,
  `orderdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-23 23:20:07
