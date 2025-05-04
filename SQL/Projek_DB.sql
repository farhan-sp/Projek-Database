-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 04, 2025 at 02:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Projek_DB`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Barang_Dibeli` (IN `kt` INT, IN `kb` INT, IN `jumlah` INT, IN `ket` TEXT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
    INSERT INTO `Detail_Transaksi_Pembelian` (kode_transaksi_pembelian, kode_barang, jumlah_barang, keterangan)
    VALUES (kt, kb, jumlah, ket);
    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Barang_Diganti` (IN `kt` INT, IN `kb` INT, IN `jumlah` INT, IN `ket` TEXT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    INSERT INTO `Retur_Penjualan` (kode_transaksi, kode_barang, jumlah_barang, keterangan)
    VALUES (kt, kb, jumlah, ket);
    
    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Barang_Dijual` (IN `kt` INT, IN `kb` INT, IN `jumlah` INT, IN `ket` TEXT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
    INSERT INTO `Detail_Transaksi_Penjualan` (kode_transaksi_penjualan, kode_barang, jumlah_barang, keterangan)
    VALUES (kt, kb, jumlah, ket);
    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Barang`
--

CREATE TABLE `Barang` (
  `kode_barang` int(11) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga_barang` double NOT NULL,
  `berat` double NOT NULL,
  `satuan_berat` enum('kg') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Barang`
--

INSERT INTO `Barang` (`kode_barang`, `nama_barang`, `harga_barang`, `berat`, `satuan_berat`) VALUES
(1, 'Gresik Semen Abu', 57000, 40, 'kg'),
(2, 'Tiga Roda Semen Abu', 56000, 40, 'kg'),
(3, 'Cilegon Pasir Halus', 15000, 20, 'kg'),
(4, 'Bangka Pasir Halus', 14000, 20, 'kg'),
(5, 'Garuda Cat Tembok', 85000, 5, 'kg'),
(6, 'Supermix Cat Tembok', 83000, 5, 'kg'),
(7, 'Blesscon Cat Kayu dan Besi', 92000, 2.5, 'kg'),
(8, 'Ks Cat Kayu dan Besi', 91000, 2.5, 'kg'),
(9, 'Master Steel Paku Beton', 12000, 1, 'kg'),
(10, 'Taso Paku Beton', 11500, 1, 'kg'),
(11, 'Cilegon Steel Gergaji Tangan', 45000, 0.8, 'kg'),
(12, 'Meranti Gergaji Tangan', 43000, 0.8, 'kg'),
(13, 'Kamper MCB 6A', 28000, 0.2, 'kg'),
(14, 'Jayaboard MCB 6A', 27000, 0.2, 'kg'),
(15, 'Aplus Pipa Listrik PVC', 35000, 2, 'kg'),
(16, 'Dulux Pipa Listrik PVC', 34000, 2, 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `alamat_customer` varchar(255) NOT NULL,
  `nomor_telepon_customer` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`id_customer`, `nama_customer`, `alamat_customer`, `nomor_telepon_customer`) VALUES
(1, 'Siti Aminah', 'Jl. Merdeka No. 10, Jakarta', '081278945612'),
(2, 'Joko Prasetyo', 'Jl. Soekarno Hatta No. 45, Bandung', '082134567899'),
(3, 'Maria Elisabeth', 'Jl. Gajah Mada No. 22, Surabaya', '083312345678'),
(4, 'Dwi Lestari', 'Jl. Raya No. 88, Yogyakarta', '081212345678'),
(5, 'Anton Wijaya', 'Jl. Indah No. 3, Medan', '085678901234');

-- --------------------------------------------------------

--
-- Table structure for table `Detail_Transaksi_Pembelian`
--

CREATE TABLE `Detail_Transaksi_Pembelian` (
  `kode_transaksi_pembelian` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Detail_Transaksi_Pembelian`
--

INSERT INTO `Detail_Transaksi_Pembelian` (`kode_transaksi_pembelian`, `kode_barang`, `jumlah_barang`, `keterangan`) VALUES
(1, 1, 50, NULL),
(2, 2, 40, NULL),
(3, 3, 30, NULL),
(4, 4, 60, NULL),
(5, 5, 25, NULL),
(6, 6, 30, NULL),
(7, 7, 20, NULL),
(8, 8, 35, NULL),
(9, 9, 45, NULL),
(10, 10, 50, NULL);

--
-- Triggers `Detail_Transaksi_Pembelian`
--
DELIMITER $$
CREATE TRIGGER `tBarang_Dibeli` AFTER INSERT ON `Detail_Transaksi_Pembelian` FOR EACH ROW begin
    UPDATE `Stok_Barang`
    SET jumlah_stok_barang = jumlah_stok_barang + NEW.jumlah_barang 
    WHERE kode_barang = NEW.kode_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Detail_Transaksi_Penjualan`
--

CREATE TABLE `Detail_Transaksi_Penjualan` (
  `kode_transaksi_penjualan` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Detail_Transaksi_Penjualan`
--

INSERT INTO `Detail_Transaksi_Penjualan` (`kode_transaksi_penjualan`, `kode_barang`, `jumlah_barang`, `keterangan`) VALUES
(1, 1, 3, NULL),
(1, 5, 2, NULL),
(2, 3, 1, NULL),
(2, 7, 5, NULL),
(3, 2, 2, NULL),
(3, 4, 1, NULL),
(4, 6, 3, NULL),
(4, 8, 2, NULL),
(5, 1, 4, NULL),
(5, 9, 1, NULL),
(6, 3, 2, NULL),
(6, 10, 3, NULL),
(7, 5, 5, NULL),
(7, 7, 2, NULL),
(8, 2, 1, NULL),
(8, 6, 2, NULL),
(9, 4, 3, NULL),
(9, 8, 1, NULL),
(10, 1, 2, NULL),
(10, 9, 4, NULL),
(11, 3, 3, NULL),
(11, 10, 1, NULL),
(12, 5, 2, NULL),
(12, 7, 3, NULL),
(13, 2, 4, NULL),
(13, 6, 1, NULL),
(14, 4, 2, NULL),
(14, 8, 3, NULL),
(15, 1, 1, NULL),
(15, 9, 2, NULL);

--
-- Triggers `Detail_Transaksi_Penjualan`
--
DELIMITER $$
CREATE TRIGGER `tBarang_Dijual` AFTER INSERT ON `Detail_Transaksi_Penjualan` FOR EACH ROW begin
    UPDATE `Stok_Barang`
    SET jumlah_stok_barang = jumlah_stok_barang - NEW.jumlah_barang 
    WHERE kode_barang = NEW.kode_barang;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Gudang`
--

CREATE TABLE `Gudang` (
  `kode_gudang` int(11) NOT NULL,
  `nama_gudang` varchar(30) NOT NULL,
  `alamat_gudang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Gudang`
--

INSERT INTO `Gudang` (`kode_gudang`, `nama_gudang`, `alamat_gudang`) VALUES
(1, 'Gudang Mekar Sari', 'Jalan Sidorahayu RT 27 RW 3, Sidorahayu, Wagir, Bakalankrajan, Kec. Sukun, Kota Malang, Jawa Timur 65158');

-- --------------------------------------------------------

--
-- Table structure for table `Jenis_Barang`
--

CREATE TABLE `Jenis_Barang` (
  `kode_jenis_barang` int(11) NOT NULL,
  `kode_kategori` int(11) NOT NULL,
  `nama_jenis_barang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Jenis_Barang`
--

INSERT INTO `Jenis_Barang` (`kode_jenis_barang`, `kode_kategori`, `nama_jenis_barang`) VALUES
(152, 23, 'Semen Abu'),
(153, 23, 'Pasir Halus'),
(154, 24, 'Cat Tembok'),
(155, 24, 'Cat Kayu dan Besi'),
(156, 25, 'Paku Beton'),
(157, 25, 'Gergaji Tangan'),
(158, 26, 'MCB 6A'),
(159, 26, 'Pipa Listrik PVC');

-- --------------------------------------------------------

--
-- Table structure for table `Karyawan`
--

CREATE TABLE `Karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `jenis_pekerjaan_karyawan` varchar(20) NOT NULL,
  `nomor_telepon_karyawan` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Karyawan`
--

INSERT INTO `Karyawan` (`id_karyawan`, `nama_karyawan`, `jenis_pekerjaan_karyawan`, `nomor_telepon_karyawan`) VALUES
(1, 'Andi Saputra', 'Kepala Toko', '081234567891'),
(2, 'Rina Marlina', 'Kasir', '082345678912'),
(3, 'Budi Santoso', 'Kurir', '083456789123');

-- --------------------------------------------------------

--
-- Table structure for table `Kategori_Barang`
--

CREATE TABLE `Kategori_Barang` (
  `kode_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Kategori_Barang`
--

INSERT INTO `Kategori_Barang` (`kode_kategori`, `nama_kategori`, `deskripsi`) VALUES
(23, 'Material Bangunan', 'Kategori yang mencakup bahan utama dalam pembangunan struktur bangunan'),
(24, 'Cat dan Pelapis', 'Kategori ini berisi berbagai jenis cat dan pelapis untuk kebutuhan dekoratif maupun perlindungan permukaan bangunan'),
(25, 'Peralatan Pertukangan', 'Alat-alat yang digunakan oleh tukang untuk proses konstruksi atau perbaikan bangunan'),
(26, 'Instalasi Listrik', 'Mencakup komponen yang dibutuhkan untuk pemasangan dan sistem kelistrikan dalam bangunan');

-- --------------------------------------------------------

--
-- Table structure for table `Kendaraan`
--

CREATE TABLE `Kendaraan` (
  `kode_kendaraan` int(11) NOT NULL,
  `nama_kendaraan` varchar(20) NOT NULL,
  `jenis_kendaraan` varchar(10) NOT NULL,
  `kapasitas_maksimal` int(11) NOT NULL,
  `satuan_kapasitas` enum('kg') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Kendaraan`
--

INSERT INTO `Kendaraan` (`kode_kendaraan`, `nama_kendaraan`, `jenis_kendaraan`, `kapasitas_maksimal`, `satuan_kapasitas`) VALUES
(1, 'pick up traga', 'roda 4', 1500, 'kg'),
(2, 'pick up L300', 'roda 4', 1200, 'kg'),
(3, 'viar', 'roda 3', 400, 'kg');

-- --------------------------------------------------------

--
-- Table structure for table `Merek_Barang`
--

CREATE TABLE `Merek_Barang` (
  `kode_merek_barang` int(11) NOT NULL,
  `nama_merek` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Merek_Barang`
--

INSERT INTO `Merek_Barang` (`kode_merek_barang`, `nama_merek`) VALUES
(71, 'Gresik'),
(72, 'Tiga Roda'),
(73, 'Cilegon'),
(74, 'Bangka'),
(75, 'Garuda'),
(76, 'Supermix'),
(77, 'Blesscon'),
(78, 'Ks'),
(79, 'Master Steel'),
(80, 'Taso'),
(81, 'Cilegon Steel'),
(82, 'Meranti'),
(83, 'Kamper'),
(84, 'Jayaboard'),
(85, 'Aplus'),
(86, 'Dulux');

-- --------------------------------------------------------

--
-- Table structure for table `Order_Pesanan`
--

CREATE TABLE `Order_Pesanan` (
  `kode_order` int(11) NOT NULL,
  `kode_kendaraan` int(11) NOT NULL,
  `kode_transaksi_penjualan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Relasi_Barang`
--

CREATE TABLE `Relasi_Barang` (
  `kode_barang` int(11) NOT NULL,
  `kode_jenis_barang` int(11) NOT NULL,
  `kode_merek_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Relasi_Barang`
--

INSERT INTO `Relasi_Barang` (`kode_barang`, `kode_jenis_barang`, `kode_merek_barang`) VALUES
(1, 152, 71),
(2, 152, 72),
(3, 153, 73),
(4, 153, 74),
(5, 154, 75),
(6, 154, 76),
(7, 155, 77),
(8, 155, 78),
(9, 156, 79),
(10, 156, 80),
(11, 157, 81),
(12, 157, 82),
(13, 158, 83),
(14, 158, 84),
(15, 159, 85),
(16, 159, 86);

-- --------------------------------------------------------

--
-- Table structure for table `Retur_Pembelian`
--

CREATE TABLE `Retur_Pembelian` (
  `kode_transaksi_pembelian` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_retur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Retur_Penjualan`
--

CREATE TABLE `Retur_Penjualan` (
  `kode_transaksi_penjualan` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal_retur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `Retur_Penjualan`
--
DELIMITER $$
CREATE TRIGGER `tBarang_Diganti` AFTER INSERT ON `Retur_Penjualan` FOR EACH ROW BEGIN
    UPDATE `Stok_Barang`
    SET jumlah_stok_barang = jumlah_stok_barang - NEW.jumlah_barang
    WHERE kode_barang = NEW.kode_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Stok_Barang`
--

CREATE TABLE `Stok_Barang` (
  `kode_gudang` int(11) NOT NULL,
  `kode_barang` int(11) NOT NULL,
  `jumlah_stok_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Stok_Barang`
--

INSERT INTO `Stok_Barang` (`kode_gudang`, `kode_barang`, `jumlah_stok_barang`) VALUES
(1, 1, 140),
(1, 2, 123),
(1, 3, 174),
(1, 4, 194),
(1, 5, 86),
(1, 6, 89),
(1, 7, 90),
(1, 8, 114),
(1, 9, 158),
(1, 10, 156),
(1, 11, 60),
(1, 12, 55),
(1, 13, 75),
(1, 14, 70),
(1, 15, 130),
(1, 16, 125);

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE `Supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `nomor_telepon_supplier` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Supplier`
--

INSERT INTO `Supplier` (`id_supplier`, `nama_supplier`, `nomor_telepon_supplier`) VALUES
(13, 'Bobon Santoso', '081256781312'),
(14, 'Sutirjo', '085678431210'),
(15, 'Mulyadi', '087512348603'),
(16, 'Sutarno', '081254051111'),
(17, 'Zaki', '088961540110'),
(18, 'Rajiman', '082311008784');

-- --------------------------------------------------------

--
-- Table structure for table `Transaksi_Pembelian`
--

CREATE TABLE `Transaksi_Pembelian` (
  `kode_transaksi_pembelian` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Transaksi_Pembelian`
--

INSERT INTO `Transaksi_Pembelian` (`kode_transaksi_pembelian`, `id_supplier`, `id_karyawan`, `tanggal_transaksi`) VALUES
(1, 13, 2, '2025-04-10'),
(2, 14, 2, '2025-04-11'),
(3, 14, 2, '2025-04-12'),
(4, 15, 2, '2025-04-13'),
(5, 16, 2, '2025-04-14'),
(6, 16, 2, '2025-04-15'),
(7, 16, 2, '2025-04-16'),
(8, 17, 2, '2025-04-17'),
(9, 18, 2, '2025-04-18'),
(10, 18, 2, '2025-04-19');

-- --------------------------------------------------------

--
-- Table structure for table `Transaksi_Penjualan`
--

CREATE TABLE `Transaksi_Penjualan` (
  `kode_transaksi_penjualan` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Transaksi_Penjualan`
--

INSERT INTO `Transaksi_Penjualan` (`kode_transaksi_penjualan`, `id_customer`, `id_karyawan`, `tanggal_transaksi`) VALUES
(1, 1, 2, '2025-04-10'),
(2, 1, 2, '2025-04-11'),
(3, 2, 2, '2025-04-12'),
(4, 2, 2, '2025-04-13'),
(5, 2, 2, '2025-04-14'),
(6, 2, 2, '2025-04-15'),
(7, 3, 2, '2025-04-16'),
(8, 4, 2, '2025-04-10'),
(9, 4, 2, '2025-04-12'),
(10, 4, 2, '2025-04-14'),
(11, 4, 2, '2025-04-16'),
(12, 4, 2, '2025-04-17'),
(13, 5, 2, '2025-04-11'),
(14, 5, 2, '2025-04-13'),
(15, 5, 2, '2025-04-15');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vBarang`
-- (See below for the actual view)
--
CREATE TABLE `vBarang` (
`kategori` varchar(50)
,`jenis` varchar(30)
,`nama` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vPembelian`
-- (See below for the actual view)
--
CREATE TABLE `vPembelian` (
`id_supplier` int(11)
,`nama_supplier` varchar(50)
,`nama_barang` varchar(30)
,`jumlah_barang` int(11)
,`harga_barang` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vPenjualan`
-- (See below for the actual view)
--
CREATE TABLE `vPenjualan` (
`id_customer` int(11)
,`nama_customer` varchar(50)
,`nama_barang` varchar(30)
,`jumlah_barang` int(11)
,`harga_barang` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vStok_Barang`
-- (See below for the actual view)
--
CREATE TABLE `vStok_Barang` (
`kode_barang` int(11)
,`nama_barang` varchar(30)
,`jumlah_stok_barang` int(11)
,`berat` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vStok_Kosong`
-- (See below for the actual view)
--
CREATE TABLE `vStok_Kosong` (
`kode_barang` int(11)
,`nama_barang` varchar(30)
,`harga_barang` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vTotal_Berkunjung`
-- (See below for the actual view)
--
CREATE TABLE `vTotal_Berkunjung` (
`id_customer` int(11)
,`nama_customer` varchar(50)
,`total_transaksi_customer` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vTotal_Transaksi_Customer`
-- (See below for the actual view)
--
CREATE TABLE `vTotal_Transaksi_Customer` (
`id_customer` int(11)
,`nama_customer` varchar(50)
,`total_transaksi_customer` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `vBarang`
--
DROP TABLE IF EXISTS `vBarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vBarang`  AS SELECT `KB`.`nama_kategori` AS `kategori`, `JB`.`nama_jenis_barang` AS `jenis`, `B`.`nama_barang` AS `nama` FROM ((((`Barang` `B` left join `Relasi_Barang` `RB` on(`RB`.`kode_barang` = `B`.`kode_barang`)) join `Jenis_Barang` `JB` on(`JB`.`kode_jenis_barang` = `RB`.`kode_jenis_barang`)) join `Kategori_Barang` `KB` on(`KB`.`kode_kategori` = `JB`.`kode_kategori`)) join `Merek_Barang` `MB` on(`MB`.`kode_merek_barang` = `RB`.`kode_merek_barang`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vPembelian`
--
DROP TABLE IF EXISTS `vPembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vPembelian`  AS SELECT `TPB`.`id_supplier` AS `id_supplier`, `S`.`nama_supplier` AS `nama_supplier`, `B`.`nama_barang` AS `nama_barang`, `DTPB`.`jumlah_barang` AS `jumlah_barang`, `B`.`harga_barang` AS `harga_barang` FROM (((`Transaksi_Pembelian` `TPB` join `Detail_Transaksi_Pembelian` `DTPB` on(`TPB`.`kode_transaksi_pembelian` = `DTPB`.`kode_transaksi_pembelian`)) join `Barang` `B` on(`DTPB`.`kode_barang` = `B`.`kode_barang`)) join `Supplier` `S` on(`S`.`id_supplier` = `TPB`.`id_supplier`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vPenjualan`
--
DROP TABLE IF EXISTS `vPenjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vPenjualan`  AS SELECT `TPJ`.`id_customer` AS `id_customer`, `C`.`nama_customer` AS `nama_customer`, `B`.`nama_barang` AS `nama_barang`, `DTPJ`.`jumlah_barang` AS `jumlah_barang`, `B`.`harga_barang` AS `harga_barang` FROM (((`Transaksi_Penjualan` `TPJ` join `Detail_Transaksi_Penjualan` `DTPJ` on(`TPJ`.`kode_transaksi_penjualan` = `DTPJ`.`kode_transaksi_penjualan`)) join `Barang` `B` on(`DTPJ`.`kode_barang` = `B`.`kode_barang`)) join `Customer` `C` on(`C`.`id_customer` = `TPJ`.`id_customer`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vStok_Barang`
--
DROP TABLE IF EXISTS `vStok_Barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vStok_Barang`  AS SELECT `B`.`kode_barang` AS `kode_barang`, `B`.`nama_barang` AS `nama_barang`, `SB`.`jumlah_stok_barang` AS `jumlah_stok_barang`, `B`.`berat` AS `berat` FROM ((`Barang` `B` join `Stok_Barang` `SB` on(`B`.`kode_barang` = `SB`.`kode_barang`)) join `Gudang` `G` on(`G`.`kode_gudang` = `SB`.`kode_gudang`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vStok_Kosong`
--
DROP TABLE IF EXISTS `vStok_Kosong`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vStok_Kosong`  AS SELECT `B`.`kode_barang` AS `kode_barang`, `B`.`nama_barang` AS `nama_barang`, `B`.`harga_barang` AS `harga_barang` FROM (`Stok_Barang` `SB` left join `Barang` `B` on(`B`.`kode_barang` = `SB`.`kode_barang`)) WHERE `SB`.`jumlah_stok_barang` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `vTotal_Berkunjung`
--
DROP TABLE IF EXISTS `vTotal_Berkunjung`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vTotal_Berkunjung`  AS SELECT `C`.`id_customer` AS `id_customer`, `C`.`nama_customer` AS `nama_customer`, count(`TPJ`.`id_customer`) AS `total_transaksi_customer` FROM (`Customer` `C` join `Transaksi_Penjualan` `TPJ` on(`C`.`id_customer` = `TPJ`.`id_customer`)) GROUP BY `C`.`id_customer` ;

-- --------------------------------------------------------

--
-- Structure for view `vTotal_Transaksi_Customer`
--
DROP TABLE IF EXISTS `vTotal_Transaksi_Customer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vTotal_Transaksi_Customer`  AS SELECT `C`.`id_customer` AS `id_customer`, `C`.`nama_customer` AS `nama_customer`, count(`TPJ`.`id_customer`) AS `total_transaksi_customer` FROM (`Customer` `C` join `Transaksi_Penjualan` `TPJ` on(`C`.`id_customer` = `TPJ`.`id_customer`)) GROUP BY `C`.`id_customer` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Barang`
--
ALTER TABLE `Barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `Detail_Transaksi_Pembelian`
--
ALTER TABLE `Detail_Transaksi_Pembelian`
  ADD PRIMARY KEY (`kode_transaksi_pembelian`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `Detail_Transaksi_Penjualan`
--
ALTER TABLE `Detail_Transaksi_Penjualan`
  ADD PRIMARY KEY (`kode_transaksi_penjualan`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `Gudang`
--
ALTER TABLE `Gudang`
  ADD PRIMARY KEY (`kode_gudang`);

--
-- Indexes for table `Jenis_Barang`
--
ALTER TABLE `Jenis_Barang`
  ADD PRIMARY KEY (`kode_jenis_barang`),
  ADD KEY `kode_kategori` (`kode_kategori`);

--
-- Indexes for table `Karyawan`
--
ALTER TABLE `Karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `Kategori_Barang`
--
ALTER TABLE `Kategori_Barang`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `Kendaraan`
--
ALTER TABLE `Kendaraan`
  ADD PRIMARY KEY (`kode_kendaraan`);

--
-- Indexes for table `Merek_Barang`
--
ALTER TABLE `Merek_Barang`
  ADD PRIMARY KEY (`kode_merek_barang`);

--
-- Indexes for table `Order_Pesanan`
--
ALTER TABLE `Order_Pesanan`
  ADD PRIMARY KEY (`kode_order`),
  ADD KEY `kode_kendaraan` (`kode_kendaraan`),
  ADD KEY `kode_transaksi_penjualan` (`kode_transaksi_penjualan`);

--
-- Indexes for table `Relasi_Barang`
--
ALTER TABLE `Relasi_Barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `kode_jenis_barang` (`kode_jenis_barang`),
  ADD KEY `kode_merek_barang` (`kode_merek_barang`);

--
-- Indexes for table `Retur_Pembelian`
--
ALTER TABLE `Retur_Pembelian`
  ADD PRIMARY KEY (`kode_transaksi_pembelian`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `Retur_Penjualan`
--
ALTER TABLE `Retur_Penjualan`
  ADD PRIMARY KEY (`kode_transaksi_penjualan`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `Stok_Barang`
--
ALTER TABLE `Stok_Barang`
  ADD PRIMARY KEY (`kode_gudang`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `Transaksi_Pembelian`
--
ALTER TABLE `Transaksi_Pembelian`
  ADD PRIMARY KEY (`kode_transaksi_pembelian`),
  ADD KEY `id_supplier` (`id_supplier`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indexes for table `Transaksi_Penjualan`
--
ALTER TABLE `Transaksi_Penjualan`
  ADD PRIMARY KEY (`kode_transaksi_penjualan`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Barang`
--
ALTER TABLE `Barang`
  MODIFY `kode_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Gudang`
--
ALTER TABLE `Gudang`
  MODIFY `kode_gudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Jenis_Barang`
--
ALTER TABLE `Jenis_Barang`
  MODIFY `kode_jenis_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `Karyawan`
--
ALTER TABLE `Karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Kategori_Barang`
--
ALTER TABLE `Kategori_Barang`
  MODIFY `kode_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `Kendaraan`
--
ALTER TABLE `Kendaraan`
  MODIFY `kode_kendaraan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Merek_Barang`
--
ALTER TABLE `Merek_Barang`
  MODIFY `kode_merek_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `Order_Pesanan`
--
ALTER TABLE `Order_Pesanan`
  MODIFY `kode_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Transaksi_Pembelian`
--
ALTER TABLE `Transaksi_Pembelian`
  MODIFY `kode_transaksi_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Transaksi_Penjualan`
--
ALTER TABLE `Transaksi_Penjualan`
  MODIFY `kode_transaksi_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Detail_Transaksi_Pembelian`
--
ALTER TABLE `Detail_Transaksi_Pembelian`
  ADD CONSTRAINT `Detail_Transaksi_Pembelian_ibfk_1` FOREIGN KEY (`kode_transaksi_pembelian`) REFERENCES `Transaksi_Pembelian` (`kode_transaksi_pembelian`),
  ADD CONSTRAINT `Detail_Transaksi_Pembelian_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `Barang` (`kode_barang`);

--
-- Constraints for table `Detail_Transaksi_Penjualan`
--
ALTER TABLE `Detail_Transaksi_Penjualan`
  ADD CONSTRAINT `Detail_Transaksi_Penjualan_ibfk_1` FOREIGN KEY (`kode_transaksi_penjualan`) REFERENCES `Transaksi_Penjualan` (`kode_transaksi_penjualan`),
  ADD CONSTRAINT `Detail_Transaksi_Penjualan_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `Barang` (`kode_barang`);

--
-- Constraints for table `Jenis_Barang`
--
ALTER TABLE `Jenis_Barang`
  ADD CONSTRAINT `Jenis_Barang_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `Kategori_Barang` (`kode_kategori`);

--
-- Constraints for table `Order_Pesanan`
--
ALTER TABLE `Order_Pesanan`
  ADD CONSTRAINT `Order_Pesanan_ibfk_1` FOREIGN KEY (`kode_kendaraan`) REFERENCES `Kendaraan` (`kode_kendaraan`),
  ADD CONSTRAINT `Order_Pesanan_ibfk_2` FOREIGN KEY (`kode_transaksi_penjualan`) REFERENCES `Transaksi_Penjualan` (`kode_transaksi_penjualan`);

--
-- Constraints for table `Relasi_Barang`
--
ALTER TABLE `Relasi_Barang`
  ADD CONSTRAINT `Relasi_Barang_ibfk_1` FOREIGN KEY (`kode_jenis_barang`) REFERENCES `Jenis_Barang` (`kode_jenis_barang`),
  ADD CONSTRAINT `Relasi_Barang_ibfk_2` FOREIGN KEY (`kode_merek_barang`) REFERENCES `Merek_Barang` (`kode_merek_barang`);

--
-- Constraints for table `Retur_Pembelian`
--
ALTER TABLE `Retur_Pembelian`
  ADD CONSTRAINT `Retur_Pembelian_ibfk_1` FOREIGN KEY (`kode_transaksi_pembelian`) REFERENCES `Transaksi_Pembelian` (`kode_transaksi_pembelian`),
  ADD CONSTRAINT `Retur_Pembelian_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `Barang` (`kode_barang`);

--
-- Constraints for table `Retur_Penjualan`
--
ALTER TABLE `Retur_Penjualan`
  ADD CONSTRAINT `Retur_Penjualan_ibfk_1` FOREIGN KEY (`kode_transaksi_penjualan`) REFERENCES `Transaksi_Penjualan` (`kode_transaksi_penjualan`),
  ADD CONSTRAINT `Retur_Penjualan_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `Barang` (`kode_barang`);

--
-- Constraints for table `Stok_Barang`
--
ALTER TABLE `Stok_Barang`
  ADD CONSTRAINT `Stok_Barang_ibfk_1` FOREIGN KEY (`kode_gudang`) REFERENCES `Gudang` (`kode_gudang`),
  ADD CONSTRAINT `Stok_Barang_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `Barang` (`kode_barang`);

--
-- Constraints for table `Transaksi_Pembelian`
--
ALTER TABLE `Transaksi_Pembelian`
  ADD CONSTRAINT `Transaksi_Pembelian_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `Supplier` (`id_supplier`),
  ADD CONSTRAINT `Transaksi_Pembelian_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `Karyawan` (`id_karyawan`);

--
-- Constraints for table `Transaksi_Penjualan`
--
ALTER TABLE `Transaksi_Penjualan`
  ADD CONSTRAINT `Transaksi_Penjualan_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `Customer` (`id_customer`),
  ADD CONSTRAINT `Transaksi_Penjualan_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `Karyawan` (`id_karyawan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
