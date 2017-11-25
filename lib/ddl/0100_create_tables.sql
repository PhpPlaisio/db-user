/*================================================================================*/
/* DDL SCRIPT                                                                     */
/*================================================================================*/
/*  Title    : ABC Framework: User                                                */
/*  FileName : abc-user.ecm                                                       */
/*  Platform : MySQL 5                                                            */
/*  Version  :                                                                    */
/*  Date     : zaterdag 25 november 2017                                          */
/*================================================================================*/
/*================================================================================*/
/* CREATE TABLES                                                                  */
/*================================================================================*/

CREATE TABLE `ABC_AUTH_USER` (
  `usr_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
  `cmp_id` SMALLINT UNSIGNED NOT NULL,
  `lan_id` TINYINT UNSIGNED NOT NULL,
  `pro_id` SMALLINT UNSIGNED NOT NULL,
  `usr_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_general_ci,
  `usr_password_hash` VARCHAR(60) CHARACTER SET ascii COLLATE ascii_bin,
  `usr_anonymous` BOOL,
  `usr_last_login` TIMESTAMP DEFAULT now(),
  CONSTRAINT `PRIMARY_KEY` PRIMARY KEY (`usr_id`),
  CONSTRAINT `usr_name` UNIQUE (`cmp_id`, `usr_name`)
);

/*
COMMENT ON COLUMN `ABC_AUTH_USER`.`usr_anonymous`
If set this user is an anonymous user. Per company there can be only one anonymous user.
*/

/*================================================================================*/
/* CREATE INDEXES                                                                 */
/*================================================================================*/

CREATE INDEX `IX_FK_ABC_AUTH_USER` ON `ABC_AUTH_USER` (`cmp_id`);

CREATE INDEX `IX_FK_ABC_AUTH_USER1` ON `ABC_AUTH_USER` (`lan_id`);

CREATE INDEX `IX_FK_ABC_AUTH_USER2` ON `ABC_AUTH_USER` (`pro_id`);

/*================================================================================*/
/* CREATE FOREIGN KEYS                                                            */
/*================================================================================*/

ALTER TABLE `ABC_AUTH_USER`
  ADD CONSTRAINT `FK_ABC_AUTH_USER_ABC_AUTH_COMPANY`
  FOREIGN KEY (`cmp_id`) REFERENCES `ABC_AUTH_COMPANY` (`cmp_id`);

ALTER TABLE `ABC_AUTH_USER`
  ADD CONSTRAINT `FK_ABC_AUTH_USER_ABC_BABEL_LANGUAGE`
  FOREIGN KEY (`lan_id`) REFERENCES `ABC_BABEL_LANGUAGE` (`lan_id`);

ALTER TABLE `ABC_AUTH_USER`
  ADD CONSTRAINT `FK_ABC_AUTH_USER_AUT_PROFILE`
  FOREIGN KEY (`pro_id`) REFERENCES `AUT_PROFILE` (`pro_id`);
