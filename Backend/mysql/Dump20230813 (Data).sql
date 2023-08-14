-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `border`
--

LOCK TABLES `border` WRITE;
/*!40000 ALTER TABLE `border` DISABLE KEYS */;
/*!40000 ALTER TABLE `border` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','admin','admin','1998-07-04','010-6212-5651','경기도',NULL,1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
ALTER TABLE `product` AUTO_INCREMENT = 1;
INSERT INTO `product` VALUES (1,'기네스','맥주',2300,10,330,4.2,'아일랜드','맛있음',NULL,'admin'),(2,'버드와이저','맥주',1500,10,330,5.0,'미국','맛있음',NULL,'admin'),(3,'산미구엘','맥주',2800,10,320,5.0,'필리핀','맛있음',NULL,'admin'),(4,'서머스비','맥주',1700,10,330,4.5,'덴마크','맛있음',NULL,'admin'),(5,'스텔라 아르투아','맥주',3300,10,330,5.0,'벨기에','맛있음',NULL,'admin'),(6,'칭따오','맥주',5500,10,640,4.7,'중국','맛있음',NULL,'admin'),(7,'크로넨버그','맥주',2500,10,650,5.0,'프랑스','맛있음',NULL,'admin'),(8,'하이네켄','맥주',4000,10,650,5.0,'네덜란드','맛있음',NULL,'admin'),(9,'골목막걸리','막걸리',7470,10,350,12.0,'대한민국','맛있음',NULL,'admin'),(10,'대대포 블루','막걸리',2970,10,600,6.0,'대한민국','맛있음',NULL,'admin'),(11,'동래아들 막걸리','막걸리',3500,10,750,6.0,'대한민국','맛있음',NULL,'admin'),(12,'마크홀리 막걸리','막걸리',16050,10,500,12.0,'대한민국','맛있음',NULL,'admin'),(13,'복분자 막걸리','막걸리',3220,10,360,6.0,'대한민국','맛있음',NULL,'admin'),(14,'붉은 원숭이 막걸리','막걸리',8550,10,375,10.8,'대한민국','맛있음',NULL,'admin'),(15,'삼양춘 막걸리','막걸리',12160,10,500,12.5,'대한민국','맛있음',NULL,'admin'),(16,'얼떨결에 막걸리','막걸리',7600,10,935,6.0,'대한민국','맛있음',NULL,'admin'),(17,'왕밤 막걸리','막걸리',1800,10,750,6.0,'대한민국','맛있음',NULL,'admin'),(18,'우곡생주','막걸리',7000,10,750,10.0,'대한민국','맛있음',NULL,'admin'),(19,'앱솔루트 어피치','보드카',35900,10,700,40.0,'스웨덴','맛있음',NULL,'admin'),(20,'스미노프 그린애플','보드카',37300,10,700,37.5,'미국','맛있음',NULL,'admin'),(21,'벨베디어 보드카','보드카',64200,10,700,40.0,'폴란드','맛있음',NULL,'admin'),(22,'그레이구스 보드카 레몬향','보드카',68400,10,750,40.0,'프랑스','맛있음',NULL,'admin'),(23,'휘틀리 보드카','보드카',48500,10,750,41.0,'미국','맛있음',NULL,'admin'),(24,'스톨리 바닐라','보드카',37100,10,700,37.5,'러시아','맛있음',NULL,'admin'),(25,'스톨리 솔티드 캐러멜','보드카',37100,10,700,37.5,'라트비아','맛있음',NULL,'admin'),(26,'그레이구스 보드카','보드카',68400,10,750,40.0,'프랑스','맛있음',NULL,'admin'),(27,'앱솔루트 라임','보드카',35900,10,700,40.0,'스웨덴','맛있음',NULL,'admin'),(28,'그레이구스 보드카 오렌지향','보드카',68400,10,750,40.0,'프랑스','맛있음',NULL,'admin'),(29,'아마부키 하쿠토우슈','사케',45700,10,720,8.0,'일본','맛있음',NULL,'admin'),(30,'우미유즈','사케',52800,10,720,7.0,'일본','맛있음',NULL,'admin'),(31,'코타카라 자두','사케',48400,10,720,8.0,'일본','맛있음',NULL,'admin'),(32,'코이시소우','사케',45000,10,750,7.0,'일본','맛있음',NULL,'admin'),(33,'이소노사와 준마이','사케',15500,10,720,14.5,'일본','맛있음',NULL,'admin'),(34,'하나기자쿠라 준마이긴죠','사케',17100,10,720,12.0,'일본','맛있음',NULL,'admin'),(35,'킨미야 소츄','사케',28500,10,720,25.0,'일본','맛있음',NULL,'admin'),(36,'사카리 No.21 유즈슈','사케',55600,10,710,8.0,'일본','맛있음',NULL,'admin'),(37,'고래 사케','사케',10000,10,720,15.0,'중국','맛있음',NULL,'admin'),(38,'닷사이 준마이 다이긴죠','사케',186400,10,720,16.0,'일본','맛있음',NULL,'admin'),(39,'안동소주','소주',10500,10,375,42.0,'대한민국','맛있음',NULL,'admin'),(40,'금빛소주','소주',33250,10,375,35.0,'대한민국','맛있음',NULL,'admin'),(41,'도원결의','소주',6930,10,360,25.0,'대한민국','맛있음',NULL,'admin'),(42,'동해소주','소주',2220,10,360,17.5,'대한민국','맛있음',NULL,'admin'),(43,'미상 감귤소주','소주',11700,10,350,25.0,'대한민국','맛있음',NULL,'admin'),(44,'서울의 밤','소주',7900,10,375,17.0,'대한민국','맛있음',NULL,'admin'),(45,'일품','소주',5100,10,350,21.0,'대한민국','맛있음',NULL,'admin'),(46,'전주이강주','소주',12350,10,375,25.0,'대한민국','맛있음',NULL,'admin'),(47,'추사백 사과 소주','소주',32000,10,500,40.0,'대한민국','맛있음',NULL,'admin'),(48,'황금보리','소주',9630,10,375,25.0,'대한민국','맛있음',NULL,'admin'),(49,'쇼비농 블랑','와인',24300,10,750,13.0,'뉴질랜드','맛있음',NULL,'admin'),(50,'브레드 앤 버터 프노 누아','와인',35200,10,750,13.5,'미국','맛있음',NULL,'admin'),(51,'디아블로 데블스 브뤼 루미너스','와인',42300,10,750,12.0,'칠레','맛있음',NULL,'admin'),(52,'골든블랑 포스타 크레망 브뤼','와인',67000,10,750,12.0,'프랑스','맛있음',NULL,'admin'),(53,'골든블랑 포스타 크레망 로제','와인',83700,10,750,12.0,'프랑스','맛있음',NULL,'admin'),(54,'돔 페리뇽 빈티지','와인',379000,10,750,12.5,'프랑스','맛있음',NULL,'admin'),(55,'모엣 샹동 로제 임페리얼','와인',100300,10,750,12.0,'프랑스','맛있음',NULL,'admin'),(56,'뵈브 클리코 옐로우 라벨','와인',100200,10,750,12.0,'프랑스','맛있음',NULL,'admin'),(57,'1865 셀렉티드 빈야드 시라','와인',46800,10,750,14.5,'칠레','맛있음',NULL,'admin'),(58,'칸티나 자키니니 달 트랄체토 체라수올로','와인',32900,10,750,13.0,'이탈리아','맛있음',NULL,'admin'),(59,'짐빔','위스키',46000,10,700,43.0,'미국','맛있음',NULL,'admin'),(60,'조니워커 더블블랙','위스키',68500,10,700,40.0,'스코틀랜드','맛있음',NULL,'admin'),(61,'몽키숄더','위스키',61600,10,700,40.0,'스코틀랜드','맛있음',NULL,'admin'),(62,'발렌타인 7년산','위스키',46200,10,700,40.0,'영국','맛있음',NULL,'admin'),(63,'메이커스 마크','위스키',61300,10,750,45.0,'미국','맛있음',NULL,'admin'),(64,'더 페이머스 그라우스','위스키',33600,10,700,40.0,'스코틀랜드','맛있음',NULL,'admin'),(65,'블랙 보틀','위스키',31500,10,700,40.0,'스코틀랜드','맛있음',NULL,'admin'),(66,'스카츠 그레이','위스키',19900,10,700,40.0,'스코틀랜드','맛있음',NULL,'admin'),(67,'위스키 코쿤','위스키',17900,10,600,37.0,'일본','맛있음',NULL,'admin'),(68,'미스터 보스턴 버번','위스키',17200,10,1000,40.0,'미국','맛있음',NULL,'admin');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-13 14:13:43
