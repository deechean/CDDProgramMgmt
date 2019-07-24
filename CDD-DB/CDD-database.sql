-- MySQL Script generated by MySQL Workbench
-- Tue Jul 23 19:52:32 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cdd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cdd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cdd` ;
USE `cdd` ;

-- -----------------------------------------------------
-- Table `cdd`.`dic_productline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`dic_productline` ;

CREATE TABLE IF NOT EXISTS `cdd`.`dic_productline` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
COMMENT = 'Product Line Dictionary';


-- -----------------------------------------------------
-- Table `cdd`.`dic_fieldtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`dic_fieldtype` ;

CREATE TABLE IF NOT EXISTS `cdd`.`dic_fieldtype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `desc` VARCHAR(45) NOT NULL,
  `status` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdd`.`dic_field`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`dic_field` ;

CREATE TABLE IF NOT EXISTS `cdd`.`dic_field` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fieldname` VARCHAR(45) NOT NULL,
  `fieldtypeid` INT NOT NULL,
  `category` CHAR(1) NOT NULL,
  `status` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_FIELD_TYPR_idx` (`fieldtypeid` ASC) VISIBLE,
  CONSTRAINT `FK_FIELD_TYPR`
    FOREIGN KEY (`fieldtypeid`)
    REFERENCES `cdd`.`dic_fieldtype` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdd`.`dic_listvalue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`dic_listvalue` ;

CREATE TABLE IF NOT EXISTS `cdd`.`dic_listvalue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `fieldid` INT NOT NULL,
  `status` CHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_LISTVALUE_FIELD_idx` (`fieldid` ASC) VISIBLE,
  CONSTRAINT `FK_LISTVALUE_FIELD`
    FOREIGN KEY (`fieldid`)
    REFERENCES `cdd`.`dic_field` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Firmware Dictionary';


-- -----------------------------------------------------
-- Table `cdd`.`t_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_user` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_EMAIL_UNIQUE` (`email` ASC) VISIBLE)
COMMENT = 'User Table';


