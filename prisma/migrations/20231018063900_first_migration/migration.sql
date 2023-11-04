/*
  Warnings:

  - You are about to drop the column `created_at` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `parentId` on the `category` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `category` table. All the data in the column will be lost.
  - You are about to alter the column `metaTitle` on the `category` table. The data in that column could be lost. The data in that column will be cast from `VarChar(300)` to `VarChar(100)`.
  - You are about to drop the column `created_at` on the `personal_access_tokens` table. All the data in the column will be lost.
  - You are about to drop the column `expires_at` on the `personal_access_tokens` table. All the data in the column will be lost.
  - You are about to drop the column `last_used_at` on the `personal_access_tokens` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `personal_access_tokens` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `intro` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `passwordHash` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `profile` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post_category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post_comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post_meta` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `post_tag` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tag` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `slug` to the `category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `admin` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `post` DROP FOREIGN KEY `products_authorId_foreign`;

-- DropForeignKey
ALTER TABLE `post_category` DROP FOREIGN KEY `post_category_categoryId_foreign`;

-- DropForeignKey
ALTER TABLE `post_category` DROP FOREIGN KEY `post_category_postId_foreign`;

-- DropForeignKey
ALTER TABLE `post_comment` DROP FOREIGN KEY `post_comments_postId_foreign`;

-- DropForeignKey
ALTER TABLE `post_meta` DROP FOREIGN KEY `post_meta_postId_foreign`;

-- DropForeignKey
ALTER TABLE `post_tag` DROP FOREIGN KEY `post_tag_post_id_foreign`;

-- DropForeignKey
ALTER TABLE `post_tag` DROP FOREIGN KEY `post_tag_tag_id_foreign`;

-- AlterTable
ALTER TABLE `category` DROP COLUMN `created_at`,
    DROP COLUMN `parentId`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `slug` VARCHAR(100) NOT NULL,
    ADD COLUMN `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    MODIFY `title` VARCHAR(100) NOT NULL,
    MODIFY `metaTitle` VARCHAR(100) NOT NULL;

-- AlterTable
ALTER TABLE `personal_access_tokens` DROP COLUMN `created_at`,
    DROP COLUMN `expires_at`,
    DROP COLUMN `last_used_at`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `createdAt` TIMESTAMP(0) NULL,
    ADD COLUMN `expiresAt` TIMESTAMP(0) NULL,
    ADD COLUMN `last_usedAt` TIMESTAMP(0) NULL,
    ADD COLUMN `updatedAt` TIMESTAMP(0) NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `created_at`,
    DROP COLUMN `intro`,
    DROP COLUMN `passwordHash`,
    DROP COLUMN `profile`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `admin` TINYINT NOT NULL,
    ADD COLUMN `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    ADD COLUMN `password` VARCHAR(100) NOT NULL,
    ADD COLUMN `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    MODIFY `firstName` VARCHAR(100) NOT NULL,
    MODIFY `middleName` VARCHAR(100) NOT NULL,
    MODIFY `lastName` VARCHAR(100) NOT NULL,
    MODIFY `email` VARCHAR(100) NOT NULL,
    MODIFY `mobile` VARCHAR(100) NOT NULL,
    ALTER COLUMN `registeredAt` DROP DEFAULT,
    MODIFY `lastLogin` TIMESTAMP(0) NOT NULL;

-- DropTable
DROP TABLE `post`;

-- DropTable
DROP TABLE `post_category`;

-- DropTable
DROP TABLE `post_comment`;

-- DropTable
DROP TABLE `post_meta`;

-- DropTable
DROP TABLE `post_tag`;

-- DropTable
DROP TABLE `tag`;

-- CreateTable
CREATE TABLE `product` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(100) NOT NULL,
    `metaTitle` VARCHAR(100) NOT NULL,
    `slug` VARCHAR(100) NOT NULL,
    `summery` VARCHAR(100) NOT NULL,
    `price` INTEGER NOT NULL,
    `discount` INTEGER NOT NULL,
    `userId` BIGINT UNSIGNED NOT NULL,
    `publishedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `startsdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `endsdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `token` VARCHAR(100) NOT NULL,
    `subTotal` INTEGER NOT NULL,
    `itemDiscount` INTEGER NOT NULL,
    `tax` INTEGER NOT NULL,
    `total` INTEGER NOT NULL,
    `discount` INTEGER NOT NULL,
    `grandTotal` INTEGER NOT NULL,
    `firstName` VARCHAR(100) NOT NULL,
    `middleName` VARCHAR(100) NOT NULL,
    `lastName` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `userId` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cart` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `sessionId` VARCHAR(100) NOT NULL,
    `token` VARCHAR(100) NOT NULL,
    `status` VARCHAR(100) NOT NULL,
    `firstName` VARCHAR(100) NOT NULL,
    `middleName` VARCHAR(100) NOT NULL,
    `lastName` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `country` VARCHAR(100) NOT NULL,
    `userId` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_review` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `rating` VARCHAR(100) NOT NULL,
    `content` VARCHAR(100) NOT NULL,
    `productId` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_meta` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(50) NOT NULL,
    `content` TEXT NOT NULL,
    `productId` BIGINT UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `product_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `order_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart` ADD CONSTRAINT `cart_userId_foreign` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_review` ADD CONSTRAINT `product_review_productId_foreign` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_meta` ADD CONSTRAINT `product_meta_productId_foreign` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
