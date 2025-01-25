CREATE database shopee_multilingual;

USE shopee_multilingual;

# Category

CREATE TABLE categories (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL, -- Nama kategori dalam bahasa default
parent_id INT NULL, -- Menunjukkan kategori induk (NULL jika kategori utama)
icon_url VARCHAR(255), -- URL ikon untuk kategori
is_active BOOLEAN DEFAULT TRUE, -- Status aktif/inaktif
is_recommended BOOLEAN DEFAULT FALSE,
FOREIGN KEY (parent_id) REFERENCES categories(id) ON DELETE CASCADE
)Engine = InnoDB;

DESCRIBE categories;

# CategoryTranslations

CREATE TABLE category_translations (
id INT AUTO_INCREMENT PRIMARY KEY,
category_id INT NOT NULL, -- Mengacu ke tabel categories
language_code VARCHAR(10) NOT NULL, -- Misalnya: 'en', 'id'
name VARCHAR(255) NOT NULL, -- Nama kategori
description TEXT, -- Deskripsi kategori
UNIQUE (category_id, language_code), -- Menghindari duplikasi bahasa
FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
)Engine = InnoDB;

DESCRIBE categories;

# Input data 
-- Kategori utama : Elektronik

INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES 
('Elektronik', NULL, '/icons/electronics.png', TRUE, FALSE),
('Makanan & Minuman', NULL, '/icons/food.png', TRUE, FALSE),
('Komputer & Aksesoris', NULL, '/icons/computer.png', TRUE, FALSE),
('Perawatan & Kecantikan', NULL, '/icons/beauty.png', TRUE, FALSE),
('Handphone & Aksesoris', NULL, '/icons/phone_accessories.png', TRUE, FALSE),
('Perlengkapan Rumah', NULL, '/icons/home_appliances.png', TRUE, FALSE),
('Pakaian Pria', NULL, '/icons/men_clothing.png', TRUE, FALSE),
('Pakaian Wanita', NULL, '/icons/women_clothing.png', TRUE, FALSE),
('Sepatu Pria', NULL, '/icons/men_shoes.png', TRUE, FALSE),
('Fashion Muslim', NULL, '/icons/muslim_fashion.png', TRUE, TRUE),
('Tas Pria', NULL, '/icons/men_bags.png', TRUE, FALSE),
('Fashion Bayi & Anak', NULL, '/icons/baby_kids_fashion.png', TRUE, FALSE),
('Aksesoris Fashion', NULL, '/icons/fashion_accessories.png', TRUE, FALSE),
('Ibu & Bayi', NULL, '/icons/mom_baby.png', TRUE, TRUE),
('Jam Tangan', NULL, '/icons/watches.png', TRUE, FALSE),
('Sepatu Wanita', NULL, '/icons/women_shoes.png', TRUE, FALSE),
('Kesehatan', NULL, '/icons/health.png', TRUE, TRUE),
('Tas Wanita', NULL, '/icons/women_bags.png', TRUE, FALSE),
('Hobi & Koleksi', NULL, '/icons/hobby_collection.png', TRUE, FALSE),
('Otomotif', NULL, '/icons/automotive.png', TRUE, FALSE),
('Olahraga & Outdoor', NULL, '/icons/sports_outdoor.png', TRUE, TRUE),
('Buku & Alat Tulis', NULL, '/icons/books_stationery.png', TRUE, FALSE),
('Souvenir', NULL, '/icons/souvenir.png', TRUE, FALSE),
('Fotografi', NULL, '/icons/photography.png', TRUE, FALSE);

SELECT * FROM categories;

