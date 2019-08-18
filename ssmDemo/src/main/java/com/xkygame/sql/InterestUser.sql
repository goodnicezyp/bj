-- auto Generated on 2019-03-23 15:50:32 
-- DROP TABLE IF EXISTS interestUser;
CREATE TABLE interestUser(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	userid BIGINT (11) NOT NULL DEFAULT 0 COMMENT 'userid',
INDEX `ix_userid`(userid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'interestUser';