-- -----------------------------------------------------
-- Table `cdd`.`dic_programstatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`dic_programstatus` ;

CREATE TABLE IF NOT EXISTS `cdd`.`dic_programstatus` (
  `statuscode` CHAR(1) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL DEFAULT '#999999',
  UNIQUE INDEX `statuscode_UNIQUE` (`statuscode` ASC) VISIBLE,
  PRIMARY KEY (`statuscode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdd`.`t_programinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_programinfo` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_programinfo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programname` VARCHAR(100) NOT NULL,
  `programowner` INT NOT NULL DEFAULT 0,
  `introdate` DATE NOT NULL,
  `regularsubmitaldate` DATE NOT NULL,
  `plcde` INT NOT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `FK_PROJECT_OWNER_USER_idx` (`programowner` ASC) VISIBLE,
  INDEX `FK_PROJECT_PRODUCTLINE_idx` (`plcde` ASC) VISIBLE,
  INDEX `FK_PROGRAM_STATUS_idx` (`status` ASC) VISIBLE,
  CONSTRAINT `FK_PROJECT_OWNER_USER`
    FOREIGN KEY (`programowner`)
    REFERENCES `cdd`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PROJECT_PRODUCTLINE`
    FOREIGN KEY (`plcde`)
    REFERENCES `cdd`.`dic_productline` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PROGRAM_STATUS`
    FOREIGN KEY (`status`)
    REFERENCES `cdd`.`dic_programstatus` (`statuscode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Project Info';


-- -----------------------------------------------------
-- Table `cdd`.`t_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_role` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(1000) NULL DEFAULT NULL,
  `createdate` DATE NOT NULL,
  `modifydate` DATE NOT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
COMMENT = 'Project Member Role';


-- -----------------------------------------------------
-- Table `cdd`.`t_teammember`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_teammember` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_teammember` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `projectid` INT NOT NULL,
  `userid` INT NOT NULL,
  `roleid` INT NOT NULL,
  `joinedtime` DATE NOT NULL,
  `endtime` DATE NULL DEFAULT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_TEAMMEMBER` (`projectid` ASC, `userid` ASC) VISIBLE,
  INDEX `IDX_TEAMROLE` (`projectid` ASC, `roleid` ASC) VISIBLE,
  INDEX `FK_TEAMMEMBER_USER_idx` (`userid` ASC) VISIBLE,
  INDEX `FK_TEAMMEMBER_ROLE_idx` (`roleid` ASC) VISIBLE,
  INDEX `FK_TEAMMEMBER_PROJECT_idx` (`projectid` ASC) VISIBLE,
  CONSTRAINT `FK_TEAMMEMBER_USER`
    FOREIGN KEY (`userid`)
    REFERENCES `cdd`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TEAMMEMBER_ROLE`
    FOREIGN KEY (`roleid`)
    REFERENCES `cdd`.`t_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TEAMMEMBER_PROJECT`
    FOREIGN KEY (`projectid`)
    REFERENCES `cdd`.`t_programinfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Team Member List';


-- -----------------------------------------------------
-- Table `cdd`.`t_privilege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_privilege` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_privilege` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `menu` VARCHAR(45) NOT NULL,
  `status` CHAR(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
COMMENT = 'Privilege List';


-- -----------------------------------------------------
-- Table `cdd`.`t_role_privilege`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_role_privilege` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_role_privilege` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleid` INT NOT NULL,
  `privilegeid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_ROLEPRIVILEGE_ROLE_idx` (`roleid` ASC) VISIBLE,
  INDEX `FK_ROLEPRIVILEGE_PRIV_idx` (`privilegeid` ASC) VISIBLE,
  CONSTRAINT `FK_ROLEPRIVILEGE_ROLE`
    FOREIGN KEY (`roleid`)
    REFERENCES `cdd`.`t_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ROLEPRIVILEGE_PRIV`
    FOREIGN KEY (`privilegeid`)
    REFERENCES `cdd`.`t_privilege` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Privileges of the Role';


-- -----------------------------------------------------
-- Table `cdd`.`t_version`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_version` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_version` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `updateby` INT NOT NULL,
  `type` CHAR(1) NOT NULL,
  `object` INT NOT NULL,
  `updatedate` DATE NOT NULL,
  `desc` VARCHAR(2000) NULL DEFAULT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`, `status`),
  INDEX `IDX_VERSION_OBJECT` (`type` ASC, `object` ASC) VISIBLE,
  INDEX `FK_VERSION_USER_idx` (`updateby` ASC) VISIBLE,
  CONSTRAINT `FK_VERSION_USER`
    FOREIGN KEY (`updateby`)
    REFERENCES `cdd`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Deliverable and Template Version Record';


-- -----------------------------------------------------
-- Table `cdd`.`t_deliverable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_deliverable` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_deliverable` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `programid` INT NOT NULL,
  `owner` INT NOT NULL,
  `duedate` DATE NOT NULL,
  `versionid` INT NOT NULL,
  `status` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_DELIVERABLE_NAME_UNIQUE` (`name` ASC) INVISIBLE,
  INDEX `IDX_DELIVERABLE_PROJECT` (`programid` ASC) VISIBLE,
  INDEX `FK_DELIVERABLE_OWNER_idx` (`owner` ASC) VISIBLE,
  INDEX `FK_DELIVERABLE_VERSION_idx` (`versionid` ASC) VISIBLE,
  CONSTRAINT `FK_DELIVERABLE_OWNER`
    FOREIGN KEY (`owner`)
    REFERENCES `cdd`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DELIVERABLE_PROJECT`
    FOREIGN KEY (`programid`)
    REFERENCES `cdd`.`t_programinfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DELIVdic_firmwareERABLE_VERSION`
    FOREIGN KEY (`versionid`)
    REFERENCES `cdd`.`t_version` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Project Deliverable List';


-- -----------------------------------------------------
-- Table `cdd`.`t_field_value`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_field_value` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_field_value` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `programid` INT NOT NULL,
  `fieldid` INT NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `IDX_FIELDVALUE_UNIQUE` (`programid` ASC, `fieldid` ASC) VISIBLE,
  INDEX `FK_FIELDVALUE_FIELD_idx` (`fieldid` ASC) VISIBLE,
  CONSTRAINT `FK_FIELDVALUE_PROJECT`
    FOREIGN KEY (`programid`)
    REFERENCES `cdd`.`t_programinfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_FIELDVALUE_FIELD`
    FOREIGN KEY (`fieldid`)
    REFERENCES `cdd`.`dic_field` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cdd`.`t_userwatch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`t_userwatch` ;

CREATE TABLE IF NOT EXISTS `cdd`.`t_userwatch` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `programid` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_t_userwatch_t_userwatch1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_t_userwatch_t_programid_idx` (`programid` ASC) VISIBLE,
  CONSTRAINT `fk_t_userwatch_t_userid`
    FOREIGN KEY (`userid`)
    REFERENCES `cdd`.`t_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_userwatch_t_programid`
    FOREIGN KEY (`programid`)
    REFERENCES `cdd`.`t_programinfo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `cdd` ;

-- -----------------------------------------------------
-- Placeholder table for view `cdd`.`vw_watchprogram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdd`.`vw_watchprogram` (`id` INT, `userid` INT, `programid` INT, `programname` INT, `programowner` INT, `introdate` INT, `regularsubmitaldate` INT, `plcde` INT, `status` INT, `color` INT);

-- -----------------------------------------------------
-- Placeholder table for view `cdd`.`vw_programinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdd`.`vw_programinfo` (`id` INT, `programname` INT, `ownerid` INT, `ownername` INT, `introdate` INT, `regularsubmitaldate` INT, `plid` INT, `plcde` INT, `status` INT, `color` INT);

-- -----------------------------------------------------
-- Placeholder table for view `cdd`.`vw_programadditioninfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cdd`.`vw_programadditioninfo` (`programid` INT, `programname` INT, `fieldid` INT, `fieldname` INT, `desc` INT, `value` INT);

-- -----------------------------------------------------
-- View `cdd`.`vw_watchprogram`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`vw_watchprogram`;
DROP VIEW IF EXISTS `cdd`.`vw_watchprogram` ;
USE `cdd`;
CREATE  OR REPLACE VIEW `vw_watchprogram` AS
select a.id, a.userid, a.programid, 
b.programname, b.programowner, 
DATE_FORMAT(b.introdate,'%d %b %y') as introdate, 
DATE_FORMAT(b.regularsubmitaldate,'%d %b %y') as regularsubmitaldate,
c.name as plcde, 
d.name as status,
d.color as color
from t_userwatch a , t_programinfo b, dic_productline c, dic_programstatus d
where  a.programid= b.id and b.plcde=c.id and b.status=d.statuscode;

-- -----------------------------------------------------
-- View `cdd`.`vw_programinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`vw_programinfo`;
DROP VIEW IF EXISTS `cdd`.`vw_programinfo` ;
USE `cdd`;
CREATE  OR REPLACE VIEW `vw_programinfo` AS
SELECT  a.id, a.programname, b.id as ownerid, 
b.name as ownername, 
DATE_FORMAT(a.introdate,'%d %b %y') as introdate,
DATE_FORMAT(a.regularsubmitaldate,'%d %b %y') as regularsubmitaldate, 
c.id as plid, c.name as plcde, 
d.name as status,
d.color as color
FROM t_programinfo a LEFT JOIN t_user b
ON a.programowner = b.id
LEFT JOIN dic_productline c
ON a.plcde = c.id
LEFT JOIN dic_programstatus d
ON a.status = d.statuscode;

-- -----------------------------------------------------
-- View `cdd`.`vw_programadditioninfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cdd`.`vw_programadditioninfo`;
DROP VIEW IF EXISTS `cdd`.`vw_programadditioninfo` ;
USE `cdd`;
CREATE  OR REPLACE VIEW `vw_programadditioninfo` AS
SELECT a.id as programid, a.programname as programname, b.fieldid as fieldid, c.fieldname as fieldname, d.desc,
CASE d.desc WHEN 'text' THEN b.value
WHEN 'long desc' THEN b.value
WHEN 'list_single' THEN e.name
WHEN 'user_single' THEN f.name
ELSE null END AS value 
FROM t_programinfo a INNER JOIN dic_field c
LEFT JOIN t_field_value b ON a.id=b.programid AND c.id = b.fieldid
LEFT JOIN dic_fieldtype d on c.fieldtypeid = d.id 
LEFT JOIN dic_listvalue e ON e.id = b.value
LEFT JOIN t_user f on f.id = b.value;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
