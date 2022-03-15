/*
The execution of this entire file is necessary, if you neglect to do so I will not provide support for you.
*/
SET SQL_SAFE_UPDATES=0;
UPDATE (player) SET name = REPLACE(name, '"', '');
UPDATE (clan) SET name = REPLACE(name, '"', '');
UPDATE (account) SET name = REPLACE(name, '"', '');
UPDATE (clan_map_marker) SET label = REPLACE(label, '"', '');
UPDATE (territory) SET name = REPLACE(name, '"', '');
ALTER TABLE `player` CHANGE COLUMN `hitpoints` `hitpoints` VARCHAR(1024) NOT NULL DEFAULT '[]' ;
ALTER TABLE `player` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`, `account_uid`);
ALTER TABLE `vehicle`
CHANGE COLUMN `hitpoints` `hitpoints` TEXT NULL ,
CHANGE COLUMN `cargo_items` `cargo_items` TEXT NULL ,
CHANGE COLUMN `cargo_magazines` `cargo_magazines` TEXT NULL ,
CHANGE COLUMN `cargo_weapons` `cargo_weapons` TEXT NULL ,
CHANGE COLUMN `cargo_container` `cargo_container` TEXT NULL ,
CHANGE COLUMN `vehicle_texture` `vehicle_texture` TEXT NULL ;
ALTER TABLE `account`
CHANGE COLUMN `score` `score` INT(50) NOT NULL DEFAULT '0' ,
CHANGE COLUMN `locker` `locker` INT(50) NOT NULL DEFAULT '0' ;
ALTER TABLE `player`
CHANGE COLUMN `money` `money` INT(50) UNSIGNED NOT NULL DEFAULT '0' ;
ALTER TABLE `container`
DROP FOREIGN KEY `container_ibfk_2`;
ALTER TABLE  `container`
DROP INDEX `territory_id` ;
ALTER TABLE `construction`
DROP FOREIGN KEY `construction_ibfk_2`;
ALTER TABLE `construction`
DROP INDEX `territory_id` ;
ALTER TABLE `territory`
DROP FOREIGN KEY `territory_ibfk_2`;
ALTER TABLE `territory`
DROP INDEX `flag_stolen_by_uid` ;
ALTER TABLE `vehicle` DROP FOREIGN KEY `vehicle_ibfk_2`;
ALTER TABLE `vehicle` DROP INDEX `vehicle_ibfk_2_idx` ;