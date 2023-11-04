/*
  Warnings:

  - Added the required column `key` to the `post_meta` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `post_meta` ADD COLUMN `key` VARCHAR(50) NOT NULL;
