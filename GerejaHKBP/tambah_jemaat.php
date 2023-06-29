<?php
$conn = new mysqli("localhost", "root", "", "gereja");
$nama_jemaat = $_POST["nama_jemaat"];
$pendidikan = $_POST["pendidikan"];
$bidangPendidikan = $_POST["bidangPendidikan"];
$pekerjaan = $_POST["pekerjaan"];
$alamat = $_POST["alamat"];
$lingkungan = $_POST["id_lingkungan"];

$data = mysqli_query($conn, "INSERT INTO tambah_jemaat set nama_jemaat='$nama_jemaat', pendidikan='$pendidikan', bidangPendidikan='$bidangPendidikan', pekerjaan='$pekerjaan',id_lingkungan='$lingkungan',alamat ='$alamat' ");

if ($data) {
    echo json_encode([
        'pesan' => 'Sukses'
    ]);
} else {
    echo json_encode([
        'pesan' => 'Gagal'
    ]);
}