-- Subkategori Elektronik
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Konsol Game', 1, '/icons/game_console.png', TRUE, FALSE),
('Aksesoris Konsol', 1, '/icons/console_accessories.png', TRUE, FALSE),
('Alat Casting', 1, '/icons/casting_tools.png', TRUE, FALSE),
('Foott Bath & Spa', 1, '/icons/foot_bath_spa.png', TRUE, FALSE),
('Mesin Jahit & Aksesoris', 1, '/icons/sewing_machine.png', TRUE, FALSE),
('Setrika & Mesin Uap', 1, '/icons/iron_steamer.png', TRUE, FALSE),
('Purifier & Humidifier', 1, '/icons/air_purifier.png', TRUE, FALSE),
('Penyedot Debu & Peralatan Perawatan Lantai', 1, '/icons/vacuum_cleaner.png', TRUE, FALSE),
('Telepon', 1, '/icons/telephone.png', TRUE, FALSE),
('Mesin Cuci & Pengering', 1, '/icons/washing_machine.png', TRUE, FALSE),
('Water Heater', 1, '/icons/water_heater.png', TRUE, FALSE),
('Pendingin Ruangan', 1, '/icons/air_conditioner.png', TRUE, FALSE),
('Pengering Sepatu', 1, '/icons/shoe_dryer.png', TRUE, FALSE),
('Penghangat Ruangan', 1, '/icons/room_heater.png', TRUE, FALSE),
('TV & Aksesoris', 1, '/icons/tv_accessories.png', TRUE, FALSE),
('Media Player', 1, '/icons/media_player.png', TRUE, FALSE),
('Perangkat Audio & Speaker', 1, '/icons/audio_speaker.png', TRUE, FALSE),
('Elektronik Lainnya', 1, '/icons/other_electronics.png', TRUE, FALSE);

-- Subkategori Makanan & Minuman
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Makanan Ringan', 2, '/icons/snacks.png', TRUE, TRUE),
('Bahan Pokok', 2, '/icons/staple_foods.png', TRUE, TRUE),
('Menu Sarapan', 2, '/icons/breakfast_menu.png', TRUE, FALSE),
('Minuman', 2, '/icons/drinks.png', TRUE, FALSE),
('Susu & Olahan', 2, '/icons/dairy_products.png', TRUE, FALSE),
('Makanan Segar & Beku', 2, '/icons/fresh_frozen_food.png', TRUE, TRUE),
('Roti & Kue', 2, '/icons/bread_cakes.png', TRUE, FALSE),
('Makanan Kaleng', 2, '/icons/canned_foods.png', TRUE, FALSE),
('Makanan Instan', 2, '/icons/instant_foods.png', TRUE, FALSE),
('Makanan & Minuman Lainnya', 2, '/icons/other_food_and_beverages.png', TRUE, FALSE);

-- Subkategori Komputer & Aksesoris
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Deskop', 3, '/icons/desktop.png', TRUE, FALSE),
('Monitor', 3, '/icons/monitor.png', TRUE, FALSE),
('Penyimpanan Data', 3, '/icons/data_storage.png', TRUE, FALSE),
('Komponen Network', 3, '/icons/network_components.png', TRUE, FALSE),
('Software', 3, '/icons/software.png', TRUE, FALSE),
('Peralatan Kantor', 3, '/icons/office_equipment.png', TRUE, FALSE),
('Printer & Scanner', 3, '/icons/printer_scanner.png', TRUE, FALSE),
('Keyboard & Mouse', 3, '/icons/keyboard_mouse.png', TRUE, FALSE),
('Laptop', 3, '/icons/laptop.png', TRUE, FALSE),
('Proyektor & Aksesoris', 3, '/icons/projector_accessories.png', TRUE, FALSE),
('Audio Computer', 3, '/icons/computer_audio.png', TRUE, FALSE),
('Komputer & Aksesoris Lainnya', 3, '/icons/other_computer_accessories.png', TRUE, FALSE);

