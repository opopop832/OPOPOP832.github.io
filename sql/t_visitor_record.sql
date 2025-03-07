/*
 Navicat Premium Dump SQL

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : weblog

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 09/01/2025 21:51:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_visitor_record
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor_record`;
CREATE TABLE `t_visitor_record`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `visitor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'agent',
  `ip_address` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '127.0.0.1',
  `ip_region` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未知',
  `visit_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '访问时间',
  `is_notify` tinyint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ip_visit_time`(`ip_address` ASC, `visit_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访客记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_visitor_record
-- ----------------------------
INSERT INTO `t_visitor_record` VALUES (1, 'agent', '113.65.205.124', '外太空', '2024-10-29 19:16:17', 0);
INSERT INTO `t_visitor_record` VALUES (2, 'agent', '113.65.205.124', '外太空', '2024-10-29 19:42:25', 0);
INSERT INTO `t_visitor_record` VALUES (3, 'agent', '113.65.205.124', '外太空', '2024-10-31 13:03:11', 0);
INSERT INTO `t_visitor_record` VALUES (4, 'agent', '113.65.205.124', '外太空', '2024-10-31 13:42:21', 0);
INSERT INTO `t_visitor_record` VALUES (5, 'agent', '113.65.205.124', '外太空', '2024-11-04 18:04:42', 0);
INSERT INTO `t_visitor_record` VALUES (6, 'agent', '113.65.205.124', '外太空', '2024-11-04 18:11:16', 0);
INSERT INTO `t_visitor_record` VALUES (7, 'agent', '113.65.205.124', '外太空', '2024-11-06 10:54:44', 0);
INSERT INTO `t_visitor_record` VALUES (8, 'agent', '113.65.205.124', '外太空', '2024-11-16 11:23:53', 0);
INSERT INTO `t_visitor_record` VALUES (9, 'agent', '113.65.205.124', '外太空', '2024-12-31 00:41:55', 0);
INSERT INTO `t_visitor_record` VALUES (10, 'agent', '113.65.205.124', '外太空', '2025-01-05 18:44:30', 0);
INSERT INTO `t_visitor_record` VALUES (11, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:17:10', 0);
INSERT INTO `t_visitor_record` VALUES (12, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:33:24', 0);
INSERT INTO `t_visitor_record` VALUES (13, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:39:16', 0);
INSERT INTO `t_visitor_record` VALUES (14, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:41:22', 0);
INSERT INTO `t_visitor_record` VALUES (15, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:45:19', 0);
INSERT INTO `t_visitor_record` VALUES (16, 'agent', '113.65.205.124', '外太空', '2025-01-05 19:46:49', 0);
INSERT INTO `t_visitor_record` VALUES (17, 'agent', '113.65.205.124', '外太空', '2025-01-05 20:26:26', 0);
INSERT INTO `t_visitor_record` VALUES (18, 'agent', '113.65.205.124', '外太空', '2025-01-06 14:55:07', 0);
INSERT INTO `t_visitor_record` VALUES (19, 'agent', '113.65.205.124', '外太空', '2025-01-06 15:54:45', 0);
INSERT INTO `t_visitor_record` VALUES (20, 'agent', '113.65.205.124', '外太空', '2025-01-06 21:34:57', 0);
INSERT INTO `t_visitor_record` VALUES (21, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:14:59', 0);
INSERT INTO `t_visitor_record` VALUES (22, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:29:18', 0);
INSERT INTO `t_visitor_record` VALUES (23, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:39:54', 0);
INSERT INTO `t_visitor_record` VALUES (24, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:43:00', 0);
INSERT INTO `t_visitor_record` VALUES (25, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:46:52', 0);
INSERT INTO `t_visitor_record` VALUES (26, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:51:04', 0);
INSERT INTO `t_visitor_record` VALUES (27, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:53:59', 0);
INSERT INTO `t_visitor_record` VALUES (28, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:57:17', 0);
INSERT INTO `t_visitor_record` VALUES (29, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:58:37', 0);
INSERT INTO `t_visitor_record` VALUES (30, 'agent', '113.65.205.124', '外太空', '2025-01-06 23:59:35', 0);
INSERT INTO `t_visitor_record` VALUES (31, 'agent', '113.65.205.124', '外太空', '2025-01-07 00:08:09', 0);
INSERT INTO `t_visitor_record` VALUES (32, 'agent', '113.65.205.124', '外太空', '2025-01-07 00:10:04', 0);
INSERT INTO `t_visitor_record` VALUES (33, 'agent', '113.65.205.124', '外太空', '2025-01-07 00:13:45', 0);
INSERT INTO `t_visitor_record` VALUES (34, 'agent', '192.168.31.39', '外太空', '2025-01-07 00:31:51', 0);
INSERT INTO `t_visitor_record` VALUES (35, 'agent', '192.168.31.39', '外太空', '2025-01-07 00:34:39', 0);
INSERT INTO `t_visitor_record` VALUES (36, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 00:37:18', 0);
INSERT INTO `t_visitor_record` VALUES (37, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 12:11:59', 0);
INSERT INTO `t_visitor_record` VALUES (38, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 12:14:44', 0);
INSERT INTO `t_visitor_record` VALUES (39, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:03:03', 0);
INSERT INTO `t_visitor_record` VALUES (40, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:32:54', 0);
INSERT INTO `t_visitor_record` VALUES (41, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:36:37', 0);
INSERT INTO `t_visitor_record` VALUES (42, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:37:37', 0);
INSERT INTO `t_visitor_record` VALUES (43, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:37:53', 0);
INSERT INTO `t_visitor_record` VALUES (44, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:43:34', 0);
INSERT INTO `t_visitor_record` VALUES (45, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:49:16', 0);
INSERT INTO `t_visitor_record` VALUES (46, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:51:14', 0);
INSERT INTO `t_visitor_record` VALUES (47, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:54:42', 0);
INSERT INTO `t_visitor_record` VALUES (48, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:55:28', 0);
INSERT INTO `t_visitor_record` VALUES (49, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 13:59:30', 0);
INSERT INTO `t_visitor_record` VALUES (50, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:03:56', 0);
INSERT INTO `t_visitor_record` VALUES (51, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:04:26', 0);
INSERT INTO `t_visitor_record` VALUES (52, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:06:04', 0);
INSERT INTO `t_visitor_record` VALUES (53, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:09:00', 0);
INSERT INTO `t_visitor_record` VALUES (54, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:09:27', 0);
INSERT INTO `t_visitor_record` VALUES (55, 'agent', '192.168.31.39', '中国-浙江省-杭州市-HDU', '2025-01-07 14:10:32', 0);
INSERT INTO `t_visitor_record` VALUES (56, 'agent', '192.168.1.226', '中国-浙江省-杭州市-HDU', '2025-01-09 21:16:09', 0);
INSERT INTO `t_visitor_record` VALUES (57, 'agent', '192.168.1.226', '中国-浙江省-杭州市-HDU', '2025-01-09 21:22:54', 0);
INSERT INTO `t_visitor_record` VALUES (58, 'agent', '192.168.1.226', '中国-浙江省-杭州市-HDU', '2025-01-09 21:30:29', 0);
INSERT INTO `t_visitor_record` VALUES (59, 'agent', '192.168.1.226', '中国-浙江省-杭州市-HDU', '2025-01-09 21:39:51', 0);
INSERT INTO `t_visitor_record` VALUES (60, 'agent', '192.168.1.226', '中国-浙江省-杭州市-HDU', '2025-01-09 21:43:32', 0);
INSERT INTO `t_visitor_record` VALUES (61, 'agent', '192.168.1.226', '中国-浙江省-杭州市-HDU', '2025-01-09 21:50:10', 0);

SET FOREIGN_KEY_CHECKS = 1;
