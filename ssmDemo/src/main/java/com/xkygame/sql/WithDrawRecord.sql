-- auto Generated on 2019-03-20 11:09:38 
-- DROP TABLE IF EXISTS with_draw_record; 
CREATE TABLE withDrawRecord(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	userID BIGINT (11) NOT NULL DEFAULT 0 COMMENT 'userID',
	price DECIMAL (11,2) NOT NULL DEFAULT 0 COMMENT '申请提现金额',
	profit DECIMAL (11,2) NOT NULL DEFAULT 0 COMMENT '收益余额',
	createTime DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '申请时间',
	updateTime DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '审核时间',
	update_by VARCHAR (50) NOT NULL DEFAULT '' COMMENT '审核人员',
	state INT (2) NOT NULL DEFAULT 0 COMMENT '提现状态 -1：审核驳回  0：处理中 1：提现成功',
INDEX `ix_userID`(userID),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'withDrawRecord';