-- Subkategori Perawatan & Kecantikan
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Perawatan Tubuh', 4, '/icons/body_care.png', TRUE, TRUE),
('Perawatan Tangan', 4, '/icons/hand_care.png', TRUE, FALSE),
('Perawatan Kaki', 4, '/icons/foot_care.png', TRUE, FALSE),
('Perawatan Kuku', 4, '/icons/nail_care.png', TRUE, FALSE),
('Perawatan Rambut', 4, '/icons/hair_care.png', TRUE, FALSE),
('Perawatan Pria', 4, '/icons/men_care.png', TRUE, FALSE),
('Parfum & Wewangian', 4, '/icons/perfume.png', TRUE, FALSE),
('Kosmetik Wajah', 4, '/icons/face_cosmetic.png', TRUE, FALSE),
('Kosmetik Mata', 4, '/icons/eye_cosmetic.png', TRUE, FALSE),
('Kosmetik Bibir', 4, '/icons/lip_cosmetic.png', TRUE, FALSE),
('Pembersih Make Up', 4, '/icons/makeup_cleaner.png', TRUE, FALSE),
('Aksesoris MakeUp', 4, '/icons/makeup_accessories.png', TRUE, FALSE),
('Alat Perawatan Wajah', 4, '/icons/face_care_tools.png', TRUE, FALSE),
('Alat Penghilang Bulu Rambut', 4, '/icons/hair_removal_tools.png', TRUE, FALSE),
('Perawatan Wajah', 4, '/icons/face_treatment.png', TRUE, TRUE),
('Treatment Mata', 4, '/icons/eye_treatment.png', TRUE, FALSE),
('Treatment Bibir', 4, '/icons/lip_treatment.png', TRUE, FALSE),
('Perawatan & Kecantikan Lainnya', 4, '/icons/other_beauty_care.png', TRUE, FALSE);

-- Subkategori Handphone & Aksesoris
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Handphone', 5, '/icons/handphone.png', TRUE, FALSE),
('Kartu Perdana', 5, '/icons/sim_card.png', TRUE, FALSE),
('Tablet', 5, '/icons/tablet.png', TRUE, FALSE),
('Perangkat Wearable', 5, '/icons/wearable_device.png', TRUE, FALSE),
('Perangkat VR', 5, '/icons/vr_device.png', TRUE, FALSE),
('Aksesoris Selfie', 5, '/icons/selfie_accessories.png', TRUE, FALSE),
('Handphone & Tablet Aksesoris', 5, '/icons/phone_tablet_accessories.png', TRUE, FALSE),
('Kartu Memori', 5, '/icons/memory_card.png', TRUE, FALSE),
('Kabel, Charger, & Konverter', 5, '/icons/cable_charger_converter.png', TRUE, FALSE),
('Powerbank & Baterai', 5, '/icons/powerbank_battery.png', TRUE, FALSE),
('Casing & Skin', 5, '/icons/casing_skin.png', TRUE, TRUE),
('Audio Handphone', 5, '/icons/phone_audio.png', TRUE, FALSE),
('Handphone & Aksesoris Lainnya', 5, '/icons/other_phone_accessories.png', TRUE, FALSE);

SELECT * FROM categories;

-- Subkategori Perlengkapan Rumah
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Renovasi Rumah', 6, '/icons/home_renovation.png', TRUE, FALSE),
('Perkakas', 6, '/icons/tools.png', TRUE, FALSE),
('Alat Pemeliharaan Rumah', 6, '/icons/home_maintenance_tools.png', TRUE, FALSE),
('Kebersihan & Binatu', 6, '/icons/cleaning_laundry.png', TRUE, FALSE),
('Peralatan Dapur', 6, '/icons/kitchen_appliances.png', TRUE, TRUE),
('Peralatan Masak', 6, '/icons/cooking_tools.png', TRUE, FALSE),
('Peralatan Makan', 6, '/icons/dining_tools.png', TRUE, FALSE),
('Alat Pengaman', 6, '/icons/safety_tools.png', TRUE, FALSE),
('Organizer Rumah', 6, '/icons/home_organizer.png', TRUE, FALSE),
('Perlengkapan Keagamaan', 6, '/icons/religious_supplies.png', TRUE, FALSE),
('Payung', 6, '/icons/umbrella.png', TRUE, FALSE),
('Pengharum Ruangan & Aromaterapi', 6, '/icons/air_freshener_aromatherapy.png', TRUE, FALSE),
('Kamar Mandi', 6, '/icons/bathroom.png', TRUE, FALSE),
('Kamar Tidur', 6, '/icons/bedroom.png', TRUE, FALSE),
('Dekorasi', 6, '/icons/decoration.png', TRUE, TRUE),
('Furniture', 6, '/icons/furniture.png', TRUE, FALSE),
('Taman', 6, '/icons/garden.png', TRUE, FALSE),
('Perlengkapan Rumah Lainnya', 6, '/icons/other_home_supplies.png', TRUE, FALSE);

