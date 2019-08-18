-- auto Generated on 2019-03-06 10:57:36 
-- DROP TABLE IF EXISTS cooperation; 
CREATE TABLE cooperation(
	id BIGINT (1) NOT NULL AUTO_INCREMENT COMMENT 'id',
	title VARCHAR (200) DEFAULT '' COMMENT 'title',
	userid BIGINT (11) DEFAULT 0 COMMENT '发布人用户id',
	content TEXT COMMENT 'content',
	create_time DATETIME  NOT NULL COMMENT 'createTime',
	state INT (2) DEFAULT 0 COMMENT '合作状态 0：已删除 1：已启用',
	examine INT (2) DEFAULT 0 COMMENT '审核状态 -1：驳回 0：审核中 1：审核通过',
	update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '审核时间',
	update_by VARCHAR (50) NOT NULL DEFAULT '' COMMENT '审核人',
INDEX `ix_userid`(userid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'cooperation';
