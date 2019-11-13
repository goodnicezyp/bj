-- auto Generated on 2019-04-11 09:48:41 
-- DROP TABLE IF EXISTS disk_space; 
CREATE TABLE diskSpace(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	title VARCHAR (50) NOT NULL DEFAULT '' COMMENT '磁盘空间名称',
	price DECIMAL (11,2) NOT NULL DEFAULT 0 COMMENT '购买价格',
	sizeNum DECIMAL (11,2) NOT NULL DEFAULT 0 COMMENT '磁盘大小 单位：G',
	state INT (2) NOT NULL DEFAULT 1 COMMENT '0：停用 1：启用',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'diskSpace';