-- Subkategori Pakaian Pria
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Denim', 7, '/icons/denim.png', TRUE, FALSE),
('Hoodie & Sweatshirt', 7, '/icons/hoodie_sweatshirt.png', TRUE, FALSE),
('Sweater & Cardigan', 7, '/icons/sweater_cardigan.png', TRUE, FALSE),
('Jaket, Mantel, & Rompi', 7, '/icons/jacket_coat_vest.png', TRUE, FALSE),
('Jas Formal', 7, '/icons/formal_suit.png', TRUE, FALSE),
('Celana Panjang', 7, '/icons/long_pants.png', TRUE, FALSE),
('Celana Pendek', 7, '/icons/short_pants.png', TRUE, FALSE),
('Atasan', 7, '/icons/shirts.png', TRUE, TRUE),
('Batik', 7, '/icons/batik.png', TRUE, FALSE),
('Pakaian Dalam', 7, '/icons/underwear.png', TRUE, FALSE),
('Pakaian Tidur', 7, '/icons/sleepwear.png', TRUE, FALSE),
('Set Pakaian Pria', 7, '/icons/men_clothing_set.png', TRUE, FALSE),
('Pakaian Tradisional', 7, '/icons/traditional_clothing.png', TRUE, FALSE),
('Kostum', 7, '/icons/costume.png', TRUE, FALSE),
('Pakaian Kerja', 7, '/icons/work_clothing.png', TRUE, FALSE),
('Pakaian Pria Lainnya', 7, '/icons/other_men_clothing.png', TRUE, FALSE);

SELECT * FROM categories;

-- Subkategori Pakaian Wanita
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Pakaian Tradisional', 8, '/icons/traditional_clothing.png', TRUE, FALSE),
('Kostum', 8, '/icons/costume.png', TRUE, FALSE),
('Kain', 8, '/icons/fabric.png', TRUE, FALSE),
('Batik', 8, '/icons/batik.png', TRUE, FALSE),
('Denim', 8, '/icons/denim.png', TRUE, FALSE),
('Atasan', 8, '/icons/shirts.png', TRUE, TRUE),
('Celana Panjang & Legging', 8, '/icons/long_pants_leggings.png', TRUE, FALSE),
('Celana Pendek', 8, '/icons/short_pants.png', TRUE, FALSE),
('Rok', 8, '/icons/skirt.png', TRUE, FALSE),
('Dress', 8, '/icons/dress.png', TRUE, FALSE),
('Wedding Dress', 8, '/icons/wedding_dress.png', TRUE, FALSE),
('Jumpsuit, Playsuit & Overall', 8, '/icons/jumpsuit_playsuit_overall.png', TRUE, FALSE),
('Jaket, Mantel & Rompi', 8, '/icons/jacket_coat_vest.png', TRUE, FALSE),
('Sweater & Cardigan', 8, '/icons/sweater_cardigan.png', TRUE, FALSE),
('Hoodie & Sweatshirt', 8, '/icons/hoodie_sweatshirt.png', TRUE, FALSE),
('Pakaian Dalam', 8, '/icons/underwear.png', TRUE, FALSE),
('Pakaian Tidur & Piyama', 8, '/icons/sleepwear.png', TRUE, FALSE),
('Baju Hamil', 8, '/icons/maternity_clothing.png', TRUE, FALSE),
('Pakaian Wanita Lainnya', 8, '/icons/other_women_clothing.png', TRUE, FALSE);

-- Subkategori Sepatu Pria
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Sneakers', 9, '/icons/sneakers.png', TRUE, FALSE),
('Kaos Kaki', 9, '/icons/socks.png', TRUE, FALSE),
('Sandal', 9, '/icons/sandals.png', TRUE, FALSE),
('Boot', 9, '/icons/boots.png', TRUE, FALSE),
('Tali Sepatu', 9, '/icons/shoelaces.png', TRUE, FALSE),
('Slip-On & Mules', 9, '/icons/slipon_mules.png', TRUE, FALSE),
('Sepatu Formal', 9, '/icons/formal_shoes.png', TRUE, FALSE),
('Sepatu Pria Lainnya', 9, '/icons/other_men_shoes.png', TRUE, FALSE);

