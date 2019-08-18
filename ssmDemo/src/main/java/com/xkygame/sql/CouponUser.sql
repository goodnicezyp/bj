-- auto Generated on 2019-03-19 20:32:01 
-- DROP TABLE IF EXISTS coupon_user; 
CREATE TABLE coupon_user(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	coupon_id BIGINT (11) NOT NULL DEFAULT 0 COMMENT '代金券ID',
	user_id BIGINT (11) NOT NULL DEFAULT 0 COMMENT '获取用户ID',
	create_time DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '获取时间',
	used_time DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '使用时间',
	expired_time DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '截止时间',
	state INT (2) NOT NULL DEFAULT 0 COMMENT '使用状态 -1：已过期 0：未使用 1：已使用',
INDEX `ix_user_id`(user_id),
INDEX `ix_coupon_id`(coupon_id),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'coupon_user';
