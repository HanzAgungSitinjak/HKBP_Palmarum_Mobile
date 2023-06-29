<?php
$conn = new mysqli("localhost", "root", "", "gereja");
$nama_anak = $_POST["nama_anak"];
$TempatLahir = $_POST["TempatLahir"];
$tgl_lahir = $_POST["tgl_lahir"];
$tgl_baptis = $_POST["tgl_baptis"];
$nama_ayah = $_POST["nama_ayah"];
$nama_ibu = $_POST["nama_ibu"];

$data = mysqli_query($conn, "INSERT INTO data_sidi set nama_anak='$nama_anak', TempatLahir='$TempatLahir', tgl_lahir='$tgl_lahir', tgl_baptis='$tgl_baptis',nama_ayah='$nama_ayah', nama_ibu='$nama_ibu' ");

if ($data) {
    echo json_encode([
        'pesan' => 'Sukses'
    ]);
} else {
    echo json_encode([
        'pesan' => 'Gagal'
    ]);
}