-- Subkategori Fashion Muslim
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Hijab', 10, '/icons/hijab.png', TRUE, TRUE),
('Aksesoris Muslim', 10, '/icons/muslim_accessories.png', TRUE, FALSE),
('Atasan Muslim Wanita', 10, '/icons/muslim_women_tops.png', TRUE, FALSE),
('Dress Muslim', 10, '/icons/muslim_dress.png', TRUE, FALSE),
('Bawahan Muslim Wanita', 10, '/icons/muslim_women_bottoms.png', TRUE, FALSE),
('Mukena & Perlengkapan Sholat', 10, '/icons/prayer_gear.png', TRUE, FALSE),
('Pakaian Muslim Pria', 10, '/icons/muslim_men_clothing.png', TRUE, FALSE),
('Pakaian Muslim Anak', 10, '/icons/muslim_kids_clothing.png', TRUE, FALSE),
('Outerwear', 10, '/icons/muslim_outerwear.png', TRUE, FALSE),
('Fashion Muslim Lainnya', 10, '/icons/other_muslim_fashion.png', TRUE, FALSE);

-- Subkategori Tas Pria
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Tas Selempang & Bahu Pria', 11, '/icons/mens_sling_bag.png', TRUE, FALSE),
('Dompet', 11, '/icons/wallet.png', TRUE, FALSE),
('Ransel Pria', 11, '/icons/mens_backpack.png', TRUE, FALSE),
('Tas Pinggang Pria', 11, '/icons/mens_waist_bag.png', TRUE, FALSE),
('Tas Laptop', 11, '/icons/laptop_bag.png', TRUE, FALSE),
('Clutch', 11, '/icons/clutch.png', TRUE, FALSE),
('Tote Bag', 11, '/icons/tote_bag.png', TRUE, FALSE),
('Tas Kerja', 11, '/icons/briefcase.png', TRUE, FALSE),
('Tas Pria Lainnya', 11, '/icons/other_mens_bags.png', TRUE, FALSE);


-- Subkategori Fashion Bayi & Anak
INSERT INTO categories (name, parent_id, icon_url, is_active, is_recommended)
VALUES
('Pakaian Bayi', 12, '/icons/baby_clothing.png', TRUE, FALSE),
('Sepatu Bayi', 12, '/icons/baby_shoes.png', TRUE, FALSE),
('Pakaian Anak Laki-Laki', 12, '/icons/boys_clothing.png', TRUE, TRUE),
('Pakaian Anak Perempuan', 12, '/icons/girls_clothing.png', TRUE, TRUE),
('Sepatu Anak Laki-Laki', 12, '/icons/boys_shoes.png', TRUE, FALSE),
('Sepatu Anak Perempuan', 12, '/icons/girls_shoes.png', TRUE, FALSE),
('Tas Anak Laki-Laki', 12, '/icons/boys_bag.png', TRUE, FALSE),
('Tas Anak Perempuan', 12, '/icons/girls_bag.png', TRUE, FALSE),
('Aksesoris Bayi & Anak', 12, '/icons/kids_accessories.png', TRUE, FALSE),
('Perlengkapan Hujan', 12, '/icons/rain_gear.png', TRUE, FALSE),
('Perhiasan', 12, '/icons/jewelry.png', TRUE, FALSE),
('Fashion Bayi & Anak Lainnya', 12, '/icons/other_kids_fashion.png', TRUE, FALSE);

