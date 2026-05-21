/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : loopyouthbeifen

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 23/12/2025 23:15:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add 商品', 6, 'add_goodsinfo');
INSERT INTO `auth_permission` VALUES (17, 'Can change 商品', 6, 'change_goodsinfo');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 商品', 6, 'delete_goodsinfo');
INSERT INTO `auth_permission` VALUES (19, 'Can add 商品类型', 7, 'add_typeinfo');
INSERT INTO `auth_permission` VALUES (20, 'Can change 商品类型', 7, 'change_typeinfo');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 商品类型', 7, 'delete_typeinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can add 评论回复', 8, 'add_contentchart');
INSERT INTO `auth_permission` VALUES (23, 'Can change 评论回复', 8, 'change_contentchart');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 评论回复', 8, 'delete_contentchart');
INSERT INTO `auth_permission` VALUES (25, 'Can add 商品评论', 9, 'add_goodscontent');
INSERT INTO `auth_permission` VALUES (26, 'Can change 商品评论', 9, 'change_goodscontent');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 商品评论', 9, 'delete_goodscontent');
INSERT INTO `auth_permission` VALUES (28, 'Can add 用户信息', 10, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can change 用户信息', 10, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 用户信息', 10, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can add 用户浏览记录', 11, 'add_goodsbrowser');
INSERT INTO `auth_permission` VALUES (32, 'Can change 用户浏览记录', 11, 'change_goodsbrowser');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 用户浏览记录', 11, 'delete_goodsbrowser');
INSERT INTO `auth_permission` VALUES (34, 'Can add 用户消息', 12, 'add_information');
INSERT INTO `auth_permission` VALUES (35, 'Can change 用户消息', 12, 'change_information');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 用户消息', 12, 'delete_information');
INSERT INTO `auth_permission` VALUES (37, 'Can add 退款订单', 13, 'add_tuihuoinfo');
INSERT INTO `auth_permission` VALUES (38, 'Can change 退款订单', 13, 'change_tuihuoinfo');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 退款订单', 13, 'delete_tuihuoinfo');
INSERT INTO `auth_permission` VALUES (40, 'Can add session', 14, 'add_session');
INSERT INTO `auth_permission` VALUES (41, 'Can change session', 14, 'change_session');
INSERT INTO `auth_permission` VALUES (42, 'Can delete session', 14, 'delete_session');
INSERT INTO `auth_permission` VALUES (43, 'Can add 购物车', 15, 'add_cartinfo');
INSERT INTO `auth_permission` VALUES (44, 'Can change 购物车', 15, 'change_cartinfo');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 购物车', 15, 'delete_cartinfo');
INSERT INTO `auth_permission` VALUES (46, 'Can add 付款订单', 16, 'add_orderdetailinfo');
INSERT INTO `auth_permission` VALUES (47, 'Can change 付款订单', 16, 'change_orderdetailinfo');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 付款订单', 16, 'delete_orderdetailinfo');
INSERT INTO `auth_permission` VALUES (49, 'Can add 未付款订单', 17, 'add_orderinfo');
INSERT INTO `auth_permission` VALUES (50, 'Can change 未付款订单', 17, 'change_orderinfo');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 未付款订单', 17, 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES (52, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (53, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (54, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (55, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (56, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (57, 'Can view session', 14, 'view_session');
INSERT INTO `auth_permission` VALUES (58, 'Can view 购物车', 15, 'view_cartinfo');
INSERT INTO `auth_permission` VALUES (59, 'Can view 商品', 6, 'view_goodsinfo');
INSERT INTO `auth_permission` VALUES (60, 'Can view 商品类型', 7, 'view_typeinfo');
INSERT INTO `auth_permission` VALUES (61, 'Can view 评论回复', 8, 'view_contentchart');
INSERT INTO `auth_permission` VALUES (62, 'Can view 商品评论', 9, 'view_goodscontent');
INSERT INTO `auth_permission` VALUES (63, 'Can view 用户信息', 10, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (64, 'Can view 用户浏览记录', 11, 'view_goodsbrowser');
INSERT INTO `auth_permission` VALUES (65, 'Can view 用户消息', 12, 'view_information');
INSERT INTO `auth_permission` VALUES (66, 'Can view 付款订单', 16, 'view_orderdetailinfo');
INSERT INTO `auth_permission` VALUES (67, 'Can view 未付款订单', 17, 'view_orderinfo');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员密码',
  `last_login` datetime(6) NULL DEFAULT NULL COMMENT '最后登录时间',
  `is_superuser` tinyint(1) NOT NULL COMMENT '是否为超级用户',
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员昵称',
  `first_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '名字',
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '姓氏',
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '邮箱',
  `is_staff` tinyint(1) NOT NULL COMMENT '是否为用户',
  `is_active` tinyint(1) NOT NULL COMMENT '状态',
  `date_joined` datetime(6) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$X6LBNEYkr1Jk0FAsvRQgfZ$z0Hx9CDxzUJLNEmX0DGqgGoF9DA0iT5d8lQhRSRsatk=', '2025-12-23 23:10:54.147992', 1, 'admin', '', '', '1940027703@qq.com', 1, 1, '2025-12-01 22:00:15.000000');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$600000$bwjsObDBPe9OHhFKbBG4Yj$QpslMXdzGsyxTS70fKOp3VU1GXaYBZ6lHrfItX0lIFo=', NULL, 1, '57EVER', '', '', '1940027705@qq.com', 1, 1, '2025-12-21 06:27:40.572318');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for df_cart_cartinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_cart_cartinfo`;
CREATE TABLE `df_cart_cartinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `count` int NOT NULL COMMENT '数量',
  `goods_id` int NOT NULL COMMENT '商品编号',
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df_cart_cartinfo_goods_id_4357294f_fk_df_goods_goodsinfo_id`(`goods_id` ASC) USING BTREE,
  INDEX `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `df_cart_cartinfo_goods_id_4357294f_fk_df_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_cart_cartinfo
-- ----------------------------
INSERT INTO `df_cart_cartinfo` VALUES (11, 1, 26, 9);
INSERT INTO `df_cart_cartinfo` VALUES (16, 1, 45, 2);

-- ----------------------------
-- Table structure for df_goods_contentchart
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_contentchart`;
CREATE TABLE `df_goods_contentchart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `isDelete` tinyint(1) NOT NULL,
  `ctitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cusername` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cusername1` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ccontent_chart` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `ccontent_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df_goods_contentchar_ccontent_id_b10a0757_fk_df_goods_`(`ccontent_id` ASC) USING BTREE,
  CONSTRAINT `df_goods_contentchar_ccontent_id_b10a0757_fk_df_goods_` FOREIGN KEY (`ccontent_id`) REFERENCES `df_goods_goodscontent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_goods_contentchart
-- ----------------------------

-- ----------------------------
-- Table structure for df_goods_goodscontent
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodscontent`;
CREATE TABLE `df_goods_goodscontent`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `isDelete` tinyint(1) NOT NULL COMMENT '是否删除',
  `ctitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名',
  `cpic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '评论图片',
  `cusername` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论用户',
  `clogo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论用户头像',
  `cuser_content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `date_publish` datetime(6) NOT NULL COMMENT '发布时间',
  `cgoodsname_id` int NOT NULL COMMENT '被评论商品编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df_goods_goodsconten_cgoodsname_id_a19f6072_fk_df_goods_`(`cgoodsname_id` ASC) USING BTREE,
  CONSTRAINT `df_goods_goodsconten_cgoodsname_id_a19f6072_fk_df_goods_` FOREIGN KEY (`cgoodsname_id`) REFERENCES `df_goods_goodsinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_goods_goodscontent
-- ----------------------------
INSERT INTO `df_goods_goodscontent` VALUES (5, 0, '软工案例', '', 'user2', 'images/SCNU001用户头像.jpg', '非常好 五星好评', '2025-12-15 16:14:34.363864', 28);
INSERT INTO `df_goods_goodscontent` VALUES (6, 0, 'casio ccd相机', 'df_goods/image/2025/12/微信图片_20251220200135.jpg', 'user1', 'images/user1头像.jpg', '卖家非常细心，相机包装的很好，可以正常使用，大胆冲', '2025-12-20 20:01:50.538353', 45);

-- ----------------------------
-- Table structure for df_goods_goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodsinfo`;
CREATE TABLE `df_goods_goodsinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `isDelete` tinyint(1) NOT NULL COMMENT '是否删除',
  `gtitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名',
  `gpic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `gprice` decimal(7, 2) NOT NULL COMMENT '商品价格',
  `gunit` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '卖家昵称',
  `gclick` int NOT NULL COMMENT '点击数',
  `gjianjie` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '简介',
  `gkucun` int NOT NULL COMMENT '库存',
  `gcontent` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详情',
  `gtype_id` int NOT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `df_goods_goodsinfo_gtitle_8ec0f32b_uniq`(`gtitle` ASC) USING BTREE,
  INDEX `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id`(`gtype_id` ASC) USING BTREE,
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_typeinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_goods_goodsinfo
-- ----------------------------
INSERT INTO `df_goods_goodsinfo` VALUES (26, 0, '人机交互二手书', 'df_goods/image/2025/12/15/微信图片_20251212130009.jpg', 15.00, 'user1', 2, '自用', 2, '自带笔记', 1);
INSERT INTO `df_goods_goodsinfo` VALUES (27, 0, '东野圭吾《秘密》', 'df_goods/image/2025/12/15/东野圭吾秘密.jpg', 40.00, 'user1', 6, '东野圭吾最具争议作品', 2, '全新', 1);
INSERT INTO `df_goods_goodsinfo` VALUES (28, 0, '软工案例', 'df_goods/image/2025/12/15/软件工程案例.jpg', 25.00, 'user1', 6, '自用', 1, '六成新，带笔记', 1);
INSERT INTO `df_goods_goodsinfo` VALUES (29, 0, '滑板', 'df_goods/image/2025/12/15/滑板.jpg', 199.00, 'user1', 1, '八成新', 1, '私聊小刀', 4);
INSERT INTO `df_goods_goodsinfo` VALUES (30, 0, '滑板车', 'df_goods/image/2025/12/15/滑板车.jpg', 99.00, 'user1', 2, '便宜出', 1, '不接受小刀', 4);
INSERT INTO `df_goods_goodsinfo` VALUES (31, 0, '迪卡侬自行车', 'df_goods/image/2025/12/15/自行车.jpg', 1199.00, 'user1', 2, '全新线下店购买', 2, '私聊', 4);
INSERT INTO `df_goods_goodsinfo` VALUES (32, 0, 'suica限量公交卡', 'df_goods/image/2025/12/15/suica限量公交卡.jpg', 40.00, 'user1', 0, '限量版', 10, '日版', 4);
INSERT INTO `df_goods_goodsinfo` VALUES (33, 0, '水洗外套', 'df_goods/image/2025/12/15/clothes1.jpg', 399.00, 'user1', 0, 'xl码', 1, '<p>全新</p>', 3);
INSERT INTO `df_goods_goodsinfo` VALUES (34, 0, '座山雕外套', 'df_goods/image/2025/12/15/clothes2.jpg', 499.00, 'user1', 0, 'm码', 1, '加绒', 3);
INSERT INTO `df_goods_goodsinfo` VALUES (35, 0, '复古美式夹克', 'df_goods/image/2025/12/15/clothes3.jpg', 199.00, 'user1', 0, '八成新 xl码', 1, '<p>私聊</p>', 3);
INSERT INTO `df_goods_goodsinfo` VALUES (36, 0, '板鞋', 'df_goods/image/2025/12/15/板鞋.jpg', 199.00, 'user1', 1, '42码', 0, '全新未暇', 3);
INSERT INTO `df_goods_goodsinfo` VALUES (37, 0, '美的三筒', 'df_goods/image/2025/12/15/洗衣机.jpg', 2999.00, 'user1', 0, '1', 1, '<p>1</p>', 2);
INSERT INTO `df_goods_goodsinfo` VALUES (38, 0, '智能榨汁机', 'df_goods/image/2025/12/15/智能榨汁机.jpg', 299.00, 'user1', 0, '1', 1, '1', 2);
INSERT INTO `df_goods_goodsinfo` VALUES (39, 0, '电吹风', 'df_goods/image/2025/12/15/电吹风.jpg', 19.00, 'user1', 0, '1', 1, '1', 2);
INSERT INTO `df_goods_goodsinfo` VALUES (40, 0, '电药壶', 'df_goods/image/2025/12/15/电药壶.jpg', 49.00, 'user1', 1, '1', 1, '1', 2);
INSERT INTO `df_goods_goodsinfo` VALUES (41, 0, '电吉他', 'df_goods/image/2025/12/15/电吉他.jpg', 3999.00, 'user1', 0, '1', 1, '1', 5);
INSERT INTO `df_goods_goodsinfo` VALUES (42, 0, '小提琴', 'df_goods/image/2025/12/15/小提琴.jpg', 899.00, 'user1', 0, '1', 1, '1', 5);
INSERT INTO `df_goods_goodsinfo` VALUES (43, 0, '笛子', 'df_goods/image/2025/12/15/笛子.jpg', 59.00, 'user1', 0, '1', 1, '1', 5);
INSERT INTO `df_goods_goodsinfo` VALUES (44, 0, '电子琴', 'df_goods/image/2025/12/15/电子琴.jpg', 899.00, 'user1', 0, '1', 1, '1', 5);
INSERT INTO `df_goods_goodsinfo` VALUES (45, 0, 'casio ccd相机', 'df_goods/image/2025/12/15/casio.jpg', 399.00, 'user2', 5, '十年前生产的', 0, '可以正常使用', 6);
INSERT INTO `df_goods_goodsinfo` VALUES (46, 0, '平板电脑', 'df_goods/image/2025/12/23/微信图片_20251223222900.jpg', 4999.00, 'user1', 0, '1', 2, '1', 6);
INSERT INTO `df_goods_goodsinfo` VALUES (47, 0, '手机', 'df_goods/image/2025/12/23/微信图片_20251223222934.jpg', 3999.00, 'user1', 0, '1', 11, '1', 6);
INSERT INTO `df_goods_goodsinfo` VALUES (48, 0, '耳机', 'df_goods/image/2025/12/23/微信图片_20251223223018.jpg', 1799.00, 'user1', 0, '11', 111, '1', 6);
INSERT INTO `df_goods_goodsinfo` VALUES (49, 0, '计算机网络实验', 'df_goods/image/2025/12/23/微信图片_20251223223105.jpg', 15.00, 'user1', 0, '1', 23, '1', 1);

-- ----------------------------
-- Table structure for df_goods_typeinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_typeinfo`;
CREATE TABLE `df_goods_typeinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `isDelete` tinyint(1) NOT NULL,
  `ttitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_goods_typeinfo
-- ----------------------------
INSERT INTO `df_goods_typeinfo` VALUES (1, 0, '书籍');
INSERT INTO `df_goods_typeinfo` VALUES (2, 0, '家电');
INSERT INTO `df_goods_typeinfo` VALUES (3, 0, '衣物');
INSERT INTO `df_goods_typeinfo` VALUES (4, 0, '出行');
INSERT INTO `df_goods_typeinfo` VALUES (5, 0, '乐器');
INSERT INTO `df_goods_typeinfo` VALUES (6, 0, '智能');

-- ----------------------------
-- Table structure for df_order_orderdetailinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_order_orderdetailinfo`;
CREATE TABLE `df_order_orderdetailinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(6, 2) NOT NULL,
  `count` int NOT NULL,
  `goods_id` int NOT NULL,
  `order_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `datatime` datetime(6) NOT NULL,
  `shopername` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df_order_orderdetail_goods_id_d0acef4d_fk_df_goods_`(`goods_id` ASC) USING BTREE,
  INDEX `df_order_orderdetail_order_id_b91dcf67_fk_df_order_`(`order_id` ASC) USING BTREE,
  CONSTRAINT `df_order_orderdetail_goods_id_d0acef4d_fk_df_goods_` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` FOREIGN KEY (`order_id`) REFERENCES `df_order_orderinfo` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_order_orderdetailinfo
-- ----------------------------
INSERT INTO `df_order_orderdetailinfo` VALUES (10, 25.00, 1, 28, '202512151614042', '2025-12-15 16:14:04.938948', 'user1', 'user2');
INSERT INTO `df_order_orderdetailinfo` VALUES (11, 199.00, 1, 36, '202512170030567', '2025-12-17 00:30:56.668371', 'user1', 'user1');
INSERT INTO `df_order_orderdetailinfo` VALUES (12, 399.00, 1, 45, '202512201959537', '2025-12-20 19:59:53.575967', 'user2', 'user1');

-- ----------------------------
-- Table structure for df_order_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_order_orderinfo`;
CREATE TABLE `df_order_orderinfo`  (
  `oid` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号',
  `odate` datetime(6) NOT NULL COMMENT '订单时间',
  `oIsPay` tinyint(1) NOT NULL COMMENT '是否支付',
  `ototal` decimal(8, 2) NOT NULL COMMENT '总价格',
  `oaddress` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收货地址',
  `user_id` int NOT NULL COMMENT '下单用户id',
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_order_orderinfo
-- ----------------------------
INSERT INTO `df_order_orderinfo` VALUES ('202512151614042', '2025-12-15 16:14:04.936747', 0, 35.00, '广东佛山', 2);
INSERT INTO `df_order_orderinfo` VALUES ('202512170030567', '2025-12-17 00:30:56.664086', 0, 209.00, '广东深圳', 7);
INSERT INTO `df_order_orderinfo` VALUES ('202512201959537', '2025-12-20 19:59:53.575967', 0, 409.00, '广东深圳', 7);

-- ----------------------------
-- Table structure for df_user_goodsbrowser
-- ----------------------------
DROP TABLE IF EXISTS `df_user_goodsbrowser`;
CREATE TABLE `df_user_goodsbrowser`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `browser_time` datetime(6) NOT NULL COMMENT '浏览时间',
  `good_id` int NOT NULL COMMENT '商品编号',
  `user_id` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df_user_goodsbrowser_good_id_81bbd6f5_fk_df_goods_goodsinfo_id`(`good_id` ASC) USING BTREE,
  INDEX `df_user_goodsbrowser_user_id_b7a661a4_fk_df_user_userinfo_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `df_user_goodsbrowser_good_id_81bbd6f5_fk_df_goods_goodsinfo_id` FOREIGN KEY (`good_id`) REFERENCES `df_goods_goodsinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `df_user_goodsbrowser_user_id_b7a661a4_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_user_goodsbrowser
-- ----------------------------
INSERT INTO `df_user_goodsbrowser` VALUES (34, '2025-12-15 16:14:38.374334', 28, 2);
INSERT INTO `df_user_goodsbrowser` VALUES (35, '2025-12-15 16:16:00.758656', 30, 2);
INSERT INTO `df_user_goodsbrowser` VALUES (36, '2025-12-15 16:16:03.033169', 31, 2);
INSERT INTO `df_user_goodsbrowser` VALUES (37, '2025-12-15 19:20:24.418149', 26, 9);
INSERT INTO `df_user_goodsbrowser` VALUES (41, '2025-12-17 00:30:40.505347', 36, 7);
INSERT INTO `df_user_goodsbrowser` VALUES (42, '2025-12-20 19:49:28.964815', 27, 7);
INSERT INTO `df_user_goodsbrowser` VALUES (43, '2025-12-20 19:49:33.637009', 26, 7);
INSERT INTO `df_user_goodsbrowser` VALUES (44, '2025-12-20 20:01:54.241814', 45, 7);
INSERT INTO `df_user_goodsbrowser` VALUES (45, '2025-12-20 19:58:59.428993', 45, 2);
INSERT INTO `df_user_goodsbrowser` VALUES (46, '2025-12-23 22:50:10.284255', 40, 7);

-- ----------------------------
-- Table structure for df_user_information
-- ----------------------------
DROP TABLE IF EXISTS `df_user_information`;
CREATE TABLE `df_user_information`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `isDelete` tinyint(1) NOT NULL COMMENT '是否删除',
  `ctitle` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `cusername` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '买家名称',
  `cusername1` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '卖家名称',
  `ccontent_chart` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息内容',
  `ccheck` tinyint(1) NOT NULL COMMENT '消息是否已读',
  `date_publish` datetime(6) NOT NULL COMMENT '发送时间',
  `cinformation_id` int NOT NULL COMMENT '消息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df_user_information_cinformation_id_ead36b05_fk_df_user_u`(`cinformation_id` ASC) USING BTREE,
  CONSTRAINT `df_user_information_cinformation_id_ead36b05_fk_df_user_u` FOREIGN KEY (`cinformation_id`) REFERENCES `df_user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_user_information
-- ----------------------------
INSERT INTO `df_user_information` VALUES (2, 0, '问下老板，这个python书籍包邮吗？', 'user1', 'user2', '我想买这个书可以包邮吗，最近手里紧！', 1, '2025-12-14 20:43:12.000000', 2);
INSERT INTO `df_user_information` VALUES (3, 0, '', 'user2', 'user1', '可以的，你拍吧，亲', 1, '2025-12-14 20:43:42.000000', 7);
INSERT INTO `df_user_information` VALUES (4, 0, '', 'user2', 'user1', '拍了今天给你发货哦！', 1, '2025-12-14 20:46:16.000000', 7);
INSERT INTO `df_user_information` VALUES (5, 0, '这个自行车轮子尺寸多大？', 'user1', 'user2', '我儿子15岁可以骑吗，他1米6了', 1, '2025-12-14 23:04:29.000000', 2);
INSERT INTO `df_user_information` VALUES (6, 0, '', 'user2', 'user1', '可以，轮子适合它！', 1, '2025-12-14 23:05:22.000000', 7);
INSERT INTO `df_user_information` VALUES (7, 0, '', 'user2', 'user1', '我想要两颗西柚', 1, '2025-12-15 14:27:06.000000', 7);
INSERT INTO `df_user_information` VALUES (8, 0, '男款短袖', 'user1', 'user2', '在吗在吗', 1, '2025-12-15 16:25:14.000000', 2);
INSERT INTO `df_user_information` VALUES (9, 0, '', 'user2', 'user1', '在的呀', 1, '2025-12-15 16:30:28.000000', 7);
INSERT INTO `df_user_information` VALUES (10, 0, '我想要两颗西柚', 'user1', 'user2', '这本书好看吗\r\n', 1, '2025-12-16 14:07:57.000000', 2);
INSERT INTO `df_user_information` VALUES (11, 0, '榨汁机', 'zhenght', 'user2', '榨汁机还有吗', 1, '2025-12-16 14:57:38.000000', 2);
INSERT INTO `df_user_information` VALUES (12, 0, '', 'user2', 'user1', '亲亲，ccd还在吗？', 1, '2025-12-20 19:53:50.704267', 7);
INSERT INTO `df_user_information` VALUES (13, 0, '', 'user2', 'user1', '可以刀20块钱吗 可以面交', 1, '2025-12-20 19:54:24.289890', 7);
INSERT INTO `df_user_information` VALUES (14, 0, '', 'user1', 'user2', 'ok 我修改下价格 你拍吧', 1, '2025-12-20 19:55:34.937955', 2);

-- ----------------------------
-- Table structure for df_user_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_user_userinfo`;
CREATE TABLE `df_user_userinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名',
  `upwd` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户密码',
  `uemail` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户邮箱',
  `ushou` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户收货地址',
  `uaddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户地址',
  `uyoubian` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户邮编',
  `uphone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户手机号码',
  `uage` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户年龄',
  `ucheck_passOrfail` tinyint(1) NOT NULL COMMENT '是否通过后台认证',
  `ulogo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户头像',
  `uname_passOrfail` tinyint(1) NOT NULL COMMENT '是否允许登录',
  `upersonInf` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '个人简介',
  `urealname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户真实姓名',
  `usex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户性别',
  `uzhengjian_img` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户证件图',
  `uzhengjian_tel` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户证件号',
  `uzhengjian_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户证件类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `df_user_userinfo_uemail_da079075_uniq`(`uemail` ASC) USING BTREE,
  UNIQUE INDEX `df_user_userinfo_uname_feb27ea0_uniq`(`uname` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of df_user_userinfo
-- ----------------------------
INSERT INTO `df_user_userinfo` VALUES (2, 'user2', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2222222@qq.com', 'ybw', '广东佛山', '000000', '12341234123', '21', 0, 'images/SCNU001用户头像.jpg', 1, '啦啦啦', 'Jack', '男', 'images/zhengjian_img/IMG_20200908_095453_JHFuswa.jpg', '123456123412241234', '身份证');
INSERT INTO `df_user_userinfo` VALUES (5, '123aaa', '7c4a8d09ca3762af61e59520943dc26494f8941b', '33333@163.com', '', '', '', '', '', 0, 'default.jpg', 1, '', '', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES (6, 'customer', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4444444@qq.com', '', '', '', '', '', 0, 'default.jpg', 1, '', '', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES (7, 'user1', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'test@126.com', '张三', '广东深圳', 'test@1', '13511112222', '24', 1, 'images/user1头像.jpg', 1, 'hehe', '张三', '男', 'images/zhengjian_img/18.jpg', '513031199210213943', '大陆身份证');
INSERT INTO `df_user_userinfo` VALUES (8, 'zhenght', '7c4a8d09ca3762af61e59520943dc26494f8941b', '123456@qq.com', '李四', '广东珠海', '515434', '124314124', '23', 0, 'images/default_ijGWSou.jpg', 1, 'HAHA', '信息', '女', 'images/zhengjian_img/default.jpg', '123456123412241234', '身份证');
INSERT INTO `df_user_userinfo` VALUES (9, 'user3', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1940027705@qq.com', '赵六', '广东肇庆·', '', '', '', 0, 'default.jpg', 1, '', '', '', '', '', '');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `action_time` datetime(6) NOT NULL COMMENT '操作时间',
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '操作对象id',
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '操作对象的描述',
  `action_flag` smallint UNSIGNED NOT NULL COMMENT '操作类型',
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '详细说明',
  `content_type_id` int NULL DEFAULT NULL COMMENT '操作对象模块类型',
  `user_id` int NOT NULL COMMENT '操作者id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2025-11-29 22:05:15.000000', '1', '书籍', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-11-29 22:05:24.000000', '2', '家电', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2025-11-29 22:09:31.000000', '3', '衣物', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2025-11-29 22:15:39.000000', '4', '出行', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (5, '2025-11-30 00:05:46.000000', '5', '乐器', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (6, '2025-11-30 00:09:51.000000', '6', '智能', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (7, '2025-12-03 15:30:38.000000', '1', '123456', 2, '[{\"changed\": {\"fields\": [\"usex\", \"uage\", \"upersonInf\", \"ulogo\", \"urealname\", \"uzhengjian_type\", \"uzhengjian_tel\", \"uzhengjian_img\", \"ucheck_passOrfail\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (8, '2025-12-03 20:13:19.000000', '2', 'user2', 2, '[{\"changed\": {\"fields\": [\"usex\", \"uage\", \"upersonInf\", \"ulogo\", \"urealname\", \"uzhengjian_type\", \"uzhengjian_tel\", \"uzhengjian_img\", \"ushou\", \"uaddress\", \"uyoubian\", \"uphone\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (9, '2025-12-03 20:37:23.000000', '1', '三国演义', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (10, '2025-12-03 20:44:47.000000', '2345678909876', '碎花裙', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (11, '2025-12-03 21:11:04.000000', '1', '三国演义', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (12, '2025-12-04 22:53:14.000000', '4', 'python编程', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (13, '2025-12-04 22:54:36.000000', '1', '三国演义', 2, '[{\"changed\": {\"fields\": [\"gpic\", \"gcontent\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (14, '2025-12-04 22:55:17.000000', '3', '裙子', 2, '[{\"changed\": {\"fields\": [\"gpic\", \"gcontent\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (15, '2025-12-04 22:55:30.000000', '2', '热水壶', 2, '[{\"changed\": {\"fields\": [\"gpic\", \"gcontent\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (16, '2025-12-04 22:55:58.000000', '1', '三国演义', 2, '[{\"changed\": {\"fields\": [\"gpic\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (17, '2025-12-04 23:15:09.000000', '1', '三国演义', 2, '[{\"changed\": {\"fields\": [\"gpic\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (18, '2025-12-04 23:15:23.000000', '4', 'python编程', 2, '[{\"changed\": {\"fields\": [\"gpic\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (19, '2025-12-04 23:15:35.000000', '3', '裙子', 2, '[{\"changed\": {\"fields\": [\"gpic\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (20, '2025-12-04 23:15:46.000000', '2', '热水壶', 2, '[{\"changed\": {\"fields\": [\"gpic\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (21, '2025-12-04 23:16:44.000000', '2', 'SCNU001', 2, '[{\"changed\": {\"fields\": [\"ulogo\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (22, '2025-12-04 20:31:49.000000', '7', 'user1', 2, '[{\"changed\": {\"fields\": [\"ucheck_passOrfail\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (23, '2025-12-15 15:38:45.486569', '3', '裙子', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (24, '2025-12-15 15:38:45.496916', '2', '热水壶', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (25, '2025-12-15 15:39:26.990307', '25', '摇摇车', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (26, '2025-12-15 15:39:27.000881', '24', '榨汁机小型', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (27, '2025-12-15 15:39:27.008894', '23', '洗衣机', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (28, '2025-12-15 15:39:27.015655', '22', '电动打蛋器', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (29, '2025-12-15 15:39:27.022286', '18', '陆地冲浪板', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (30, '2025-12-15 15:39:27.029933', '17', '女溜冰鞋', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (31, '2025-12-15 15:39:27.036437', '16', '电瓶车头盔', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (32, '2025-12-15 15:39:27.042439', '15', 't恤男夏季', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (33, '2025-12-15 15:39:27.046698', '14', '甜辣正肩短袖', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (34, '2025-12-15 15:39:27.052393', '13', '正肩短袖', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (35, '2025-12-15 15:39:27.057659', '12', '古琴', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (36, '2025-12-15 15:39:27.062473', '11', '卡林巴琴', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (37, '2025-12-15 15:39:27.065787', '10', '小提琴', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (38, '2025-12-15 15:39:27.070693', '7', '自行车', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (39, '2025-12-15 15:39:27.074694', '6', '琵琶', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (40, '2025-12-15 15:50:58.855432', '33', '水洗外套', 2, '[{\"changed\": {\"fields\": [\"\\u8be6\\u60c5\", \"\\u5206\\u7c7b\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (41, '2025-12-15 15:52:52.668379', '35', '复古美式夹克', 2, '[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u540d\\u79f0\", \"\\u8be6\\u60c5\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (42, '2025-12-15 15:58:31.113547', '37', '美的三筒', 2, '[{\"changed\": {\"fields\": [\"\\u8be6\\u60c5\", \"\\u5206\\u7c7b\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (43, '2025-12-15 16:07:35.536606', '1', '活着', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (44, '2025-12-15 16:13:39.413305', '202306071422238', 'zhenght在的订单2023-06-07 14:22:23.137234', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (45, '2025-12-15 16:13:39.422291', '2345678909876', 'user2在的订单2023-06-05 22:33:47', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (46, '2025-12-15 16:13:39.428486', '202306042203392', 'user2在的订单2023-06-04 22:03:39.090212', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (47, '2025-12-15 16:13:39.434697', '202208302306177', 'user1在的订单2023-06-03 23:06:17', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (48, '2025-12-15 16:13:39.439788', '202208302047597', 'user1在的订单2023-06-03 20:47:59', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (49, '2025-12-23 20:36:59.747666', '21', '红米手环2', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (50, '2025-12-23 20:36:59.756354', '20', '蓝牙音响', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (51, '2025-12-23 20:36:59.764334', '19', '蓝牙耳机', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (52, '2025-12-23 20:36:59.768531', '9', '新西游记', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (53, '2025-12-23 20:36:59.776839', '8', '我想要两颗西柚', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (54, '2025-12-23 20:36:59.781883', '5', '笔记本', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (55, '2025-12-23 20:36:59.789668', '4', '被讨厌的勇气', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (56, '2025-12-23 20:36:59.794789', '1', '活着', 3, '', 6, 1);
INSERT INTO `django_admin_log` VALUES (57, '2025-12-23 23:11:36.201032', '1', '123456', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (58, '2025-12-23 23:13:27.010600', '8', 'zhenght', 2, '[{\"changed\": {\"fields\": [\"\\u7528\\u6237\\u5934\\u50cf\", \"\\u771f\\u5b9e\\u59d3\\u540d\", \"\\u8bc1\\u4ef6\\u7c7b\\u578b\", \"\\u8bc1\\u4ef6\\u53f7\\u7801\", \"\\u8bc1\\u4ef6\\u56fe\\u7247\", \"\\u624b\\u673a\\u53f7\"]}}]', 10, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模块标签',
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (15, 'df_cart', 'cartinfo');
INSERT INTO `django_content_type` VALUES (8, 'df_goods', 'contentchart');
INSERT INTO `django_content_type` VALUES (9, 'df_goods', 'goodscontent');
INSERT INTO `django_content_type` VALUES (6, 'df_goods', 'goodsinfo');
INSERT INTO `django_content_type` VALUES (7, 'df_goods', 'typeinfo');
INSERT INTO `django_content_type` VALUES (16, 'df_order', 'orderdetailinfo');
INSERT INTO `django_content_type` VALUES (17, 'df_order', 'orderinfo');
INSERT INTO `django_content_type` VALUES (11, 'df_user', 'goodsbrowser');
INSERT INTO `django_content_type` VALUES (12, 'df_user', 'information');
INSERT INTO `django_content_type` VALUES (13, 'df_user', 'tuihuoinfo');
INSERT INTO `django_content_type` VALUES (10, 'df_user', 'userinfo');
INSERT INTO `django_content_type` VALUES (14, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-11-27 21:57:41.000000');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-11-27 21:57:43.000000');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2025-12-01 21:57:44.000000');
INSERT INTO `django_migrations` VALUES (14, 'df_goods', '0001_initial', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (15, 'df_goods', '0002_auto_20251127_2157', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (16, 'df_user', '0001_initial', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (17, 'df_user', '0002_auto_20251127_2157', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (18, 'df_cart', '0001_initial', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (19, 'df_cart', '0002_auto_20251127_2157', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (20, 'df_order', '0001_initial', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (21, 'df_order', '0002_auto_20251127_2157', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (22, 'sessions', '0001_initial', '2025-12-01 21:59:14.000000');
INSERT INTO `django_migrations` VALUES (23, 'admin', '0003_logentry_add_action_flag_choices', '2025-12-01 19:56:10.000000');
INSERT INTO `django_migrations` VALUES (24, 'auth', '0010_alter_group_name_max_length', '2025-12-01 19:56:10.000000');
INSERT INTO `django_migrations` VALUES (25, 'auth', '0011_update_proxy_permissions', '2025-12-03 19:56:10.000000');
INSERT INTO `django_migrations` VALUES (26, 'df_goods', '0003_auto_20251203_1632', '2025-12-03 19:56:10.000000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '键值',
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '数据',
  `expire_date` datetime(6) NOT NULL COMMENT '有效期',
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2c3rh6wsy51m4wn3xcyg2dlg9y02jgnz', 'MDE0NjVkNDQ5N2ZlYjQ3MjdlZmNmZTdiZGZhOWQ0NGY2YmQyNDE5ODp7InZlcmlmeWNvZGUiOiJDZThqIiwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoiMTIzNDU2In0=', '2025-12-19 22:32:17.000000');
INSERT INTO `django_session` VALUES ('7y3lu8nbdiklr7nemypnc218lzdcts67', 'OTE2NmZjYmQ4NDkzOTRiMmU4MzI3YzY4MDA3NmFkNTVmMDVhZDE5ODp7InZlcmlmeWNvZGUiOiJiYTZ2IiwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiU1RVMDAxIn0=', '2025-12-19 20:45:58.000000');
INSERT INTO `django_session` VALUES ('86prr8v8loycal9pwo8pufozjttb1r26', '.eJzFVk2PmzAQ_SsR5zRgY2zYY--Vemh7KSvkz4Q2QGVgV6tV_ns9Ia0KQQuEtrnYwvP8mHlvBvHqPWmbmxdZKe09eJ--PH30tl7G2-aQtbW2Wa7cMeqfCS6_6xIC6hsv99VOVmVjc7EDyO4SrXcfHOfx_QXbIzjw-uBuJzHmCUUcMy5JGATYMIGV0ohopLDCjBFGBcaE4DgRJCQ4CCMU0lAxJCRhQFrosq0d19fX1Ct5oVPvYZN6adpGEaGwEYlSb-vOcpdlFzXcbgx_J3Mrj7oLFpBrDeGVRK09djGfqyIvfWWyfVWp2j-veWkqvwNypT5PYx3qghdWcyVtW4i1aZ62mxWXHyGscwVR5DybYEtbJpmAJxaLNfo1Lz_0TPl-Q--g3pJ6h1qGk9yxa_vzJvjqXoSh1WUztx1_we-i6fy6h5qS7iB71vn-0MBh0AegkZezCMduozhk674dfxKlLTEaiqEBNbe5Bx9PH5bJQegj53s2v_IJ2ZZUO_SMTnJTRQz0QyLjri0C6BUTRSt0PXe5sNUzPExq20PfRd9bNRiqza4mBPUB0UgqseAYXhfOkvyNCSFanWsSoV5MO-JkZZXz47wq3fD8ODkp4zfmOzo_5REZb61-6GEywk0Z5v9U4CXS_k9RVxY-0BYFV_OB--LHY_Ph_l9hYjFN4MlQum5MbuIbsU9y2_iwTJrXRy6wbmmmf0O9oWf4yrOwD0CnR-_0Ez8gDew:1vXttO:VFDEHNUU1hH-di9_tmHg7a7MACNpDSnmhMe45JIGDJY', '2026-01-06 12:21:02.763808');
INSERT INTO `django_session` VALUES ('8e7v0q5a9wwaz9nuog4t3wcshp03vt50', 'eyJ2ZXJpZnljb2RlIjoiQ0dXSCJ9:1vXtem:KlA03z3R4tEdWLU5NPHvTOrg09rGWQeSz9c4PwYY5MQ', '2026-01-06 12:05:56.445890');
INSERT INTO `django_session` VALUES ('b3kmpt0ahayuaxpb1a507lb3fn2kwwze', 'M2U3NDBjMTQ3MmY2ODc2ZGUyZWYyMDVkMTViOTg3ZTI1N2QzNjcxZDp7InZlcmlmeWNvZGUiOiJzM25lIiwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiU1RVMDAxIn0=', '2025-12-19 21:26:34.000000');
INSERT INTO `django_session` VALUES ('b5thlybj2uu5l9vpmkos0aali3ot5cvl', 'eyJ2ZXJpZnljb2RlIjoibGZxdSJ9:1vXtUz:4MaEWAOhH5GFmgxVKUvZJFsH9T91Aog-xUW5ijGHyWY', '2026-01-06 11:55:49.124929');
INSERT INTO `django_session` VALUES ('cfj9ma48ql8uohbxpmz8fa9ppbubr6ik', 'YzdhODYyOTBhYWNiOTgwMTcxNjU1NzFlOWFiZDc3NGRlMDNjYzYwZTp7InZlcmlmeWNvZGUiOiI1SDM2IiwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiU1RVMDAxIn0=', '2025-12-20 17:33:58.000000');
INSERT INTO `django_session` VALUES ('dpq6f4hp9irg9dmn641y8in06mb513hm', 'eyJ2ZXJpZnljb2RlIjoiOVRNYiJ9:1vTvwL:H-ncyf2WXZoTafvvjn_1gjUy5kW7MldtZGgiOFIfLSc', '2025-12-26 13:43:41.376914');
INSERT INTO `django_session` VALUES ('ff2eumbnydhk267bnsih7rdj5na3m0en', 'MDA2MGQ2MGYxMmY4N2Q5NWU0OTc5Njk1MWJiZWNjYjE4MWExN2YyNzp7InZlcmlmeWNvZGUiOiJaOUk0In0=', '2025-12-20 23:24:50.000000');
INSERT INTO `django_session` VALUES ('g8t1ly16x2tio1x7hgh3panuee7we7tr', 'eyJ2ZXJpZnljb2RlIjoibkpBMyJ9:1vXtJ5:nAB1BaCKrKZgcj1BNjVrs8yt7UO5ut1qrK9DYcBo5gE', '2026-01-06 11:43:31.328103');
INSERT INTO `django_session` VALUES ('kv6vp2ndbtgg9lrvtbvuoj0os7t1ix96', 'eyJ2ZXJpZnljb2RlIjoiTTZ5MyJ9:1vXtWH:ubYNqwMnItWQXA5Pt_T7R2kPPtf0LoYlTk6XKHsWN_Q', '2026-01-06 11:57:09.479637');
INSERT INTO `django_session` VALUES ('lblfzzzn3kn5m0hpzk3c0dhih2s0pb4e', 'eyJ2ZXJpZnljb2RlIjoiQjlUWCJ9:1vXtap:eMZ_D2nVnJ0rjhCCH-A9Bz1yjWEK1JBrPHo2sJhiDIE', '2026-01-06 12:01:51.620684');
INSERT INTO `django_session` VALUES ('n8f1hoovumlv70bn0vgwn3xaqxk5px3v', 'ODJkZTNjZWU5OTI5MGVhODMzMTM5MDQyN2Y4ZjBjNWZlM2FiYTBmZDp7InZlcmlmeWNvZGUiOiJzOG53In0=', '2025-12-21 22:15:36.000000');
INSERT INTO `django_session` VALUES ('pk21a5y5nb6wje0tjpv0uryzw4dl9wfm', 'eyJ2ZXJpZnljb2RlIjoiMHM0aiJ9:1vXteC:XitRqWB4A6L_GiB4Qz8lM2GBShVE02S9-RmNGIrZRXc', '2026-01-06 12:05:20.760134');
INSERT INTO `django_session` VALUES ('r77y2lr3jgau7rw4vsti3a8o8wry26oq', 'eyJ2ZXJpZnljb2RlIjoiUUQwcCJ9:1vXtS7:4EnVB0uCGEYQLkZtUjsiIpE0FySN5x0fSoKZNlvu8mM', '2026-01-06 11:52:51.154146');
INSERT INTO `django_session` VALUES ('ufv2sk50kozyu678b35j8hm2lxxvp2r4', 'eyJ2ZXJpZnljb2RlIjoiRUw1aCJ9:1vXteK:WdZB8YrhmNePg57L8oKdHfMXZlC64hkvE6fO17GljkM', '2026-01-06 12:05:28.172501');
INSERT INTO `django_session` VALUES ('vz3ww7gfletulri43nbgpb75rotrhjk6', 'eyJ2ZXJpZnljb2RlIjoiQjJBZiJ9:1vXtc5:cUEo0eKPI38SFWJsk4WkCLXiIdYuvs0uHs1kMjGtZd4', '2025-12-21 12:03:09.000000');
INSERT INTO `django_session` VALUES ('wdhe5t9vi1353wfnz6d5ype5bdaj33df', '.eJzFVsuumzAQ_ZXI6zTgBzZk2U0XVZddlSvkFwltgIpHr66u8u_1hPSqEFQgtM3Gxp7j8cw5Mxav6IetsvRFl8aiPfpAPwq0RW1tqyQzaC-u34XMwQzf2NkT2TbH5A2FBntK6m-2AIP5KotDudNl0VSZ2gFkd7XWu0_uztP7K7bn4CjrozsdhURGHEsipGbU90kqFDHGYmaxIYYIwQRXhDBGwkgxyohPA0w5NQIrzSCTJLdFWztfX15jBFnEaL-JURy3QcA4TEzjGG3dXuai7KyprDapfKezSp9sZ8wh1hrMKx211amzedLkWeGZNDmUpam9y5gVael1QGnM52msQ13xqrLS6KrN1dowz9vNisNPYLaZASt2mk14i1uhhYKVCNUa_pqX73YmfW_QB7C3JN8hl3TSd-jK_jIpuboWoWlt0cwtx1_wh3A6P-8hp6zbSJ5tdjg2sOn3AXjkchGQ0E2cULHu7fjdUdyy1EIy3OfpferB4-nBMNkIfeR8zeZnPkHbkmyHmvFJ39ywFOoh0mFXFj7UShoEK3i9VLmqymdYTHLbQz-E33s5GLItbjoE9wHBSCihkgSuo7Mo_0OHMGsuOSlqF7sdUbKsjNPjMhrbyOw02SnjJ-YrOj_kERrvzX6oYTTimwsi_ynBS6j9n6SuTHzALfZv-oP0yQ_H-sP9v0LHEh7BKuV8XZvc5W9EPi2rxoNhUrw-coF0SyP9G-wNNSM3mtE-AJ-f0PknSt0X4Q:1vY42I:4fJG7At6i3NNVmJnYKIzReFhxGjXQfxq635x8AkHlqI', '2026-01-06 23:10:54.196685');
INSERT INTO `django_session` VALUES ('ww02czbadrt061c8xvt3ewcyan7l0qjp', 'OGVkMmNiZTQ3OWU2YThkZDUwNmQyNzhmNDAwMWI3N2Q4ODZhMDA1MDp7InZlcmlmeWNvZGUiOiJZRzJZIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZmNTkyNzY0MTA1MTI4MjVkN2MxYzJhMjkyOWI5YTg5MzQ3Y2JjNmEiLCJfbWVudXMiOiJbe1wibmFtZVwiOiBcIlxcdTU1NDZcXHU1NGMxXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU1NTQ2XFx1NTRjMVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2RmX2dvb2RzL2dvb2RzaW5mby9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vZGZfZ29vZHMvZ29vZHNpbmZvL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTU1NDZcXHU1NGMxXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1NTQ2XFx1NTRjMVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwMn0sIHtcIm5hbWVcIjogXCJcXHU1NTQ2XFx1NTRjMVxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vZGZfZ29vZHMvdHlwZWluZm8vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2RmX2dvb2RzL3R5cGVpbmZvL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTU1NDZcXHU1NGMxXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU1NTQ2XFx1NTRjMVxcdTdjN2JcXHU1NzhiXCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDAzfSwge1wibmFtZVwiOiBcIlxcdTU1NDZcXHU1NGMxXFx1OGJjNFxcdThiYmFcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9kZl9nb29kcy9nb29kc2NvbnRlbnQvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2RmX2dvb2RzL2dvb2RzY29udGVudC9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU1NTQ2XFx1NTRjMVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NTU0NlxcdTU0YzFcXHU4YmM0XFx1OGJiYVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9XSwgXCJlaWRcIjogMTAwNH1dLCBcIl93ZWlnaHRcIjogMCwgXCJlaWRcIjogMTAwMX0sIHtcIm5hbWVcIjogXCJcXHU3NTI4XFx1NjIzN1wiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU0ZmUxXFx1NjA2ZlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2RmX3VzZXIvdXNlcmluZm8vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2RmX3VzZXIvdXNlcmluZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XFx1NGZlMVxcdTYwNmZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDZ9LCB7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcXHU2ZDRmXFx1ODljOFxcdThiYjBcXHU1ZjU1XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vZGZfdXNlci9nb29kc2Jyb3dzZXIvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2RmX3VzZXIvZ29vZHNicm93c2VyL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU3NTI4XFx1NjIzN1xcdTZkNGZcXHU4OWM4XFx1OGJiMFxcdTVmNTVcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMDd9LCB7XCJuYW1lXCI6IFwiXFx1OTAwMFxcdTZiM2VcXHU4YmEyXFx1NTM1NVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCIsIFwidXJsXCI6IFwiL2FkbWluL2RmX3VzZXIvdHVpaHVvaW5mby9cIiwgXCJhZGRVcmxcIjogXCIvYWRtaW4vZGZfdXNlci90dWlodW9pbmZvL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdTc1MjhcXHU2MjM3XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn0sIHtcIm5hbWVcIjogXCJcXHU5MDAwXFx1NmIzZVxcdThiYTJcXHU1MzU1XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDA4fV0sIFwiX3dlaWdodFwiOiAxLCBcImVpZFwiOiAxMDA1fSwge1wibmFtZVwiOiBcIlxcdThiYTJcXHU1MzU1XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU0ZWQ4XFx1NmIzZVxcdThiYTJcXHU1MzU1XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJ1cmxcIjogXCIvYWRtaW4vZGZfb3JkZXIvb3JkZXJkZXRhaWxpbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9kZl9vcmRlci9vcmRlcmRldGFpbGluZm8vYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhMlxcdTUzNTVcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifSwge1wibmFtZVwiOiBcIlxcdTRlZDhcXHU2YjNlXFx1OGJhMlxcdTUzNTVcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTB9LCB7XCJuYW1lXCI6IFwiXFx1NjcyYVxcdTRlZDhcXHU2YjNlXFx1OGJhMlxcdTUzNTVcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9kZl9vcmRlci9vcmRlcmluZm8vXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2RmX29yZGVyL29yZGVyaW5mby9hZGQvXCIsIFwiYnJlYWRjcnVtYnNcIjogW3tcIm5hbWVcIjogXCJcXHU4YmEyXFx1NTM1NVwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1NjcyYVxcdTRlZDhcXHU2YjNlXFx1OGJhMlxcdTUzNTVcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwifV0sIFwiZWlkXCI6IDEwMTF9XSwgXCJfd2VpZ2h0XCI6IDIsIFwiZWlkXCI6IDEwMDl9LCB7XCJuYW1lXCI6IFwiXFx1OGQyZFxcdTcyNjlcXHU4ZjY2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIiwgXCJtb2RlbHNcIjogW3tcIm5hbWVcIjogXCJcXHU4ZDJkXFx1NzI2OVxcdThmNjZcIiwgXCJpY29uXCI6IFwiZmFyIGZhLWNpcmNsZVwiLCBcInVybFwiOiBcIi9hZG1pbi9kZl9jYXJ0L2NhcnRpbmZvL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9kZl9jYXJ0L2NhcnRpbmZvL2FkZC9cIiwgXCJicmVhZGNydW1ic1wiOiBbe1wibmFtZVwiOiBcIlxcdThkMmRcXHU3MjY5XFx1OGY2NlwiLCBcImljb25cIjogXCJmYXIgZmEtY2lyY2xlXCJ9LCB7XCJuYW1lXCI6IFwiXFx1OGQyZFxcdTcyNjlcXHU4ZjY2XCIsIFwiaWNvblwiOiBcImZhciBmYS1jaXJjbGVcIn1dLCBcImVpZFwiOiAxMDEzfV0sIFwiX3dlaWdodFwiOiAzLCBcImVpZFwiOiAxMDEyfSwge1wibmFtZVwiOiBcIlxcdThiYTRcXHU4YmMxXFx1NTQ4Y1xcdTYzODhcXHU2NzQzXCIsIFwiaWNvblwiOiBcImZhcyBmYS1zaGllbGQtYWx0XCIsIFwibW9kZWxzXCI6IFt7XCJuYW1lXCI6IFwiXFx1NzUyOFxcdTYyMzdcIiwgXCJpY29uXCI6IFwiZmFyIGZhLXVzZXJcIiwgXCJ1cmxcIjogXCIvYWRtaW4vYXV0aC91c2VyL1wiLCBcImFkZFVybFwiOiBcIi9hZG1pbi9hdXRoL3VzZXIvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIn0sIHtcIm5hbWVcIjogXCJcXHU3NTI4XFx1NjIzN1wiLCBcImljb25cIjogXCJmYXIgZmEtdXNlclwifV0sIFwiZWlkXCI6IDEwMTV9LCB7XCJuYW1lXCI6IFwiXFx1N2VjNFwiLCBcImljb25cIjogXCJmYXMgZmEtdXNlcnMtY29nXCIsIFwidXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCIsIFwiYWRkVXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvYWRkL1wiLCBcImJyZWFkY3J1bWJzXCI6IFt7XCJuYW1lXCI6IFwiXFx1OGJhNFxcdThiYzFcXHU1NDhjXFx1NjM4OFxcdTY3NDNcIiwgXCJpY29uXCI6IFwiZmFzIGZhLXNoaWVsZC1hbHRcIn0sIHtcIm5hbWVcIjogXCJcXHU3ZWM0XCIsIFwiaWNvblwiOiBcImZhcyBmYS11c2Vycy1jb2dcIn1dLCBcImVpZFwiOiAxMDE2fV0sIFwiX3dlaWdodFwiOiA0LCBcImVpZFwiOiAxMDE0fV0iLCJ1c2VyX2lkIjo3LCJ1c2VyX25hbWUiOiJ1c2VyMSJ9', '2025-12-21 23:01:15.000000');
INSERT INTO `django_session` VALUES ('x8bekptqix68sgp69v49uuk5zghbqubz', 'eyJ2ZXJpZnljb2RlIjoiRGRDVSJ9:1vXteu:pviBrDanaWax7PdnW4p2aS2q5qVdNo97yAOcVK2OLRw', '2026-01-06 12:06:04.538998');
INSERT INTO `django_session` VALUES ('xc7y9y93lpotcrvizxqjmj6nojt5dgxm', '.eJyrVipLLcpMq0zOT0lVslLKyzUIUtJRKi1OLYrPTFGyMoey8xJzQdIgtqFSLQDlORGx:1vUgo5:IXEtoh4PxHTlGSn4-RlRGsTBmmLL2sVmlk0YYceip94', '2025-12-28 15:46:17.023941');
INSERT INTO `django_session` VALUES ('xl40nxazuf383bpyfs9wzvrkpyuu5b93', 'eyJ2ZXJpZnljb2RlIjoiS0JxSSJ9:1vXtbI:ydaFxHW8m_eMQWDGQMrhqNdizIO345r3d3YExLE7evA', '2026-01-06 12:02:20.149200');
INSERT INTO `django_session` VALUES ('yr32ydm9kq16hdjm9ekbxm8d0juayq6i', 'MTU3ZWMwNzdmZGU0NjIxZjFhZjQwZjY3ZmE5MWFmMGNlZDYzNzljMzp7InZlcmlmeWNvZGUiOiI0dXFTIiwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiU1RVMDAxIn0=', '2025-12-23 14:59:31.000000');
INSERT INTO `django_session` VALUES ('z55c373kfzpv7qua7n4dvqhhhxdiwv7s', '.eJzFVk2PmzAQ_SuRz2nAxtiQY-_dW09lFfkzcZtAxceuVqv893pCuiosWiC0zcXGnufxzHszFq_oyZTOvqhCG7RFD0_uAa1RU5ly5zTa8ut3Lk5ghm_s7TvR1IfdGwr19qRQP0wOBv1d5Ptio4q8Lp3cAGRztVabL_7O4-crtuPgIKqDP50mRKQMC8KFolEYEssl0dpgarAmmnBOOZOEUEqSVNKIkjCKccQizbFUlIPTk8mbyvv69pohyCJD21WGsqyJY8pgogpnaO33nI-ytVpRrqz4pFypjqY1niDWCswLHTXlsbUFQp9cHmi72xeFroLL6HJbBC1QaP11HOtRV7wsjdCqbE5yaZjn9WrB4UcwG6fBir1mI96yhisuYcUTuYS_-uWnmUjfG_QO7M3Jt89lNOo78WV_maRYXIvQtCavp5bjb_hdOJ2ed59T2m7sno3bH2rYDLsAPHA5j0niJ0Yivuzt-NNR1lBrIBkWMnubevB4BjCMNkIXOV2z6ZmP0DYn275mbNQ309RCPaQqacsihFqxcbyA10uVy7J4hsUotx30Xfi9lYM-2_xdh-AuIB4IJZGCwHXRJMo_6BBq9CUnGZnZbgeULErt9biM2tTCHUc7ZfjEdEWnhzxA463Z9zVMB3wzTsQ_JXgOtf-T1IWJ97jF4bv-IF3yk6H-8P-v0LGEpbCyjC1rk5v8DcinRFkHMIyK10XOkG5upH-Dvb5m5J1mUReAz4_o_AvEZRhg:1vY3Tm:t4-DTnyng9YfVlJAvOiqxrAvrShg7z_q_157XvblMgk', '2026-01-06 22:35:14.931669');
INSERT INTO `django_session` VALUES ('zt3m4a7bjby6rtstyq6nknbdk7dk2ssn', 'YTcxYjI0ZTkwOWQ5M2U2MWE0ODczMTQxZGE5ODM5NjE5ZDQ3NGMzNzp7InZlcmlmeWNvZGUiOiJzM1RzIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImM3YmI2MGNiZGI1YzYxYTc3ZjA1ZjU5ZGNiMDQ3NDlmZTYxMzFmZmYifQ==', '2025-12-23 10:01:05.000000');

SET FOREIGN_KEY_CHECKS = 1;
