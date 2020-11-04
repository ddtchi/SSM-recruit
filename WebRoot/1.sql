# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.28
# Server OS:                    Win64
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2019-05-22 22:48:33
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table job.commond
DROP TABLE IF EXISTS `commond`;
CREATE TABLE IF NOT EXISTS `commond` (
  `commond_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `createDate` varchar(255) DEFAULT NULL,
  `info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`commond_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

# Dumping data for table job.commond: ~2 rows (approximately)
/*!40000 ALTER TABLE `commond` DISABLE KEYS */;
INSERT INTO `commond` (`commond_id`, `content`, `user_id`, `createDate`, `info_id`) VALUES
	(1, '这类型工作太多，你可以仔细比较一下', 2, '2019-04-30 18:08:15', 2),
	(2, '这个职位不错，可以考虑', 2, '2019-04-30 18:09:15', 2);
/*!40000 ALTER TABLE `commond` ENABLE KEYS */;


# Dumping structure for table job.company
DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comtype` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `empcount` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `m_tel` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

# Dumping data for table job.company: ~5 rows (approximately)
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` (`com_id`, `fullname`, `username`, `user_id`, `comtype`, `description`, `empcount`, `address`, `email`, `tel`, `manager`, `m_tel`, `image`) VALUES
	(1, '凤凰餐厅', 'fenghuang', 20, '私营', '吕梁学院校内综合性服务公司', '30', '吕梁学院校内综合楼旁', '852205453@qq.com', '0253-12345678', '张三', '13935393135', ''),
	(2, '怡丁轩餐厅', 'yidingxuan', 21, '私营', '吕梁学院校内综合性服务公司', '30', '吕梁学院校内艺术楼旁', '527821557@qq.com', '0353-87654321', '张三1', '18753202373', ''),
	(3, '同达森客时代广场', 'tongda', 22, '私营', '吕梁学院附近一家餐饮购物中心', '100', '吕梁学院正门森客时代广场', '123456789@qq.com', '0353-1234567', '张三2', '13256658963', ''),
	(4, '恒大影城', 'hengda', 23, '私营', '恒大华府附近一家综合性服务公司', '50', '恒大华府附近', '987654321@qq.com', '0353-7654321', '张三3', '12235645456', ''),
	(5, '学院北门', 'wentao', 24, '私营', '吕梁学院北门综合性服务一条街', '50', '吕梁学院四人间后', '887654321@qq.com', '0353-11345678', '张三4', '15603538843', '');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;


# Dumping structure for table job.com_resume
DROP TABLE IF EXISTS `com_resume`;
CREATE TABLE IF NOT EXISTS `com_resume` (
  `resume_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `resume_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `look` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table job.com_resume: ~0 rows (approximately)
/*!40000 ALTER TABLE `com_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_resume` ENABLE KEYS */;


# Dumping structure for table job.emp
DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `marry` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `jobtype` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `jobstatus` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `resume_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `xuehao` varchar(255) NOT NULL,
  `hj` varchar(255) DEFAULT NULL,
  `waddress` varchar(255) DEFAULT NULL,
  `study` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

# Dumping data for table job.emp: ~3 rows (approximately)
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` (`emp_id`, `realname`, `sex`, `birthday`, `marry`, `degree`, `tel`, `email`, `description`, `address`, `jobtype`, `salary`, `jobstatus`, `image`, `resume_name`, `user_id`, `country`, `xuehao`, `hj`, `waddress`, `study`, `work`, `family`, `experience`, `language`, `qq`) VALUES
	(1, '张三', '男', '1995-08-12', '否', '本科', '0353-12345678', '2251804131@qq.com', '活泼大方，幽默搞笑', '山西太原', '餐饮零售', 800.00, '否', '/recruit/photo/2019-05-22_5.png', '个人简历', 10, '中国', '2251804131', '山西太原', '校园附近', '三好学生', '暂无', '父母', '无相关经历', '英语四级', ''),
	(2, '张三1', '男', '1996-05-01', '否', '本科', '0353-87654321', '907651927@qq.com', '干练负责，吃苦耐劳', '山西大同', '文体教育', 1500.00, '否', '/recruit/photo/2017-05-01_7.jpg', '个人简历', 11, '中国', '2280514639', '山西大同', '校园附近', '三好学生', '暂无', '父母', '数学家教', '英语四级', NULL),
	(7, 'cc', '男', '2019-05-09', '是', 'cc', '13471041971', 'cc@163.com', 'c', '1', 'c', 111.00, '否', NULL, 'c', 41, '中国', '1', 'c', 'c', 'c', 'c', 'c', 'c', '1', NULL);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;


# Dumping structure for table job.emp_look
DROP TABLE IF EXISTS `emp_look`;
CREATE TABLE IF NOT EXISTS `emp_look` (
  `look_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `com_id` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`look_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table job.emp_look: ~0 rows (approximately)
/*!40000 ALTER TABLE `emp_look` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_look` ENABLE KEYS */;


# Dumping structure for table job.info
DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `isApply` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

# Dumping data for table job.info: ~4 rows (approximately)
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` (`info_id`, `title`, `content`, `createDate`, `user_id`, `isApply`, `status`) VALUES
	(2, '在线求答', '求一份餐饮零售类型的工作,薪资比较高点的', '2019-04-30 13:39:06', 11, 1, 1),
	(11, 'qiuyifengongzuo', 'qiuyifendaiyubucuodegongzuo', '2019-05-07 16:53:28', 10, 1, 1),
	(12, '献花留言', 'ganxingqudehuanijiulaiba', '2019-05-07 16:54:32', 20, 1, 2),
	(13, '123', '1234567', '2019-05-07 17:29:11', 10, 0, 1);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;


# Dumping structure for table job.job
DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_id` int(11) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `job_PersonCount` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL,
  `start_date` varchar(50) DEFAULT NULL,
  `end_date` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

# Dumping data for table job.job: ~10 rows (approximately)
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`job_id`, `com_id`, `job_name`, `job_PersonCount`, `degree`, `language`, `grade`, `address`, `salary`, `job_status`, `start_date`, `end_date`, `description`) VALUES
	(1, 1, '餐厅服务员', '2', '本科', '无具体要求', NULL, '凤凰餐厅内湖北炒米', '0.5k-0.8k', '餐饮零售', NULL, NULL, '待遇优厚，工作时间合理'),
	(2, 2, '餐厅收银员', '1', '本科', '无具体要求', NULL, '怡丁轩餐厅内土耳其烤肉饭', '0.5k-0.8k', '餐饮零售', '', '', '待遇优厚，工作时间合理'),
	(3, 3, '店铺服务员', '2', '本科', '无具体要求', NULL, '同达森客时代广场森客超市', '0.8k-1k', '餐饮零售', '', '', '待遇优厚'),
	(4, 3, '店铺收银员', '1', '本科', '无具体要求', NULL, '同达森客时代广场文体城', '0.8k-1k', '文体教育', '', '', '待遇优厚'),
	(5, 4, '店铺销售员', '2', '本科', '无具体要求', NULL, '恒大影城一楼海红日化', '0.8K+', '日化美妆', '', '', '待遇优厚，工作时间合理'),
	(6, 4, '店铺服务员', '2', '本科', '无具体要求', NULL, '恒大影城一楼暗自着迷', '0.8k-1k', '服装饰品', '', '', '待遇优厚，工作时间合理'),
	(7, 4, '店铺收银员', '1', '本科', '无具体要求', NULL, '恒大影城一楼名创优品', '0.8k-1k', '服装饰品', '', '', '待遇优厚，工作时间合理'),
	(8, 1, '服务员', '5', '本科', '无具体要求', NULL, '凤凰餐厅后菜鸟驿站', '0.5k-1k', '快递服务', '', '', '工作时间合理'),
	(9, 5, '家教', '3', '本科', '英语四级', NULL, '学院北门精英教育', '1k+', '文体教育', '', '', '待遇优厚，工作时间合理'),
	(10, 2, '服务员', '2', '本科', '英语四级', NULL, '怡丁轩负一层十分复印', '0.5k-1k', '文体教育', NULL, NULL, '工作时间合理');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;