# Input data categoriesTranslations
-- Contoh 
INSERT INTO category_translations (category_id, language_code, name, description)
VALUES
-- Kategori utama dalam 3 bahasa
(1, 'IN', 'Elektronik', 'Kategori untuk barang elektronik seperti handphone, laptop, dan perangkat lainnya.'),
(1, 'EN', 'Electronics', 'Category for electronics such as phones, laptops, and other devices.'),
(1, 'FR', 'Électronique', 'Catégorie pour les produits électroniques comme les téléphones, ordinateurs portables et autres appareils.'),
(2, 'IN', 'Makanan & Minuman', 'Berbagai jenis makanan dan minuman untuk kebutuhan sehari-hari.'),
(2, 'EN', 'Food & Beverages', 'Various types of food and beverages for daily needs.'),
(2, 'FR', 'Alimentation et Boissons', 'Divers types de nourriture et de boissons pour les besoins quotidiens.'),
-- Subkategori Makanan Ringan
(43, 'IN', 'Makanan Ringan', 'Camilan ringan seperti keripik, biskuit, dan lainnya.'),
(43, 'EN', 'Snacks', 'Light snacks such as chips, biscuits, and more.'),
(43, 'FR', 'Snacks', 'Snacks légers comme des chips, des biscuits et plus encore.'),
-- Subkategori Minuman
(46, 'IN', 'Minuman', 'Berbagai jenis minuman seperti jus, teh, dan kopi.'),
(46, 'EN', 'Drinks', 'Various types of drinks such as juice, tea, and coffee.'),
(46, 'FR', 'Boissons', 'Divers types de boissons comme le jus, le thé et le café.'),
-- Subkategori Bahan Pokok
(44, 'IN', 'Bahan Pokok', 'Kebutuhan dasar seperti beras, gula, dan tepung.'),
(44, 'EN', 'Staples', 'Basic needs like rice, sugar, and flour.'),
(44, 'FR', 'Produits de Base', 'Besoins de base comme le riz, le sucre et la farine.');

