ALTER TABLE coupon
	ADD user_num INT(11) NOT NULL DEFAULT 0 COMMENT 'user_num';
ALTER TABLE coupon DROP COLUMN trade_code;
