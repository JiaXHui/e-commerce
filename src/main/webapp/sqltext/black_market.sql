/*
 Navicat Premium Data Transfer

 Source Server         : xiaohui
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : black_market

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 26/11/2019 10:59:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, '刘华强', 'liu', '123456');
INSERT INTO `admin_user` VALUES (2, '小猪佩琪', 'peiqi', '123456');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` tinyint(1) NULL DEFAULT NULL,
  `order_number` int(5) NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (64, '精品女优', 1, 56, '舌头灵活腰有劲儿', '2019-11-21 10:03:36');
INSERT INTO `category` VALUES (68, '稀世珍品', 1, 12, '名贵的', '2019-11-21 11:23:52');
INSERT INTO `category` VALUES (69, '枪械', 1, 1, '', '2019-11-21 11:27:53');
INSERT INTO `category` VALUES (70, '毒品', 1, 2, '====', '2019-11-21 11:28:04');
INSERT INTO `category` VALUES (71, '雇佣兵', 1, 3, '都是退伍军人', '2019-11-21 11:28:22');
INSERT INTO `category` VALUES (72, '战斗机', 1, 5, '高科技产品', '2019-11-21 11:30:08');
INSERT INTO `category` VALUES (73, '军舰', 1, 15, '各大航母驱逐', '2019-11-21 11:28:40');
INSERT INTO `category` VALUES (74, '菲佣', 1, 3213, '我', '2019-11-21 11:29:03');
INSERT INTO `category` VALUES (75, '卡面来打', 1, 12313, 'henshen', '2019-11-21 13:24:24');
INSERT INTO `category` VALUES (76, '海鲜野味', 1, 0, '珍稀野生，人间美味，不枉人间走一趟。', '2019-11-20 21:25:28');
INSERT INTO `category` VALUES (77, '器官', 1, 3, '血腥', '2019-11-21 13:28:44');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '越王勾践剑', 90000, '天下第一剑', '55fc64ae-59f3-4dff-a1d8-61eaf6e70bc3.jpg', '2019-11-21 11:25:22', 68);
INSERT INTO `goods` VALUES (2, '卢本伟', 25, '卢本伟有口臭', '0b77212b-81a8-44a2-9a01-11ea17381b98.jpg', '2019-11-27 11:31:35', 71);
INSERT INTO `goods` VALUES (5, '曾侯乙尊盘', 111, '曾侯乙墓,出土', 'e378aa0b-672d-4da9-94ab-1cf89e14f678.jpg', '2019-11-21 13:09:24', 68);
INSERT INTO `goods` VALUES (6, 'B站手办', 98000000, '98亿的手办', 'f6400f8b-193f-4e21-aa2d-3ab4e976c5b9.png', '2019-10-30 13:19:42', 68);
INSERT INTO `goods` VALUES (7, '测试', 1, '1', '1a7c935b-d594-4c78-8e73-fe8aa382c9fc.jpg', '2019-11-21 13:09:24', 68);
INSERT INTO `goods` VALUES (8, '歼5', 500000, '中国自主研发的战斗机', '70b19955-4eda-44c8-a09c-de1f998c0e7c.jpg', '2019-11-21 13:21:55', 72);
INSERT INTO `goods` VALUES (10, 'joker', 1231, '有点意思哦', '1685faf5-359b-4a5e-840e-e7cf9fdb396a.jpg', '2019-11-21 13:25:36', 75);
INSERT INTO `goods` VALUES (11, '三上悠亚', 999, '三上悠亚，原名鬼头桃菜（きとう ももな、1993年8月16日 - ），女子偶像团体SKE48 Team S的成员，出生于日本爱知县名古屋市。第二代惠比寿麝香葡萄成员，隶属于AKS事务所。\r\n曾经是Team KII的成员，2010年12月6日被降格为研究生，2012年8月29日升格至Team S再次成为正式成员。2014年宣布毕业，改名为三上悠亚开始拍摄成人影片与写真。\r\n2016年成为知名网络娱乐集团esball的品牌代言人，并在两岸三地举办实体见面会、YY直播线上见面会。', '5fbc4e8a-0d57-4f38-a139-ff652f5c5c39.jpg', '2019-11-21 13:25:04', 64);
INSERT INTO `goods` VALUES (12, '企业', 100000000000000, '约克城级航母', '7518d7ff-5e79-45a8-8dd2-4cf413f8fa38.jpg', '2019-11-21 13:23:45', 73);
INSERT INTO `goods` VALUES (13, '沙漠之鹰', 10000, '操作方便，容易携带', 'e5c3dbf9-a04d-4e91-aacf-a1902a07bddb.jpg', '2019-11-21 13:25:42', 69);
INSERT INTO `goods` VALUES (14, '岳阳舰', 8e15, '世界上最大的航空母舰', 'f596c544-293b-40e5-9c2b-d66a45b685ed.jpg', '2019-11-21 13:25:57', 73);
INSERT INTO `goods` VALUES (15, '明日花绮罗', 999, '明日花绮罗，1988年10月2日出生于北海道，日本AV女优，歌手 [1]  。\r\n明日花绮罗在六本木俱乐部夜总会当小姐被发堀的，被H·M·P誉为“2007年底最后最强新人”；在“スカパー！アダルト放送大赏2009”的投票活动，得到“HD赏”、“新人赏”甚至是“最优秀女优赏”等大奖。', 'b15c1e25-72a6-4e4f-867b-404ebddec65d.jpg', '', 64);
INSERT INTO `goods` VALUES (16, '天使萌', 1999, '2015年22岁的天使萌，拥有155公分的娇小身材，气质清新可爱，亲和力十足，2015年3月她才跟随AV界的超级星光大道“Honey’s Secret Party II”来台演出，回国随即在“SKYPerfecTV 成人放送大赏”，荣获“新人女优奖”，才刚出道不到一年，就能得到新人奖，她表示感到很意外，也希望中国台湾的朋友能继续支持她。 [1]', '88746682-abf8-42f7-b9b3-622c7257fc33.gif', '2019-11-21 13:29:25', 64);
INSERT INTO `goods` VALUES (17, '桥本有菜', 999, '桥本有菜（桥本ありな，はしもとありな），1996年12月15日出生，日本女演员。 [1] \r\n中文名桥本有菜外文名橋本ありな国    籍日本出生日期1996年12月15日职    业演员', '64f68a26-77ee-4086-b6c4-4d6206f1121a.jpg', '2019-11-21 13:31:37', 64);
INSERT INTO `goods` VALUES (18, 'kar-98k', 50000, 'Kar.98k毛瑟步枪由Gew.98式步枪改进而来，重量约为4公斤，有效射程800米，是第二次世界大战时期德国军队装备的制式步枪。从1935年开始服役，直到二战结束前都是纳粹德军的制式步枪。是二战期间产量最多的轻武器之一。', '7378bd5a-1adf-4e8a-8707-21f08a8f336b.jpg', '2019-11-21 13:31:16', 69);
INSERT INTO `goods` VALUES (19, '佐仓绊', 1999, '日本女子偶像サンスポPSリポート的一期成员，曾经在日本秋叶原的女仆主题咖啡厅打工，与同在咖啡厅后来成为SKE48研究生的松村香织是好朋友。\r\n虽然佐仓绊看起来很萌，但是说起话来就完全不一样，还经常会说些黄段子，还和成人光碟店的店员成为朋友，更帮忙推荐商品。\r\n早期从事写真，2014年宣布转行当AV女优。', 'f2f0e96f-7d1f-46ba-9f3d-70ca875f09e5.jpg', '2019-11-21 13:45:27', 64);
INSERT INTO `goods` VALUES (20, '尼泊尔军刀', 90000, '好用', '56c09ef0-b2c1-462c-bc3a-f017ab323f5c.jpg', '2019-11-21 13:57:37', 69);
INSERT INTO `goods` VALUES (25, '究极臭豆腐', 8888, '爱你不是两三天', '6a3c86e1-ece8-4bd1-a5ae-f071fb8359e1.jpg', '2019-11-30 09:27:45', 76);
INSERT INTO `goods` VALUES (26, '歼20', 200000000, '第五代战斗机', 'c1c9e95a-9eee-4af3-99c6-67d77412b130.jpg', '2019-11-13 09:31:29', 72);
INSERT INTO `goods` VALUES (27, '大闸蟹', 999, '中华绒螯蟹为日本绒螯蟹中华亚种，又名河蟹、大闸蟹，是我国传统的水产珍品', '7d713b4e-6817-46b8-92a9-c40400d1ef65.jpg', '2019-11-21 13:09:24', 76);
INSERT INTO `goods` VALUES (28, '大龙虾', 567, '来自大西洋的美味', '9adab9ba-776f-48cd-8173-91373e9c3d41.jpg', '2019-11-22 09:29:31', 76);
INSERT INTO `goods` VALUES (29, '虾', 1234, '我好饿啊', '27320b3f-1b6d-4200-ac44-b718bd332ce5.jpg', '2019-11-22 09:29:06', 76);
INSERT INTO `goods` VALUES (30, '女优', 500000, '性感女优在线撩你', '51886b36-b343-4f11-bf29-fcebe5d0ae02.jpg', '2019-11-22 09:27:30', 64);
INSERT INTO `goods` VALUES (31, '皮皮虾', 0.5, '啤酒小龙虾', 'c4ed88f8-7cbc-4948-a95e-e24e697a7301.jpg', '2019-11-22 09:28:54', 76);
INSERT INTO `goods` VALUES (32, '非洲海鲜', 9999, '赏你一个最爱的大嘴巴子', '0d791128-34e2-4348-b416-e83278e11672.jpg', '2019-11-22 09:29:05', 76);
INSERT INTO `goods` VALUES (33, '烤面筋', 9999, '辣辣的滋味你吃过没', 'b76bb1e1-7a59-45f6-b272-551c45167e3b.jpg', '2019-11-23 09:29:00', 76);
INSERT INTO `goods` VALUES (34, '鲍鱼', 300, '营养价值极高，外形奇特', '2877b5ca-c17b-4c51-a169-7c6611b2a7d6.jpg', '2019-11-22 09:29:17', 76);
INSERT INTO `goods` VALUES (35, '手枪', 20000, '厉害', '976b3b8c-82ea-45ae-bb6f-1ba226c3aa10.jpg', '', 69);
INSERT INTO `goods` VALUES (36, '野生犹猪', 300, '疣猪属（学名：Phacochoerus）：体重在50-150千克。该属仅有2个物种，即非洲疣猪和荒漠疣猪。因眼部下方具疣而得名，且雄猪吻部多具一对较小的疣，在挖土取食时，这些疣可能有助于保护眼睛。头较大，占体长的三分之一。背部具鬃毛。獠牙4枚，长而锋利。', 'c67e08a7-9c8e-4707-880b-946d166eb36a.jpg', '2019-11-22 09:29:20', 76);
INSERT INTO `goods` VALUES (37, '鱼翅', 1000, '鲨鱼翅在民间通常以\"鱼翅\"简称。作为中国传统的名贵食品之一，始见于《宋会要》，是山珍海味中的一种，鱼翅又称鲛鱼翅、鲛鲨翅、沙鱼翅、金丝菜等，具体指鲨鱼鳍中的细丝状软骨，由鲨鱼的胸、腹、尾等处的鳍翅干燥制成。根据中国的相关规定，不得在公务接待中提供鱼翅等保护动物制作的菜肴。', '19170952-f47e-49a4-ba82-51a8a154bb17.jpg', '2019-11-20 09:30:03', 76);
INSERT INTO `goods` VALUES (38, '三文鱼', 128, '给你不一样的味道', '12739d72-0e9f-4072-bda1-44de65551c8e.jpg', '2019-11-22 09:31:32', 76);
INSERT INTO `goods` VALUES (39, '海鲜小咖', 199, '。。。。。。', 'a9cf5dac-f77c-4fef-a956-d61c25142426.jpg', '2019-11-22 09:29:45', 76);
INSERT INTO `goods` VALUES (40, '全鲜海味', 1399.9, '集聚海鲜之精华', 'fa3b3012-8234-466f-a250-f37fd8187579.jpg', '2019-11-20 09:30:00', 76);
INSERT INTO `goods` VALUES (41, '熊掌', 1000, '好吃', '2a4e3eb4-dda0-4a93-9806-87257f6a94d0.jpg', '2019-11-22 09:31:10', 76);
INSERT INTO `goods` VALUES (42, '大鲵', 50000, '大鲵属（学名：Andrias、Cryptobranchus）：共有三个物种，中国大鲵、日本大鲵和美国大鲵。中国大鲵身长可达1.8米，日本大鲵身长可达1.5米，美国大鲵身长可达0.75米。共通点是体形扁长，四肢很短，前肢4指，后肢5趾，趾间有蹼，有一短而侧扁的尾巴。不知者或误以为鱼类，其实属两栖动物，水中用鳃呼吸，水外用肺兼皮肤呼吸，皮肤只有黏膜，没有鳞片覆盖。栖息于溪涧、池塘。', '1060a33e-993b-4793-b6bd-050cc1942f24.jpg', '2019-11-22 09:32:53', 76);
INSERT INTO `goods` VALUES (44, '扇贝', 99999, '终是扇贝开了口，从此粉嫩不再有。安慕希', '6fe429a6-deb2-45e1-910b-831e6f19e6be.jpg', '2019-11-22 09:33:34', 76);
INSERT INTO `goods` VALUES (46, '超级兵', 29952, '最牛逼的', 'b3b220d9-332f-4e88-abfd-da6e8c348163.jpg', '2019-11-21 09:35:21', 71);
INSERT INTO `goods` VALUES (47, '山珍', 2399, '身与帝王家，宴过赛神仙', 'b62af48f-7d08-4b23-8ed2-73482d8247d0.jpg', '2019-11-22 09:34:57', 76);
INSERT INTO `goods` VALUES (48, '滋补生蚝', 998, '男人的加油站，女人的美容院！！！', 'a0d78db9-651d-4e6c-9bcf-153adfb17de1.jpg', '2019-11-22 09:36:27', 76);
INSERT INTO `goods` VALUES (49, '海鲜', 0.5, 'qwer', 'f2f18638-a380-47e8-a56e-fd83588cce40.jpeg', '2019-11-22 09:36:07', 76);
INSERT INTO `goods` VALUES (50, '三文鱼', 0.1, 'dfadsf', '15e66add-8441-437a-9180-0f24fbcf935c.jpeg', '2019-11-22 09:36:32', 76);
INSERT INTO `goods` VALUES (51, '古柯碱', 600, '1859年，奥地利化学家纽曼（Albert Neiman）又精制出更高纯度的物质，命名为可卡因（Cocaine）。该化合物又称古柯碱，化学名称为苯甲基芽子碱，多呈白色晶体状，无臭，味苦而麻。在医疗中，它被用作局部麻醉药或血管收缩剂，由于其麻醉效果好，穿透力强，主要用于表面麻醉，但因毒性强，不宜注射。同时可作强烈的天然中枢兴奋剂，也因其对中枢神经系统的兴奋作用而导致滥用，1985年起成为世界性主要毒品之一，多在美洲和欧洲。', 'a0ade0a1-258e-4acc-94cb-904863b2aac0.jpg', '2019-11-22 09:29:20', 70);
INSERT INTO `goods` VALUES (52, '姥鲨', 12312, '姥鲨速度很慢，不具攻击性并且数量丰富，历史上它是渔业的主要收获，商业上它也用途广泛，身体可做食物和鱼粉，鱼皮可做皮革，肝脏可做鱼肝油。', '544417ca-8493-4b78-b3a5-6e7825c06275.jpg', '2019-11-22 09:38:09', 76);
INSERT INTO `goods` VALUES (53, '蛏子', 10, '长长的，带皮的', '4f5d81ee-0bdf-4419-9172-990e7d209b3a.jpg', '2019-11-22 09:40:30', 76);
INSERT INTO `goods` VALUES (54, '腰子', 108888, '大腰子', '3f752656-6c19-4821-b6c3-f4ad26093bea.png', '2019-11-22 09:44:49', 76);
INSERT INTO `goods` VALUES (55, '菜虚困', 9.99, '童叟无欺菜虚鲲，北陵有鱼，名曰为鲲，鲲之大一锅炖不下。', '69666fbe-18a9-4108-9512-4d04e5f43d7e.jpg', '2019-11-22 09:44:59', 76);
INSERT INTO `goods` VALUES (57, '扇贝', 99999, '终是扇贝开了口，从此粉嫩不再有。安慕希', '09a26a50-bb3b-4fcc-a1d6-66ac727a60c3.jpg', '2020-11-19 09:33:34', 76);
INSERT INTO `goods` VALUES (63, '尾野真知子', 1999, '尾野真知子，1993年2月15日出生，日本AV女优。\r\n2011年8月出道。同年12月9日，写真集发售，12月20日，AV出道了。2012年11月隐退。\r\n知名AV女优，在日本、中国名气很大，代表作品虽然不是特别多，但是都很经典。', '2c9145e5-7c8c-4343-bab7-308183590c08.jpg', '2019-11-22 10:33:24', 64);
INSERT INTO `goods` VALUES (72, 'AK12', 99999, '原指卡拉什尼科夫自动步枪，以稳定耐用著称于世。俄语全称为Автомат Калашникова образца 2012 года，意为“卡拉什尼科夫2012年定型的突击步枪”。AK12是原AK74的基础上进行设计。', '31c70ea8-0926-4b88-9078-4aa61622620d.jpg', '2019-11-21 14:17:52', 69);
INSERT INTO `goods` VALUES (73, '狙击枪', 9999999, '一发致命', '76368a92-b676-4216-87ad-427e0761ae09.jpg', '2019-11-29 10:54:00', 69);
INSERT INTO `goods` VALUES (74, '大黄蜂', 100000000000000, '大黄蜂号航空母舰（英文：USS Hornet，舷号：CV-12），是美国海军隶下的一艘航空母舰，隶属于美国埃塞克斯级航母4号舰。\r\n大黄蜂号航空母舰在二战中起了显著作用，给海军航空兵注入了机动性、持久力和攻击力，促使盟国海军从日本舰队手中夺取了太平洋的控制权，确保了最终的胜利 [1]  。\r\n大黄蜂号航空母舰是美军第八艘以大黄蜂为名的军舰，于1942年8月3日在纽波特纽斯造船及船坞公司开工，1943年8月30日下水，1943年11月29日正式服役，1970年退役，1989年除籍，1998年5月26日捐赠作博物馆舰 [1]  ', '4474359b-f271-4374-b8a9-99563d7d6d61.jpg', '2019-11-22 10:52:51', 73);
INSERT INTO `goods` VALUES (76, 'HK-416', 9999999, 'HK416，原产于德国，是由黑克勒-科赫(Heckler & Koch，经常缩写为H&K或HK)公司研发，现在美国也有生产。由HK公司对英国SA80和M16进行改装，HK 416的研制目的在于提供一款性能比长期服役的M16突击步枪更优越的武器。它采用短行程导气式自动方式，而不像M16系列那样使用直接气体驱动系统。该枪对M16的基本设计做了重大改进，将一体化合金前托换成了由两部分组成的聚合材料前托，并采用浮动式枪管。装备可折叠的机械瞄具，因为标准配置是使用光学和夜视瞄准设备。', 'ec71c4da-5310-42a2-873c-97e70d2c148f.jpg', '2100-05-01 10:54:09', 69);
INSERT INTO `goods` VALUES (77, '上原亚衣', 500000, '上原亚衣（日语：上原 亜衣、1992年11月12日－），日本电视艺人、YouTuber、前AV女优，曾拍摄不同题材的成人影片，部分作品有女性射液[2]。福冈县出身，属于マインズ（Mine\'s）事务所。', '4668f019-1e26-4072-8bca-9490f196ccee.jpg', '2019-11-22 10:55:16', 64);
INSERT INTO `goods` VALUES (78, 'HK416步枪', 90000, '　所谓的HK416步枪，原产于德国，是由黑克勒-科赫公司研发，现在美国也有生产。由HK公司对英国SA80和M16进行改装，HK 416的研制目的在于提供一款性能比长期服役的M16突击步枪更优越的武器。它采用短行程导气式自动方式，而不像M16系列那样使用直接气体驱动系统。该枪对M16的基本设计做了重大改进，将一体化合金前托换成了由两部分组成的聚合材料前托，并采用浮动式枪管。装备可折叠的机械瞄具，因为标准配置是使用光学和夜视瞄准设备。', '5ce23a95-fbc0-4721-8327-842dc2748ec5.jpg', '2019-11-22 08:36:41', 69);
INSERT INTO `goods` VALUES (79, '我也不知道', 1231, '没有简介', '8c686ecc-667e-4009-b6b3-12667b93034f.png', '2019-11-22 10:57:26', 64);
INSERT INTO `goods` VALUES (80, 'M24', 100000, 'M24 狙击武器系统(Sniper Weapon System), 简称M24 SWS, 是雷明顿700步枪的军用版衍生型。', 'cffa2070-14a0-4ba8-a522-1e124e67d626.jpg', '2019-11-22 10:59:10', 69);
INSERT INTO `goods` VALUES (81, 'Mini14', 333333, 'Mini－14式轻型步枪起初是作为民用步枪而研制的，于1974年投入市场。此后有许多军队和保安部队采用该枪。1977年对该枪进行了改进，主式步枪的不锈钢型。1981年再次对该枪改进，配用了M14式7．62mm步枪的消焰器和发光瞄准具。主要是简化了机构，使枪机机构更好地防灰尘和油泥。', '589a7f51-1fc2-496f-991a-cf14d66e893a.jpg', '2019-11-22 09:32:53', 69);
INSERT INTO `goods` VALUES (82, 'AWM', 600000, 'AWM，M代表Magnum，在弹药上是指加量装药的子弹，AI（精准国际）针对狩猎竞技者的需求，改良原本AW狙击枪产品，推出了军用款的AWM狙击枪（警用款为AWP）。AWM原来以狩猎为主，后来也普及军事层面，用以提升远程杀伤力。它不但适合北极寒冷地域使用，能在-40℃条件下可靠地工作，而且能在热带使用。在炎热潮湿气候条件下的性能也相当优良。', '2f27436b-e8e7-4a4a-a65b-42bd1f693c88.jpg', '2019-11-22 11:00:09', 69);
INSERT INTO `goods` VALUES (83, '毛瑟', 100000, '毛瑟公司的历史可以追溯到1811年7月31日，当时符腾堡（Württemberg）国王腓特烈一世（Friedrich I）在德国黑森林的一个小镇奥伯恩多夫（Oberndorf）建立一间皇家兵工厂，该工厂于第二年开始运作，雇用了133个工人，专门为普鲁士军队生产武器。毛瑟两兄弟——威廉与保罗自小就跟随父亲在这家兵工厂当学徒，也是在这家工厂开始尝试设计枪支。', '02379c2e-2f01-49e8-af71-51d91b7cc279.jpg', '2019-11-22 11:01:07', 69);
INSERT INTO `goods` VALUES (84, '氯胺酮（K粉）', 666, '分离性麻醉剂。主体成分医学上称氯胺酮，全名为 2－邻－氯苯基－2－甲氨基环已酮，是苯环已哌啶(PCP)的衍生物。因为其物理形状通常呈白色粉末，而英文名称的第一个字母是 K，故俗称“K”粉。在医学临床上一般作为麻醉剂使用。', '2be1f4bc-cf8e-41cb-82dd-d80b7046cd9d.jpg', '2023-11-22 11:04:56', 70);
INSERT INTO `goods` VALUES (85, '毒品', 100000000, '冰毒，新型毒品的一种，又名甲基安非他明、去氧麻黄碱，是一种无味或微有苦味的透明结晶体，纯品很像冰糖，形似冰，故俗称冰毒。吸、贩毒者也称之为“冰”。', '2ec5f14d-0903-4973-8503-c3b7b2d6fff9.jpg', '2019-11-22 11:07:08', 70);
INSERT INTO `goods` VALUES (86, '鸦片', 80000, '鸦片（英语 opium 阿拉伯语 Afyūm），又叫阿片，俗称大烟，源于罂粟植物蒴果，含有20多种生物碱，可分为菲类和异喹啉类。前者如吗啡（含量约10%）和可待因，后者如罂粟碱。鸦片因产地不同，呈黑色或褐色；有氨味或陈旧尿味，味苦，气味强烈。生鸦片经烧煮和发酵，可制成精制鸦片，呈棕色或金黄色。吸食时散发香甜气味。', '9c2b13d7-6725-4561-b7f6-04d872c73e76.jpg', '2019-11-22 11:06:28', 70);
INSERT INTO `goods` VALUES (87, '卫龙', 8888, '第三方是', '706c9e4f-5e2b-4d17-96fc-de34a84deacf.jpg', '2020-12-10 11:07:04', 70);
INSERT INTO `goods` VALUES (88, 'DDV', 998, '好喝不上头', '738ae172-ef54-4896-9b1f-fe2e34106662.gif', '2087-11-22 10:25:23', 70);
INSERT INTO `goods` VALUES (89, '安非他命', 4444, '安非他命（Amphetamine）指的是dextroamphetamine， benzedrine，and Ritalin这类药物，治疗气喘，睡眠失常(嗜睡症)与过动症状，提神并防止疲劳。\r\n本品纯品为无色至淡黄色油状物，其盐酸盐或硫酸盐为微带苦味之白色结晶体粉末。', '3be43aea-92af-4526-a88c-f073415b3f00.jpg', '2019-11-22 09:29:20', 70);
INSERT INTO `goods` VALUES (90, '春药', 199, '可以帮助催情、增强性能力（壮阳），含有一定量的性激素，如丙酸睾酮、绒毛膜促性腺激素、甲基睾丸素、苯丙酸诺龙等。据资料证明滥服“春药”助兴的父母所孕育的胎儿，先天不足或畸型的可能性较大。', 'fbd7e802-2a26-4149-8981-3fad50144084.jpg', '2019-11-22 11:07:58', 70);
INSERT INTO `goods` VALUES (91, '葵-葵司', 1, '只可亵玩不可远观也', '8c844daa-c8ad-40bc-aeef-5da57a9b2347.png', '2019-11-22 11:08:06', 76);
INSERT INTO `goods` VALUES (92, '罂粟', 123141241412, '被警方查获', '91e483d8-4237-4448-899a-7b3110e60b29.jpg', '2019-11-22 11:09:34', 70);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` tinyint(1) NULL DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `phone_number`(`phone_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, '孙浩楠', 0, '18813043437', NULL, '2019-11-19 11:01:21');

SET FOREIGN_KEY_CHECKS = 1;