INSERT INTO category_translations (category_id, language_code, name, description)
VALUES
-- Komputer & Aksesoris
(3, 'EN', 'Computer & Accessories', 'Category for computers, laptops, and related accessories'),
(3, 'ID', 'Komputer & Aksesoris', 'Kategori untuk komputer, laptop, dan aksesoris terkait'),
(3, 'FR', 'Ordinateurs & Accessoires', 'Catégorie pour ordinateurs, ordinateurs portables et accessoires'),
-- Perawatan & Kecantikan
(4, 'EN', 'Beauty & Personal Care', 'Category for skincare, cosmetics, and personal care'),
(4, 'ID', 'Perawatan & Kecantikan', 'Kategori untuk perawatan kulit, kosmetik, dan perawatan pribadi'),
(4, 'FR', 'Soins & Beauté', 'Catégorie pour soins de la peau, cosmétiques et soins personnels'),
-- Handphone & Aksesoris
(5, 'EN', 'Mobile Phones & Accessories', 'Category for smartphones, phone cases, and accessories'),
(5, 'ID', 'Handphone & Aksesoris', 'Kategori untuk ponsel, casing ponsel, dan aksesoris'),
(5, 'FR', 'Téléphones & Accessoires', 'Catégorie pour téléphones portables et accessoires'),
-- Perlengkapan Rumah
(6, 'EN', 'Home Supplies', 'Category for household equipment and furniture'),
(6, 'ID', 'Perlengkapan Rumah', 'Kategori untuk peralatan rumah tangga dan furniture'),
(6, 'FR', 'Fournitures de Maison', 'Catégorie pour équipements ménagers et meubles'),
-- Pakaian Pria
(7, 'EN', 'Men\'s Clothing', 'Category for men\'s fashion and apparel'),
(7, 'ID', 'Pakaian Pria', 'Kategori untuk pakaian pria dan fashion'),
(7, 'FR', 'Vêtements Hommes', 'Catégorie pour vêtements et mode pour hommes'),
-- Pakaian Wanita
(8, 'EN', 'Women\'s Clothing', 'Category for women\'s fashion and apparel'),
(8, 'ID', 'Pakaian Wanita', 'Kategori untuk pakaian wanita dan fashion'),
(8, 'FR', 'Vêtements Femmes', 'Catégorie pour vêtements et mode pour femmes'),
-- Sepatu Pria
(9, 'EN', 'Men\'s Shoes', 'Category for men\'s footwear'),
(9, 'ID', 'Sepatu Pria', 'Kategori untuk sepatu pria'),
(9, 'FR', 'Chaussures Hommes', 'Catégorie pour chaussures pour hommes'),
-- Fashion Muslim
(10, 'EN', 'Muslim Fashion', 'Category for Muslim clothing and accessories'),
(10, 'ID', 'Fashion Muslim', 'Kategori untuk pakaian dan aksesoris Muslim'),
(10, 'FR', 'Mode Musulmane', 'Catégorie pour vêtements et accessoires musulmans'),
-- Tas Pria
(11, 'EN', 'Men\'s Bags', 'Category for bags for men, including backpacks and shoulder bags'),
(11, 'ID', 'Tas Pria', 'Kategori untuk tas pria, termasuk ransel dan tas selempang'),
(11, 'FR', 'Sacs Hommes', 'Catégorie pour sacs pour hommes, y compris sacs à dos'),
-- Fashion Bayi & Anak
(12, 'EN', 'Baby & Kids Fashion', 'Category for baby and children\'s clothing and accessories'),
(12, 'ID', 'Fashion Bayi & Anak', 'Kategori untuk pakaian dan aksesoris bayi dan anak-anak'),
(12, 'FR', 'Mode Bébés & Enfants', 'Catégorie pour vêtements et accessoires pour bébés et enfants'),
-- Aksesoris Fashion
(13, 'EN', 'Fashion Accessories', 'Category for fashion items like belts, hats, and sunglasses'),
(13, 'ID', 'Aksesoris Fashion', 'Kategori untuk item fashion seperti sabuk, topi, dan kacamata'),
(13, 'FR', 'Accessoires de Mode', 'Catégorie pour accessoires de mode comme ceintures, chapeaux'),
-- Ibu & Bayi
(14, 'EN', 'Mother & Baby', 'Category for mother and baby care products'),
(14, 'ID', 'Ibu & Bayi', 'Kategori untuk produk perawatan ibu dan bayi'),
(14, 'FR', 'Mère & Bébé', 'Catégorie pour produits pour mères et bébés'),
-- Jam Tangan
(15, 'EN', 'Watches', 'Category for wristwatches for men and women'),
(15, 'ID', 'Jam Tangan', 'Kategori untuk jam tangan pria dan wanita'),
(15, 'FR', 'Montres', 'Catégorie pour montres hommes et femmes'),
-- Sepatu Wanita
(16, 'EN', 'Women\'s Shoes', 'Category for women\'s footwear'),
(16, 'ID', 'Sepatu Wanita', 'Kategori untuk sepatu wanita'),
(16, 'FR', 'Chaussures Femmes', 'Catégorie pour chaussures pour femmes'),
-- Kesehatan
(17, 'EN', 'Health', 'Category for health and wellness products'),
(17, 'ID', 'Kesehatan', 'Kategori untuk produk kesehatan dan kebugaran'),
(17, 'FR', 'Santé', 'Catégorie pour produits de santé et bien-être'),
-- Tas Wanita
(18, 'EN', 'Women\'s Bags', 'Category for women\'s handbags, clutches, and backpacks'),
(18, 'ID', 'Tas Wanita', 'Kategori untuk tas wanita, termasuk tas tangan dan ransel'),
(18, 'FR', 'Sacs Femmes', 'Catégorie pour sacs pour femmes, y compris sacs à main'),
-- Hobi & Koleksi
(19, 'EN', 'Hobbies & Collectibles', 'Category for hobby and collectible items'),
(19, 'ID', 'Hobi & Koleksi', 'Kategori untuk hobi dan koleksi'),
(19, 'FR', 'Loisirs & Collections', 'Catégorie pour loisirs et objets de collection'),
-- Otomotif
(20, 'EN', 'Automotive', 'Category for automotive accessories and tools'),
(20, 'ID', 'Otomotif', 'Kategori untuk aksesoris dan peralatan otomotif'),
(20, 'FR', 'Automobile', 'Catégorie pour accessoires et outils automobiles'),
-- Olahraga & Outdoor
(21, 'EN', 'Sports & Outdoors', 'Category for sports and outdoor activities'),
(21, 'ID', 'Olahraga & Outdoor', 'Kategori untuk olahraga dan aktivitas luar ruangan'),
(21, 'FR', 'Sports & Plein Air', 'Catégorie pour sports et activités de plein air'),
-- Buku & Alat Tulis
(22, 'EN', 'Books & Stationery', 'Category for books and stationery products'),
(22, 'ID', 'Buku & Alat Tulis', 'Kategori untuk buku dan alat tulis'),
(22, 'FR', 'Livres & Papeterie', 'Catégorie pour livres et articles de papeterie'),
-- Souvenir
(23, 'EN', 'Souvenirs', 'Category for souvenir and gift items'),
(23, 'ID', 'Souvenir', 'Kategori untuk souvenir dan hadiah'),
(23, 'FR', 'Souvenirs', 'Catégorie pour souvenirs et cadeaux'),
-- Fotografi
(24, 'EN', 'Photography', 'Category for photography equipment and accessories'),
(24, 'ID', 'Fotografi', 'Kategori untuk perlengkapan dan aksesoris fotografi'),
(24, 'FR', 'Photographie', 'Catégorie pour équipements et accessoires de photographie');


