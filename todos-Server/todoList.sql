/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1:3306
 Source Schema         : todoList

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 23/12/2019 17:11:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '待办事项内容',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `overTime` datetime DEFAULT NULL COMMENT '实际完成时间',
  `expectTime` datetime DEFAULT NULL COMMENT '预期完成时间',
  `deleteTime` datetime DEFAULT NULL COMMENT '删除时间',
  `isComplete` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'false' COMMENT '完成状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of items
-- ----------------------------
BEGIN;
INSERT INTO `items` VALUES (3, 'study for Y!', '2019-12-23 16:48:41', '2019-12-23 17:04:52', '2019-12-23 16:29:57', NULL, 'true');
INSERT INTO `items` VALUES (4, 'study for Y!', '2019-12-23 16:49:08', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (5, 'study for Y!', '2019-12-23 16:49:08', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (6, 'study for Y!', '2019-12-23 16:49:08', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (7, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (8, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (9, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (10, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (11, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (12, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (13, 'study for Y!', '2019-12-23 16:49:09', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (14, 'study for Y!', '2019-12-23 16:49:10', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (15, 'study for Y!', '2019-12-23 16:49:10', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (16, 'study for Y!', '2019-12-23 16:49:10', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (17, 'study for Y!', '2019-12-23 16:49:26', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (18, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (19, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (20, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (21, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (22, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (23, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (24, 'study for Y!', '2019-12-23 16:49:27', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (25, 'study for Y!', '2019-12-23 16:49:28', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (26, 'study for Y!', '2019-12-23 16:49:28', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (27, 'study for Y!', '2019-12-23 16:49:28', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (28, 'study for Y!', '2019-12-23 16:52:00', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (29, 'study for Y!', '2019-12-23 16:52:01', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (30, 'study for Y!', '2019-12-23 16:52:01', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (31, 'study for Y!', '2019-12-23 16:52:01', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (32, 'study for Y!', '2019-12-23 16:52:02', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (33, 'study for Y!', '2019-12-23 16:52:02', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (34, 'study for Y!', '2019-12-23 16:53:50', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (35, 'study for Y!', '2019-12-23 17:08:21', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (36, 'study for Y!', '2019-12-23 17:08:21', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (37, 'study for Y!', '2019-12-23 17:08:21', NULL, '2019-12-23 16:29:57', NULL, 'false');
INSERT INTO `items` VALUES (38, 'study for Y!', '2019-12-23 17:08:21', NULL, '2019-12-23 16:29:57', NULL, 'false');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