# Dumping structure for table job.top_job
DROP TABLE IF EXISTS `top_job`;
CREATE TABLE IF NOT EXISTS `top_job` (
  `top_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `job_name` varchar(100) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`top_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

# Dumping data for table job.top_job: ~1 rows (approximately)
/*!40000 ALTER TABLE `top_job` DISABLE KEYS */;
INSERT INTO `top_job` (`top_id`, `job_id`, `job_name`, `count`) VALUES
	(1, 2, '餐厅收银员', 1);
/*!40000 ALTER TABLE `top_job` ENABLE KEYS */;


# Dumping structure for table job.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

# Dumping data for table job.user: ~10 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `pwd`, `question`, `answer`, `status`) VALUES
	(3, 'admin', '123456', NULL, NULL, 3),
	(10, 'zhangsan', '123456', NULL, NULL, 1),
	(11, 'zhangsan1', '123456', '你的真实名字？', 'zhangsan1', 1),
	(20, 'fenghuang', '123456', NULL, NULL, 2),
	(21, 'yidingxuan', '123456', NULL, NULL, 2),
	(22, 'tongda', '123456', NULL, NULL, 2),
	(23, 'hengda', '123456', NULL, NULL, 2),
	(24, 'wentao', '123456', NULL, NULL, 2),
	(38, 'hengdahua', '123456', NULL, NULL, 2),
	(41, 'fantesycy', '123456', NULL, NULL, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
