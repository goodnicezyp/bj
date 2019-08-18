-- auto Generated on 2019-03-23 18:02:53 
DROP TABLE IF EXISTS professionUser;
CREATE TABLE professionUser(
	id BIGINT (11) NOT NULL AUTO_INCREMENT COMMENT 'id',
	userid BIGINT (11) NOT NULL DEFAULT 0 COMMENT 'userid',
  professionid BIGINT (11) NOT NULL DEFAULT 0 COMMENT 'professionid',
INDEX `ix_userid`(userid),
INDEX `ix_professionid`(professionid),
UNIQUE `ux_professionid_userid`(professionid,userid),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'professionUser';
