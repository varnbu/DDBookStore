/*
Navicat MySQL Data Transfer

Source Server         : my
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : ddbook

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-07-02 20:10:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addressinfo
-- ----------------------------
DROP TABLE IF EXISTS `addressinfo`;
CREATE TABLE `addressinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  `people` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `addressinfo_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customerinfo` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressinfo
-- ----------------------------
INSERT INTO `addressinfo` VALUES ('2', '10086', '山东省济宁市国家高新区大学园', '1', 'yuanzhiliang', '18753355332');
INSERT INTO `addressinfo` VALUES ('3', '10086', '山东济南', '1', 'lijie', '17084957322');
INSERT INTO `addressinfo` VALUES ('5', '10089', '辽宁', '1', '刘能', '15723278738');
INSERT INTO `addressinfo` VALUES ('6', '10090', '江苏', '1', '舒鑫', '18888888888');
INSERT INTO `addressinfo` VALUES ('7', '10091', ' 佛山', '1', '黄飞鸿', '15672348899');
INSERT INTO `addressinfo` VALUES ('8', '10092', '济宁', '1', 'aa', '');
INSERT INTO `addressinfo` VALUES ('9', '10093', '321', '1', '312', '');

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currentprice` decimal(10,2) DEFAULT NULL,
  `ISBN` varchar(255) NOT NULL,
  `sales` int(10) NOT NULL DEFAULT '0',
  `author` varchar(20) DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `img1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `state` int(2) DEFAULT '1',
  `entrytime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `store` int(255) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', 'JavaWed实战', '60.00', '22.20', '978-7-115-35803-5', '5', '高翔', '人民邮电出版社', '科技', '/DDbook/bookimg/Javaweb开发与实践.jpg', null, '1', '2016-06-23 20:23:21', '100');
INSERT INTO `bookinfo` VALUES ('2', '概率论', '19.00', '13.00', '9787040238969', '222', '周学民', '理工出版社', '教育', '/DDbook/bookimg/gailv.jpg', null, '1', '2016-05-24 14:18:44', '100');
INSERT INTO `bookinfo` VALUES ('3', '线性代数', '19.00', '13.00', '57234384319', '191', '李杰', '理工出版社', '教育', '/DDbook/bookimg/xiandai.jpg', null, '1', '2016-05-24 14:20:02', '100');
INSERT INTO `bookinfo` VALUES ('4', '经济学', '30.00', '23.00', '312948MSA', '432', '肖晶', '理工出版社', '教育', '/DDbook/bookimg/jingji.jpg', null, '1', '2016-06-24 14:21:24', '100');
INSERT INTO `bookinfo` VALUES ('5', '新视野大学英语', '28.00', '22.00', 'MSANB78978', '88', '不详', '理工出版社', '教育', '/DDbook/bookimg/yingyu.jpg', null, '1', '2016-06-24 14:22:22', '100');
INSERT INTO `bookinfo` VALUES ('6', '外科学', '66.00', '56.00', 'WKXASD123123', '59', '白求恩', '校医院出版社', '教育', '/DDbook/bookimg/waike.jpg', null, '1', '2016-06-24 14:23:31', '100');
INSERT INTO `bookinfo` VALUES ('7', '古代汉语', '38.00', '33.00', 'CANID91247H', '100', '钱钟书', '古汉语出版社', '教育', '/DDbook/bookimg/hanyu.jpg', null, '1', '2016-04-24 14:24:54', '100');
INSERT INTO `bookinfo` VALUES ('8', '韩语教程', '1.00', '1.00', '7986768ASDD', '0', '思密达', '棒子出版社', '教育', '/DDbook/bookimg/hanguo.jpg', null, '1', '2016-04-04 14:26:46', '100');
INSERT INTO `bookinfo` VALUES ('9', '工商管理', '48.00', '48.00', 'DASD988123J', '188', '闫海玉', '惠普出版社', '教育', '/DDbook/bookimg/gongshang.jpg', null, '1', '2016-06-24 14:28:00', '100');
INSERT INTO `bookinfo` VALUES ('10', '东财会计', '55.00', '55.00', 'D9812344313M', '259', '郑海波', '惠普出版社', '教育', '/DDbook/bookimg/kuaiji.jpg', null, '1', '2016-06-24 14:29:02', '100');
INSERT INTO `bookinfo` VALUES ('11', '岛上书店', '21.70', '27.00', 'DASMKFE889', '888', '不家瑞艾泽啦', '江苏文艺出版社', '文艺小说', '/DDbook/bookimg/daoshang.jpg', null, '1', '2016-06-24 14:36:10', '100');
INSERT INTO `bookinfo` VALUES ('12', '三体', '51.20', '51.10', 'VHJDHFEK12637', '1024', '刘慈欣', '重庆出版社', '文艺小说', '/DDbook/bookimg/santi.jpg', null, '1', '2016-05-24 14:37:29', '100');
INSERT INTO `bookinfo` VALUES ('13', '玛格丽特小镇', '24.00', '22.00', '743JKDQW42', '666', '加泽文', '江苏文艺出版社', '文艺小说', '/DDbook/bookimg/xiaozhen.jpg', null, '1', '2016-06-24 14:41:09', '100');
INSERT INTO `bookinfo` VALUES ('14', '北京遇上西雅图', '22.80', '22.80', 'NMCA78912KK', '1313', '薛晓路', '现代出版社', '文艺小说', '/DDbook/bookimg/beijing.jpg', null, '1', '2016-05-24 14:42:17', '100');
INSERT INTO `bookinfo` VALUES ('15', '男人相对论', '26.50', '26.50', 'POQWEN78123M', '309', '秋微', '北京联合出版社', '文艺小说', '/DDbook/bookimg/xiangdui.jpg', null, '1', '2016-04-24 14:44:59', '100');
INSERT INTO `bookinfo` VALUES ('16', '笼中的爱人', '30.80', '30.50', 'BNDJ89123M', '555', '雷切尔阿伯特', '百花文艺出版社', '文艺小说', '/DDbook/bookimg/airen.jpg', null, '1', '2016-04-24 14:46:55', '100');
INSERT INTO `bookinfo` VALUES ('17', '活着', '11.00', '11.00', 'QWE5581MNAD', '777', '余华', '作家出版社', '文艺小说', '/DDbook/bookimg/huozhe.jpg', null, '1', '2016-06-24 14:51:30', '100');
INSERT INTO `bookinfo` VALUES ('18', '摆渡人', '19.50', '12.00', 'YUDSB22112DD', '123', '克莱尔麦克服', '百花洲文艺出版社', '文艺小说', '/DDbook/bookimg/baidu.jpg', null, '1', '2016-06-24 14:54:46', '100');
INSERT INTO `bookinfo` VALUES ('19', '高等数学', '25.00', '22.00', '9787540476007', '2016', '袁致良', '理工出版社', '教育', '/DDbook/bookimg/gaoshu.jpg', null, '1', '2016-06-24 14:15:15', '100');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(50) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `sellerid` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cartid`),
  KEY `cid` (`cid`),
  KEY `bid` (`bid`),
  KEY `sellerid` (`sellerid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customerinfo` (`cid`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for commentinfo
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `orderid` varchar(50) DEFAULT NULL,
  `content` text NOT NULL,
  `grade` int(2) NOT NULL,
  `commenttime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`),
  KEY `bid` (`bid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `commentinfo_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------
INSERT INTO `commentinfo` VALUES ('1', '9', '123332', '蛮好的，很详细', '4', '2016-06-30 10:21:17');
INSERT INTO `commentinfo` VALUES ('2', '9', '234', '非常好啊', '5', '2016-06-30 10:21:38');
INSERT INTO `commentinfo` VALUES ('12', '2', '1467422070705', '啊啊', '5', '2016-07-02 09:26:43');
INSERT INTO `commentinfo` VALUES ('13', '14', '1467439262075', '书挺好', '3', '2016-07-02 14:02:46');
INSERT INTO `commentinfo` VALUES ('14', '2', '1467441112038', '哈哈', '4', '2016-07-02 14:33:38');
INSERT INTO `commentinfo` VALUES ('15', '18', '1467441606567', '漂亮', '5', '2016-07-02 14:40:58');

-- ----------------------------
-- Table structure for customerinfo
-- ----------------------------
DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10094 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customerinfo
-- ----------------------------
INSERT INTO `customerinfo` VALUES ('10086', 'd', '小米', '18753373738', '1093819418@qq.com', '1', '1');
INSERT INTO `customerinfo` VALUES ('10089', 'eee', '大雄', '12345678880', '1241793659@qq.com', 'eee', '1');
INSERT INTO `customerinfo` VALUES ('10090', 'www', '舒鑫', '18888888888', '1229639799@qq.com', 'w1w2w3', '0');
INSERT INTO `customerinfo` VALUES ('10091', '土地', '土地', '23453234533', '1152592625@qq.com', 'www', '1');
INSERT INTO `customerinfo` VALUES ('10092', 'qq', '袁志良', '18753377131', '33423@qq.com', '123', '0');
INSERT INTO `customerinfo` VALUES ('10093', 'lml', 'lbl', '18754432123', '555@qq.com', '123', '1');

-- ----------------------------
-- Table structure for managerinfo
-- ----------------------------
DROP TABLE IF EXISTS `managerinfo`;
CREATE TABLE `managerinfo` (
  `managerid` int(11) NOT NULL AUTO_INCREMENT,
  `managername` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`managerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of managerinfo
-- ----------------------------
INSERT INTO `managerinfo` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` varchar(50) NOT NULL,
  `cid` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `ordertime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(2) NOT NULL DEFAULT '1',
  `addressid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `cid` (`cid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customerinfo` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1467446628826', '10090', '26.50', '2016-07-02 16:03:48', '3', '6');
INSERT INTO `order` VALUES ('1467461256192', '10090', '23.00', '2016-07-02 20:07:36', '3', '6');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(50) NOT NULL,
  `bid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  `sellerid` int(11) DEFAULT NULL,
  `currentprice` decimal(10,2) DEFAULT NULL,
  `bname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `bid` (`bid`),
  KEY `sellerid` (`sellerid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`bid`),
  CONSTRAINT `orderitem_ibfk_4` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('106', '1467446628826', '15', '1', '26.50', '3', '0', '26.50', '男人相对论');
INSERT INTO `orderitem` VALUES ('107', '1467461256192', '18', '1', '12.00', '3', '0', '12.00', '摆渡人');
INSERT INTO `orderitem` VALUES ('108', '1467461256192', '17', '1', '11.00', '3', '0', '11.00', '活着');

-- ----------------------------
-- Table structure for sellerinfo
-- ----------------------------
DROP TABLE IF EXISTS `sellerinfo`;
CREATE TABLE `sellerinfo` (
  `sellerid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `srealname` varchar(20) NOT NULL,
  `cardId` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sellerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sellerinfo
-- ----------------------------
INSERT INTO `sellerinfo` VALUES ('1', '张三', '张三三', '2123123', '111', '1');

-- ----------------------------
-- Table structure for storeinfo
-- ----------------------------
DROP TABLE IF EXISTS `storeinfo`;
CREATE TABLE `storeinfo` (
  `storeid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `storenumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`storeid`),
  KEY `bid` (`bid`),
  KEY `sellerid` (`sellerid`),
  CONSTRAINT `storeinfo_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`bid`),
  CONSTRAINT `storeinfo_ibfk_2` FOREIGN KEY (`sellerid`) REFERENCES `sellerinfo` (`sellerid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storeinfo
-- ----------------------------
INSERT INTO `storeinfo` VALUES ('1', '1', '1', '100');
INSERT INTO `storeinfo` VALUES ('2', '18', '1', '240');

-- ----------------------------
-- Table structure for untread
-- ----------------------------
DROP TABLE IF EXISTS `untread`;
CREATE TABLE `untread` (
  `untreadid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `orderid` varchar(50) NOT NULL,
  `totalprice` decimal(10,0) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`untreadid`),
  KEY `cid` (`cid`),
  KEY `sellerid` (`sellerid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `untread_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customerinfo` (`cid`),
  CONSTRAINT `untread_ibfk_2` FOREIGN KEY (`sellerid`) REFERENCES `sellerinfo` (`sellerid`),
  CONSTRAINT `untread_ibfk_3` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of untread
-- ----------------------------

-- ----------------------------
-- Table structure for untreaditem
-- ----------------------------
DROP TABLE IF EXISTS `untreaditem`;
CREATE TABLE `untreaditem` (
  `untreadItemid` int(11) NOT NULL AUTO_INCREMENT,
  `untreadid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`untreadItemid`),
  KEY `untreadid` (`untreadid`),
  KEY `bid` (`bid`),
  CONSTRAINT `untreaditem_ibfk_1` FOREIGN KEY (`untreadid`) REFERENCES `untread` (`untreadid`),
  CONSTRAINT `untreaditem_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `bookinfo` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of untreaditem
-- ----------------------------
