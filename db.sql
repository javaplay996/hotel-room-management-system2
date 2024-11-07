/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - jiudiankefang
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jiudiankefang` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jiudiankefang`;

/*Table structure for table `caiwu` */

DROP TABLE IF EXISTS `caiwu`;

CREATE TABLE `caiwu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '消费人',
  `purpose` varchar(200) DEFAULT NULL COMMENT '用途 Search',
  `maxMoney` decimal(10,2) DEFAULT NULL COMMENT '花费金额',
  `expenditure_time` timestamp NULL DEFAULT NULL COMMENT '花费时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='财务表';

/*Data for the table `caiwu` */

insert  into `caiwu`(`id`,`yh_types`,`purpose`,`maxMoney`,`expenditure_time`) values (16,1,'支付 003 房间的房费','36000.00','2021-04-26 19:44:57'),(17,1,'支付 003 房间的房费','36000.00','2021-04-26 20:11:55'),(18,1,'支付 002 房间的房费','10000.00','2021-04-26 20:13:44'),(19,2,'支付 004 房间的房费','120000.00','2021-04-26 21:19:29'),(20,2,'购买：零食大礼包 ，10 件','1000.00','2021-04-30 21:21:59'),(21,2,'购买：螺蛳粉 ，1 件','40.00','2021-04-26 21:22:19');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614570669179 DEFAULT CHARSET=utf8 COMMENT='客服聊天表';

/*Data for the table `chat` */

insert  into `chat`(`id`,`addtime`,`userid`,`adminid`,`ask`,`reply`,`isreply`) values (61,'2021-04-22 11:42:19',1,1,'提问1','回复1',1),(62,'2021-04-22 11:42:19',2,2,'提问2','回复2',2),(63,'2021-04-22 11:42:19',3,3,'提问3','回复3',3),(64,'2021-04-22 11:42:19',4,4,'提问4','回复4',4),(65,'2021-04-22 11:42:19',5,5,'提问5','回复5',5),(66,'2021-04-22 11:42:19',6,6,'提问6','回复6',6);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/jiudiankefang/upload/1615347704301.jpg'),(2,'picture2','http://localhost:8080/jiudiankefang/upload/1615347709862.jpg'),(3,'picture3','http://localhost:8080/jiudiankefang/upload/1615347713866.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',1,'男',NULL,'2021-04-22 11:41:54'),(2,'sex_types','性别',2,'女',NULL,'2021-04-22 11:41:54'),(3,'fjlx_types','房间类型',1,'单间',NULL,'2021-04-22 11:41:54'),(4,'fjlx_types','房间类型',2,'双人间',NULL,'2021-04-22 11:41:54'),(5,'fjlx_types','房间类型',3,'套房',NULL,'2021-04-22 11:41:54'),(6,'fjzt_types','房间状态',1,'已预定',NULL,'2021-04-22 11:41:54'),(7,'fjzt_types','房间状态',2,'已入住',NULL,'2021-04-22 11:41:54'),(8,'fjzt_types','房间状态',3,'未入住',NULL,'2021-04-22 11:41:54'),(9,'sfdd_types','是否到达',1,'已到达',NULL,'2021-04-22 11:41:54'),(10,'sfdd_types','是否到达',2,'未到达',NULL,'2021-04-22 11:41:54'),(11,'sfdd_types','是否到达',3,'已入住',NULL,'2021-04-22 11:41:54');

/*Table structure for table `fangjian` */

DROP TABLE IF EXISTS `fangjian`;

CREATE TABLE `fangjian` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '房间编号 Search',
  `img_photo` varchar(200) DEFAULT NULL COMMENT '房间图片',
  `thewhere` varchar(200) DEFAULT NULL COMMENT '房间位置',
  `fjlx_types` tinyint(4) DEFAULT NULL COMMENT '房间类型 Search',
  `money` decimal(10,2) DEFAULT NULL COMMENT '房间价格 Search',
  `fjzt_types` tinyint(4) DEFAULT NULL COMMENT '房屋状态 Search',
  `fangjian_content` varchar(200) DEFAULT NULL COMMENT '房间详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='房间表';

/*Data for the table `fangjian` */

insert  into `fangjian`(`id`,`name`,`img_photo`,`thewhere`,`fjlx_types`,`money`,`fjzt_types`,`fangjian_content`) values (1,'001','http://localhost:8080/jiudiankefang/file/download?fileName=1615287461760.jpg','房间位置1',3,'1000.00',3,'<img src=\"http://localhost:8080/jiudiankefang/upload/1615287461875.jpg\" width=\"900\" height=\"560\" _src=\"http://localhost:8080/jiudiankefang/upload/1615287461875.jpg\">\r\n'),(2,'002','http://localhost:8080/jiudiankefang/file/download?fileName=1615287488085.jpg','房间位置2',2,'2000.00',3,'<img src=\"http://localhost:8080/jiudiankefang/upload/1615287488086.jpg\" width=\"900\" height=\"560\" _src=\"http://localhost:8080/jiudiankefang/upload/1615287488086.jpg\">\r\n'),(3,'003','http://localhost:8080/jiudiankefang/file/download?fileName=1615287522284.jpg','房间位置3',1,'3000.00',1,'<img src=\"http://localhost:8080/jiudiankefang/upload/1615287522284.jpg\" width=\"900\" height=\"560\" _src=\"http://localhost:8080/jiudiankefang/upload/1615287522284.jpg\">\r\n'),(4,'004','http://localhost:8080/jiudiankefang/file/download?fileName=1619442614643.webp','房间位置4',2,'40000.00',2,'房间详情4\r\n');

/*Table structure for table `fangjianyuding` */

DROP TABLE IF EXISTS `fangjianyuding`;

CREATE TABLE `fangjianyuding` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fj_types` tinyint(4) DEFAULT NULL COMMENT '预定房间',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '预定人',
  `sfdd_types` tinyint(4) DEFAULT NULL COMMENT '是否到达',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '预定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='房间预定表';

