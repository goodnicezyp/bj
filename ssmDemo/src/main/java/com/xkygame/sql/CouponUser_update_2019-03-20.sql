ALTER TABLE coupon_user
	ADD source_type INT(2) NOT NULL DEFAULT 0 COMMENT 'source_type';
ALTER TABLE coupon_user
	ADD trade_code VARCHAR(50) DEFAULT '' COMMENT 'trade_code';
