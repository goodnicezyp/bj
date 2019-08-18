-- auto Generated on 2019-03-05 19:51:45 
-- DROP TABLE IF EXISTS download_record; 
CREATE TABLE downloadRecord(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	userid BIGINT (11) NOT NULL DEFAULT -1 COMMENT 'userid',
	workid BIGINT (11) NOT NULL DEFAULT -1 COMMENT 'workid',
	url VARCHAR (200) NOT NULL DEFAULT '' COMMENT 'url',
	name VARCHAR (200) NOT NULL DEFAULT '' COMMENT '作品名称',
	createTime DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '下载时间',
INDEX `ix_userid_workid`(userid,workid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'downloadRecord';
