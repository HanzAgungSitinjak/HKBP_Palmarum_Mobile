-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 11 Jun 2023 pada 10.08
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gereja`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_baptis`
--

CREATE TABLE `data_baptis` (
  `id_Baptis` int(11) NOT NULL,
  `nama_pelayan` char(100) NOT NULL,
  `nama_anak` char(100) NOT NULL,
  `TempatLahir` char(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `nama_ayah` char(50) NOT NULL,
  `nama_ibu` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_baptis`
--

INSERT INTO `data_baptis` (`id_Baptis`, `nama_pelayan`, `nama_anak`, `TempatLahir`, `tgl_lahir`, `nama_ayah`, `nama_ibu`) VALUES
(1, 'Leomord Sitinjak', 'Devi Tri Sinaga', 'Pantai Labu', '2000-10-07', 'Fransisko sinaga', 'fransiska simbolon'),
(2, 'Leomord Sitinjak', 'Juliana Saragih', 'Pekanbaru', '2006-09-07', 'Zukri Saragih', 'Mesda purba'),
(3, 'Boston Silalahi', 'Rudi Salim Sitinjak', 'Pekanbaru', '2023-06-07', 'Boston Sitinjak', 'Martha Saragih'),
(4, 'Rendi Sibarani', 'Junanto Silaen', 'Pekanbaru', '2023-06-07', 'Hermanto Siln', 'Herin Siahaan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pelayan`
--

CREATE TABLE `data_pelayan` (
  `id_Pelayan` int(11) NOT NULL,
  `nama_pelayan` varchar(100) NOT NULL,
  `lingkungan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_pelayan`
--

INSERT INTO `data_pelayan` (`id_Pelayan`, `nama_pelayan`, `lingkungan`) VALUES
(7, 'Boston Silalahi', 'lingkungan tujuh'),
(3, 'Devi Sinaga', 'lingkungan tiga'),
(8, 'Dwi br.manurung', 'lingkungan delapan'),
(6, 'Hans Sitinjak', 'lingkungan enam'),
(2, 'Leomord Sitinjak', 'lingkungan dua\r\n'),
(1, 'Mika Panjaitan', 'lingkungan satu'),
(5, 'Ray Siagian', 'lingkungan lima'),
(4, 'Rendi Sibarani', 'lingkungan empat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_sidi`
--

CREATE TABLE `data_sidi` (
  `id_Sidi` int(50) NOT NULL,
  `nama_anak` varchar(100) NOT NULL,
  `TempatLahir` char(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tgl_baptis` date NOT NULL,
  `nama_ayah` char(100) NOT NULL,
  `nama_ibu` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_sidi`
--

INSERT INTO `data_sidi` (`id_Sidi`, `nama_anak`, `TempatLahir`, `tgl_lahir`, `tgl_baptis`, `nama_ayah`, `nama_ibu`) VALUES
(1, 'Boston Sinambella', 'Pekanbaru', '2006-10-18', '2023-06-19', 'Budi Sinambela', 'ika saputri'),
(2, 'Mulyadi Pakpahan', 'Pekanbaru', '2003-06-26', '2023-06-14', 'Johnson Pakpahan', 'Martini pasaribu'),
(4, 'Kufra Sialagan', 'Padang', '2006-09-07', '2023-06-15', 'Marito Sialagan', 'Julia Marbun'),
(5, 'Atalya Saragih', 'Jambi', '2003-01-08', '2023-06-15', 'Maruli Saragih', 'Peri Pasaribu'),
(6, 'Bima Pakpahan', 'Lubuk Pakam', '2006-06-22', '2023-06-22', 'Bakara Pakpahan', 'Merry Silalahi'),
(7, 'Sri Intan Marpaung', 'Jambi', '2023-06-07', '2023-06-22', 'Budi marpaung', 'Gina Sitinjak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lingkungan`
--

CREATE TABLE `lingkungan` (
  `id_lingkungan` int(11) NOT NULL,
  `nama_lingkungan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lingkungan`
--

INSERT INTO `lingkungan` (`id_lingkungan`, `nama_lingkungan`) VALUES
(1, 'lingkungan satu'),
(2, 'lingkungan dua'),
(3, 'lingkungan tiga'),
(4, 'lingkungan empat'),
(5, 'lingkungan lima'),
(6, 'lingkungan enam'),
(7, 'lingkungan tujuh'),
(8, 'lingkungan delapan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_25_090803_data_baptis', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', '7a65c27a8485b1601624c52f9c9f8ad62d1ddfce47d41e2361c392b1f80b64ad', '[\"*\"]', NULL, NULL, '2023-05-21 10:58:24', '2023-05-21 10:58:24'),
(2, 'App\\Models\\User', 3, 'auth_token', '2361e1fc3da99f8fb314f2671e98aa96bdfe9bab9082c008b7a0fffde6748468', '[\"*\"]', NULL, NULL, '2023-05-21 18:13:40', '2023-05-21 18:13:40'),
(3, 'App\\Models\\User', 2, 'auth_token', 'a5b4c55198b27665916bae1a61f6192105dd5153d630015a77ebec2c765b456a', '[\"*\"]', NULL, NULL, '2023-05-21 18:26:08', '2023-05-21 18:26:08'),
(4, 'App\\Models\\User', 2, 'auth_token', 'c1305caeb4dbce09d7f1ba809bd81c7c9a2a8333306c3b70fb4819fc2064bafd', '[\"*\"]', NULL, NULL, '2023-05-21 18:28:30', '2023-05-21 18:28:30'),
(5, 'App\\Models\\User', 2, 'Personal Access Token', '1fe223db7f3cb87ae66e36a1884063d941813a523d97704397c5da291e6ca7c3', '[\"*\"]', NULL, NULL, '2023-05-21 20:55:53', '2023-05-21 20:55:53'),
(6, 'App\\Models\\User', 5, 'Personal Access Token', '2770d766aa87d4c2d1f47ef6f6c17e69afca9b837bd38638b662a26f11d0e232', '[\"*\"]', NULL, NULL, '2023-05-21 21:20:39', '2023-05-21 21:20:39'),
(7, 'App\\Models\\User', 2, 'Personal Access Token', 'afcf28122ee416e2210454270141fd1225bd572c0cb527dc574e3df7102433b6', '[\"*\"]', NULL, NULL, '2023-05-21 21:39:47', '2023-05-21 21:39:47'),
(8, 'App\\Models\\User', 2, 'Personal Access Token', 'af3a6dcb2954d7e085c7d698ad4d872f229968381c9c919c17bef6a35d210bb8', '[\"*\"]', NULL, NULL, '2023-05-22 00:25:34', '2023-05-22 00:25:34'),
(9, 'App\\Models\\User', 2, 'Personal Access Token', '088d95a3900e16c9d0f617cac00895e3bd68ff48d76cca9733401d34a71b5d52', '[\"*\"]', NULL, NULL, '2023-05-22 00:30:17', '2023-05-22 00:30:17'),
(10, 'App\\Models\\User', 2, 'Personal Access Token', '94428542f71fa0fd8f3eea713df5cf10e9256289039e8e85ef9c4d0cc3c5550b', '[\"*\"]', NULL, NULL, '2023-05-22 00:50:19', '2023-05-22 00:50:19'),
(11, 'App\\Models\\User', 2, 'Personal Access Token', '6b42f16cb5e98627d998ed0c4defd085f224e1d041265fdaf865ff2957b7648d', '[\"*\"]', NULL, NULL, '2023-05-22 01:32:12', '2023-05-22 01:32:12'),
(12, 'App\\Models\\User', 2, 'Personal Access Token', 'ba61fa03204ff6d7cc23561a47a493833a16f68d187de4c14daadafd3578b0b1', '[\"*\"]', NULL, NULL, '2023-05-22 18:43:51', '2023-05-22 18:43:51'),
(13, 'App\\Models\\User', 6, 'Personal Access Token', '35ad0f6c5f104600ffccaaf9663e7d95429346e2e6fac91b3c409e5de7286ba8', '[\"*\"]', NULL, NULL, '2023-05-22 19:02:29', '2023-05-22 19:02:29'),
(14, 'App\\Models\\User', 2, 'Personal Access Token', 'b7e3680f6332c6998ef481b61f82faf1552771fbe248b09f6df0a1778b4cf361', '[\"*\"]', NULL, NULL, '2023-05-22 19:25:59', '2023-05-22 19:25:59'),
(15, 'App\\Models\\User', 2, 'Personal Access Token', '65719cc85918cc9f3c60fe59ff22212afdece9c9bd1d652fb11181077b8ab9c5', '[\"*\"]', NULL, NULL, '2023-05-22 19:28:12', '2023-05-22 19:28:12'),
(16, 'App\\Models\\User', 2, 'Personal Access Token', 'aae2f498acbf656ffc57c3c9e65487321d0870fdfc8130d075858bef4eeccd86', '[\"*\"]', NULL, NULL, '2023-05-22 19:34:52', '2023-05-22 19:34:52'),
(17, 'App\\Models\\User', 2, 'Personal Access Token', '22327cbf4a540630560dd2f873dc4e3da8d40a236ec7d324356faed3494a1e0f', '[\"*\"]', NULL, NULL, '2023-05-22 19:36:53', '2023-05-22 19:36:53'),
(18, 'App\\Models\\User', 2, 'Personal Access Token', 'e95d07d341296b7a1df6db2493419b3e8321dfa20418a973ee8a074aba1cac48', '[\"*\"]', NULL, NULL, '2023-05-22 19:38:41', '2023-05-22 19:38:41'),
(19, 'App\\Models\\User', 2, 'Personal Access Token', '04b4fc5eaa7f3a08a33728670bf049330d8215da57563e2a7e1a457009183a78', '[\"*\"]', NULL, NULL, '2023-05-22 19:40:34', '2023-05-22 19:40:34'),
(20, 'App\\Models\\User', 2, 'Personal Access Token', '1dd4d501e86a5edc6ae6834343b59452641ea4f981f8f6c6fac8e10297c54eb9', '[\"*\"]', NULL, NULL, '2023-05-22 19:52:36', '2023-05-22 19:52:36'),
(21, 'App\\Models\\User', 2, 'Personal Access Token', '3d7891a4f374f077cfb30d52075392d405623ba52eab6998fbe80bcae273dc06', '[\"*\"]', NULL, NULL, '2023-05-22 23:51:23', '2023-05-22 23:51:23'),
(22, 'App\\Models\\User', 2, 'Personal Access Token', 'a34daca77b49540f2959db3a7cf577237c62cb0bca0136cfc6fd0879da773beb', '[\"*\"]', NULL, NULL, '2023-06-05 23:54:23', '2023-06-05 23:54:23'),
(23, 'App\\Models\\User', 2, 'Personal Access Token', '42cf54697cab3f2a79d262f8959bbacabbd80b1eb520606930febe558c5e626a', '[\"*\"]', NULL, NULL, '2023-06-06 00:19:56', '2023-06-06 00:19:56'),
(24, 'App\\Models\\User', 2, 'Personal Access Token', 'ffd1b9217bd88fc122f62a305d1a2ddfd2be21927b111d88fe5a8aff0b4c0719', '[\"*\"]', NULL, NULL, '2023-06-06 00:56:01', '2023-06-06 00:56:01'),
(25, 'App\\Models\\User', 2, 'Personal Access Token', '5162697a7e9f0e5461358dfec91e09c6a511b9daf8d47adc78d583cebc68826c', '[\"*\"]', NULL, NULL, '2023-06-06 01:25:09', '2023-06-06 01:25:09'),
(26, 'App\\Models\\User', 2, 'Personal Access Token', 'ae30d7cb8c23209f2f5bcc13ad744a7a23f83d6bbcf1e148424670a35f1d321f', '[\"*\"]', NULL, NULL, '2023-06-06 01:27:00', '2023-06-06 01:27:00'),
(27, 'App\\Models\\User', 7, 'Personal Access Token', 'e4d706c6dcaf92dc490cd4f406e56f28403fa7d412db79a43753d79a1822dd89', '[\"*\"]', NULL, NULL, '2023-06-06 01:51:56', '2023-06-06 01:51:56'),
(28, 'App\\Models\\User', 2, 'Personal Access Token', '142cef2e9ce1e1ce73018db6e0a9e162c242035ea64cbf35d996307ac85b882e', '[\"*\"]', NULL, NULL, '2023-06-06 02:24:15', '2023-06-06 02:24:15'),
(29, 'App\\Models\\User', 2, 'Personal Access Token', '5ef40f4c1dcf7f3b95a439fbe9f8abad1cb86e8c75985c2e7a0262b5a4a31c6a', '[\"*\"]', NULL, NULL, '2023-06-06 02:37:10', '2023-06-06 02:37:10'),
(30, 'App\\Models\\User', 1, 'Personal Access Token', '6f65175d87bc2a14807c048e9d6fa4d7363f3c1a48c870886cb8220ed32ec546', '[\"*\"]', NULL, NULL, '2023-06-06 03:12:12', '2023-06-06 03:12:12'),
(31, 'App\\Models\\User', 1, 'Personal Access Token', '0c327c33667c63add97cd82ec7f0021b08f9801c24ab23964dd7672c451fefb9', '[\"*\"]', NULL, NULL, '2023-06-06 18:14:31', '2023-06-06 18:14:31'),
(32, 'App\\Models\\User', 1, 'Personal Access Token', '4bf3f9362bfc45f331fbbea478faea937a606bdaa9f1896264cb5a1a305117e7', '[\"*\"]', NULL, NULL, '2023-06-06 18:42:32', '2023-06-06 18:42:32'),
(33, 'App\\Models\\User', 6, 'Personal Access Token', 'ebc0fffcc4b6b78bedf20688f82e2dacb540af2c17e639d05598be53f24a4876', '[\"*\"]', NULL, NULL, '2023-06-06 20:23:37', '2023-06-06 20:23:37'),
(34, 'App\\Models\\User', 6, 'Personal Access Token', '52af63cd5a2ddbb5429859ad28199fc3360796f6e979d64e6d5e4b6475a525a3', '[\"*\"]', NULL, NULL, '2023-06-06 20:23:59', '2023-06-06 20:23:59'),
(35, 'App\\Models\\User', 6, 'Personal Access Token', '3724b8a6d7f02c5f77048068b86d680657b0d0b434d4ab2c87556a8260a036f0', '[\"*\"]', NULL, NULL, '2023-06-06 20:25:12', '2023-06-06 20:25:12'),
(36, 'App\\Models\\User', 1, 'Personal Access Token', 'afc639752ad8995eb765e27387e9b6e5c4e4f2084694fe51b9c8e171b68952da', '[\"*\"]', NULL, NULL, '2023-06-06 20:29:31', '2023-06-06 20:29:31'),
(37, 'App\\Models\\User', 1, 'Personal Access Token', '1be223411e1bd111a1d9520343458125b08f10f950c785c2031a139b2bc43bda', '[\"*\"]', NULL, NULL, '2023-06-06 20:40:25', '2023-06-06 20:40:25'),
(38, 'App\\Models\\User', 7, 'Personal Access Token', '38f9a3bf80a473e1b81fd15be5d9cca6b06de2e4f5b2666521cf6865444ab56b', '[\"*\"]', NULL, NULL, '2023-06-07 02:33:23', '2023-06-07 02:33:23'),
(39, 'App\\Models\\User', 1, 'Personal Access Token', '98c604833cb655dfe3ed2efb8fcfda4eb08fbe821bbb90e5ab2b88ae28354a9c', '[\"*\"]', NULL, NULL, '2023-06-07 02:37:38', '2023-06-07 02:37:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tambah_jemaat`
--

CREATE TABLE `tambah_jemaat` (
  `id_jemaat` int(50) NOT NULL,
  `nama_jemaat` varchar(100) NOT NULL,
  `pendidikan` varchar(100) NOT NULL,
  `bidangPendidikan` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `id_lingkungan` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tambah_jemaat`
--

INSERT INTO `tambah_jemaat` (`id_jemaat`, `nama_jemaat`, `pendidikan`, `bidangPendidikan`, `pekerjaan`, `alamat`, `id_lingkungan`) VALUES
(1, 'Hans agung', 'Sarjana', 'S1 - Informatika', 'Mahasiswa', 'Jl.Patimura no.12, Sidoarjo', 3),
(2, 'Pustaka Lina Pasaribu', 'Diploma', 'D3 - Teknologi Komunikasi', 'Mahasiswa', 'Jl.Patimura no.45, Sidoarjo ', 2),
(3, 'Junanto pakpahan', 'SMA', 'MIA', 'Pelajar', 'Jl.Kasih no.23, Palakan', 7),
(4, 'Kevin Prenata', 'SMA', 'IPS', 'Pelajar', 'Jl.Diponogoro no.166, Baksel', 1),
(5, 'Hans Sitinjak', 'Sarjana', 'D4-TRPL', 'Mahasiswa', 'Pangkalan kerinci timur', 4),
(6, 'Maku Zalkhu', 'SMA', 'MIA', 'Pelajar', 'JL.Kasih Ibu no.12, jambi', 2),
(7, 'Masnida Oloan', 'SMP', 'SMP', 'Pelajar', 'Jl.Soekarno no.123, padang bulan', 8),
(8, 'Kevin Harianja', 'Sarjana', 'S1-TE', 'mahasiswa', 'Jl.kasih no 1, PAdang Bulan', 5),
(9, 'Srinengsi Rajagukguk', 'Sarjana', 'D4-TRPL', 'Mahasiswa', 'Jl. Pattimura no.34, Panggabean', 7),
(10, 'Juni Sirait', 'Sarjana', 'S1-TE', 'Mahasiswa', 'Jl.burneo no.12, Kacel', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'hansagung', 'hansagung@gmail.com', NULL, '$2y$10$o26sD7PwA9EpynAgKeMwtOAlkNC2IblMkMT4woj3azgggAqNVchxa', NULL, '2023-05-21 10:58:24', '2023-05-21 10:58:24'),
(2, 'layana', 'layana@gmail.com', NULL, '$2y$10$Wtr2xEw2IzLmYXN6jXdtjOUmMJ1bDPJ2wJvkHinlNeQltrAqLD.3y', NULL, '2023-05-21 18:13:40', '2023-05-21 18:13:40'),
(3, 'judika manurung', 'judika12@gmail.com', NULL, '$2y$10$l6lpDkFL6Tid4q7IRKLXZei5743YbWNmr9aNvYbA2evjuq1D.XqW.', NULL, '2023-05-21 21:20:39', '2023-05-21 21:20:39'),
(4, 'Juliana', 'juliana11@gmail.com', NULL, '$2y$10$EdgWD7r1.iSaoXpwYhf.BOP11TszEnk37jRDkhhmPsqWfltoHbWoe', NULL, '2023-05-22 19:02:29', '2023-05-22 19:02:29'),
(5, 'Budi Harianto', 'budiharianto@gmail.com', NULL, '$2y$10$fVPU4zvSKXmyNLMN1F75vO4mAFQz0WbDbUvSBfeUSiHEq3rBLtt6u', NULL, '2023-06-06 01:51:56', '2023-06-06 01:51:56'),
(6, 'Atalya Saragih', 'atalyasaragih01@gmail.com', NULL, '$2y$10$y2C6HxT.fo6yoJH3YupgzunAl0gcojH/nt0vSEw6PJ.T00fSOjk26', NULL, '2023-06-06 20:23:37', '2023-06-06 20:23:37'),
(7, 'Rendi Sibarani', 'rendi@gmail.com', NULL, '$2y$10$to0nZzhC1GM9L44G9v11i.Vejj6OuRSAe85S2TCVoR.yZa2jYsn6e', NULL, '2023-06-07 02:33:23', '2023-06-07 02:33:23');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_baptis`
--
ALTER TABLE `data_baptis`
  ADD PRIMARY KEY (`id_Baptis`),
  ADD KEY `fk_pelayan` (`nama_pelayan`);

--
-- Indeks untuk tabel `data_pelayan`
--
ALTER TABLE `data_pelayan`
  ADD PRIMARY KEY (`nama_pelayan`),
  ADD KEY `id_Pelayan` (`id_Pelayan`) USING BTREE;

--
-- Indeks untuk tabel `data_sidi`
--
ALTER TABLE `data_sidi`
  ADD PRIMARY KEY (`id_Sidi`);

--
-- Indeks untuk tabel `lingkungan`
--
ALTER TABLE `lingkungan`
  ADD PRIMARY KEY (`id_lingkungan`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `tambah_jemaat`
--
ALTER TABLE `tambah_jemaat`
  ADD PRIMARY KEY (`id_jemaat`),
  ADD KEY `fk_lingkungan` (`id_lingkungan`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_baptis`
--
ALTER TABLE `data_baptis`
  MODIFY `id_Baptis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `data_pelayan`
--
ALTER TABLE `data_pelayan`
  MODIFY `id_Pelayan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `data_sidi`
--
ALTER TABLE `data_sidi`
  MODIFY `id_Sidi` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `lingkungan`
--
ALTER TABLE `lingkungan`
  MODIFY `id_lingkungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `tambah_jemaat`
--
ALTER TABLE `tambah_jemaat`
  MODIFY `id_jemaat` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_baptis`
--
ALTER TABLE `data_baptis`
  ADD CONSTRAINT `data_baptis_ibfk_1` FOREIGN KEY (`nama_pelayan`) REFERENCES `data_pelayan` (`nama_pelayan`);

--
-- Ketidakleluasaan untuk tabel `tambah_jemaat`
--
ALTER TABLE `tambah_jemaat`
  ADD CONSTRAINT `tambah_jemaat_ibfk_1` FOREIGN KEY (`id_lingkungan`) REFERENCES `lingkungan` (`id_lingkungan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
