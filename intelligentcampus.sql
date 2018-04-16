/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : intelligentcampus

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-04-05 10:24:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `evaluateid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`evaluateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `foodid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('2', '西红柿鸡蛋', '2018-03-26', '1521905596903.jpg');
INSERT INTO `food` VALUES ('3', '宫保鸡丁', '2018-03-26', '1521905596903.jpg');
INSERT INTO `food` VALUES ('4', '123123123', '2018-04-05', '1521905596903.jpg');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `type` char(1) DEFAULT NULL COMMENT '1:校园信息 2:公寓信息',
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('2', '学校信息1', '学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1学校信息1', '2018-03-26 19:45:44', '1');
INSERT INTO `news` VALUES ('3', '学校信息2', '学校信息2学校信息2学校信息2学校信息2学校信息2', '2018-03-26 19:45:50', '1');
INSERT INTO `news` VALUES ('4', '学校信息3', '学校信息3学校信息3学校信息3学校信息3', '2018-03-26 19:45:57', '1');
INSERT INTO `news` VALUES ('5', '公寓信息1', '公寓信息1公寓信息1公寓信息1公寓公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1公寓信息1', '2018-03-26 19:46:17', '2');
INSERT INTO `news` VALUES ('6', '公寓信息2', '公寓信息2公寓信息2公寓信息2公寓信息2', '2018-03-26 19:46:22', '2');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `noteid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`noteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '3', '权威人物企鹅人', '2018-03-26 20:30:33');

-- ----------------------------
-- Table structure for replies
-- ----------------------------
DROP TABLE IF EXISTS `replies`;
CREATE TABLE `replies` (
  `repliesid` int(11) NOT NULL AUTO_INCREMENT,
  `noteid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`repliesid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of replies
-- ----------------------------
INSERT INTO `replies` VALUES ('4', '1', '5', '234234', '2018-03-26 21:02:06');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '0', null);
INSERT INTO `user` VALUES ('3', '123', '123456', '1', '学生2学生2学生2学生2');
INSERT INTO `user` VALUES ('5', '234', '234', '1', '234');
