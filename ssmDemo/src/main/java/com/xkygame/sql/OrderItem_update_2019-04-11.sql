ALTER TABLE orderitem
	ADD diskID BIGINT(11) NOT NULL DEFAULT 0 COMMENT 'diskID';ALTER TABLE orderitem
	ADD diskTitle VARCHAR(50) DEFAULT '' COMMENT 'diskTitle';ALTER TABLE orderitem
	ADD sizeNum DECIMAL(11,2) NOT NULL DEFAULT 0 COMMENT 'sizeNum';
ALTER TABLE orderitem
	ADD userid BIGINT(11) NOT NULL DEFAULT 0 COMMENT 'userid';