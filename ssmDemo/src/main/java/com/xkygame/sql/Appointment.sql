-- auto Generated on 2019-03-23 10:34:00 
-- DROP TABLE IF EXISTS appointment; 
CREATE TABLE appointment(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	userid BIGINT (11) NOT NULL DEFAULT 0 COMMENT 'userid',
	type INT (2) NOT NULL DEFAULT 0 COMMENT '预约服务类型 0：取证 1：维权 2：商标 3：专利 4：版权 5：其他',
	recordNo VARCHAR (100) NOT NULL DEFAULT '' COMMENT '预约编号',
	createTime DATETIME NOT NULL COMMENT '预约时间',
	updateTime TIMESTAMP COMMENT '处理时间',
	update_by VARCHAR (50) DEFAULT '' COMMENT '处理人员',
	state INT (2) NOT NULL DEFAULT 0 COMMENT '处理状态 0：处理中 1：已处理',
INDEX `ix_userid`(userid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'appointment';
