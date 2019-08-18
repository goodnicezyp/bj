-- auto Generated on 2019-04-11 11:56:49 
-- DROP TABLE IF EXISTS orderItem; 
CREATE TABLE orderItem(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	orderNo VARCHAR (200) NOT NULL DEFAULT '' COMMENT 'orderNo',
	workid BIGINT (11) NOT NULL DEFAULT 0 COMMENT '作品id',
	memberid INT (2) NOT NULL DEFAULT 0 COMMENT '购买会员等级 0：普通会员 1：钻石会员 2：皇冠会员',
	memberTitle VARCHAR (100) DEFAULT '' COMMENT '购买套餐名称',
	monthNum INT (11) NOT NULL DEFAULT 0 COMMENT '购买月份期限',
	price DECIMAL (11,2) NOT NULL DEFAULT 0 COMMENT '订单价格',
	sourceType INT (2) NOT NULL DEFAULT 0 COMMENT '订单来源 0:作品购买 1：会员购买 2.作品备案',
INDEX `ix_orderNo`(orderNo),
INDEX `ix_memberid`(memberid),
INDEX `ix_workid`(workid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'orderItem';
