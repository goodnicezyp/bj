-- auto Generated on 2019-03-23 17:44:47 
-- DROP TABLE IF EXISTS professional; 
CREATE TABLE professional(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	name VARCHAR (50) NOT NULL DEFAULT '' COMMENT '职业名称',
	parentid BIGINT (11) NOT NULL DEFAULT 0 COMMENT '上级职业ID',
	parentName VARCHAR (50) NOT NULL DEFAULT '' COMMENT '父类名称',
	depth INT (2) NOT NULL DEFAULT 0 COMMENT '深度',
	state INT (2) NOT NULL DEFAULT 0 COMMENT '状态 1:可用 0:删除',
INDEX `ix_state`(state),
INDEX `ix_parentid`(parentid),
INDEX `ix_depth`(depth),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'professional';
