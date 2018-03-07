/*
Navicat MySQL Data Transfer

Source Server         : local_root_root
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : scmsdb

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-11-24 16:02:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_TYPE_ID` int(11) DEFAULT NULL,
  `ACCOUNT` varchar(1024) NOT NULL,
  `PASSWORD` varchar(1024) NOT NULL,
  `NOTE` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  KEY `FK_Reference_6` (`ACCOUNT_TYPE_ID`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`ACCOUNT_TYPE_ID`) REFERENCES `account_type` (`ACCOUNT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COMMENT='ACCOUNT';

-- ----------------------------
-- Records of account
-- ----------------------------

INSERT INTO `account` VALUES ('154', '46', '3232', '323', '2323');

-- ----------------------------
-- Table structure for `account_type`
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `ACCOUNT_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_TYPE_CODE` varchar(20) NOT NULL,
  `ACCOUNT_TYPE_NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ACCOUNT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='ACCOUNT_TYPE';

-- ----------------------------
-- Records of account_type
-- ----------------------------
INSERT INTO `account_type` VALUES ('6', '1001', '天猫');
INSERT INTO `account_type` VALUES ('7', '1002', 'QQ');
INSERT INTO `account_type` VALUES ('8', '1003', '淘宝');
INSERT INTO `account_type` VALUES ('9', '1004', 'Google');
INSERT INTO `account_type` VALUES ('10', '1005', '百度');
INSERT INTO `account_type` VALUES ('11', '1006', 'CSDN');
INSERT INTO `account_type` VALUES ('12', '1007', '雅虎');
INSERT INTO `account_type` VALUES ('13', '1008', '微软');
INSERT INTO `account_type` VALUES ('14', '1009', '魅族');
INSERT INTO `account_type` VALUES ('15', '1010', '小米');
INSERT INTO `account_type` VALUES ('16', '1011', '华为');
INSERT INTO `account_type` VALUES ('17', '1012', '锤子');
INSERT INTO `account_type` VALUES ('18', '1013', '乐视');
INSERT INTO `account_type` VALUES ('19', '1014', '一加');
INSERT INTO `account_type` VALUES ('20', '1015', '酷派');
INSERT INTO `account_type` VALUES ('21', '1016', '360');
INSERT INTO `account_type` VALUES ('22', '1017', '中兴');
INSERT INTO `account_type` VALUES ('23', '1018', '阿里巴巴');
INSERT INTO `account_type` VALUES ('24', '1019', '京东');
INSERT INTO `account_type` VALUES ('25', '1020', '苏宁');
INSERT INTO `account_type` VALUES ('26', '1021', '国美');
INSERT INTO `account_type` VALUES ('27', '1022', '亚马逊');
INSERT INTO `account_type` VALUES ('28', '1023', '当当网');
INSERT INTO `account_type` VALUES ('29', '1024', '华硕');
INSERT INTO `account_type` VALUES ('30', '1025', '小天鹅');
INSERT INTO `account_type` VALUES ('31', '1026', '花生壳');
INSERT INTO `account_type` VALUES ('32', '1027', '迅雷');
INSERT INTO `account_type` VALUES ('33', '1028', '微博');
INSERT INTO `account_type` VALUES ('34', '1029', 'gitHub');
INSERT INTO `account_type` VALUES ('35', '1030', 'Facebook');
INSERT INTO `account_type` VALUES ('36', '1030', 'Facebook');
INSERT INTO `account_type` VALUES ('37', '1031', 'Email');
INSERT INTO `account_type` VALUES ('38', '1032', '其他');
INSERT INTO `account_type` VALUES ('39', '1033', '支付宝');
INSERT INTO `account_type` VALUES ('40', '1034', '12306');
INSERT INTO `account_type` VALUES ('41', '1035', '搬瓦工vps');
INSERT INTO `account_type` VALUES ('42', '1036', 'cnblog');
INSERT INTO `account_type` VALUES ('43', '1037', '拉钩网');
INSERT INTO `account_type` VALUES ('44', '1038', 'paypal');
INSERT INTO `account_type` VALUES ('45', '1039', '自定义12');
INSERT INTO `account_type` VALUES ('46', '1040', 'viishow_cn');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `MENU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MENU_CODE` varchar(20) NOT NULL,
  `MENU_NAME` varchar(20) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `MENU_ORDER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='MENU';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '100', '基础管理', null, null);
INSERT INTO `menu` VALUES ('2', '200', '业务处理', null, null);
INSERT INTO `menu` VALUES ('3', '300', '报表管理', null, null);
INSERT INTO `menu` VALUES ('4', '400', '系统管理', null, null);
INSERT INTO `menu` VALUES ('5', '1001', '学生管理', '100', null);
INSERT INTO `menu` VALUES ('6', '1002', '课程管理', '100', null);
INSERT INTO `menu` VALUES ('7', '1003', '教师管理', '100', null);
INSERT INTO `menu` VALUES ('8', '2001', '账户类型', '200', null);
INSERT INTO `menu` VALUES ('9', '2002', '账户管理', '200', null);
INSERT INTO `menu` VALUES ('10', '3001', '出勤率', '300', null);
INSERT INTO `menu` VALUES ('11', '3002', '使用率', '300', null);
INSERT INTO `menu` VALUES ('12', '4001', '角色管理', '400', null);
INSERT INTO `menu` VALUES ('13', '4002', '菜单管理', '400', null);
INSERT INTO `menu` VALUES ('14', '4003', '权限管理', '400', null);
INSERT INTO `menu` VALUES ('15', '4004', '操作员', '400', null);
INSERT INTO `menu` VALUES ('16', '4005', '系统参数', '400', null);

-- ----------------------------
-- Table structure for `operater`
-- ----------------------------
DROP TABLE IF EXISTS `operater`;
CREATE TABLE `operater` (
  `OPERATER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `OPERATER_CODE` varchar(20) NOT NULL,
  `OPERATER_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`OPERATER_ID`),
  KEY `FK_Reference_8` (`ROLE_ID`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OPERATER';

-- ----------------------------
-- Records of operater
-- ----------------------------

-- ----------------------------
-- Table structure for `org_resource`
-- ----------------------------
DROP TABLE IF EXISTS `org_resource`;
CREATE TABLE `org_resource` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `icon` varchar(512) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2qoscu42yxypno5iv9w9raj2n` (`parent_id`),
  CONSTRAINT `org_resource_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `org_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_resource
-- ----------------------------
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb2e74b90000', null, '2017-03-17 15:32:19', '0', '2017-03-17 15:32:19', 'icon-settings', '修改密码', '90', 'module', '/user/update_pwd', null);
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb32ffb90001', null, '2017-03-17 15:37:16', '0', '2017-03-17 15:37:16', 'icon-chart', '内容管理', '30', 'module', '', null);
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb36bac60002', null, '2017-03-17 15:41:21', '0', '2017-03-17 16:17:12', '', '栏目列表', '31', 'page', '/cms/column/list', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_resource` VALUES ('2c9025ab5adb1eef015adb37ccd50003', null, '2017-03-17 15:42:31', '0', '2017-03-17 16:17:21', '', '文章列表', '32', 'page', '/cms/article/list', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_resource` VALUES ('2c9025ab5b140c22015b140fbbd30000', null, '2017-03-28 16:37:07', '0', '2017-03-28 16:37:07', 'icon-base', '换肤管理', '20', 'module', '/user/skin/list', null);
INSERT INTO `org_resource` VALUES ('70', null, '2016-08-17 17:06:19', '0', '2016-10-28 17:02:57', 'icon-business', '权限管理', '10', 'module', '/system/user/index', null);
INSERT INTO `org_resource` VALUES ('71', null, '2016-09-07 15:15:58', '0', '2016-10-28 17:03:06', '', '用户列表', '11', 'page', '/system/user/index', '70');
INSERT INTO `org_resource` VALUES ('72', null, '2016-09-07 15:17:37', '0', '2016-10-28 17:03:13', '', '角色列表', '12', 'page', '/system/role/index', '70');
INSERT INTO `org_resource` VALUES ('73', null, '2016-09-18 16:34:14', '0', '2016-10-28 17:03:19', '', '菜单列表', '13', 'page', '/system/menu/index', '70');

-- ----------------------------
-- Table structure for `org_role`
-- ----------------------------
DROP TABLE IF EXISTS `org_role`;
CREATE TABLE `org_role` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `role_name` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_role
-- ----------------------------
INSERT INTO `org_role` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', null, '2017-02-24 16:11:40', '0', '2017-02-24 16:11:40', null, '可以分配后台用户', '权限管理员', null, '', null);
INSERT INTO `org_role` VALUES ('402846815f324a19015f324d99180001', null, '2017-10-19 09:44:27', '0', '2017-10-19 10:30:25', null, '网站日常运维', '网站运维', null, null, null);
INSERT INTO `org_role` VALUES ('402881e457f075530157f0791e2f0000', null, '2016-10-23 15:37:31', '0', '2017-02-24 16:11:20', null, '拥有所有的权限', '超级管理员', null, 'role_admin', null);

-- ----------------------------
-- Table structure for `org_role_resource_rel`
-- ----------------------------
DROP TABLE IF EXISTS `org_role_resource_rel`;
CREATE TABLE `org_role_resource_rel` (
  `role_id` varchar(32) NOT NULL,
  `resources_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`),
  KEY `FK_hpsdqtxbypycwcdrw23na40bp` (`resources_id`),
  CONSTRAINT `org_role_resource_rel_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `org_role` (`id`),
  CONSTRAINT `org_role_resource_rel_ibfk_2` FOREIGN KEY (`resources_id`) REFERENCES `org_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_role_resource_rel
-- ----------------------------
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5ada5755015ada59461d0000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb2e74b90000');
INSERT INTO `org_role_resource_rel` VALUES ('402846815f324a19015f324d99180001', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb32ffb90001');
INSERT INTO `org_role_resource_rel` VALUES ('402846815f324a19015f324d99180001', '2c9025ab5adb1eef015adb36bac60002');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb36bac60002');
INSERT INTO `org_role_resource_rel` VALUES ('402846815f324a19015f324d99180001', '2c9025ab5adb1eef015adb37ccd50003');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5adb1eef015adb37ccd50003');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '2c9025ab5b140c22015b140fbbd30000');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '70');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '70');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '71');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '71');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '72');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '72');
INSERT INTO `org_role_resource_rel` VALUES ('2c9025ab5a6f2b85015a6f2cef950000', '73');
INSERT INTO `org_role_resource_rel` VALUES ('402881e457f075530157f0791e2f0000', '73');

-- ----------------------------
-- Table structure for `org_user`
-- ----------------------------
DROP TABLE IF EXISTS `org_user`;
CREATE TABLE `org_user` (
  `id` varchar(32) NOT NULL,
  `audit_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `delete_flag` varchar(1) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `current_skin` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_user
-- ----------------------------
INSERT INTO `org_user` VALUES ('2c9025ab5a6f14c2015a6f17caee0000', null, '2017-02-24 15:48:34', '0', '2017-03-27 15:01:12', null, '13202044010', '21218CCA77804D2BA1922C33E0151105', 'xujeff', '1', 'xujeff', '0', null);
INSERT INTO `org_user` VALUES ('402846815f324a19015f324c7fe60000', null, '2017-10-19 09:43:15', '0', '2017-10-19 09:43:15', null, '13291832474', '67E6B805AA5B8215DC41CF54F6D13908', '李稳超', '0', 'licerlee', '0', null);
INSERT INTO `org_user` VALUES ('4028821e5b7a6947015b7a6ebacf0000', null, '2016-08-17 15:17:02', '0', '2017-04-20 21:48:41', null, '13202044010', 'E10ADC3949BA59ABBE56E057F20F883E', '超级管理员', '1', 'admin', '0', 'skin_blue');

-- ----------------------------
-- Table structure for `org_user_role_rel`
-- ----------------------------
DROP TABLE IF EXISTS `org_user_role_rel`;
CREATE TABLE `org_user_role_rel` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_ikyyd9vv4u7y3m3yqvqo1vwdd` (`role_id`),
  CONSTRAINT `org_user_role_rel_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `org_user` (`id`),
  CONSTRAINT `org_user_role_rel_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `org_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org_user_role_rel
-- ----------------------------
INSERT INTO `org_user_role_rel` VALUES ('2c9025ab5a6f14c2015a6f17caee0000', '2c9025ab5a6f2b85015a6f2cef950000');
INSERT INTO `org_user_role_rel` VALUES ('402846815f324a19015f324c7fe60000', '402881e457f075530157f0791e2f0000');
INSERT INTO `org_user_role_rel` VALUES ('4028821e5b7a6947015b7a6ebacf0000', '402881e457f075530157f0791e2f0000');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `PERMISSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERMISSION_CODE` varchar(20) NOT NULL,
  `PERMISSION_NAME` varchar(20) NOT NULL,
  `IS_PUBLIC` int(11) DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PERMISSION';

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(20) NOT NULL,
  `ROLE_NAME` varchar(20) NOT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ROLE';

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for `role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `RM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ROLE_MENU',
  `MENU_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RM_ID`),
  KEY `FK_Reference_11` (`MENU_ID`),
  KEY `FK_Reference_5` (`ROLE_ID`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`MENU_ID`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ROLE_MENU';

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `RP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'RP_ID',
  `PERMISSION_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RP_ID`),
  KEY `FK_Reference_7` (`ROLE_ID`),
  KEY `FK_Reference_9` (`PERMISSION_ID`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ROLE_PERMISSION';

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `visitor`
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `ID` varchar(128) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `HOST` varchar(1024) DEFAULT NULL,
  `USER_AGENT` varchar(1024) DEFAULT NULL,
  `COOKIE` varchar(1024) DEFAULT NULL,
  `ACCEPT` varchar(1024) DEFAULT NULL,
  `ACCEPT_ENCODING` varchar(1024) DEFAULT NULL,
  `ACCEPT_LANGUAGE` varchar(1024) DEFAULT NULL,
  `TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='VISITOR';

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES ('402846815915247301591524f8940000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 11:34:20');
INSERT INTO `visitor` VALUES ('4028468159152473015915292d190001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=47c90e06bafb5fc2c94f7325808c55ab', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 11:38:57');
INSERT INTO `visitor` VALUES ('4028468159152473015915297fba0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=47c90e06bafb5fc2c94f7325808c55ab', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 11:39:18');
INSERT INTO `visitor` VALUES ('40284681591524730159159156160003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=47c90e06bafb5fc2c94f7325808c55ab', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 13:32:43');
INSERT INTO `visitor` VALUES ('40284681591524730159159194be0004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=e84cef88c4381f7eeb9bbabaaac80d57', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 13:32:59');
INSERT INTO `visitor` VALUES ('4028468159152473015915a3fcd70005', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=e84cef88c4381f7eeb9bbabaaac80d57', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 13:53:06');
INSERT INTO `visitor` VALUES ('402846815916065301591606a8a80000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=e84cef88c4381f7eeb9bbabaaac80d57', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 15:40:51');
INSERT INTO `visitor` VALUES ('40284681591606530159160acb4e0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=c6ecbfb3702d495bb1af0cdc794958ac', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 15:45:23');
INSERT INTO `visitor` VALUES ('40284681591606530159160bd18b0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=c6ecbfb3702d495bb1af0cdc794958ac', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 15:46:30');
INSERT INTO `visitor` VALUES ('40284681591606530159160c16a40003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=c6ecbfb3702d495bb1af0cdc794958ac', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 15:46:48');
INSERT INTO `visitor` VALUES ('4028468159161f3b0159161f62950000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=f0dc3e792be741ab03eeec6a603c6b49', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 16:07:52');
INSERT INTO `visitor` VALUES ('4028468159161f3b0159162001100001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=45bca28e7201f1a3524622d0d17f3e4d', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 16:08:33');
INSERT INTO `visitor` VALUES ('4028468159161f3b01591632e35f0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=45bca28e7201f1a3524622d0d17f3e4d', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 16:29:11');
INSERT INTO `visitor` VALUES ('4028468159161f3b01591633f2150003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=45bca28e7201f1a3524622d0d17f3e4d', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 16:30:20');
INSERT INTO `visitor` VALUES ('4028468159161f3b015916344dbd0004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=45bca28e7201f1a3524622d0d17f3e4d', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 16:30:44');
INSERT INTO `visitor` VALUES ('4028468159161f3b015916645cc30005', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=45bca28e7201f1a3524622d0d17f3e4d', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 17:23:13');
INSERT INTO `visitor` VALUES ('402846815916650c015916652d0f0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=2cfba8820426f174d274e81e1ccf0e9b', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-19 17:24:06');
INSERT INTO `visitor` VALUES ('402846815919de36015919dfd3af0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=3335f6605980cc09b20ac6813ff2be6b', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-20 09:36:56');
INSERT INTO `visitor` VALUES ('402846815919de36015919e39e5e0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=cb802170f40be5a5fb96b267e354d0fb', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-20 09:41:05');
INSERT INTO `visitor` VALUES ('402846815919de36015919ed0c520002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=cb802170f40be5a5fb96b267e354d0fb', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-20 09:51:23');
INSERT INTO `visitor` VALUES ('402846815919de36015919f4962e0003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=cb802170f40be5a5fb96b267e354d0fb', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-20 09:59:37');
INSERT INTO `visitor` VALUES ('40284681591a099d01591a0a30780000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a62be27ca4a5f46b3ea4298b2d26f6c0', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-20 10:23:12');
INSERT INTO `visitor` VALUES ('40284681591a099d01591a0a36f70001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a62be27ca4a5f46b3ea4298b2d26f6c0', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-20 10:23:14');
INSERT INTO `visitor` VALUES ('402846815949444b015949448b340000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-29 14:29:04');
INSERT INTO `visitor` VALUES ('402846815949640a01594964a0970000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=75ef30626c1366f8e97b525136375f2d; dwrsessionid=vljruqlpijg62lqzmopdtjpfc7udshni0bl', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-29 15:04:08');
INSERT INTO `visitor` VALUES ('402846815949640a015949b1532b0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=72eaa109c5d7c7f2473641aa4a8c49bb; dwrsessionid=vljruqlpijg62lqzmopdtjpfc7udshni0bl', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-12-29 16:27:55');
INSERT INTO `visitor` VALUES ('40284681596da99601596dc41c2c0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-05 16:34:44');
INSERT INTO `visitor` VALUES ('40284681596da99601596dc470230001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=ec2d6401ee6b50b9dea85c38bbf8ae04', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-05 16:35:07');
INSERT INTO `visitor` VALUES ('40284681596da99601596dc48b010002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=ec2d6401ee6b50b9dea85c38bbf8ae04', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-05 16:35:14');
INSERT INTO `visitor` VALUES ('40284681596da99601596dc4abfb0003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=ec2d6401ee6b50b9dea85c38bbf8ae04', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-05 16:35:23');
INSERT INTO `visitor` VALUES ('40284681596da99601596dd905a00004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=ec2d6401ee6b50b9dea85c38bbf8ae04', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-05 16:57:36');
INSERT INTO `visitor` VALUES ('40284681598646e6015986473d430000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 10:48:50');
INSERT INTO `visitor` VALUES ('402846815986645a01598664c7560000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=4b99c86f6d51977645b1b043ef6a5ffe', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 11:21:08');
INSERT INTO `visitor` VALUES ('402846815986ab0b015986ab39bf0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=19543f506878dd5ebc98f52047eb80a7', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 12:38:05');
INSERT INTO `visitor` VALUES ('402846815986b2da015986b307230000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=fb2839cb7466bb953eb08372db95ea58', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 12:46:36');
INSERT INTO `visitor` VALUES ('402846815986be31015986be59100000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7b6e699a63d850b4fc9cd2e3a11e39bf', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 12:58:58');
INSERT INTO `visitor` VALUES ('402846815986f6a9015986f7462f0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=aab8f2888143a975d1d31576123e36aa', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 14:01:09');
INSERT INTO `visitor` VALUES ('402846815987666f0159877766f50000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:21:06');
INSERT INTO `visitor` VALUES ('402846815987666f015987776ca70001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:21:08');
INSERT INTO `visitor` VALUES ('402846815987666f01598777f0a20002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:21:42');
INSERT INTO `visitor` VALUES ('402846815987883b015987888c0a0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:39:49');
INSERT INTO `visitor` VALUES ('402846815987883b01598789396d0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:40:34');
INSERT INTO `visitor` VALUES ('402846815987883b01598789477b0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:40:38');
INSERT INTO `visitor` VALUES ('402846815987883b01598789c8250003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=8e32563a69cd0fea0e099db41bcc4f11', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-10 16:41:11');
INSERT INTO `visitor` VALUES ('40284681598b981f01598bbe35ec0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=9f0f3fa802068ab5b7406686eb6ace33', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-11 12:16:55');
INSERT INTO `visitor` VALUES ('40284681598b981f01598bbea66d0001', '192.168.198.1', 'licerlee.imwork.net:20691', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2017-01-11 12:17:25');
INSERT INTO `visitor` VALUES ('40284681598b981f01598bbfa86d0002', '192.168.198.1', 'licerlee.imwork.net:20691', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/39.0.2171.95 safari/537.36 micromessenger/6.5.2.501 nettype/wifi windowswechat qbcore/3.43.27.400 qqbrowser/9.0.2524.400', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.6,en;q=0.5;q=0.4', '2017-01-11 12:18:31');
INSERT INTO `visitor` VALUES ('40284681598b981f01598bbfccfa0003', '192.168.198.1', 'licerlee.imwork.net:20691', 'mozilla/5.0 (linux; android 4.4.4; itoolsvm build/ktu84p) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/33.0.0.0 mobile safari/537.36 micromessenger/6.3.31.940 nettype/wifi language/zh_cn', '', '*/*', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8,en-us;q=0.6,en;q=0.4', '2017-01-11 12:18:40');
INSERT INTO `visitor` VALUES ('40284681598c456e01598c46733b0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=ee2cfdec2d0f347487575d017c73aaed', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-11 14:45:44');
INSERT INTO `visitor` VALUES ('402846815996b6cd015996b6dd7f0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=9f0f3fa802068ab5b7406686eb6ace33; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-13 15:24:43');
INSERT INTO `visitor` VALUES ('402846815996d121015996d1d3320000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '_ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-13 15:54:10');
INSERT INTO `visitor` VALUES ('402846815996e15a015996e291650000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=d9878368ed23edcce78b63842e4bc24b; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-01-13 16:12:27');
INSERT INTO `visitor` VALUES ('402846815a83ff17015a83ff61470000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=68972d8cb11da5d04abc5a5a81aaa026; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-02-28 17:13:56');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5a20750000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7cf81645e69790ab706975e273d0d720; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 22:26:59');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5a211b0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7cf81645e69790ab706975e273d0d720; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 22:26:59');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5ab0b90002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a471c5a10eacb3994ef2b3698031a6f2; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 22:27:36');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5ab19a0003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a471c5a10eacb3994ef2b3698031a6f2; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 22:27:36');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5ab2290004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a471c5a10eacb3994ef2b3698031a6f2; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 22:27:37');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5c438f0005', '192.168.1.104', '192.168.1.101:8081', 'mozilla/5.0 (linux; android 7.0; frd-al10 build/huaweifrd-al10; wv) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/53.0.2785.49 mobile mqqbrowser/6.2 tbs/043221 safari/537.36 v1_and_sq_7.0.0_676_yyb_d qq/7.0.0.3135 nettype/wifi webp/0.3.0 pixel/1080', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2017-06-03 22:29:19');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5c6e930006', '192.168.1.104', '192.168.1.101:8081', 'mozilla/5.0 (linux; u; android 7.0; zh-cn; frd-al10 build/huaweifrd-al10) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/40.0.2214.89 ucbrowser/11.5.2.942 mobile safari/537.36', 'jsessionid=b4a0b2f28bf0976b9a99a2aa7996bac4', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8,uc/145', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2017-06-03 22:29:30');
INSERT INTO `visitor` VALUES ('402846815c6e5740015c6e5c8e6d0007', '192.168.1.104', '192.168.1.101:8081', 'mozilla/5.0 (linux; u; android 7.0; zh-cn; frd-al10 build/huaweifrd-al10) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/40.0.2214.89 ucbrowser/11.5.2.942 mobile safari/537.36', 'jsessionid=b4a0b2f28bf0976b9a99a2aa7996bac4', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8,uc/145', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2017-06-03 22:29:39');
INSERT INTO `visitor` VALUES ('402846815c6e71c6015c6e728fc20000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a471c5a10eacb3994ef2b3698031a6f2; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 22:53:41');
INSERT INTO `visitor` VALUES ('402846815c6e7b7e015c6e83780a0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=eff810f8bef901bfadb6e7e6c696d2e9; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 23:12:09');
INSERT INTO `visitor` VALUES ('402846815c6e7b7e015c6e94994e0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=eff810f8bef901bfadb6e7e6c696d2e9; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 23:30:51');
INSERT INTO `visitor` VALUES ('402846815c6e7b7e015c6e9512dd0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=eff810f8bef901bfadb6e7e6c696d2e9; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-03 23:31:22');
INSERT INTO `visitor` VALUES ('402846815c6e7b7e015c713000b20003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=db4a5849ee4a5c4b8a369e1503d57a9b; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 11:39:50');
INSERT INTO `visitor` VALUES ('402846815c6e7b7e015c7139b4890004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=db4a5849ee4a5c4b8a369e1503d57a9b; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 11:50:26');
INSERT INTO `visitor` VALUES ('402846815c6e7b7e015c7140473b0005', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=db4a5849ee4a5c4b8a369e1503d57a9b; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 11:57:37');
INSERT INTO `visitor` VALUES ('402846815c71653e015c716579f50000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a15ef0cf3548992e23b0f536655be97d; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 12:38:14');
INSERT INTO `visitor` VALUES ('402846815c71653e015c71660b370001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a15ef0cf3548992e23b0f536655be97d; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 12:38:52');
INSERT INTO `visitor` VALUES ('402846815c71653e015c716626e40002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a15ef0cf3548992e23b0f536655be97d; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 12:38:59');
INSERT INTO `visitor` VALUES ('402846815c73a44a015c73a477830000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a15ef0cf3548992e23b0f536655be97d; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 23:06:17');
INSERT INTO `visitor` VALUES ('402846815c73a44a015c73a5209a0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=09976c47f8a2e62b112f5ebdf632c73e; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 23:07:01');
INSERT INTO `visitor` VALUES ('402846815c73a586015c73a5a8000000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=09976c47f8a2e62b112f5ebdf632c73e; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 23:07:35');
INSERT INTO `visitor` VALUES ('402846815c73a586015c73a5ddd10001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=09976c47f8a2e62b112f5ebdf632c73e; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-04 23:07:49');
INSERT INTO `visitor` VALUES ('402881e4556901460155690778380000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-19 22:19:03');
INSERT INTO `visitor` VALUES ('402881e45585c003015585c026e70000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=6655e3389e957d8b9e40c62edc386436', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-25 12:10:09');
INSERT INTO `visitor` VALUES ('402881e45585c217015585c24eb20000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=6655e3389e957d8b9e40c62edc386436', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-25 12:12:31');
INSERT INTO `visitor` VALUES ('402881e4565f014a01565f04a36c0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=ad711ee84349171a5879e75589085c78', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-08-06 16:42:32');
INSERT INTO `visitor` VALUES ('402881e4565f084d01565f0861c20000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=ad711ee84349171a5879e75589085c78', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-08-06 16:46:39');
INSERT INTO `visitor` VALUES ('402881e4565f2da801565f2f93f90000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=0ee8ba6995570afeaacf35e622dd8227', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-08-06 17:29:28');
INSERT INTO `visitor` VALUES ('402881e4565f2da801565f4f88f20001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=0ee8ba6995570afeaacf35e622dd8227', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-08-06 18:04:23');
INSERT INTO `visitor` VALUES ('402881e4565f2da801565f5361430002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=0ee8ba6995570afeaacf35e622dd8227', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-08-06 18:08:35');
INSERT INTO `visitor` VALUES ('402881e5558b601c01558b61cb370000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-26 14:24:48');
INSERT INTO `visitor` VALUES ('402881e655209f540155209fce530000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-05 20:53:09');
INSERT INTO `visitor` VALUES ('402881e6552b5a1601552b5a62860000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-07 22:53:09');
INSERT INTO `visitor` VALUES ('402881e65554a34e015554a3cded0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-15 23:17:46');
INSERT INTO `visitor` VALUES ('402881e75511e69a015511e79e250000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=b9d37482b961deabf903799adb3c0118', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-03 12:17:15');
INSERT INTO `visitor` VALUES ('402881e7551bef2d01551bf07a100000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 23:03:10');
INSERT INTO `visitor` VALUES ('402881e955a1c5110155a1c78fae0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=cefcfe6bf8b34ea08fd05352f02ecbf0', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-30 22:47:38');
INSERT INTO `visitor` VALUES ('402881e955a6b1ff0155a6b2d7b70000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f8380d3c0b19f3c356ecfbf3863c620f', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-07-01 21:43:04');
INSERT INTO `visitor` VALUES ('402881e955a6b1ff0155a6b334560001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f8380d3c0b19f3c356ecfbf3863c620f', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-07-01 21:43:30');
INSERT INTO `visitor` VALUES ('402881e955a6b1ff0155a6b3802a0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f8380d3c0b19f3c356ecfbf3863c620f', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-07-01 21:43:50');
INSERT INTO `visitor` VALUES ('402881e955a6dc820155a6dcba2b0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f8380d3c0b19f3c356ecfbf3863c620f', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-07-01 22:28:50');
INSERT INTO `visitor` VALUES ('8a8a8adf551a2bd301551a3390560000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=6dbd35e7cd31c1294cb771e8866e687f', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 14:57:14');
INSERT INTO `visitor` VALUES ('8a8a8adf55240b910155240c8d0a0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-06 12:50:48');
INSERT INTO `visitor` VALUES ('8a8a8adf5528717c01552871e1d20000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-07 09:19:58');
INSERT INTO `visitor` VALUES ('8a8a8adf552e002d01552e00ee670000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-08 11:14:18');
INSERT INTO `visitor` VALUES ('8a8a8adf552f390101552f396e480000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64; rv:46.0) gecko/20100101 firefox/46.0', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3', '2016-06-08 16:55:40');
INSERT INTO `visitor` VALUES ('8a8a8adf55479f090155479fb8b30000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-13 10:38:14');
INSERT INTO `visitor` VALUES ('8a8a8adf556ba8db01556ba9650c0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-20 10:35:09');
INSERT INTO `visitor` VALUES ('8a8a8adf55709b650155709c71340000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-21 09:39:07');
INSERT INTO `visitor` VALUES ('8a8a8adf5575961301557596aa0a0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-22 08:50:54');
INSERT INTO `visitor` VALUES ('8a8a8adf5575f8e2015575f8f6200000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-22 10:38:16');
INSERT INTO `visitor` VALUES ('8a8a8adf5575fc9c015575fd06c40000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=09f8e913b41ae6570e964db5b8c9fe0b', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-22 10:42:44');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c38f2b40000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=d2bd1e66e55330b6b329dd7d224c1f4a', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:45:52');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c3a1d2a0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:47:11');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c3e2e360002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:51:38');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c3e45890003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:51:44');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c3e5f8f0004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:51:50');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c3fb3420005', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:53:17');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c41b6fb0006', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:55:29');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c41ca040007', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:55:34');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c4316270008', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:56:59');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c43dd730009', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:57:50');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c44bdfa000a', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:58:48');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c4579a7000b', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 15:59:36');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c6889e9000c', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 16:37:54');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c68ae4c000d', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 16:38:03');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c68e40e000e', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 16:38:17');
INSERT INTO `visitor` VALUES ('8a8a8adf557c388801557c69cbf7000f', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f93bd4676a75f3a4477de69435da2852', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-23 16:39:16');
INSERT INTO `visitor` VALUES ('8a8a8adf557fff9b01558000c80a0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-24 09:23:01');
INSERT INTO `visitor` VALUES ('8a8a8adf558049890155810d8b3e0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=7cf4a03b19ca4e6d7932f7c6290be843', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-24 14:16:29');
INSERT INTO `visitor` VALUES ('8a8a8adf5580498901558120b2560001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=6bd95aa350241739438d0716275abebf', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-24 14:37:32');
INSERT INTO `visitor` VALUES ('8a8a8adf5580498901558120b8f20002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=6bd95aa350241739438d0716275abebf', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-24 14:37:33');
INSERT INTO `visitor` VALUES ('8a8a8adf5580498901558120e0010003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=6bd95aa350241739438d0716275abebf', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-24 14:37:43');
INSERT INTO `visitor` VALUES ('8a8a8adf55aa96580155aa96d9570000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=f0938cf66746e651d88503b8bd4ac96f', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-07-02 15:50:59');
INSERT INTO `visitor` VALUES ('8a8a8adf5667fa0d015668de559d0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=fb110233491a95923e042bc9af4b047c', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-08-08 14:36:56');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c0158528586780000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:33:51');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c0158529725340001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:53:07');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c0158529885dd0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:37');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c015852988b030003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:39');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c015852988e030004', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:39');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c015852988f200005', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:40');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c015852988fc30006', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:40');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c01585298907d0007', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:40');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c01585298ad430008', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:47');
INSERT INTO `visitor` VALUES ('8a8a8adf5852815c01585298d6b30009', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 16:54:58');
INSERT INTO `visitor` VALUES ('8a8a8adf585299d30158529f792c0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=7541657ac5f7f7743d3a66c438193e88', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2016-11-11 17:02:12');
INSERT INTO `visitor` VALUES ('8a8a8adf5ba3fab4015ba3fb36ba0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '_ga=ga1.1.1047533706.1484201122; io=i6-kncmzhbszjjbbaaae', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-04-25 15:20:00');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd6b31a015bd6b39aff0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', '_ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 11:42:25');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd6ba53015bd6ba89180000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=6be48bd770f399628ec07e54146938d2; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 11:50:00');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd6ba53015bd78887050001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=dc13351fee7f2000828f09ca5d5f5bf1; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 15:35:01');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd6ba53015bd788a09f0002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=dc13351fee7f2000828f09ca5d5f5bf1; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 15:35:07');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd7e2ed015bd7e30dab0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=a0485baf2a54642c42f10972127050a1; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 17:13:53');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd7ef1b015bd7efa45b0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=53708db52f977f062868bbb2d2fd2f83; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 17:27:38');
INSERT INTO `visitor` VALUES ('8a8a8adf5bd80eb3015bd81000180000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=53708db52f977f062868bbb2d2fd2f83; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-05-05 18:02:59');
INSERT INTO `visitor` VALUES ('8a8a8adf5c679d4c015c679d830b0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-02 15:03:15');
INSERT INTO `visitor` VALUES ('8a8a8adf5c679d4c015c679e095b0001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=dc11092a951509b86143f835047cd632; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-02 15:03:49');
INSERT INTO `visitor` VALUES ('8a8a8adf5c679d4c015c67c491090002', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=dc11092a951509b86143f835047cd632; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-02 15:45:54');
INSERT INTO `visitor` VALUES ('8a8a8adf5c679d4c015c67cd50330003', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=dc11092a951509b86143f835047cd632; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-02 15:55:28');
INSERT INTO `visitor` VALUES ('8a8a8adf5c67e852015c67e8e1ed0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=dc11092a951509b86143f835047cd632; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-02 16:25:34');
INSERT INTO `visitor` VALUES ('8a8a8adf5c6824aa015c6824f0e20000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=06619faae505abe85280d4aae5bd73a7; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-02 17:31:10');
INSERT INTO `visitor` VALUES ('8a8a8adf5ca60ea5015ca60f46b50000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=fad175f063a7148c210278adb4ddbbac; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-14 18:03:58');
INSERT INTO `visitor` VALUES ('8a8a8adf5ca9cbfe015ca9ccc6d90000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=d40955f9968de21f2d62e923c6c4c561; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-15 11:29:48');
INSERT INTO `visitor` VALUES ('8a8a8adf5ca9cbfe015ca9d3ac050001', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=d40955f9968de21f2d62e923c6c4c561; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-15 11:37:21');
INSERT INTO `visitor` VALUES ('8a8a8adf5ca9dc2e015ca9dc965c0000', '0:0:0:0:0:0:0:1', 'localhost:8081', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/54.0.2840.87 safari/537.36', 'jsessionid=b06454fca7e44d8a55366b1469d88fd2; hm_lvt_6da605d5179851cd3e688506c96b7613=1494899027; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch, br', 'zh-cn,zh;q=0.8', '2017-06-15 11:47:05');
INSERT INTO `visitor` VALUES ('8a8a8adf5febe4f7015febe52d6e0000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=bfda59b34527aeb1ddff7cf5dd7cae52; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 10:39:46');
INSERT INTO `visitor` VALUES ('8a8a8adf5febebb9015febebed3e0000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=bfda59b34527aeb1ddff7cf5dd7cae52; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 10:47:08');
INSERT INTO `visitor` VALUES ('8a8a8adf5febed36015febedd8790000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=110a440c25e850c1c7a72d13af06a7c8; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 10:49:14');
INSERT INTO `visitor` VALUES ('8a8a8adf5febed36015febeed5910001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=110a440c25e850c1c7a72d13af06a7c8; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 10:50:19');
INSERT INTO `visitor` VALUES ('8a8a8adf5febf986015febf9ad050000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=110a440c25e850c1c7a72d13af06a7c8; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:02:09');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec011f015fec0142050000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=61f4604fbf6155dfe46b5704503aa3f1; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:10:26');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec011f015fec01b90c0001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=fd99d7a5d8bd77f2f872cbf981728294; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:10:57');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec0482015fec04e2480000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=fd99d7a5d8bd77f2f872cbf981728294; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:14:24');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec11fd015fec1226470000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:28:53');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec11fd015fec1246f70001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:29:02');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec11fd015fec12dfe20002', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:29:41');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec29a6b10000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:54:33');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec29d0d50001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:54:44');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec2e6f090002', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 11:59:47');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec2f695a0003', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:00:51');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec30117e0004', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:01:34');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec33161a0005', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:04:52');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec34389b0006', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:06:06');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec3464760007', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:06:17');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec3534770008', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:07:11');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec36954d0009', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:08:41');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec36abf8000a', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:08:47');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec371d30000b', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:09:16');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec2978015fec37cc3b000c', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 12:10:01');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec7b5d015fec7b8bdb0000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=521808e9795fd337634d09665f1d65ab; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 13:24:00');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec7d2e015fec7dad930000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=868325d2e582fc90e8f8253064a8e836; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 13:26:20');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec7d2e015fec7ff0220001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=f6960a04a34ba355c94f72f8c03308d1; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 13:28:48');
INSERT INTO `visitor` VALUES ('8a8a8adf5fec7d2e015fec80eba40002', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=f6960a04a34ba355c94f72f8c03308d1; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 13:29:53');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecc738015fecc7b5f40000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=f6960a04a34ba355c94f72f8c03308d1; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:47:12');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecc738015fecc7dc320001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=59b6c2fff8157a89dc82634fb004ee75; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:47:22');
INSERT INTO `visitor` VALUES ('8a8a8adf5feccc42015feccccee80000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=59b6c2fff8157a89dc82634fb004ee75; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:52:46');
INSERT INTO `visitor` VALUES ('8a8a8adf5feccd9e015fecce20710000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:54:12');
INSERT INTO `visitor` VALUES ('8a8a8adf5feccd9e015fecce38970001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:54:19');
INSERT INTO `visitor` VALUES ('8a8a8adf5feccd9e015fecce42750002', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:54:21');
INSERT INTO `visitor` VALUES ('8a8a8adf5feccd9e015fecce57eb0003', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:54:27');
INSERT INTO `visitor` VALUES ('8a8a8adf5feccd9e015fecd050b90004', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:56:36');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecd280015fecd2d0fe0000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 14:59:20');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecd415015fecd49e1b0000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3522096b3ea4abb255806af65d906382; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:01:18');
INSERT INTO `visitor` VALUES ('8a8a8adf5fece9c6015feceaada40000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=a717081a5bd616102148200f7e46df07; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:25:24');
INSERT INTO `visitor` VALUES ('8a8a8adf5fece9c6015fecec9f0c0001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=2401829e171a4da4c946072320ea4ff9; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:27:31');
INSERT INTO `visitor` VALUES ('8a8a8adf5fece9c6015fececab210002', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=2401829e171a4da4c946072320ea4ff9; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:27:34');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecf12d015fecf2368d0000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=7cd6d13f8263aaab85b73d5546c71c72; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:33:37');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecf12d015fecf37b940001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=283af938c0fcb52d2d51658715435267; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:35:01');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecf12d015fecf3d15f0002', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=283af938c0fcb52d2d51658715435267; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:35:23');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecf12d015fecf44fb00003', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=c3166a65412ececee5aa5578c081fe95; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:35:55');
INSERT INTO `visitor` VALUES ('8a8a8adf5fecf12d015fecf540ee0004', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=c3166a65412ececee5aa5578c081fe95; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:36:57');
INSERT INTO `visitor` VALUES ('8a8a8adf5fed08da015fed091c330000', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=3a46e9d13f90f03896c588fd56e22bbc; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:58:38');
INSERT INTO `visitor` VALUES ('8a8a8adf5fed08da015fed09ddec0001', '0:0:0:0:0:0:0:1', 'localhost:8089', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/61.0.3163.100 safari/537.36', 'jsessionid=15f460d7545c8df2b519c8dd3e0cdb5e; hm_lvt_6da605d5179851cd3e688506c96b7613=1502781624; _ga=ga1.1.1047533706.1484201122', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'gzip, deflate, br', 'zh-cn,zh;q=0.8', '2017-11-24 15:59:28');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015511f238e40000', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-03 00:28:54');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015511f469180001', '125.39.106.102', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1.1; redmi note 3 build/lmy47v) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:31:18');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015511f55dd10002', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:32:20');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015511f660470003', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:33:27');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015511f8f03f0004', '125.39.106.102', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1.1; redmi note 3 build/lmy47v) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:36:15');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015511f9cdf60005', '125.39.106.102', '104.224.170.204:8080', 'mozilla/5.0 (linux; u; android 5.1.1; zh-cn; redmi note 3 build/lmy47v) applewebkit/534.30 (khtml, like gecko) version/4.0 ucbrowser/10.10.0.800 u3/0.8.0 mobile safari/534.30', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8,uc/145,plugin/1,alipay/un', 'gzip', 'zh-cn', '2016-06-03 00:37:11');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551207b8160006', '125.39.106.102', '104.224.170.204:8080', 'mozilla/5.0 (linux; u; android 5.1.1; zh-cn; redmi note 3 build/lmy47v) applewebkit/534.30 (khtml, like gecko) version/4.0 ucbrowser/10.10.0.800 u3/0.8.0 mobile safari/534.30', 'jsessionid=646ee67a4a9cdc8235930d0c0024f049', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8,uc/145,plugin/1,alipay/un', 'gzip', 'zh-cn', '2016-06-03 00:52:23');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015512081d010007', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/40.0.2214.117 mobile safari/537.36 weibo (meizu-m3 note__weibo__6.5.1__android__android5.1)', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:52:49');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015512086b210008', '103.38.234.187', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; rv:17.0) gecko/20100101 firefox/17.0', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'en-us', '2016-06-03 00:53:09');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120b43910009', '101.226.68.215', '104.224.170.204:8080', 'mozilla/5.0 (iphone; u; cpu iphone os 4_0 like mac os x; en-us) applewebkit/532.9 (khtml, like gecko) version/4.0.5 mobile/8a293 safari/6531.22.7', '', '*/*', 'deflate, gzip', 'zh-cn', '2016-06-03 00:56:16');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120b471c000a', '101.226.68.177', '104.224.170.204:8080', 'mozilla/5.0 (compatible; msie 9.0; windows nt 6.1; wow64; trident/5.0)', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'en,*', '2016-06-03 00:56:16');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120b5a00000b', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036222 safari/537.36 v1_and_sq_6.3.7_374_yyb_d qq/6.3.7.2795 nettype/wifi webp/0.3.0 pixel/1080', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:56:21');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120c33ab000c', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036222 safari/537.36 v1_and_sq_6.3.7_374_yyb_d qq/6.3.7.2795 nettype/wifi webp/0.3.0 pixel/1080', 'jsessionid=a36b5e4db6240e2cf3ac40c4b4fc5c9b', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:57:17');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120d31db000d', '111.85.6.178', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 9_3_2 like mac os x) applewebkit/601.1.46 (khtml, like gecko) mobile/13f69 qq/6.3.3.432 v1_iph_sq_6.3.3_1_app_a pixel/640 core/uiwebview nettype/wifi mem/136', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-03 00:58:22');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120d607d000e', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:58:34');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120d7367000f', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:58:39');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120e2f880010', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', 'jsessionid=94c5b9b5044158613026941815cf1006', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:59:27');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155120e45910011', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', 'jsessionid=94c5b9b5044158613026941815cf1006', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:59:33');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551215c8150012', '125.39.106.102', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1.1; redmi note 3 build/lmy47v) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 01:07:45');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551247c7010013', '117.185.27.104', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 7_0_2 like mac os x) applewebkit/537.51.1 (khtml, like gecko) crios/30.0.1599.12 mobile/11a501 safari/8536.25 micromessenger/6.1.0', 'lang=zh', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip', 'en-us,en', '2016-06-03 02:02:21');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015512f82f5e0014', '112.90.82.218', '104.224.170.204:8080', 'mozilla/5.0 (iphone; u; cpu iphone os 4_0 like mac os x; en-us) applewebkit/532.9 (khtml, like gecko) version/4.0.5 mobile/8a293 safari/6531.22.7', '', '*/*', 'deflate, gzip', 'zh-cn', '2016-06-03 05:15:02');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015512f837510015', '211.138.199.177', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1.1; pe-tl20 build/huaweipe-tl20) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 v1_and_sq_6.3.7_374_yyb_d qq/6.3.7.2795 nettype/4g webp/0.3.0 pixel/1080', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'en-us', '2016-06-03 05:15:04');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155130e37ba0016', '222.64.162.210', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 9_3_2 like mac os x) applewebkit/601.1.46 (khtml, like gecko) mobile/13f69 qq/6.3.5.437 v1_iph_sq_6.3.5_1_app_a pixel/1080 core/uiwebview nettype/wifi mem/67', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-03 05:39:06');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513363d430017', '115.60.91.74', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; sm-j5008 build/lmy47o) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 v1_and_sq_6.3.6_372_yyb_d qq/6.3.6.2790 nettype/wifi webp/0.3.0 pixel/720', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 06:22:49');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155135c02040018', '117.185.27.102', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 7_0_2 like mac os x) applewebkit/537.51.1 (khtml, like gecko) crios/30.0.1599.12 mobile/11a501 safari/8536.25 micromessenger/6.1.0', 'lang=zh', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip', 'en-us,en', '2016-06-03 07:04:04');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155136504b90019', '106.111.222.193', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.4; vivo x5v build/ktu84p) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036222 safari/537.36 v1_and_sq_6.3.1_350_yyb_d qq/6.3.1.2735 nettype/wifi webp/0.3.0 pixel/720', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 07:13:55');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155138315ce001a', '121.235.229.104', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.4; che1-cl10 build/che1-cl10) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/33.0.0.0 mobile safari/537.36 micromessenger/6.3.7.51_rbb7fa12.660 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 07:46:45');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551383297c001b', '121.235.229.104', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.4; che1-cl10 build/che1-cl10) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/33.0.0.0 mobile safari/537.36 micromessenger/6.3.7.51_rbb7fa12.660 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 07:46:50');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513878858001c', '101.226.125.122', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 7_0_2 like mac os x) applewebkit/537.51.1 (khtml, like gecko) crios/30.0.1599.12 mobile/11a501 safari/8536.25 micromessenger/6.1.0', 'lang=zh', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip', 'en-us,en', '2016-06-03 07:51:37');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551387caa4001d', '101.226.61.193', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 7_0_2 like mac os x) applewebkit/537.51.1 (khtml, like gecko) crios/30.0.1599.12 mobile/11a501 safari/8536.25 micromessenger/6.1.0', 'lang=zh', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip', 'en-us,en', '2016-06-03 07:51:54');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551387d2e2001e', '117.185.27.144', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 7_0_2 like mac os x) applewebkit/537.51.1 (khtml, like gecko) crios/30.0.1599.12 mobile/11a501 safari/8536.25 micromessenger/6.1.0', 'lang=zh', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip', 'en-us,en', '2016-06-03 07:51:56');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f901551387e08b001f', '117.144.246.147', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 7_0_2 like mac os x) applewebkit/537.51.1 (khtml, like gecko) crios/30.0.1599.12 mobile/11a501 safari/8536.25 micromessenger/6.1.0', 'lang=zh', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip', 'en-us,en', '2016-06-03 07:51:59');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f90155139b02fa0020', '114.217.113.128', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/38.0.2125.122 safari/537.36 se 2.x metasr 1.0', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate,sdch', 'zh-cn,zh;q=0.8', '2016-06-03 08:12:53');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513a9c3650021', '180.175.60.212', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 9_3_2 like mac os x) applewebkit/601.1.46 (khtml, like gecko) mobile/13f69 qq/6.3.5.437 v1_iph_sq_6.3.5_1_app_a pixel/750 core/uiwebview nettype/wifi mem/154', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-03 08:29:00');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513b887a30022', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=96315fb296dd24cfb80dc92182853751', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 08:45:08');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513bde83f0023', '49.88.86.76', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 8_4 like mac os x) applewebkit/600.1.4 (khtml, like gecko) mobile/12h143 micromessenger/6.3.16 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-03 08:51:00');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513bdf8920024', '49.88.86.76', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 8_4 like mac os x) applewebkit/600.1.4 (khtml, like gecko) mobile/12h143 micromessenger/6.3.16 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-03 08:51:04');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513c8da110025', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=96315fb296dd24cfb80dc92182853751', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 09:02:58');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513d22efa0026', '140.206.89.97', '104.224.170.204:8080', 'mozilla/5.0 (iphone; cpu iphone os 9_3_2 like mac os x) applewebkit/601.1.46 (khtml, like gecko) mobile/13f69 micromessenger/6.3.16 nettype/3g+ language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-03 09:13:09');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513d829f50027', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=96315fb296dd24cfb80dc92182853751', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 09:19:41');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513eda9de0028', '58.210.67.150', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.3; sm-n9009 build/jss15j) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 09:43:10');
INSERT INTO `visitor` VALUES ('e8602a4c5511f1f9015513edc15c0029', '58.210.67.150', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.3; sm-n9009 build/jss15j) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036519 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/sharpp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 09:43:16');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155142067a70000', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=96315fb296dd24cfb80dc92182853751', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:38:35');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d01551422df850001', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=52b8ff60e4f50fee5a548432e29eaa15', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:41:17');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d01551423e62d0002', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=52b8ff60e4f50fee5a548432e29eaa15', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:42:24');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d015514246b9f0003', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=52b8ff60e4f50fee5a548432e29eaa15', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:42:59');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d01551424dcbc0004', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=52b8ff60e4f50fee5a548432e29eaa15', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:43:28');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155142a36000005', '113.108.21.69', '104.224.170.204:8080', 'mozilla/5.0 (iphone; u; cpu iphone os 4_0 like mac os x; en-us) applewebkit/532.9 (khtml, like gecko) version/4.0.5 mobile/8a293 safari/6531.22.7', '', '*/*', 'deflate, gzip', 'zh-cn', '2016-06-02 22:49:18');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155142a3f0e0006', '49.88.86.76', '104.224.170.204:8080', 'qzonejssdk/6.5.2.1 qqjssdk/1.2 mozilla/5.0 (iphone; cpu iphone os 8_4 like mac os x) applewebkit/600.1.4 (khtml, like gecko) mobile/12h143 qzone/v1_iph_qz_6.5.2_1_app_a newversion', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'gzip, deflate', 'zh-cn', '2016-06-02 22:49:20');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155142c11eb0007', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:51:20');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155142c337c0008', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', 'jsessionid=dd8e0c909e7373a1a5ec9b987586deb5', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 22:51:29');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155144cbe6f0009', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; u; android 5.0; zh-cn; letv x501 build/dbxcnop5501304131s) applewebkit/537.36 (khtml, like gecko)version/4.0 chrome/37.0.0.0 mobile safari/537.36 eui browser/1.0', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 23:27:01');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d01551453950b000a', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.4; chm-cl00 build/chm-cl00) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/33.0.0.0 mobile safari/537.36 v1_and_sq_6.3.1_350_yyb_d pa qq/6.3.1.2735 nettype/wifi webp/0.3.2 pixel/720', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-02 23:34:29');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155148e8a5c000b', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:38:53');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d0155148ebffd000c', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 00:39:07');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d015514acdfb3000d', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/40.0.2214.117 mobile safari/537.36 weibo (meizu-m3 note__weibo__6.5.1__android__android5.1)', 'jsessionid=f8175250e778cde3094d753c13cadf59', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 01:12:01');
INSERT INTO `visitor` VALUES ('e8602a4c5514204d015514bc7b29000e', '111.160.45.86', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.4; chm-cl00 build/chm-cl00) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/33.0.0.0 mobile safari/537.36 v1_and_sq_6.3.1_350_yyb_d qq/6.3.1.2735 nettype/wifi webp/0.3.2 pixel/720', 'jsessionid=1fc91eb14755dbfb3b02b080c236ff60', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 01:29:04');
INSERT INTO `visitor` VALUES ('e8602a4c5514c75401551615530a0000', '42.80.198.151', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 19:45:43');
INSERT INTO `visitor` VALUES ('e8602a4c5514c7540155163798c20001', '183.206.198.54', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.2; 2014501 build/kot49h) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036215 safari/537.36 micromessenger/6.3.18.800 nettype/wifi language/zh_cn', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 20:23:10');
INSERT INTO `visitor` VALUES ('e8602a4c5514c754015516a5f11c0002', '113.108.21.69', '104.224.170.204:8080', 'mozilla/5.0 (iphone; u; cpu iphone os 4_0 like mac os x; en-us) applewebkit/532.9 (khtml, like gecko) version/4.0.5 mobile/8a293 safari/6531.22.7', '', '*/*', 'deflate, gzip', 'zh-cn', '2016-06-03 22:23:41');
INSERT INTO `visitor` VALUES ('e8602a4c5514c754015516a5f8b80003', '101.90.253.56', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 4.4.4; chm-cl00 build/chm-cl00) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/37.0.0.0 mobile mqqbrowser/6.2 tbs/036222 safari/537.36 v1_and_sq_6.3.1_350_yyb_d qq/6.3.1.2735 nettype/4g webp/0.3.0 pixel/720', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip,deflate', 'zh-cn,en-us;q=0.8', '2016-06-03 22:23:43');
INSERT INTO `visitor` VALUES ('e8602a4c551709080155170c4d780000', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=79391de437819ac89c70fd19a0aa57b6', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-04 00:15:29');
INSERT INTO `visitor` VALUES ('e8602a4c551709080155170d46490001', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', '', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 00:16:33');
INSERT INTO `visitor` VALUES ('e8602a4c551709080155170dec650002', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=79391de437819ac89c70fd19a0aa57b6', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-04 00:17:16');
INSERT INTO `visitor` VALUES ('e8602a4c551709080155170ecdce0003', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=79391de437819ac89c70fd19a0aa57b6', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-04 00:18:14');
INSERT INTO `visitor` VALUES ('e8602a4c551709080155170f5ec00004', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=35da440bc35d7877ca856623896196da', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 00:18:51');
INSERT INTO `visitor` VALUES ('e8602a4c551725460155172557fc0000', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=35da440bc35d7877ca856623896196da', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 00:42:50');
INSERT INTO `visitor` VALUES ('e8602a4c551735120155173524210000', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=35da440bc35d7877ca856623896196da', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 01:00:06');
INSERT INTO `visitor` VALUES ('e8602a4c55173512015517435f540001', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (windows nt 6.1; wow64) applewebkit/537.36 (khtml, like gecko) chrome/47.0.2526.8 safari/537.36', 'jsessionid=35da440bc35d7877ca856623896196da', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate, sdch', 'zh-cn,zh;q=0.8', '2016-06-04 01:15:39');
INSERT INTO `visitor` VALUES ('e8602a4c5517443f015517cbe0820000', '60.28.189.184', '104.224.170.204:8080', 'mozilla/5.0 (linux; android 5.1; mz-m3 note build/lmy47i) applewebkit/537.36 (khtml, like gecko) version/4.0 chrome/45.0.2454.94 mobile safari/537.36', 'jsessionid=79391de437819ac89c70fd19a0aa57b6', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'gzip, deflate', 'zh-cn,en-us;q=0.8', '2016-06-04 03:44:45');

