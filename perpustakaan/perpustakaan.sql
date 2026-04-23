-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Apr 2026 pada 02.40
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `email`, `no_hp`, `alamat`, `tanggal_daftar`, `status`) VALUES
(1, 'Andi', 'andi@mail.com', '0811', 'Bandung', '2024-01-01', 'aktif'),
(2, 'Budi', 'budi@mail.com', '0822', 'Jakarta', '2024-01-02', 'aktif'),
(3, 'Citra', 'citra@mail.com', '0833', 'Surabaya', '2024-01-03', 'aktif'),
(4, 'Dewi', 'dewi@mail.com', '0844', 'Jogja', '2024-01-04', 'aktif'),
(5, 'Eka', 'eka@mail.com', '0855', 'Medan', '2024-01-05', 'aktif'),
(6, 'Fajar', 'fajar@mail.com', '0866', 'Semarang', '2024-01-06', 'aktif'),
(7, 'Gita', 'gita@mail.com', '0877', 'Bandung', '2024-01-07', 'aktif'),
(8, 'Hadi', 'hadi@mail.com', '0888', 'Bekasi', '2024-01-08', 'aktif'),
(9, 'Indah', 'indah@mail.com', '0899', 'Depok', '2024-01-09', 'aktif'),
(10, 'Joko', 'joko@mail.com', '0810', 'Bogor', '2024-01-10', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `id_penerbit` int(11) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `isbn`, `judul`, `id_kategori`, `id_penerbit`, `tahun_terbit`, `deskripsi`, `stok`) VALUES
(1, '978001', 'Laskar Pelangi', 1, 2, '2005', 'Novel inspiratif', 10),
(2, '978002', 'Bumi Manusia', 2, 1, '1980', 'Sejarah Indonesia', 5),
(3, '978003', 'Negeri 5 Menara', 5, 1, '2009', 'Motivasi pendidikan', 8),
(4, '978004', 'Ayat-Ayat Cinta', 6, 5, '2004', 'Novel religi', 7),
(5, '978005', 'Dilan 1990', 1, 4, '2014', 'Novel remaja', 6),
(6, '978006', 'Perahu Kertas', 1, 2, '2009', 'Romance', 9),
(7, '978007', 'Atomic Habits', 5, 6, '2018', 'Self improvement', 12),
(8, '978008', 'Rich Dad Poor Dad', 4, 6, '1997', 'Keuangan', 10),
(9, '978009', 'Harry Potter', 8, 10, '1997', 'Fantasi', 15),
(10, '978010', 'The Hobbit', 8, 7, '1937', 'Petualangan', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku_penulis`
--

CREATE TABLE `buku_penulis` (
  `id_buku` int(11) NOT NULL,
  `id_penulis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku_penulis`
--

INSERT INTO `buku_penulis` (`id_buku`, `id_penulis`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku_rak`
--

CREATE TABLE `buku_rak` (
  `id_buku` int(11) NOT NULL,
  `id_rak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku_rak`
--

INSERT INTO `buku_rak` (`id_buku`, `id_rak`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `denda`
--

CREATE TABLE `denda` (
  `id_denda` int(11) NOT NULL,
  `id_peminjaman` int(11) DEFAULT NULL,
  `jumlah_denda` decimal(10,2) DEFAULT NULL,
  `status` enum('belum bayar','sudah bayar') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `denda`
--

INSERT INTO `denda` (`id_denda`, `id_peminjaman`, `jumlah_denda`, `status`) VALUES
(1, 1, 0.00, 'sudah bayar'),
(2, 2, 5000.00, 'belum bayar'),
(3, 3, 0.00, 'sudah bayar'),
(4, 4, 7000.00, 'belum bayar'),
(5, 5, 0.00, 'sudah bayar'),
(6, 6, 10000.00, 'belum bayar'),
(7, 7, 0.00, 'sudah bayar'),
(8, 8, 8000.00, 'belum bayar'),
(9, 9, 0.00, 'sudah bayar'),
(10, 10, 6000.00, 'belum bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail` int(11) NOT NULL,
  `id_peminjaman` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id_detail`, `id_peminjaman`, `id_buku`, `jumlah`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 2),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 2),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 2),
(10, 10, 10, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Novel'),
(2, 'Sejarah'),
(3, 'Teknologi'),
(4, 'Bisnis'),
(5, 'Motivasi'),
(6, 'Religi'),
(7, 'Pendidikan'),
(8, 'Fantasi'),
(9, 'Sains'),
(10, 'Komik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id_log` int(11) NOT NULL,
  `aktivitas` varchar(255) DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id_log`, `aktivitas`, `waktu`, `id_petugas`) VALUES
(1, 'Tambah buku', '2026-04-19 19:11:13', 1),
(2, 'Edit buku', '2026-04-19 19:11:13', 2),
(3, 'Hapus buku', '2026-04-19 19:11:13', 3),
(4, 'Tambah anggota', '2026-04-19 19:11:13', 4),
(5, 'Peminjaman', '2026-04-19 19:11:13', 5),
(6, 'Pengembalian', '2026-04-19 19:11:13', 6),
(7, 'Restock buku', '2026-04-19 19:11:13', 7),
(8, 'Login', '2026-04-19 19:11:13', 8),
(9, 'Logout', '2026-04-19 19:11:13', 9),
(10, 'Cetak laporan', '2026-04-19 19:11:13', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_jatuh_tempo` date DEFAULT NULL,
  `status` enum('dipinjam','kembali','terlambat') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_anggota`, `id_petugas`, `tanggal_pinjam`, `tanggal_jatuh_tempo`, `status`) VALUES
(1, 1, 1, '2024-02-01', '2024-02-07', 'kembali'),
(2, 2, 2, '2024-02-02', '2024-02-08', 'dipinjam'),
(3, 3, 3, '2024-02-03', '2024-02-09', 'kembali'),
(4, 4, 4, '2024-02-04', '2024-02-10', 'dipinjam'),
(5, 5, 5, '2024-02-05', '2024-02-11', 'kembali'),
(6, 6, 6, '2024-02-06', '2024-02-12', 'dipinjam'),
(7, 7, 7, '2024-02-07', '2024-02-13', 'kembali'),
(8, 8, 8, '2024-02-08', '2024-02-14', 'dipinjam'),
(9, 9, 9, '2024-02-09', '2024-02-15', 'kembali'),
(10, 10, 10, '2024-02-10', '2024-02-16', 'dipinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `alamat`) VALUES
(1, 'Gramedia', 'Jakarta'),
(2, 'Bentang', 'Yogyakarta'),
(3, 'Erlangga', 'Jakarta'),
(4, 'Mizan', 'Bandung'),
(5, 'Republika', 'Jakarta'),
(6, 'Penguin', 'USA'),
(7, 'HarperCollins', 'USA'),
(8, 'Springer', 'Germany'),
(9, 'O\'Reilly', 'USA'),
(10, 'Bloomsbury', 'UK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penulis`
--

CREATE TABLE `penulis` (
  `id_penulis` int(11) NOT NULL,
  `nama_penulis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penulis`
--

INSERT INTO `penulis` (`id_penulis`, `nama_penulis`) VALUES
(1, 'Andrea Hirata'),
(2, 'Pramoedya Ananta Toer'),
(3, 'Ahmad Fuadi'),
(4, 'Habiburrahman El Shirazy'),
(5, 'Pidi Baiq'),
(6, 'Dee Lestari'),
(7, 'James Clear'),
(8, 'Robert Kiyosaki'),
(9, 'J.K Rowling'),
(10, 'J.R.R Tolkien');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','staff') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama`, `username`, `password`, `role`) VALUES
(1, 'Admin1', 'admin1', '123', 'admin'),
(2, 'Admin2', 'admin2', '123', 'staff'),
(3, 'Admin3', 'admin3', '123', 'staff'),
(4, 'Admin4', 'admin4', '123', 'staff'),
(5, 'Admin5', 'admin5', '123', 'staff'),
(6, 'Admin6', 'admin6', '123', 'staff'),
(7, 'Admin7', 'admin7', '123', 'staff'),
(8, 'Admin8', 'admin8', '123', 'staff'),
(9, 'Admin9', 'admin9', '123', 'staff'),
(10, 'Admin10', 'admin10', '123', 'staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak`
--

CREATE TABLE `rak` (
  `id_rak` int(11) NOT NULL,
  `kode_rak` varchar(50) DEFAULT NULL,
  `lokasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rak`
--

INSERT INTO `rak` (`id_rak`, `kode_rak`, `lokasi`) VALUES
(1, 'A1', 'Lantai 1'),
(2, 'A2', 'Lantai 1'),
(3, 'B1', 'Lantai 2'),
(4, 'B2', 'Lantai 2'),
(5, 'C1', 'Lantai 3'),
(6, 'C2', 'Lantai 3'),
(7, 'D1', 'Gudang'),
(8, 'D2', 'Gudang'),
(9, 'E1', 'Display'),
(10, 'E2', 'Display');

-- --------------------------------------------------------

--
-- Struktur dari tabel `restock_buku`
--

CREATE TABLE `restock_buku` (
  `id_restock` int(11) NOT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal_restock` date DEFAULT NULL,
  `sumber` enum('beli','donasi','hibah') DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `restock_buku`
--

INSERT INTO `restock_buku` (`id_restock`, `id_buku`, `jumlah`, `tanggal_restock`, `sumber`, `id_petugas`) VALUES
(1, 1, 5, '2024-03-01', 'beli', 1),
(2, 2, 3, '2024-03-02', 'donasi', 2),
(3, 3, 4, '2024-03-03', 'beli', 3),
(4, 4, 2, '2024-03-04', 'hibah', 4),
(5, 5, 6, '2024-03-05', 'beli', 5),
(6, 6, 3, '2024-03-06', 'donasi', 6),
(7, 7, 5, '2024-03-07', 'beli', 7),
(8, 8, 2, '2024-03-08', 'hibah', 8),
(9, 9, 4, '2024-03-09', 'beli', 9),
(10, 10, 3, '2024-03-10', 'donasi', 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `buku_penulis`
--
ALTER TABLE `buku_penulis`
  ADD PRIMARY KEY (`id_buku`,`id_penulis`),
  ADD KEY `id_penulis` (`id_penulis`);

--
-- Indeks untuk tabel `buku_rak`
--
ALTER TABLE `buku_rak`
  ADD PRIMARY KEY (`id_buku`,`id_rak`),
  ADD KEY `id_rak` (`id_rak`);

--
-- Indeks untuk tabel `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id_denda`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indeks untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_peminjaman` (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indeks untuk tabel `penulis`
--
ALTER TABLE `penulis`
  ADD PRIMARY KEY (`id_penulis`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- Indeks untuk tabel `restock_buku`
--
ALTER TABLE `restock_buku`
  ADD PRIMARY KEY (`id_restock`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `denda`
--
ALTER TABLE `denda`
  MODIFY `id_denda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penulis`
--
ALTER TABLE `penulis`
  MODIFY `id_penulis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `rak`
--
ALTER TABLE `rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `restock_buku`
--
ALTER TABLE `restock_buku`
  MODIFY `id_restock` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku_penulis`
--
ALTER TABLE `buku_penulis`
  ADD CONSTRAINT `buku_penulis_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `buku_penulis_ibfk_2` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id_penulis`);

--
-- Ketidakleluasaan untuk tabel `buku_rak`
--
ALTER TABLE `buku_rak`
  ADD CONSTRAINT `buku_rak_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `buku_rak_ibfk_2` FOREIGN KEY (`id_rak`) REFERENCES `rak` (`id_rak`);

--
-- Ketidakleluasaan untuk tabel `denda`
--
ALTER TABLE `denda`
  ADD CONSTRAINT `denda_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`);

--
-- Ketidakleluasaan untuk tabel `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`id_peminjaman`) REFERENCES `peminjaman` (`id_peminjaman`),
  ADD CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

--
-- Ketidakleluasaan untuk tabel `restock_buku`
--
ALTER TABLE `restock_buku`
  ADD CONSTRAINT `restock_buku_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `restock_buku_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
