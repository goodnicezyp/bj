-- auto Generated on 2019-03-09 12:53:19 
-- DROP TABLE IF EXISTS base_data; 
CREATE TABLE baseData(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	content TEXT NOT NULL COMMENT '配置数据内容',
	sourceType INT (2) NOT NULL DEFAULT 0 COMMENT '所属类型 0：会员权益文案',
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'baseData';