SELECT * FROM category_translations;

-- Mengambil Semua Subkategori dari Parent ID Tertentu
SELECT * 
FROM categories 
WHERE parent_id = 1;

-- Mengambil Semua Kategori Utama (tanpa Parent)
SELECT * 
FROM categories 
WHERE parent_id IS NULL;

SELECT id, name, icon_url, is_active, is_recommended
FROM categories
WHERE parent_id IS NULL;

-- Menghubungkan semua
SELECT * FROM categories 
JOIN category_translations ct 
ON categories.id = ct.category_id;

-- Menghubungkan kategori anak (categories.parent_id) dengan nama kategori induknya
SELECT c.id AS subcategory_id, c.name AS subcategory_name, 
       parent.name AS parent_category_name, c.icon_url
FROM categories c
LEFT JOIN categories parent ON c.parent_id = parent.id
WHERE c.parent_id IS NOT NULL;

-- Menampilkan semua kategori dengan nama terjemahannya dalam bahasa Inggris (EN)
SELECT c.id AS category_id, c.name AS default_name, 
       ct.language_code, ct.name AS translated_name, ct.description
FROM categories c
LEFT JOIN category_translations ct ON c.id = ct.category_id
WHERE ct.language_code = 'EN';

-- Menampilkan semua data kategori beserta terjemahannya dalam berbagai bahasa
SELECT c.id AS category_id, c.name AS default_name, c.icon_url, 
       ct.language_code, ct.name AS translated_name, ct.description
FROM categories c
LEFT JOIN category_translations ct ON c.id = ct.category_id;

-- Menampilkan kategori yang aktif dan direkomendasikan, termasuk nama terjemahannya
SELECT c.id, c.name, c.icon_url, ct.language_code, ct.name AS translated_name
FROM categories c
LEFT JOIN category_translations ct ON c.id = ct.category_id
WHERE c.is_active = TRUE AND c.is_recommended = TRUE;

-- Menampilkan kategori atau subkategori yang memiliki nama "Makanan" (bahasa default) atau "Food" (terjemahan)
SELECT c.id, c.name AS category_name, parent.name AS parent_category_name, ct.language_code, ct.name AS translated_name
FROM categories c
LEFT JOIN categories parent ON c.parent_id = parent.id
LEFT JOIN category_translations ct ON c.id = ct.category_id
WHERE c.name LIKE '%Makanan%' OR ct.name LIKE '%Food%';

-- Menampilkan hierarki kategori induk dan subkategori dalam satu hasil
SELECT parent.id AS parent_id, parent.name AS parent_name, 
       child.id AS subcategory_id, child.name AS subcategory_name
FROM categories parent
LEFT JOIN categories child ON child.parent_id = parent.id;

-- Menampilkan kategori yang masuk rekomendasi
SELECT c.id, c.name AS category_name, c.icon_url, c.is_recommended
FROM categories c
WHERE c.is_recommended = TRUE; 

-- Menampilkan kategori yang masuk rekomendasi dengan terjemahannya
SELECT c.id AS category_id, 
       c.name AS default_name, 
       ct.language_code, 
       ct.name AS translated_name, 
       c.icon_url, 
       c.is_recommended
FROM categories c
LEFT JOIN category_translations ct ON c.id = ct.category_id
WHERE c.is_recommended = TRUE;