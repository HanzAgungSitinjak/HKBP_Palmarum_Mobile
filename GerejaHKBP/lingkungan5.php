<?php

// Step 1: Koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "gereja";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Step 2: Mengambil data dari database dan mengubahnya menjadi JSON
$sql = "SELECT * FROM tambah_jemaat WHERE id_lingkungan = '5'";
$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Step 3: Mengirimkan data dalam format JSON
header('Content-Type: application/json');
echo json_encode($data);

// Step 4: Menutup koneksi database
$conn->close();
?>
