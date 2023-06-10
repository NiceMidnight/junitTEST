/*
 Navicat MySQL Data Transfer

 Source Server         : J2EE
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : jj

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 31/05/2023 17:48:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `customer_phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户手机号',
  `customer_email` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户邮箱',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '客户A', '广州航海学院', '12345678901', '12345678901@163.com');
INSERT INTO `customer` VALUES (2, '客户B', '广州航海学院', '12345678901', '12345678901@163.com');
INSERT INTO `customer` VALUES (3, '客户C', '广州航海学院', '12345678901', '12345678901@163.com');
INSERT INTO `customer` VALUES (4, '客户D', '广州航海学院', '12345678901', '12345678901@163.com');
INSERT INTO `customer` VALUES (5, '客户E', '广州航海学院', '12345678901', '12345678901@163.com');
INSERT INTO `customer` VALUES (6, '客户F', '广州航海学院', '12345678901', '12345678901@163.com');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `dict_id` int NOT NULL AUTO_INCREMENT COMMENT '角色字典id',
  `dict_type_code` int NULL DEFAULT NULL COMMENT '角色类型id',
  `dict_type_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色类型',
  `dict_item_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 1, '商品类别', '平板');
INSERT INTO `dict` VALUES (2, 2, '商品类别', '电脑');
INSERT INTO `dict` VALUES (3, 3, '商品类别', '手机');
INSERT INTO `dict` VALUES (4, 1, 'role', '系统管理员');
INSERT INTO `dict` VALUES (5, 2, 'role', '仓库经理');
INSERT INTO `dict` VALUES (6, 3, 'role', '系统操作员');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int NOT NULL AUTO_INCREMENT COMMENT '职工id',
  `employee_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职工名字',
  `employee_password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `employee_sex` int NULL DEFAULT NULL COMMENT '性别',
  `employee_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职工电话',
  `employee_role` int NULL DEFAULT NULL COMMENT '职工角色类型id',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '系统管理员A', '123', 1, '11111', 1);
INSERT INTO `employee` VALUES (2, '经理B', '123', 1, '22222', 2);
INSERT INTO `employee` VALUES (3, '系统操作员C', '123', 1, '33333', 3);

-- ----------------------------
-- Table structure for in_data
-- ----------------------------
DROP TABLE IF EXISTS `in_data`;
CREATE TABLE `in_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_num` int NULL DEFAULT NULL,
  `in_order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of in_data
-- ----------------------------

-- ----------------------------
-- Table structure for in_order
-- ----------------------------
DROP TABLE IF EXISTS `in_order`;
CREATE TABLE `in_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '入库号',
  `order_date` datetime(0) NULL DEFAULT NULL COMMENT '入库时间',
  `order_supplier_id` int NULL DEFAULT NULL COMMENT '供货商id',
  `order_storage_id` int NULL DEFAULT NULL COMMENT '仓库id',
  `order_employee_id` int NULL DEFAULT NULL COMMENT '系统操作员id',
  `order_product_id` int NULL DEFAULT NULL COMMENT '产品id',
  `order_product_num` int NULL DEFAULT NULL COMMENT '产品数量',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `1`(`order_supplier_id`) USING BTREE,
  INDEX `2`(`order_storage_id`) USING BTREE,
  INDEX `3`(`order_product_id`) USING BTREE,
  CONSTRAINT `1` FOREIGN KEY (`order_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `2` FOREIGN KEY (`order_storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `3` FOREIGN KEY (`order_product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of in_order
-- ----------------------------
INSERT INTO `in_order` VALUES (1, '2023-05-30 00:00:00', 1, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (2, '2023-05-30 00:00:00', 2, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (3, '2023-05-30 00:00:00', 4, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (4, '2023-05-30 00:00:00', 5, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (5, '2023-06-02 00:00:00', 1, 1, 1, 1, 10);
INSERT INTO `in_order` VALUES (6, '2023-06-02 00:00:00', 3, 1, 1, 1, 10);
INSERT INTO `in_order` VALUES (7, '2023-06-03 00:00:00', 3, 1, 1, 4, 5);
INSERT INTO `in_order` VALUES (8, '2023-06-04 00:00:00', 4, 2, 1, 4, 10);
INSERT INTO `in_order` VALUES (9, '2023-06-04 00:00:00', 4, 1, 1, 1, 10);
INSERT INTO `in_order` VALUES (10, '2023-06-05 00:00:00', 6, 1, 1, 3, 10);
INSERT INTO `in_order` VALUES (11, '2023-06-05 00:00:00', 7, 2, 1, 1, 5);
INSERT INTO `in_order` VALUES (12, '2023-06-05 00:00:00', 2, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (13, '2023-06-06 00:00:00', 1, 1, 1, 1, 5);
INSERT INTO `in_order` VALUES (14, '2023-06-07 00:00:00', 1, 1, 1, 7, 15);

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `product_id` int NOT NULL COMMENT '产品id',
  `storage_id` int NOT NULL COMMENT '仓库id',
  `product_num` int NULL DEFAULT NULL COMMENT '产品数量',
  PRIMARY KEY (`product_id`, `storage_id`) USING BTREE,
  INDEX `storage_id`(`storage_id`) USING BTREE,
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `storage_id` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`storage_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (1, 1, 10);
INSERT INTO `inventory` VALUES (1, 2, 35);
INSERT INTO `inventory` VALUES (2, 1, 4);
INSERT INTO `inventory` VALUES (2, 2, 25);
INSERT INTO `inventory` VALUES (3, 1, 10);
INSERT INTO `inventory` VALUES (3, 2, 22);
INSERT INTO `inventory` VALUES (4, 1, 5);
INSERT INTO `inventory` VALUES (4, 2, 10);
INSERT INTO `inventory` VALUES (5, 1, 4);
INSERT INTO `inventory` VALUES (5, 2, 15);
INSERT INTO `inventory` VALUES (6, 1, 12);
INSERT INTO `inventory` VALUES (6, 2, 3);
INSERT INTO `inventory` VALUES (7, 1, 15);
INSERT INTO `inventory` VALUES (7, 2, 2);

-- ----------------------------
-- Table structure for out_data
-- ----------------------------
DROP TABLE IF EXISTS `out_data`;
CREATE TABLE `out_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `product_num` int NULL DEFAULT NULL,
  `out_order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of out_data
-- ----------------------------

-- ----------------------------
-- Table structure for out_order
-- ----------------------------
DROP TABLE IF EXISTS `out_order`;
CREATE TABLE `out_order`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '出库订单号',
  `order_date` datetime(0) NULL DEFAULT NULL COMMENT '订单创建日期',
  `order_customer_id` int NULL DEFAULT NULL COMMENT '订单所属客户id',
  `order_storage_id` int NULL DEFAULT NULL COMMENT '出库仓库id',
  `order_employee_id` int NULL DEFAULT NULL COMMENT '系统操作员id',
  `order_product_id` int NULL DEFAULT NULL COMMENT '产品id',
  `order_product_num` int NULL DEFAULT NULL COMMENT '产品数量',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of out_order
-- ----------------------------
INSERT INTO `out_order` VALUES (1, '2023-06-01 00:00:00', 1, 1, 1, 1, 20);
INSERT INTO `out_order` VALUES (2, '2023-06-01 00:00:00', 1, 1, 1, 1, 5);
INSERT INTO `out_order` VALUES (3, '2023-06-01 00:00:00', 1, 1, 1, 1, 5);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_type` int NULL DEFAULT NULL COMMENT '商品类别号',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'iPad Pro 11英寸平板电脑', 1);
INSERT INTO `product` VALUES (2, 'iPad9 灰色 64G', 1);
INSERT INTO `product` VALUES (3, '华为笔记本电脑', 1);
INSERT INTO `product` VALUES (4, '惠普笔记本电脑', 2);
INSERT INTO `product` VALUES (5, '机械革命笔记本电脑', 2);
INSERT INTO `product` VALUES (6, '一加 10pro', 3);
INSERT INTO `product` VALUES (7, 'Redmi k60', 3);

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage`  (
  `storage_id` int NOT NULL AUTO_INCREMENT COMMENT '仓库id',
  `storage_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `storage_address` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `storage_phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '仓库电话',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES (1, '货运之星物流仓', '广东省广州市番禺区市桥镇南光大道123号', '0755-1234567');
INSERT INTO `storage` VALUES (2, '灵活物流物流仓', '广东省广州市黄埔区红谷路456号', '0755-1234567');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `supplier_id` int NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `supplier_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `supplier_address` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `supplier_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '供应商电话',
  PRIMARY KEY (`supplier_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '创新之翼有限公司', '广东省广州市黄埔区红山101', '0755-89725050');
INSERT INTO `supplier` VALUES (2, '灵动通讯有限公司', '广东省广州市海珠区江南大道789号', '0755-89725050');
INSERT INTO `supplier` VALUES (3, '无限创新有限公司', '广东省广州市荔湾区解放北路321号', '0755-89725087');
INSERT INTO `supplier` VALUES (4, '时代先锋有限公司', '广东省广州市白云区黄石东路987号', '0755-89725050');
INSERT INTO `supplier` VALUES (5, '数字源泉有限公司', '广东省广州市天河区珠江新城华强路654号', '0755-89725050');
INSERT INTO `supplier` VALUES (6, '极致科技有限公司', '广东省广州市越秀区中山路456号', '0755-89725050');
INSERT INTO `supplier` VALUES (7, '光速通信有限公司', '广东省广州市越秀区中山路496号', '0755-89725050');

SET FOREIGN_KEY_CHECKS = 1;
