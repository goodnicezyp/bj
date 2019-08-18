/*
Navicat MySQL Data Transfer

Source Server         : web_ssm_sql
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : e_securitymark

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-02-18 18:39:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(100) COLLATE utf8_bin NOT NULL,
  `adminPwd` varchar(100) COLLATE utf8_bin NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` datetime NOT NULL,
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sex` int(2) NOT NULL DEFAULT '0',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `roleid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', '1', '2019-02-14 11:47:37', null, null, '0', null, '0');
INSERT INTO admin VALUES ('2', '张三', '324564654', '1', '2019-02-13 11:47:40', null, null, '0', null, '0');
INSERT INTO admin VALUES ('5', '李四', '698d51a19d8a121ce581499d7b701668', '1', '2019-02-14 16:34:14', '17688942200', '245374011@qq.com', '1', '三生三世', '2');

-- ----------------------------
-- Table structure for `adminrole`
-- ----------------------------
DROP TABLE IF EXISTS `adminrole`;
CREATE TABLE `adminrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adminid` bigint(20) DEFAULT NULL,
  `roleid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of adminrole
-- ----------------------------
INSERT INTO adminrole VALUES ('1', '1', '1');
INSERT INTO adminrole VALUES ('2', '2', '1');
INSERT INTO adminrole VALUES ('5', '5', '2');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `parentid` bigint(11) DEFAULT '0',
  `parentName` varchar(100) COLLATE utf8_bin DEFAULT '',
  `depth` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO category VALUES ('1', '美术', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('2', '摄影', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('3', '音频', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('4', '视频', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('5', '设计图', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('6', '模型', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('7', '文字', '0', '已经是顶级节点', '1', '1');
INSERT INTO category VALUES ('8', '其他', '0', '已经是顶级节点', '1', '1');

-- ----------------------------
-- Table structure for `loginfo`
-- ----------------------------
DROP TABLE IF EXISTS `loginfo`;
CREATE TABLE `loginfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `method` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `params` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `action` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `exceptioncode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `exceptiondetail` text COLLATE utf8_bin,
  `createTime` datetime NOT NULL,
  `operator` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `fileFlag` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `operator` (`operator`),
  KEY `fileFlag` (`fileFlag`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of loginfo
-- ----------------------------
INSERT INTO loginfo VALUES ('1', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:27:18', 'william', '0', '1');
INSERT INTO loginfo VALUES ('2', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:27:25', 'william', '0', '1');
INSERT INTO loginfo VALUES ('3', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:27:32', 'william', '0', '1');
INSERT INTO loginfo VALUES ('4', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:27:41', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('5', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:48:11', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('6', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:49:06', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('7', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:49:10', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('8', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:52:03', '游客', '0', '1');
INSERT INTO loginfo VALUES ('9', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:52:54', '游客', '0', '1');
INSERT INTO loginfo VALUES ('10', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:54:01', '游客', '0', '1');
INSERT INTO loginfo VALUES ('11', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:54:03', '游客', '0', '1');
INSERT INTO loginfo VALUES ('12', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:55:11', '游客', '0', '1');
INSERT INTO loginfo VALUES ('13', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:55:18', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('14', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:57:41', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('15', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 14:57:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('16', 'admin.AdminLoginCtrl.adminLogin()', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 15:05:11', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('17', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 15:57:36', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('18', 'permissionList', null, '获取角色列表', '192.168.159.1', null, null, '2019-01-31 16:01:22', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('19', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 16:08:49', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('20', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 16:11:11', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('21', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 16:51:46', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('22', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:00:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('23', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:03:47', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('24', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:07:53', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('25', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:12:41', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('26', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:12:41', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('27', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:22:51', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('28', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:24:57', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('29', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:32:54', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('30', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:32:54', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('31', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:34:05', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('32', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-01-31 17:34:05', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('33', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 09:24:31', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('34', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:11:38', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('35', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:11:38', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('36', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 10:13:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('37', 'delPermission', null, '删除权限节点', '192.168.159.1', null, null, '2019-02-01 10:14:51', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('38', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:16:01', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('39', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:16:01', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('40', 'delPermission', null, '删除权限节点', '192.168.159.1', null, null, '2019-02-01 10:16:12', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('41', 'delPermission', null, '删除权限节点', '192.168.159.1', null, null, '2019-02-01 10:16:18', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('42', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:38:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('43', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:38:03', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('44', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:43:09', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('45', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 10:47:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('46', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 13:20:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('47', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 13:25:02', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('48', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 13:34:35', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('49', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 13:36:35', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('50', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 13:38:19', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('51', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 13:38:55', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('52', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 13:58:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('53', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 13:58:11', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('54', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 13:59:23', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('55', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 13:59:31', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('56', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 13:59:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('57', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 14:57:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('58', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 14:57:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('59', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 14:59:10', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('60', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 15:18:33', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('61', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 15:18:33', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('62', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 15:29:40', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('63', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 15:30:12', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('64', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 15:30:56', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('65', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-01 15:31:10', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('66', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 15:31:44', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('67', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 15:32:36', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('68', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 15:32:51', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('69', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-01 15:32:56', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('70', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-01 15:45:50', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('71', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-02 14:36:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('72', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-02 14:36:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('73', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-02 15:37:12', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('74', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-02 15:39:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('75', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-02 15:42:16', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('76', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-02 17:28:02', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('77', 'addRole', null, '添加角色', '192.168.159.1', null, null, '2019-02-02 17:42:10', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('78', 'addRole', null, '添加角色', '192.168.159.1', null, null, '2019-02-02 18:06:47', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('79', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-12 10:29:26', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('80', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-12 10:29:26', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('81', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-13 20:34:21', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('82', 'addRole', null, '添加角色', '192.168.159.1', null, null, '2019-02-13 20:39:48', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('83', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-13 20:56:03', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('84', 'updateRole', null, '更新角色', '192.168.159.1', null, null, '2019-02-13 20:56:19', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('85', 'updateRole', null, '更新角色', '192.168.159.1', null, null, '2019-02-13 20:56:25', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('86', 'updateRole', null, '更新角色', '192.168.159.1', null, null, '2019-02-13 20:56:29', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('87', 'delPermission', null, '删除权限节点', '192.168.159.1', null, null, '2019-02-13 20:59:28', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('88', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-13 21:24:08', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('89', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-13 21:24:16', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('90', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 10:36:29', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('91', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 10:36:30', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('92', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-14 10:36:55', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('93', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 10:38:37', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('94', 'addRole', null, '添加角色', '192.168.159.1', null, null, '2019-02-14 10:39:06', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('95', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-14 10:39:10', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('96', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 10:44:36', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('97', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-14 10:44:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('98', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 10:52:57', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('99', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-14 10:53:11', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('100', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-14 10:54:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('101', 'delRole', null, '删除角色', '192.168.159.1', null, null, '2019-02-14 10:55:27', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('102', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 11:31:52', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('103', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-14 11:34:03', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('104', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-14 11:35:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('105', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-14 11:35:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('106', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-14 11:36:03', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('107', 'addPermission', null, '添加权限节点', '192.168.159.1', null, null, '2019-02-14 11:36:28', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('108', 'updateRole', null, '更新角色', '192.168.159.1', null, null, '2019-02-14 11:36:44', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('109', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 11:37:44', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('110', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 11:47:48', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('111', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 12:26:02', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('112', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-14 12:27:11', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('113', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-14 12:27:19', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('114', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-14 12:27:24', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('115', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-14 12:27:30', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('116', 'updatePermission', null, '修改权限节点', '192.168.159.1', null, null, '2019-02-14 12:27:36', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('117', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 13:34:45', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('118', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 13:43:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('119', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 13:43:43', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('120', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 13:48:44', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('121', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 14:45:01', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('122', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:05:56', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('123', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 15:06:45', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('124', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 15:07:41', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('125', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:10:37', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('126', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:10:38', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('127', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 15:10:57', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('128', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:13:40', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('129', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:13:40', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('130', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 15:14:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('131', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:31:49', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('132', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 15:31:49', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('133', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 15:33:00', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('134', 'delAdmin', null, '删除管理员', '192.168.159.1', null, null, '2019-02-14 15:37:10', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('135', 'delAdmin', null, '删除管理员', '192.168.159.1', null, null, '2019-02-14 15:55:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('136', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 16:28:09', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('137', 'addAdmin', null, '添加管理员', '192.168.159.1', null, null, '2019-02-14 16:34:14', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('138', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 16:47:17', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('139', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-14 16:47:16', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('140', 'updateAdminState', null, '更改管理员状态', '192.168.159.1', null, null, '2019-02-14 16:47:31', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('141', 'updateAdminState', null, '更改管理员状态', '192.168.159.1', null, null, '2019-02-14 16:47:35', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('142', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-15 10:31:20', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('143', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-15 11:21:49', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('144', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-15 11:21:49', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('145', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-15 12:12:54', '\\u6B23\\u6850', '1', '1');
INSERT INTO loginfo VALUES ('146', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 11:16:57', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('147', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 11:41:41', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('148', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 18:37:15', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('149', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 18:37:15', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('150', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 19:52:40', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('151', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 19:59:54', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('152', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 20:25:33', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('153', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 20:32:25', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('154', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-17 20:48:15', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('155', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 00:37:22', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('156', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 00:47:51', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('157', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 00:53:22', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('158', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 09:53:25', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('159', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 10:25:19', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('160', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 11:17:32', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('161', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 11:17:32', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('162', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 14:37:23', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('163', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 15:33:07', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('164', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 15:51:45', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('165', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:51:56', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('166', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:52:20', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('167', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:52:28', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('168', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:52:37', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('169', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:52:45', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('170', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:52:53', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('171', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:52:58', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('172', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:53:02', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('173', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:54:51', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('174', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:54:55', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('175', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:55:02', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('176', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 15:56:36', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('177', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 16:00:55', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('178', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 16:01:14', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('179', 'delCate', null, '删除分类', '192.168.159.1', null, null, '2019-02-18 16:01:23', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('180', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 16:01:34', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('181', 'delCate', null, '删除分类', '192.168.159.1', null, null, '2019-02-18 16:01:37', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('182', 'adminLogin', null, '后台管理员登录', '192.168.159.1', null, null, '2019-02-18 16:06:36', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('183', 'updateCategory', null, '更新分类', '192.168.159.1', null, null, '2019-02-18 16:06:44', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('184', 'addCate', null, '添加分类', '192.168.159.1', null, null, '2019-02-18 16:08:05', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('185', 'updateCategory', null, '更新分类', '192.168.159.1', null, null, '2019-02-18 16:08:09', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('186', 'updateCategory', null, '更新分类', '192.168.159.1', null, null, '2019-02-18 16:08:13', 'admin', '0', '1');
INSERT INTO loginfo VALUES ('187', 'updateCategory', null, '更新分类', '192.168.159.1', null, null, '2019-02-18 16:08:42', 'admin', '0', '1');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `action` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `depth` int(2) NOT NULL DEFAULT '0',
  `parentID` bigint(11) NOT NULL DEFAULT '0',
  `parentName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO permission VALUES ('1', '管理员添加', 'admin_add', '3', '4', '管理员列表');
INSERT INTO permission VALUES ('2', '管理员删除', 'admin_del', '3', '4', '管理员列表');
INSERT INTO permission VALUES ('3', '管理员修改', 'admin_update', '3', '4', '管理员列表');
INSERT INTO permission VALUES ('4', '管理员列表', 'admin_list', '2', '5', '管理员管理');
INSERT INTO permission VALUES ('5', '管理员管理', 'admin_menu', '1', '0', '已经是顶级节点');
INSERT INTO permission VALUES ('92', '用户管理', 'user_menu', '1', '0', '已经是顶级节点');
INSERT INTO permission VALUES ('93', '微信用户', 'user_list', '2', '92', '用户管理');
INSERT INTO permission VALUES ('94', '角色管理', 'role_list', '2', '5', '管理员管理');
INSERT INTO permission VALUES ('95', '角色管理添加', 'role_add', '3', '94', '角色管理');
INSERT INTO permission VALUES ('96', '角色管理修改', 'role_update', '3', '94', '角色管理');
INSERT INTO permission VALUES ('97', '角色管理删除', 'role_del', '3', '94', '角色管理');
INSERT INTO permission VALUES ('99', '权限管理', 'permission_list', '2', '5', '管理员管理');
INSERT INTO permission VALUES ('100', '权限节点添加', 'permission_add', '3', '99', '权限管理');
INSERT INTO permission VALUES ('101', '权限节点修改', 'permission_update', '3', '99', '权限管理');
INSERT INTO permission VALUES ('102', '权限节点删除', 'permission_del', '3', '99', '权限管理');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `rolecode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('1', '超级管理员', '拥有至高无上的权利');
INSERT INTO role VALUES ('2', '用户管理员', '拥有管理用户的权限');

-- ----------------------------
-- Table structure for `rolepermission`
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(20) DEFAULT NULL,
  `permissionid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO rolepermission VALUES ('8', '2', '92');
INSERT INTO rolepermission VALUES ('9', '2', '93');
INSERT INTO rolepermission VALUES ('10', '3', '5');
INSERT INTO rolepermission VALUES ('11', '3', '3');
INSERT INTO rolepermission VALUES ('12', '3', '2');
INSERT INTO rolepermission VALUES ('13', '3', '1');
INSERT INTO rolepermission VALUES ('14', '3', '4');
INSERT INTO rolepermission VALUES ('22', '4', '5');
INSERT INTO rolepermission VALUES ('23', '4', '2');
INSERT INTO rolepermission VALUES ('26', '1', '5');
INSERT INTO rolepermission VALUES ('27', '1', '96');
INSERT INTO rolepermission VALUES ('28', '1', '95');
INSERT INTO rolepermission VALUES ('29', '1', '97');
INSERT INTO rolepermission VALUES ('30', '1', '94');
INSERT INTO rolepermission VALUES ('31', '1', '2');
INSERT INTO rolepermission VALUES ('32', '1', '1');
INSERT INTO rolepermission VALUES ('33', '1', '3');
INSERT INTO rolepermission VALUES ('34', '1', '4');
INSERT INTO rolepermission VALUES ('35', '1', '100');
INSERT INTO rolepermission VALUES ('36', '1', '102');
INSERT INTO rolepermission VALUES ('37', '1', '101');
INSERT INTO rolepermission VALUES ('38', '1', '99');
INSERT INTO rolepermission VALUES ('39', '1', '92');
INSERT INTO rolepermission VALUES ('40', '1', '93');

-- ----------------------------
-- Table structure for `works`
-- ----------------------------
DROP TABLE IF EXISTS `works`;
CREATE TABLE `works` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_bin NOT NULL,
  `recordNo` varchar(200) COLLATE utf8_bin NOT NULL,
  `cateid` bigint(11) NOT NULL DEFAULT '0',
  `disclosure` int(2) NOT NULL DEFAULT '0',
  `authorization` int(2) NOT NULL DEFAULT '0',
  `genre` int(2) NOT NULL DEFAULT '0',
  `copyright` text DEFAULT '',
  `remark` varchar(200) COLLATE utf8_bin NOT NULL,
  `type` int(2) NOT NULL DEFAULT '0',
  `url` varchar(200) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin,
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `userName` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `userImg` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `likedNum` int(11) NOT NULL DEFAULT '0',
  `collectNum` int(11) NOT NULL DEFAULT '0',
  `recommendFlag` int(2) NOT NULL DEFAULT '0',
  `shareNum` int(11) NOT NULL DEFAULT '0',
  `downloadNum` int(11) NOT NULL DEFAULT '0',
  `examine` int(2) NOT NULL DEFAULT '0',
  `replyNum` int(11) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL,
  `updateTime` datetime DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of works
-- ----------------------------

-- ----------------------------
-- Table structure for `wxuser`
-- ----------------------------
DROP TABLE IF EXISTS `wxuser`;
CREATE TABLE `wxuser` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) COLLATE utf8_bin NOT NULL,
  `userImg` varchar(200) COLLATE utf8_bin NOT NULL,
  `professional` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `interest` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `lastIP` varchar(100) COLLATE utf8_bin NOT NULL,
  `signCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `iuserid` bigint(11) DEFAULT '0',
  `memberid` int(2) NOT NULL DEFAULT '0',
  `inviteCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `parentid` bigint(11) DEFAULT '0',
  `memberTime` datetime DEFAULT NULL,
  `signType` int(2) NOT NULL DEFAULT '0',
  `userPhone` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `certifiedFlag` int(2) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `signTime` datetime DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `profit` decimal(11,2) NOT NULL DEFAULT '0.00',
  `miniOpenid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `userOpenid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `unionid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `totalCare` int(11) NOT NULL DEFAULT '0',
  `totalFans` int(11) NOT NULL DEFAULT '0',
  `recommendFlag` int(2) NOT NULL DEFAULT '0',
  `works` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of wxuser
-- ----------------------------
INSERT INTO wxuser VALUES ('1', 'clarence', 'https://wx.qlogo.cn/mmopen/vi_32/451hlDYzW0E9ZJ8ASd6ryN66QghTHMneHLTbo1vsJxpRy8jEE48r7bkzQU3ygNbibMj5nKYFbCAoQGO1la9RPLQ/132', '程序猿', '羽毛球、美食、旅游、王者荣耀', '127.0.0.1', '546546', '0', '1', '54654654', '0', '2019-02-17 20:48:55', '0', '17688888888', '阿里巴巴深圳市炫酷游科技有限公司', '0', '2019-01-30 11:06:44', '2019-01-31 11:06:54', '2019-01-31 11:06:58', '0', '0.00', null, null, null, '0', '0', '0', '0');
INSERT INTO wxuser VALUES ('2', '王丽丽', 'https://wx.qlogo.cn/mmopen/vi_32/5ZdqnYNyojUd0aLQibkB7AaPcKJoc5rhvgTXE9YrFAiac1fK00GLiaYbicrOViaTxKvBJmC2qgC46IeWXWEkNu1eOWg/132', '销售', '羽毛球', '192.168.1.1', 's545654', '0', '2', 'ss5555', '0', '2019-02-18 09:55:42', '0', '17588945555', '深圳啦啦啦', '0', '2019-02-18 09:55:56', '2019-02-18 09:56:00', '2019-02-18 09:56:04', '0', '0.00', null, null, null, '0', '0', '0', '0');