-- ----------------------------
-- Procedure structure for `myProcedure`
-- ----------------------------
DROP PROCEDURE IF EXISTS `myProcedure`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `myProcedure`()
    READS SQL DATA
BEGIN  
		SELECT  *  
		FROM  account_type ;  
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `cutString`
-- ----------------------------
DROP FUNCTION IF EXISTS `cutString`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cutString`(s VARCHAR(255), n INT) RETURNS varchar(255) CHARSET utf8
BEGIN

IF (ISNULL(s)) THEN
	RETURN '' ;
ELSEIF CHAR_LENGTH(s) < n THEN
	RETURN s ;
ELSEIF CHAR_LENGTH(S) = n THEN
	RETURN '相等' ;
ELSE
	RETURN CONCAT(LEFT(s, n), '...') ;
END
IF ;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getdate`
-- ----------------------------
DROP FUNCTION IF EXISTS `getdate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getdate`(gdate datetime) RETURNS varchar(255) CHARSET utf8
BEGIN
	DECLARE
		x VARCHAR (255) DEFAULT '' ;
	SET x = date_format(
		gdate,
		'%Y年%m月%d日%h时%i分%s秒'
	) ; RETURN x ;
	END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `myFunc`
-- ----------------------------
DROP FUNCTION IF EXISTS `myFunc`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `myFunc`(emp_id INT) RETURNS varchar(20) CHARSET utf8
BEGIN  
              RETURN  (SELECT  account
              FROM  account
              );  
          END
;;
DELIMITER ;
