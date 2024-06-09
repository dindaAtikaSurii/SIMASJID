

CREATE TABLE `data_log` (
  `aktivitas` varchar(255) NOT NULL,
  `pelaku_aktivitas` varchar(255) NOT NULL,
  `tanggal_aktivitas` datetime NOT NULL,
  `detail_aktivitas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO data_log VALUES("Hapus","root@localhost","2019-08-03 09:20:07","Menghapus Petugas BerID PT-003");
INSERT INTO data_log VALUES("Hapus","root@localhost","2019-08-03 09:20:10","Menghapus Petugas BerID PT-002");
INSERT INTO data_log VALUES("Hapus","root@localhost","2019-08-03 09:20:13","Menghapus Petugas BerID PT-001");
INSERT INTO data_log VALUES("Hapus","root@localhost","2019-08-03 09:20:49","Menghapus User BerID 001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-03 10:31:47","Menambah Petugas BerID PT-001");
INSERT INTO data_log VALUES("Mengubah","root@localhost","2019-08-03 10:33:59","Mengubah Data Petugas BerID PT-001");
INSERT INTO data_log VALUES("Hapus","root@localhost","2019-08-03 10:34:07","Menghapus Petugas BerID PT-001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-03 10:34:19","Menambah Petugas BerID PT-001");
INSERT INTO data_log VALUES("Mengubah","root@localhost","2019-08-03 10:34:25","Mengubah Data Petugas BerID PT-001");
INSERT INTO data_log VALUES("Hapus","root@localhost","2019-08-03 10:34:31","Menghapus Petugas BerID PT-001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-03 10:37:33","Menambah Kategori Donasi");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-04 11:42:22","Menambah User BerID US-001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-04 19:03:03","Menambah User Kategori Sedekah");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-04 19:28:18","Menambah Petugas BerID PT-001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2019-08-04 19:28:53","Menambah User BerID US-002");
INSERT INTO data_log VALUES("Mengubah","root@localhost","2021-09-01 20:22:29","Mengubah Data Petugas BerID PT-001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2024-06-08 14:43:38","Menambah User BerID US-003");
INSERT INTO data_log VALUES("Mengubah","root@localhost","2024-06-09 01:21:52","Mengubah Data Petugas BerID PT-001");
INSERT INTO data_log VALUES("Tambah","root@localhost","2024-06-09 01:22:42","Menambah Petugas BerID PT-002");



CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_reset_tokens_table","1");
INSERT INTO migrations VALUES("3","2019_08_19_000000_create_failed_jobs_table","1");
INSERT INTO migrations VALUES("4","2019_12_14_000001_create_personal_access_tokens_table","1");



CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `tbl_admin` (
  `id_admin` char(6) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `nohp_admin` varchar(13) DEFAULT NULL,
  `alamat_admin` text DEFAULT NULL,
  `username_admin` varchar(50) NOT NULL,
  `password_admin` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_admin VALUES("AD-001","Ari Smrd","085863727216","Bebas","admin","*4ACFE3202A5FF5CF467898FC58AAB1D615029441");



CREATE TABLE `tbl_agenda` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `id_petugas` char(6) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `id_petugas` (`id_petugas`),
  KEY `id_petugas_2` (`id_petugas`),
  KEY `id_petugas_3` (`id_petugas`),
  KEY `id_petugas_4` (`id_petugas`),
  KEY `id_petugas_5` (`id_petugas`),
  CONSTRAINT `tbl_agenda_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `tbl_petugas` (`id_petugas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_agenda VALUES("1","PT-001","JUMAT BERKAH","14:00:00","18:00:00","2024-06-08","2024-06-08","Dalam rangka jumat berkah mengadakan acara makan geratis bagi yang membutuhkan");
INSERT INTO tbl_agenda VALUES("2","PT-001","Pengajian","20:15:00","22:15:00","2024-06-09","2024-06-12","Pengajian bersama");
INSERT INTO tbl_agenda VALUES("3","PT-001","Santunan Anak yatim","13:00:00","16:00:00","2024-06-17","2024-06-18","Berbagi kepada anak yatim");



CREATE TABLE `tbl_album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `id_petugas` char(6) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `tgl_upload` date NOT NULL,
  PRIMARY KEY (`id_album`),
  KEY `id_petugas` (`id_petugas`),
  CONSTRAINT `tbl_album_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `tbl_petugas` (`id_petugas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_album VALUES("1","PT-001","masjid-al-hakim_169.jpeg","2024-06-08");
INSERT INTO tbl_album VALUES("3","PT-001","rabbids-removebg-preview.png","2024-06-09");
INSERT INTO tbl_album VALUES("4","PT-001","sent.png","2024-06-09");



CREATE TABLE `tbl_dana` (
  `id_dana` int(10) NOT NULL AUTO_INCREMENT,
  `id_kategori` char(10) NOT NULL,
  `total` bigint(15) NOT NULL,
  PRIMARY KEY (`id_dana`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `tbl_dana_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_dana VALUES("1","KT01","0");
INSERT INTO tbl_dana VALUES("2","KT02","0");



CREATE TABLE `tbl_detailpemasukan` (
  `id_pemasukan` char(10) NOT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `jumlah` int(5) NOT NULL,
  KEY `id_pemasukan` (`id_pemasukan`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `tbl_detailpemasukan_ibfk_1` FOREIGN KEY (`id_pemasukan`) REFERENCES `tbl_pemasukan` (`id_pemasukan`),
  CONSTRAINT `tbl_detailpemasukan_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_detailtransfer` (
  `id_transfer` varchar(10) NOT NULL,
  `id_kategori` char(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  KEY `2` (`id_kategori`),
  KEY `1` (`id_transfer`),
  KEY `id_transfer` (`id_transfer`),
  CONSTRAINT `tbl_detailtransfer_ibfk_1` FOREIGN KEY (`id_transfer`) REFERENCES `tbl_transfer` (`id_transfer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_kategori` (
  `id_kategori` char(10) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_kategori VALUES("KT01","Donasi");
INSERT INTO tbl_kategori VALUES("KT02","Sedekah");



CREATE TABLE `tbl_pemasukan` (
  `id_pemasukan` char(10) NOT NULL,
  `id_user` char(10) NOT NULL,
  `id_petugas` char(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tgl_pemasukan` varchar(15) NOT NULL,
  `totalbayar` bigint(13) NOT NULL,
  PRIMARY KEY (`id_pemasukan`),
  KEY `id_petugas` (`id_petugas`),
  KEY `id_petugas_2` (`id_petugas`),
  KEY `id_petugas_3` (`id_petugas`),
  CONSTRAINT `tbl_pemasukan_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `tbl_petugas` (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_pengeluaran` (
  `id_pengeluaran` char(10) NOT NULL,
  `id_kategori` char(10) NOT NULL,
  `id_petugas` char(10) NOT NULL,
  `tgl_pengeluaran` datetime NOT NULL,
  `nominal` int(12) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_pengeluaran`),
  KEY `id_petugas` (`id_petugas`),
  KEY `id_kategori` (`id_kategori`),
  KEY `id_petugas_2` (`id_petugas`),
  KEY `id_petugas_3` (`id_petugas`),
  CONSTRAINT `tbl_pengeluaran_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tbl_kategori` (`id_kategori`),
  CONSTRAINT `tbl_pengeluaran_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `tbl_petugas` (`id_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_petugas` (
  `id_petugas` char(6) NOT NULL,
  `no_ktp` int(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` int(13) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `id_admin` char(6) NOT NULL,
  PRIMARY KEY (`id_petugas`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `tbl_petugas_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tbl_admin` (`id_admin`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_petugas VALUES("PT-001","908070605","sumanto"," Sekeloa ","2147483647","petugas","$2y$10$q/vBmuqpujbweoBkZvR5TOWN0AnoqDb/1PiS.s7Bf9OjFYq07ews6","AD-001");
INSERT INTO tbl_petugas VALUES("PT-002","12345","wahyu","airtawar","56788990","wahyu","$2y$10$E9RkKIYLTG6j9rsv4xNIk.CJEmI5JYId31gKAvKnQPj4JwBOM80Ee","AD-001");



CREATE TABLE `tbl_sementara` (
  `id_pemasukan` char(10) NOT NULL,
  `id_kategori` char(10) NOT NULL,
  `jumlah` int(5) NOT NULL,
  KEY `id_pemasukan` (`id_pemasukan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_sementaratrf` (
  `id_transfer` varchar(10) NOT NULL,
  `id_kategori` char(10) NOT NULL,
  `subtotal` int(10) NOT NULL,
  KEY `id_transfer` (`id_transfer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_transfer` (
  `id_transfer` varchar(10) NOT NULL,
  `id_user` char(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_rekening` varchar(30) NOT NULL,
  `nama_bank` varchar(30) NOT NULL,
  `jumlah` bigint(15) NOT NULL,
  `tgl_transfer` date NOT NULL,
  `image` varchar(100) NOT NULL,
  `status` enum('tertunda','sukses') NOT NULL,
  PRIMARY KEY (`id_transfer`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `tbl_transfer_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;




CREATE TABLE `tbl_user` (
  `id_user` char(6) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `nohp_user` varchar(13) NOT NULL,
  `alamat_user` text NOT NULL,
  `bank_user` varchar(30) NOT NULL,
  `rekening_user` varchar(35) NOT NULL,
  `username_user` varchar(50) NOT NULL,
  `password_user` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO tbl_user VALUES("US-001","sadsa","+623123212131","dsadas","","","123","$2y$10$cuBCKtCsaVIhHZ9CRiSeUuEzNcd43RWx8motgmK0aJA9eJoC/Wc0u");
INSERT INTO tbl_user VALUES("US-002","Muhammad Farhaan","081982745182","BPC","BNI","601004235","user","$2y$10$JuuQnZY0SIxlVnL/DhmbruCgrpuWIy9QekbWeh3e1sJDFFKFG2Xe2");
INSERT INTO tbl_user VALUES("US-003","dinda","8776554","JALAN PUYUH","BRI","12345678","dindaatika","$2y$10$jlnjacDcK0Wwca6utR0Jqu5cKHRztcYkDdZz6rhdWx3NRC84Fyc5O");



CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


