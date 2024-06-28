-- CreateTable
CREATE TABLE `binh_luan` (
    `binh_luan_id` INTEGER NOT NULL AUTO_INCREMENT,
    `nguoi_dung_id` INTEGER NULL,
    `hinh_id` INTEGER NULL,
    `ngay_binh_luan` DATE NULL,
    `noi_dung` VARCHAR(1000) NULL,

    INDEX `hinh_id`(`hinh_id`),
    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`binh_luan_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hinh_anh` (
    `hinh_id` INTEGER NOT NULL AUTO_INCREMENT,
    `ten_hinh` VARCHAR(100) NULL,
    `duong_dan` VARCHAR(200) NULL,
    `mo_ta` VARCHAR(2000) NULL,
    `nguoi_dung_id` INTEGER NULL,

    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`hinh_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `luu_anh` (
    `luu_id` INTEGER NOT NULL AUTO_INCREMENT,
    `nguoi_dung_id` INTEGER NULL,
    `hinh_id` INTEGER NULL,
    `ngay_luu` DATE NULL,

    INDEX `hinh_id`(`hinh_id`),
    INDEX `nguoi_dung_id`(`nguoi_dung_id`),
    PRIMARY KEY (`luu_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `nguoi_dung` (
    `nguoi_dung_id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(100) NOT NULL,
    `mat_khau` VARCHAR(200) NOT NULL,
    `ho_ten` VARCHAR(70) NOT NULL,
    `tuoi` INTEGER NULL,
    `anh_dai_dien` VARCHAR(200) NULL,

    PRIMARY KEY (`nguoi_dung_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `binh_luan` ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `binh_luan` ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh`(`hinh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `hinh_anh` ADD CONSTRAINT `hinh_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `luu_anh` ADD CONSTRAINT `luu_anh_ibfk_1` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `nguoi_dung`(`nguoi_dung_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `luu_anh` ADD CONSTRAINT `luu_anh_ibfk_2` FOREIGN KEY (`hinh_id`) REFERENCES `hinh_anh`(`hinh_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