/*Data for the table `fangjianyuding` */

insert  into `fangjianyuding`(`id`,`fj_types`,`yh_types`,`sfdd_types`,`create_time`) values (11,2,1,3,'2021-04-26 20:13:23'),(13,3,1,2,'2021-04-26 20:17:45'),(15,4,2,3,'2021-04-26 21:13:41');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

/*Data for the table `news` */

insert  into `news`(`id`,`addtime`,`title`,`picture`,`content`) values (81,'2021-04-22 22:39:58','标题11111','http://localhost:8080/jiudiankefang/upload/1615347735010.jpg','内容111111\r\n'),(82,'2021-04-22 22:39:58','标题2','http://localhost:8080/jiudiankefang/upload/1615347744282.jpg','内容2\r\n'),(83,'2021-04-22 22:39:58','标题3','http://localhost:8080/jiudiankefang/upload/1615347749507.jpg','内容3\r\n'),(84,'2021-04-22 22:39:58','标题4','http://localhost:8080/jiudiankefang/upload/1615347756914.jpg','内容4\r\n');

/*Table structure for table `shangdian` */

DROP TABLE IF EXISTS `shangdian`;

CREATE TABLE `shangdian` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '商品名称 Search',
  `money` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `img_photo` varchar(200) DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='旅社商店表';

/*Data for the table `shangdian` */

insert  into `shangdian`(`id`,`name`,`money`,`img_photo`) values (1,'饼干','10.00','http://localhost:8080/jiudiankefang/file/download?fileName=1615338851506.jpg'),(2,'泡面','20.00','http://localhost:8080/jiudiankefang/file/download?fileName=1615338864328.jpg'),(3,'烤鸭','30.00','http://localhost:8080/jiudiankefang/file/download?fileName=1615338877648.jpg'),(4,'螺蛳粉','40.00','http://localhost:8080/jiudiankefang/file/download?fileName=1615338908811.jpg'),(5,'零食大礼包','100.00','http://localhost:8080/jiudiankefang/file/download?fileName=1615338948241.jpg');

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614156607632 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (5,1,'admin','users','管理员','zgv1gwny5pt0bby91br1xn3u1eyyh1nh','2021-04-22 11:02:31','2021-04-26 22:16:40'),(18,1,'111','users','用户','qlkqxux1juohpuo58vp50g3omll0tt4p','2021-04-26 19:31:53','2021-04-26 22:17:11'),(19,2,'222','users','用户','lmjpue35pfgruexhax7o4qbbvela1rya','2021-04-26 21:12:43','2021-04-26 22:17:35');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-04-22 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '名称  Search',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(4) DEFAULT NULL COMMENT '性别  Search',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `role` varchar(255) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`name`,`username`,`password`,`img_photo`,`sex_types`,`phone`,`role`) values (1,'小金','111','111','http://localhost:8080/jiudiankefang/file/download?fileName=1615287385568.jpg',1,'17796312333','用户'),(2,'小札','222','222','http://localhost:8080/jiudiankefang/file/download?fileName=1615287378665.jpg',2,'12312312333','用户');

/*Table structure for table `yuding` */

DROP TABLE IF EXISTS `yuding`;

CREATE TABLE `yuding` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fj_types` tinyint(4) DEFAULT NULL COMMENT '预定房间',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '预定人',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '预定时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定信息';

/*Data for the table `yuding` */

/*Table structure for table `zhufang` */

DROP TABLE IF EXISTS `zhufang`;

CREATE TABLE `zhufang` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fj_types` tinyint(4) DEFAULT NULL COMMENT '房间编号',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '租房用户',
  `initiate_time` timestamp NULL DEFAULT NULL COMMENT '入住时间 Search',
  `ktsf_types` timestamp NULL DEFAULT NULL COMMENT '是否退房 Search',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '退房时间',
  `maxmoney` timestamp NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='住房信息';

/*Data for the table `zhufang` */

/*Table structure for table `zhusu` */

DROP TABLE IF EXISTS `zhusu`;

CREATE TABLE `zhusu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fj_types` tinyint(4) DEFAULT NULL COMMENT '住宿房间编号',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '住宿人',
  `initiate_time` timestamp NULL DEFAULT NULL COMMENT '住宿开始时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '住宿结束时间',
  `zhuangt` int(11) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='住宿表';

/*Data for the table `zhusu` */

insert  into `zhusu`(`id`,`fj_types`,`yh_types`,`initiate_time`,`finish_time`,`zhuangt`) values (10,2,1,'2021-04-26 20:13:44','2021-05-02 00:00:00',2),(11,4,2,'2021-04-26 21:19:29','2021-04-30 00:00:00',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
