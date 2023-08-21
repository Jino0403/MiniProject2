-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.32

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
INSERT INTO `member` VALUES ('admin','admin','admin','1998-07-04','010-6212-5651','경기도','관리자',2),('kms1109','asd','유재민','1998-08-01',NULL,'asd',NULL,1),('kos1','kos1','cust','1999-02-12','010-3231-2321','서울','',1),('sdf','123','123','1999-02-12',NULL,NULL,NULL,1),('sdfsdf','123','jj1','1999-02-12',NULL,'경기도 시흥',NULL,1);
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
INSERT INTO `product` VALUES (1,'기네스','맥주',2300,10,330,4.2,'아일랜드','맛있음','/Styles/images/alcohol_image/beer/guinness.png','admin',1),(2,'버드와이저','맥주',1500,10,330,5.0,'미국','맛있음','/Styles/images/alcohol_image/beer/budweiser.png','admin',1),(3,'산미구엘','맥주',2800,10,320,5.0,'필리핀','맛있음','/Styles/images/alcohol_image/beer/sanmiguel.png','admin',1),(4,'서머스비','맥주',1700,10,330,4.5,'덴마크','맛있음','/Styles/images/alcohol_image/beer/somersby.png','admin',1),(5,'스텔라 아르투아','맥주',3300,10,330,5.0,'벨기에','맛있음','/Styles/images/alcohol_image/beer/stellaartois.png','admin',1),(6,'칭따오','맥주',5500,10,640,4.7,'중국','맛있음','/Styles/images/alcohol_image/beer/qingdao.png','admin',1),(7,'크로넨버그','맥주',2500,10,650,5.0,'프랑스','맛있음','/Styles/images/alcohol_image/beer/kronenbourg.png','admin',1),(8,'하이네켄','맥주',4000,10,650,5.0,'네덜란드','맛있음','/Styles/images/alcohol_image/beer/heineken.png','admin',1),(9,'골목막걸리','막걸리',7470,10,350,12.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/golmokmakgeolli.png','admin',1),(10,'대대포 블루','막걸리',2970,10,600,6.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/daedaepobluemakgeolli.png','admin',1),(11,'동래아들 막걸리','막걸리',3500,10,750,6.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/dongraesonmakgeolli.png','admin',1),(12,'마크홀리 막걸리','막걸리',16050,10,500,12.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/markhollymakgeolli.png','admin',1),(13,'복분자 막걸리','막걸리',3220,10,360,6.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/bokbunjamakgeolli.png','admin',1),(14,'붉은 원숭이 막걸리','막걸리',8550,10,375,10.8,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/redmonkeymakgeolli.png','admin',1),(15,'삼양춘 막걸리','막걸리',12160,10,500,12.5,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/samyangchunmakgeolli.png','admin',1),(16,'얼떨결에 막걸리','막걸리',7600,10,935,6.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/ulddyulgyulemakgeolli.png','admin',1),(17,'왕밤 막걸리','막걸리',1800,10,750,6.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/kingbammakgeolli.png','admin',1),(18,'우곡생주','막걸리',7000,10,750,10.0,'대한민국','맛있음','/Styles/images/alcohol_image/makgeolli/ugoksangjumakgeolli.png','admin',1),(19,'앱솔루트 어피치','보드카',35900,10,700,40.0,'스웨덴','맛있음','/Styles/images/alcohol_image/vodka/absoluteapeach.png','admin',1),(20,'스미노프 그린애플','보드카',37300,10,700,37.5,'미국','맛있음','/Styles/images/alcohol_image/vodka/smirnoffgreenapple.png','admin',1),(21,'벨베디어 보드카','보드카',64200,10,700,40.0,'폴란드','맛있음','/Styles/images/alcohol_image/vodka/belvederevodka.png','admin',1),(22,'그레이구스 보드카 레몬향','보드카',68400,10,750,40.0,'프랑스','맛있음','/Styles/images/alcohol_image/vodka/greygoosevodkalemon.png','admin',1),(23,'휘틀리 보드카','보드카',48500,10,750,41.0,'미국','맛있음','/Styles/images/alcohol_image/vodka/wheatleyvodka.png','admin',1),(24,'스톨리 바닐라','보드카',37100,10,700,37.5,'러시아','맛있음','/Styles/images/alcohol_image/vodka/stolibanilla.png','admin',1),(25,'스톨리 솔티드 캐러멜','보드카',37100,10,700,37.5,'라트비아','맛있음','/Styles/images/alcohol_image/vodka/stolisaltedcaramel.png','admin',1),(26,'그레이구스 보드카','보드카',68400,10,750,40.0,'프랑스','맛있음','/Styles/images/alcohol_image/vodka/greygoosevodka.png','admin',1),(27,'앱솔루트 라임','보드카',35900,10,700,40.0,'스웨덴','맛있음','/Styles/images/alcohol_image/vodka/absolutelime.png','admin',1),(28,'그레이구스 보드카 오렌지향','보드카',68400,10,750,40.0,'프랑스','맛있음','/Styles/images/alcohol_image/vodka/greygoosevodkaorange.png','admin',1),(29,'아마부키 하쿠토우슈','사케',45700,10,720,8.0,'일본','맛있음','/Styles/images/alcohol_image/sake/amabukihakutousyu.png','admin',1),(30,'우미유즈','사케',52800,10,720,7.0,'일본','맛있음','/Styles/images/alcohol_image/sake/umiuse.png','admin',1),(31,'코타카라 자두','사케',48400,10,720,8.0,'일본','맛있음','/Styles/images/alcohol_image/sake/kotakarajadu.png','admin',1),(32,'코이시소우','사케',45000,10,750,7.0,'일본','맛있음','/Styles/images/alcohol_image/sake/koisauwu.png','admin',1),(33,'이소노사와 준마이','사케',15500,10,720,14.5,'일본','맛있음','/Styles/images/alcohol_image/sake/isonosawajunmai.png','admin',1),(34,'하나기자쿠라 준마이긴죠','사케',17100,10,720,12.0,'일본','맛있음','/Styles/images/alcohol_image/sake/hanagijakurajunmaiginjyo.png','admin',1),(35,'킨미야 소츄','사케',28500,10,720,25.0,'일본','맛있음','/Styles/images/alcohol_image/sake/kinmiyasochu.png','admin',1),(36,'사카리 No.21 유즈슈','사케',55600,10,710,8.0,'일본','맛있음','/Styles/images/alcohol_image/sake/sakariNo.21usesyu.png','admin',1),(37,'고래 사케','사케',10000,10,720,15.0,'중국','맛있음','/Styles/images/alcohol_image/sake/whalesake.png','admin',1),(38,'닷사이 준마이 다이긴죠','사케',186400,10,720,16.0,'일본','맛있음','/Styles/images/alcohol_image/sake/datsaijunmaidaiginjyosake.png','admin',1),(39,'안동소주','소주',10500,10,375,42.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/andongsoju.png','admin',1),(40,'금빛소주','소주',33250,10,375,35.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/geumbitsoju.png','admin',1),(41,'도원결의','소주',6930,10,360,25.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/dowongyuleu.png','admin',1),(42,'동해소주','소주',2220,10,360,17.5,'대한민국','맛있음','/Styles/images/alcohol_image/soju/donghaesoju.png','admin',1),(43,'미상 감귤소주','소주',11700,10,350,25.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/misanggamkuylsoju.png','admin',1),(44,'서울의 밤','소주',7900,10,375,17.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/seoul\'snight.png','admin',1),(45,'일품','소주',5100,10,350,21.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/ilpum.png','admin',1),(46,'전주이강주','소주',12350,10,375,25.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/jeonjuyigangju.png','admin',1),(47,'추사백 사과 소주','소주',32000,10,500,40.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/choosabaekapplesoju.png','admin',1),(48,'황금보리','소주',9630,10,375,25.0,'대한민국','맛있음','/Styles/images/alcohol_image/soju/hwanggeumbori.png','admin',1),(49,'쇼비농 블랑','와인',24300,10,750,13.0,'뉴질랜드','맛있음','/Styles/images/alcohol_image/wine/sauvinonblanc.png','admin',1),(50,'브레드 앤 버터 프노 누아','와인',35200,10,750,13.5,'미국','맛있음','/Styles/images/alcohol_image/wine/turbread&butterpinotnoir.png','admin',1),(51,'디아블로 데블스 브뤼 루미너스','와인',42300,10,750,12.0,'칠레','맛있음','/Styles/images/alcohol_image/wine/diablodevlesbrutluminous.png','admin',1),(52,'골든블랑 포스타 크레망 브뤼','와인',67000,10,750,12.0,'프랑스','맛있음','/Styles/images/alcohol_image/wine/goldenblanc4starscremantbrut.png','admin',1),(53,'골든블랑 포스타 크레망 로제','와인',83700,10,750,12.0,'프랑스','맛있음','/Styles/images/alcohol_image/wine/goldenblanc4starscremantrose.png','admin',1),(54,'돔 페리뇽 빈티지','와인',379000,10,750,12.5,'프랑스','맛있음','/Styles/images/alcohol_image/wine/domperinonvintage.png','admin',1),(55,'모엣 샹동 로제 임페리얼','와인',100300,10,750,12.0,'프랑스','맛있음','/Styles/images/alcohol_image/wine/moetsyangdongroseimperial.png','admin',1),(56,'뵈브 클리코 옐로우 라벨','와인',100200,10,750,12.0,'프랑스','맛있음','/Styles/images/alcohol_image/wine/veuveclicquotyellowlabel.png','admin',1),(57,'1865 셀렉티드 빈야드 시라','와인',46800,10,750,14.5,'칠레','맛있음','/Styles/images/alcohol_image/wine/1865selectedvineyardsyrah.png','admin',1),(58,'칸티나 자키니니 달 트랄체토 체라수올로','와인',32900,10,750,13.0,'이탈리아','맛있음','/Styles/images/alcohol_image/wine/cantinazaccagninidaltrachetocerasuolo.png','admin',1),(59,'짐빔','위스키',46000,10,700,43.0,'미국','맛있음','/Styles/images/alcohol_image/whisky/jimbeam.png','admin',1),(60,'조니워커 더블블랙','위스키',68500,10,700,40.0,'스코틀랜드','맛있음','/Styles/images/alcohol_image/whisky/johnniewalkerdoubleblack.png','admin',1),(61,'몽키숄더','위스키',61600,10,700,40.0,'스코틀랜드','맛있음','/Styles/images/alcohol_image/whisky/monkeyshoulder.png','admin',1),(62,'발렌타인 7년산','위스키',46200,10,700,40.0,'영국','맛있음','/Styles/images/alcohol_image/whisky/valentine7year.png','admin',1),(63,'메이커스 마크','위스키',61300,10,750,45.0,'미국','맛있음','/Styles/images/alcohol_image/whisky/makersmark.png','admin',1),(64,'더 페이머스 그라우스','위스키',33600,10,700,40.0,'스코틀랜드','맛있음','/Styles/images/alcohol_image/whisky/thefamousgrouse.png','admin',1),(65,'블랙 보틀','위스키',31500,10,700,40.0,'스코틀랜드','맛있음','/Styles/images/alcohol_image/whisky/blackbottle.png','admin',1),(66,'스카츠 그레이','위스키',19900,10,700,40.0,'스코틀랜드','맛있음','/Styles/images/alcohol_image/whisky/scotsgrey.png','admin',1),(67,'위스키 코쿤','위스키',17900,10,600,37.0,'일본','맛있음','/Styles/images/alcohol_image/whisky/whiskykokun.png','admin',1),(68,'미스터 보스턴 버번','위스키',17200,10,1000,40.0,'미국','맛있음','/Styles/images/alcohol_image/whisky/mr.bostonbourbon.png','admin',1),(69,'카스','맥주',2100,10,640,4.5,'대한민국','맛있음','/Styles/images/alcohol_image/beer/cass.png','admin',1),(70,'켈리','맥주',1550,10,640,4.5,'대한민국','맛있음','/Styles/images/alcohol_image/beer/kelly.png','admin',1),(71,'육전','고기류',11000,10,NULL,NULL,'미국산','맛있음','/Styles/images/snack_image/beefjeon.png','admin',2),(72,'족발','고기류',16000,10,NULL,NULL,'국내산','맛있음','/Styles/images/snack_image/jokbal.png','admin',2),(73,'버팔로윙봉','고기류',16200,10,NULL,NULL,'태국산','맛있음','/Styles/images/snack_image/buffalochickenwingbong.png','admin',2),(74,'베이컨 야채말이','고기류',11900,10,NULL,NULL,'스페인산','맛있음','/Styles/images/snack_image/baconvegetableroll.png','admin',2),(75,'연어구이','해산물류',3300,10,NULL,NULL,'칠레산','맛있음','/Styles/images/snack_image/broiledsalmon.png','admin',2),(76,'어묵탕','탕류',9700,10,NULL,NULL,'베트남산','맛있음','/Styles/images/snack_image/fishcakesoup.png','admin',2),(77,'곱창전골','탕류',12000,10,NULL,NULL,'미국산','맛있음','/Styles/images/snack_image/gopchangjeongol.png','admin',2),(78,'김치찌개','탕류',4500,10,NULL,NULL,'국내산','맛있음','/Styles/images/snack_image/kimchijjigae.png','admin',2),(79,'무뼈 닭발','고기류',6800,10,NULL,NULL,'덴마크산','맛있음','/Styles/images/snack_image/footofchicken.png','admin',2),(80,'조개탕','탕류',8000,10,NULL,NULL,'베트남산','맛있음','/Styles/images/snack_image/clamsoup.png','admin',2),(81,'편육','고기류',5020,10,NULL,NULL,'국내산','맛있음','/Styles/images/snack_image/slicedmeat.png','admin',2),(82,'찹 스테이크','고기류',16200,10,NULL,NULL,'국내산','맛있음','/Styles/images/snack_image/chapsteak.png','admin',2),(83,'홍합 스튜','해산물류',10700,10,NULL,NULL,'국내산','맛있음','/Styles/images/snack_image/musselstew.png','admin',2),(84,'감바스','해산물류',13200,10,NULL,NULL,'베트남산','맛있음','/Styles/images/snack_image/gambas.png','admin',2),(85,'명란구이','해산물류',12500,10,NULL,NULL,'러시아산','맛있음','/Styles/images/snack_image/broiledmyungran.png','admin',2);
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

-- Dump completed on 2023-08-21  9:18:30
