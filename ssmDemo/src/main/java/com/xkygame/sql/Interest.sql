-- auto Generated on 2019-03-23 15:49:45 
-- DROP TABLE IF EXISTS interest; 
CREATE TABLE interest(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	title VARCHAR (50) NOT NULL DEFAULT '' COMMENT '兴趣类目',
	state INT (2) NOT NULL DEFAULT 1 COMMENT '状态 0：已停用 1：已启用',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'interest';
