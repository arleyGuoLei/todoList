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

 Date: 25/12/2019 20:49:56
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of items
-- ----------------------------
BEGIN;
INSERT INTO `items` VALUES (1, 'ASP.NET课程设计', '2019-12-24 16:30:42', '2019-12-24 16:32:57', '2019-12-24 13:30:00', 'true');
INSERT INTO `items` VALUES (2, '完成服务端内容', '2019-12-24 16:31:16', NULL, '2019-12-23 08:30:08', 'false');
INSERT INTO `items` VALUES (3, '完成前端内容', '2019-12-24 16:31:39', NULL, '2019-12-24 14:31:30', 'false');
INSERT INTO `items` VALUES (4, '爱生活，爱自己', '2019-12-25 20:46:38', NULL, '2019-12-24 12:46:37', 'false');
INSERT INTO `items` VALUES (5, '好好学习，天天向上', '2019-12-25 20:47:35', NULL, '2019-12-26 12:47:34', 'false');
INSERT INTO `items` VALUES (6, '学习VUE', '2019-12-25 20:47:42', NULL, '2020-01-01 12:47:42', 'false');
INSERT INTO `items` VALUES (7, '学习Webpack', '2019-12-25 20:47:53', NULL, '2020-01-01 12:47:53', 'false');
INSERT INTO `items` VALUES (8, '学习TypeScript', '2019-12-25 20:48:07', NULL, '2020-01-01 12:48:06', 'false');
INSERT INTO `items` VALUES (9, '有钱没钱，回家过年~', '2019-12-25 20:48:33', NULL, '2019-12-26 12:48:32', 'false');
INSERT INTO `items` VALUES (10, '吃烤鸭，吃啵啵鱼', '2019-12-25 20:48:47', '2019-12-25 20:49:33', '2020-01-01 12:48:46', 'true');
INSERT INTO `items` VALUES (11, 'ASP.NET 课设答辩', '2019-12-25 20:49:00', NULL, '2019-12-26 12:48:59', 'false');
INSERT INTO `items` VALUES (12, 'ASP.NET文档编写~', '2019-12-25 20:49:23', '2019-12-25 20:49:30', '2019-12-25 12:49:23', 'true');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
