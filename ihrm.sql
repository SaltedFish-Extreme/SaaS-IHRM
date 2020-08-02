/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : ihrm

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 02/08/2020 09:30:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bs_city
-- ----------------------------
DROP TABLE IF EXISTS `bs_city`;
CREATE TABLE `bs_city`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_city
-- ----------------------------

-- ----------------------------
-- Table structure for bs_permission
-- ----------------------------
DROP TABLE IF EXISTS `bs_permission`;
CREATE TABLE `bs_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `administrator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `management_module` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_permission
-- ----------------------------

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `enable_state` int(2) NULL DEFAULT 1 COMMENT '启用状态 0是禁用，1是启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `department_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` int(1) NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` int(1) NULL DEFAULT NULL COMMENT '在职状态 1.在职  2.离职',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业ID',
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户级别：saasAdmin，coAdmin，user',
  `staff_photo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_phone`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', '17606396598', '咸鱼', '123456789', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'saasAdmin', NULL);
INSERT INTO `bs_user` VALUES ('1063705482939731968', '13800000001', 'cgx', '88012a09484c94fcec9e65b2377c44b9', NULL, '2018-11-17 16:08:44', '', '2018-11-01 08:00:00', 1, '', NULL, NULL, '2018-11-01 00:00:00', NULL, '', '', '', 'saasAdmin', NULL);
INSERT INTO `bs_user` VALUES ('1063705989926227968', '13800000002', 'aj123', 'c8b7722b1139bb9b346409e503302e82', 1, '2018-11-17 16:10:45', '1066241293639880704', '2018-11-02 08:00:00', 1, '9002', NULL, NULL, '2018-11-30 00:00:00', NULL, '1', '传智播客', 'test1', 'coAdmin', 'http://pkbivgfrm.bkt.clouddn.com/1063705989926227968?t=1545788007343');
INSERT INTO `bs_user` VALUES ('1066370498633486336', '13800000003', 'zbz', '14af10ffa3798486632a79cbbf469376', 1, NULL, '1063678149528784896', '2018-11-04 08:00:00', 1, '111', NULL, NULL, '2018-11-20 00:00:00', NULL, '1', '传智播客', '测试部', 'user', 'http://pkbivgfrm.bkt.clouddn.com/1066370498633486336?t=1545812322518');
INSERT INTO `bs_user` VALUES ('1071632760222810112', '13800000004', 'll', '456134d471010ecba14c6f89cac349ff', 1, NULL, '1063678149528784896', '2018-12-02 08:00:00', 1, '1111', NULL, NULL, '2018-12-31 00:00:00', NULL, '1', '传智播客', '测试部', 'user', NULL);
INSERT INTO `bs_user` VALUES ('1074238801330704384', '13400000001', 'a01', '80069fc2872ce3cf269053f4a84b2f0d', 1, '2018-12-16 17:44:22', '1066240656856453120', '2018-01-01 00:00:00', 1, '1001', NULL, NULL, NULL, 1, '1', '传智播客', '开发部', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1074238801402007552', '13400000002', 'a02', 'a4f6437f96466ff2ad41dc8c46317e7f', 1, '2018-12-16 17:44:23', '1066240656856453120', '2018-01-01 00:00:00', 1, '1002', NULL, NULL, NULL, 1, '1', '传智播客', '开发部', NULL, NULL);
INSERT INTO `bs_user` VALUES ('1075383133106425856', '13500000001', 'test001', 'aa824c0d32d9725482e58a7503a20521', 1, NULL, '1066240656856453120', '2018-01-01 00:00:00', 1, '2001', NULL, NULL, NULL, 1, '1', '传智播客', '开发部', 'user', NULL);
INSERT INTO `bs_user` VALUES ('1075383135371350016', '13500000002', 'test002', 'becc21ed8df7975fc845c6c70f46c2dd', 1, NULL, '1066240656856453120', '2018-01-01 00:00:00', 1, '2002', NULL, NULL, NULL, 1, '1', '传智播客', '开发部', 'user', NULL);
INSERT INTO `bs_user` VALUES ('1075383135459430400', '13500000003', 'test003', '7321b9c9cfaa938abc7408147fc29441', 1, NULL, '1066240656856453120', '2018-01-01 00:00:00', 1, '2003', NULL, NULL, NULL, 1, '1', '传智播客', '开发部', 'user', NULL);
INSERT INTO `bs_user` VALUES ('1286260868039942144', 'demoData', 'demoData', '123456', 1, NULL, 'demoData', NULL, NULL, 'demoData', 'demoData', 'demoData', NULL, NULL, '1', NULL, 'demoData', NULL, NULL);

-- ----------------------------
-- Table structure for co_company
-- ----------------------------
DROP TABLE IF EXISTS `co_company`;
CREATE TABLE `co_company`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `manager_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业登录账号ID',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前版本',
  `renewal_date` datetime(0) NULL DEFAULT NULL COMMENT '续期时间',
  `expiration_date` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `company_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司地区',
  `company_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公司地址',
  `business_license_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '营业执照-图片ID',
  `legal_representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '法人代表',
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司电话',
  `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `company_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司规模',
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属行业',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `audit_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态',
  `state` tinyint(2) NULL DEFAULT 1 COMMENT '状态',
  `balance` double NULL DEFAULT NULL COMMENT '当前余额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of co_company
-- ----------------------------
INSERT INTO `co_company` VALUES ('1', '江苏传智播客教育科技股份有限公司', 'abc', '12', NULL, NULL, NULL, NULL, NULL, '张三', NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '2018-11-07 13:30:05');
INSERT INTO `co_company` VALUES ('1060043412612452352', 'zhangsan', 'abc', '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '2018-11-07 13:36:58');
INSERT INTO `co_company` VALUES ('1061532681482932224', 'zhangsan', 'abc', '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, 0, '2018-11-11 16:14:48');
INSERT INTO `co_company` VALUES ('1065494996154650624', '江苏传智播客教育股份有限公司', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 1, NULL, NULL);

-- ----------------------------
-- Table structure for co_department
-- ----------------------------
DROP TABLE IF EXISTS `co_department`;
CREATE TABLE `co_department`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父级部门ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门编码',
  `manager` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门负责人',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '介绍',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `manager_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of co_department
-- ----------------------------
INSERT INTO `co_department` VALUES ('1063676045212913664', '1', '0', '研发部', 'DEV-TECHNOLOG', '技术部总监', '包含开发部，测试部', '2018-11-17 14:11:45', NULL);
INSERT INTO `co_department` VALUES ('1063678149528784896', '1', '1063676045212913664', '测试部', 'DEPT-TEST', '测试部门领导', '所有测试人员统一划分到测试部', '2018-11-17 14:20:07', NULL);
INSERT INTO `co_department` VALUES ('1066238836272664576', '1', NULL, '财务部', 'DEPT-FIN', '李四', '包含出纳和会计', '2018-11-24 15:55:22', NULL);
INSERT INTO `co_department` VALUES ('1066239766607040512', '1', NULL, '行政中心', 'DEPT-XZ', '张三', '包含人力资源和行政部门', '2018-11-24 15:59:04', NULL);
INSERT INTO `co_department` VALUES ('1066239913642561536', '1', '1066239766607040512', '人力资源部', 'DEPT-HR', '李四', '人力资源部', '2018-11-24 15:59:39', NULL);
INSERT INTO `co_department` VALUES ('1066240303092076544', '1', '1066239766607040512', '行政部', 'DEPT-XZ', '王五', '行政部', '2018-11-24 16:01:12', NULL);
INSERT INTO `co_department` VALUES ('1066240656856453120', '1', '1063676045212913664', '开发部', 'DEPT-DEV', '研发', '全部java开发人员', '2018-11-24 16:02:37', NULL);
INSERT INTO `co_department` VALUES ('1066241293639880704', '1', '1066238836272664576', 'test1', 'test2', 'test', 'test4', '2018-11-24 16:05:08', NULL);
INSERT INTO `co_department` VALUES ('1066296800727531520', '1', NULL, 'ttt', 'ttt', 'ttt', 'ttt', NULL, NULL);
INSERT INTO `co_department` VALUES ('1066296884038991872', '1', NULL, 'aaa', 'aa', 'aa', 'aa', NULL, NULL);
INSERT INTO `co_department` VALUES ('1286135151188807680', '1', 'demoData', 'demoData', 'demoData', 'demoData', 'demoData', NULL, 'demoData');
INSERT INTO `co_department` VALUES ('1286136038011473920', '1', 'demoData', 'demoData', 'demoData', 'demoData', 'demoData', NULL, 'demoData');
INSERT INTO `co_department` VALUES ('1286136286586900480', '1', 'demoData', 'demoData', 'demoData', 'demoData', 'demoData', NULL, 'demoData');

-- ----------------------------
-- Table structure for co_transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `co_transaction_record`;
CREATE TABLE `co_transaction_record`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int(2) NOT NULL,
  `amount` double NOT NULL,
  `balance` double NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of co_transaction_record
-- ----------------------------

-- ----------------------------
-- Table structure for em_archive
-- ----------------------------
DROP TABLE IF EXISTS `em_archive`;
CREATE TABLE `em_archive`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `op_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作用户',
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '月份',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `totals` int(8) NOT NULL DEFAULT 0 COMMENT '总人数',
  `payrolls` int(8) NOT NULL DEFAULT 0 COMMENT '在职人数',
  `departures` int(8) NOT NULL DEFAULT 0 COMMENT '离职人数',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '数据',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_archive
-- ----------------------------

-- ----------------------------
-- Table structure for em_positive
-- ----------------------------
DROP TABLE IF EXISTS `em_positive`;
CREATE TABLE `em_positive`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工ID',
  `date_of_correction` datetime(0) NULL DEFAULT NULL COMMENT '转正日期',
  `correction_evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转正评价',
  `enclosure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件',
  `estatus` int(2) NOT NULL COMMENT '单据状态 1是未执行，2是已执行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_positive
-- ----------------------------
INSERT INTO `em_positive` VALUES ('1063705989926227968', '2018-12-23 08:00:00', '111', NULL, 1, '2018-12-15 21:45:10');

-- ----------------------------
-- Table structure for em_resignation
-- ----------------------------
DROP TABLE IF EXISTS `em_resignation`;
CREATE TABLE `em_resignation`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `resignation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type_of_turnover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '离职类型',
  `reasons_for_leaving` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请离职原因',
  `compensation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补偿金',
  `notifications` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '代通知金',
  `social_security_reduction_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社保减员月',
  `provident_fund_reduction_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公积金减员月',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_resignation
-- ----------------------------
INSERT INTO `em_resignation` VALUES ('1063705989926227968', '2018-02-05', '主动离职', NULL, '100', '100', '离职日本月', '离职日次月', NULL, '2018-12-16 20:49:26');

-- ----------------------------
-- Table structure for em_transferposition
-- ----------------------------
DROP TABLE IF EXISTS `em_transferposition`;
CREATE TABLE `em_transferposition`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位',
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职级',
  `reporting_object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '汇报对象',
  `hrbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'HRBP',
  `adjustment_time` datetime(0) NOT NULL COMMENT '调岗时间',
  `cause_of_adjusting_post` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调岗原因',
  `enclosure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件 [1,2,3]',
  `form_of_management` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `taxable_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纳税城市',
  `current_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同开始时间',
  `closing_time_of_current_contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同结束时间',
  `working_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作地点',
  `initial_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同开始时间',
  `first_contract_termination_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同结束时间',
  `contract_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同期限',
  `renewal_number` int(8) NULL DEFAULT NULL COMMENT '续签次数',
  `recommender_business_people` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推荐企业人',
  `estatus` int(2) NOT NULL COMMENT '单据状态 1是未执行，2是已执行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_transferposition
-- ----------------------------
INSERT INTO `em_transferposition` VALUES ('1063705989926227968', '', '', '', '', '2018-12-03 08:00:00', 'aaaaa', '', '', '', '', '2018-12-03', '2018-12-04', '', '', '', '12月', 1, '', 1, '2018-12-15 22:01:08');

-- ----------------------------
-- Table structure for em_user_company
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company`;
CREATE TABLE `em_user_company`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `department_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '在职状态 1.在职  2.离职',
  `state` tinyint(2) NOT NULL DEFAULT 1 COMMENT '启用状态',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_user_company
-- ----------------------------

-- ----------------------------
-- Table structure for em_user_company_jobs
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company_jobs`;
CREATE TABLE `em_user_company_jobs`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工ID',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业ID',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位',
  `work_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作邮箱',
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职级',
  `correction_evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转正评价',
  `report_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '汇报对象',
  `report_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state_of_correction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转正状态',
  `hrbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'hrbp',
  `working_time_for_the_first_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次参加工作时间',
  `adjustment_agedays` int(8) NULL DEFAULT NULL COMMENT '调整司龄天',
  `adjustment_of_length_of_service` int(8) NULL DEFAULT NULL COMMENT '调整工龄天',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `taxable_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纳税城市',
  `current_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同开始时间',
  `closing_time_of_current_contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同结束时间',
  `initial_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同开始时间',
  `first_contract_termination_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同结束时间',
  `contract_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同期限',
  `contract_documents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同文件',
  `renewal_number` int(8) NULL DEFAULT NULL COMMENT '续签次数',
  `other_recruitment_channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他招聘渠道',
  `recruitment_channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '招聘渠道',
  `social_recruitment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社招校招',
  `recommender_business_people` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推荐企业人',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_user_company_jobs
-- ----------------------------
INSERT INTO `em_user_company_jobs` VALUES ('1063705989926227968', '1', '文员', NULL, NULL, NULL, NULL, NULL, NULL, '1066370498633486336', NULL, 1, NULL, NULL, NULL, '2018-12-25', '2018-12-21', '2018-12-03', '2018-12-04', '6月', NULL, 1, '拉勾网', '猎头', '社招', '百度');

-- ----------------------------
-- Table structure for em_user_company_personal
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company_personal`;
CREATE TABLE `em_user_company_personal`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time_of_entry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司ID',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `date_of_birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出生日期',
  `the_highest_degree_of_education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最高学历',
  `national_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家地区',
  `passport_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '护照号',
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_card_photo_positive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证照片-正面',
  `id_card_photo_back` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证照片-背面',
  `native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '籍贯',
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '民族',
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名',
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `staff_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工照片',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `zodiac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属相',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年龄',
  `constellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星座',
  `blood_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血型',
  `domicile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户籍所在地',
  `political_outlook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `time_to_join_the_party` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入党时间',
  `archiving_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存档机构',
  `state_of_children` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子女状态',
  `do_children_have_commercial_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子女有无商业保险',
  `is_there_any_violation_of_law_or_discipline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有无违法违纪行为',
  `are_there_any_major_medical_histories` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有无重大病史',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信',
  `residence_card_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住证城市',
  `date_of_residence_permit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住证办理日期',
  `residence_permit_deadline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住证截止日期',
  `place_of_residence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现居住地',
  `postal_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `contact_the_mobile_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `personal_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emergency_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergency_contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '紧急联系电话',
  `social_security_computer_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社保电脑号',
  `provident_fund_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公积金账号',
  `bank_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `opening_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户行',
  `educational_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历类型',
  `graduate_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `enrolment_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入学时间',
  `graduation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业时间',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `graduation_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业证书',
  `certificate_of_academic_degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学位证书',
  `home_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上家公司',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职称',
  `resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简历',
  `is_there_any_competition_restriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有无竞业限制',
  `proof_of_departure_of_former_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前公司离职证明',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_user_company_personal
-- ----------------------------
INSERT INTO `em_user_company_personal` VALUES ('1', 'test1', '13000000001', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('101', 'test101', '13000000101', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('102', 'test102', '13000000102', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('103', 'test103', '13000000103', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('104', 'test104', '13000000104', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('105', 'test105', '13000000105', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('106', 'test106', '13000000106', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('1063705989926227955', 'a02', '13400000002', '2018-02-03', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('1063705989926227961', 'a02', '13400000002', '2018-02-03', '开发部', '1', '', '', '初中', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('1063705989926227968', 'aj123', '13800000002', '2018-11-02T00:00:00.000+0000', 'test1', '1', NULL, NULL, '中专', '港澳台国外', '001', '001', NULL, NULL, '香港', NULL, NULL, '未婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('107', 'test107', '13000000107', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('1074238801402007552', 'a02', '13400000002', '2018-02-01', '开发部', '1', NULL, NULL, '初中', '中国大陆', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('1074238801402007555', 'a02', '13400000002', '2018-02-01', '开发部', '1', '', '', '初中', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `em_user_company_personal` VALUES ('108', 'test108', '13000000108', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('109', 'test109', '13000000109', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('11', 'test11', '13000000011', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('110', 'test110', '13000000110', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('12', 'test12', '13000000012', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('13', 'test13', '13000000013', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('14', 'test14', '13000000014', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('15', 'test15', '13000000015', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('16', 'test16', '13000000016', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('17', 'test17', '13000000017', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('18', 'test18', '13000000018', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('19', 'test19', '13000000019', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('2', 'test2', '13000000002', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('20', 'test20', '13000000020', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('21', 'test21', '13000000021', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('22', 'test22', '13000000022', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('23', 'test23', '13000000023', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('24', 'test24', '13000000024', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('25', 'test25', '13000000025', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('26', 'test26', '13000000026', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('27', 'test27', '13000000027', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('28', 'test28', '13000000028', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('29', 'test29', '13000000029', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('3', 'test3', '13000000003', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('30', 'test30', '13000000030', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('31', 'test31', '13000000031', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('32', 'test32', '13000000032', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('33', 'test33', '13000000033', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('34', 'test34', '13000000034', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('35', 'test35', '13000000035', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('36', 'test36', '13000000036', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('37', 'test37', '13000000037', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('38', 'test38', '13000000038', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('39', 'test39', '13000000039', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('4', 'test4', '13000000004', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('40', 'test40', '13000000040', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('41', 'test41', '13000000041', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('42', 'test42', '13000000042', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('43', 'test43', '13000000043', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('44', 'test44', '13000000044', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('45', 'test45', '13000000045', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('46', 'test46', '13000000046', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('47', 'test47', '13000000047', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('48', 'test48', '13000000048', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('49', 'test49', '13000000049', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('5', 'test5', '13000000005', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('50', 'test50', '13000000050', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('51', 'test51', '13000000051', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('52', 'test52', '13000000052', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('53', 'test53', '13000000053', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('54', 'test54', '13000000054', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('55', 'test55', '13000000055', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('56', 'test56', '13000000056', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('57', 'test57', '13000000057', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('58', 'test58', '13000000058', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('59', 'test59', '13000000059', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('6', 'test6', '13000000006', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('60', 'test60', '13000000060', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('61', 'test61', '13000000061', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('62', 'test62', '13000000062', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('63', 'test63', '13000000063', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('64', 'test64', '13000000064', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('65', 'test65', '13000000065', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('66', 'test66', '13000000066', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('67', 'test67', '13000000067', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('68', 'test68', '13000000068', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('69', 'test69', '13000000069', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('70', 'test70', '13000000070', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('71', 'test71', '13000000071', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('72', 'test72', '13000000072', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('73', 'test73', '13000000073', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('74', 'test74', '13000000074', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('75', 'test75', '13000000075', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('76', 'test76', '13000000076', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('77', 'test77', '13000000077', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('78', 'test78', '13000000078', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('79', 'test79', '13000000079', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('80', 'test80', '13000000080', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('84', 'test84', '13000000084', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('85', 'test85', '13000000085', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('86', 'test86', '13000000086', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('87', 'test87', '13000000087', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('88', 'test88', '13000000088', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('89', 'test89', '13000000089', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('90', 'test90', '13000000090', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('91', 'test91', '13000000091', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('92', 'test92', '13000000092', '2018-03-01', '开发部', '1', '', '', '初中', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `em_user_company_personal` VALUES ('93', 'test93', '13000000093', '2018-03-01', '开发部', '1', '', '', '初中', '中国大陆', '1234', '1234', '', '', '1234', '1234', '', '未婚', '', '', '牛', '', '', '', '', '', '', '', '', '', '无', '无', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '统招', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for pe_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission`;
CREATE TABLE `pe_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '权限描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '权限类型 1为菜单 2为功能 3为API',
  `pid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `en_visible` int(1) NULL DEFAULT NULL COMMENT '企业可见性 0：不可见，1：可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission
-- ----------------------------
INSERT INTO `pe_permission` VALUES ('1', '3', 'SAAS企业管理', 1, '0', 'saas-clients', 0);
INSERT INTO `pe_permission` VALUES ('1063313020819738624', '查看部门的按钮', '查看部门', 2, '1', 'point-dept', 0);
INSERT INTO `pe_permission` VALUES ('1063315016368918528', '用户管理菜单', '员工管理', 1, '0', 'employees', 1);
INSERT INTO `pe_permission` VALUES ('1063315194329042944', '用户删除按钮', '用户删除按钮', 2, '1063315016368918528', 'point-user-delete', 1);
INSERT INTO `pe_permission` VALUES ('1063322760811515904', '删除api', '删除用户api', 3, '1063315194329042944', 'API-USER-DELETE', 1);
INSERT INTO `pe_permission` VALUES ('1063327833876729856', '组织架构菜单', '组织架构', 1, '0', 'departments', 1);
INSERT INTO `pe_permission` VALUES ('1063328114689576960', '公司设置菜单', '公司设置', 1, '0', 'settings', 1);
INSERT INTO `pe_permission` VALUES ('1063328310592933888', '用户添加按钮', '用户添加按钮', 2, '1063315016368918528', 'POINT-USER-ADD', 1);
INSERT INTO `pe_permission` VALUES ('1063328532492587008', '用户修改按钮', '用户修改按钮', 2, '1063315016368918528', 'POINT-USER-UPDATE', 1);
INSERT INTO `pe_permission` VALUES ('1064104257952813056', NULL, '权限管理', 1, '0', 'permissions', 1);
INSERT INTO `pe_permission` VALUES ('1064553683007705088', 'test', 'test', 1, '0', 'test', 1);
INSERT INTO `pe_permission` VALUES ('1067396481381625856', '啊啊啊', '啊啊啊', 1, '0', '啊啊啊', 1);

-- ----------------------------
-- Table structure for pe_permission_api
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_api`;
CREATE TABLE `pe_permission_api`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `api_level` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限等级，1为通用接口权限，2为需校验接口权限',
  `api_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求类型',
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission_api
-- ----------------------------
INSERT INTO `pe_permission_api` VALUES ('1063322760811515904', '1', 'delete', '/sys/user/delete');

-- ----------------------------
-- Table structure for pe_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_menu`;
CREATE TABLE `pe_permission_menu`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `menu_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限代码',
  `menu_order` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission_menu
-- ----------------------------
INSERT INTO `pe_permission_menu` VALUES ('1', 'abc5', '14');
INSERT INTO `pe_permission_menu` VALUES ('1063315016368918528', 'menu-user', '1');
INSERT INTO `pe_permission_menu` VALUES ('1063327833876729856', '2', '2');
INSERT INTO `pe_permission_menu` VALUES ('1063328114689576960', '3', '3');
INSERT INTO `pe_permission_menu` VALUES ('1064104257952813056', NULL, NULL);
INSERT INTO `pe_permission_menu` VALUES ('1064553683007705088', '1', '1');
INSERT INTO `pe_permission_menu` VALUES ('1067396481381625856', '1', '1');
INSERT INTO `pe_permission_menu` VALUES ('2', 'def', '2');

-- ----------------------------
-- Table structure for pe_permission_point
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_point`;
CREATE TABLE `pe_permission_point`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `point_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '按钮类型',
  `point_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '按钮icon',
  `point_status` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission_point
-- ----------------------------
INSERT INTO `pe_permission_point` VALUES ('1063313020819738624', 'dept', 'dept', 1);
INSERT INTO `pe_permission_point` VALUES ('1063315194329042944', 'point-user-delete', 'point-user-delete', 1);
INSERT INTO `pe_permission_point` VALUES ('1063328310592933888', 'POINT-USER-ADD', 'POINT-USER-ADD', 1);
INSERT INTO `pe_permission_point` VALUES ('1063328532492587008', 'POINT-USER-UPDATE', 'POINT-USER-UPDATE', 1);

-- ----------------------------
-- Table structure for pe_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_role`;
CREATE TABLE `pe_role`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_k3beff7qglfn58qsf2yvbg41i`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_role
-- ----------------------------
INSERT INTO `pe_role` VALUES ('1062944989845262336', '人事经理', '负责整合人事部门', '1');
INSERT INTO `pe_role` VALUES ('1064098829009293312', '系统管理员', '管理整合平台，可以操作企业所有功能', '1');
INSERT INTO `pe_role` VALUES ('1064098935443951616', '人事专员', '只能操作员工菜单', '1');
INSERT INTO `pe_role` VALUES ('1064099035536822272', '薪资专员', '绩效管理', '1');

-- ----------------------------
-- Table structure for pe_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_role_permission`;
CREATE TABLE `pe_role_permission`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `permission_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a0`(`permission_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egxd`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_role_permission
-- ----------------------------
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063315016368918528');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063328310592933888');
INSERT INTO `pe_role_permission` VALUES ('1062944989845262336', '1063328532492587008');

-- ----------------------------
-- Table structure for pe_user
-- ----------------------------
DROP TABLE IF EXISTS `pe_user`;
CREATE TABLE `pe_user`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `enable_state` int(2) NULL DEFAULT 1 COMMENT '启用状态 0是禁用，1是启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `department_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` int(1) NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` int(1) NULL DEFAULT NULL COMMENT '在职状态 1.在职  2.离职',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业ID',
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_phone`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_user
-- ----------------------------
INSERT INTO `pe_user` VALUES ('1', '17606396598', '咸鱼', '123456789', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pe_user_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_user_role`;
CREATE TABLE `pe_user_role`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a1`(`role_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egx1`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_user_role
-- ----------------------------
INSERT INTO `pe_user_role` VALUES ('1062944989845262336', '1066370498633486336');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件原始名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储路径',
  `uuid_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件实际名称',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '文件类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_settings
-- ----------------------------
DROP TABLE IF EXISTS `sys_settings`;
CREATE TABLE `sys_settings`  (
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `settings_type` int(2) NOT NULL COMMENT '设置类型',
  `settings_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '详细设置',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_settings
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
