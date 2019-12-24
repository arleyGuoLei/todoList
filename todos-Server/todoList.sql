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

 Date: 24/12/2019 16:44:38
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
  `isComplete` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'false' COMMENT '完成状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of items
-- ----------------------------
BEGIN;
INSERT INTO `items` VALUES (1, 'ASP.NET课程设计', '2019-12-24 16:30:42', '2019-12-24 16:32:57', '2019-12-24 13:30:00', 'true');
INSERT INTO `items` VALUES (2, '完成服务端内容', '2019-12-24 16:31:16', NULL, '2019-12-23 08:30:08', 'false');
INSERT INTO `items` VALUES (3, '完成前端内容', '2019-12-24 16:31:39', NULL, '2019-12-24 14:31:30', 'false');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
