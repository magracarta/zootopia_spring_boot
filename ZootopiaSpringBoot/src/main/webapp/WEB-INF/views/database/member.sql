ALTER TABLE `zootopia`.`member`
ADD COLUMN `zip_num` VARCHAR(15) NULL AFTER `petgender`,
ADD COLUMN `address1` VARCHAR(100) NULL AFTER `zip_num`,
ADD COLUMN `address2` VARCHAR(100) NULL AFTER `address1`;

ALTER TABLE `zootopia`.`member`
CHANGE COLUMN `petgender` `petgender` CHAR(4) NULL DEFAULT NULL ;