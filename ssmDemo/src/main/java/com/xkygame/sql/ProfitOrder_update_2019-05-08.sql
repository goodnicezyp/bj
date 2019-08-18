ALTER TABLE profitorder
	ADD memberid INT(2) NOT NULL DEFAULT 0 COMMENT 'memberid';ALTER TABLE profitorder
	ADD memberTitle VARCHAR(50)  DEFAULT '' COMMENT 'memberTitle';ALTER TABLE profitorder
	ADD monthNum INT(11) NOT NULL DEFAULT 0 COMMENT 'monthNum';ALTER TABLE profitorder
	ADD sourceType INT(2) NOT NULL DEFAULT 0 COMMENT 'sourceType';
