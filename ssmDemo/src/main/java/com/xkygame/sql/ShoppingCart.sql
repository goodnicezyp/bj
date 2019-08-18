-- auto Generated on 2019-04-11 14:59:50 
-- DROP TABLE IF EXISTS shoppingCart; 
CREATE TABLE shoppingCart(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	workid BIGINT (11) NOT NULL DEFAULT 0 COMMENT '作品ID',
	userid BIGINT (11) NOT NULL DEFAULT -1 COMMENT 'userid',
UNIQUE `ux_workid_userid`(workid,userid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'shoppingCart';
