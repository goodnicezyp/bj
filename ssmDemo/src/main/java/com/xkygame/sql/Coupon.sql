-- auto Generated on 2019-03-19 20:25:29 
-- DROP TABLE IF EXISTS coupon; 
CREATE TABLE coupon(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	title VARCHAR (50) NOT NULL DEFAULT '' COMMENT '代金券名称',
	price DECIMAL (11,2) NOT NULL DEFAULT 0 COMMENT '优惠金额',
	type INT (2) NOT NULL DEFAULT 0 COMMENT '类型 0：平台代金券 1：线下维权代金券',
	trade_code VARCHAR (10) NOT NULL DEFAULT '' COMMENT '线下维权代金券交易码',
	create_time DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '创建时间',
	date_flag INT (2) NOT NULL DEFAULT 0 COMMENT '是否限时 0：不限时 1：统一限时 2：获得限时',
	start_time DATETIME  COMMENT '开始时间',
	end_time DATETIME  COMMENT '截止时间',
	day_num INT (3) NOT NULL DEFAULT 0 COMMENT '领到券后N天内有效',
	state INT (11) NOT NULL DEFAULT 0 COMMENT '状态 0：已停用 1：已启用',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'coupon';
