<?php

include 'conn.php';




if ($conn->connect_error) {
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Mengambil data dari Flutter
$data = json_decode(file_get_contents('php://input'), true);

// Mendapatkan nilai yang dikirim dari Flutter
$email = $data['email'];
$password = $data['password'];

// Menjalankan query ke database
$query = "SELECT * FROM akun WHERE email = '$email' AND password = '$password'";
$result = $conn->query($query);

// Memeriksa hasil query
if ($result->num_rows > 0) {
    // Pengguna ditemukan
    $response['status'] = "success";
    $response['message'] = "Login berhasil";
} else {
    // Pengguna tidak ditemukan
    $response['status'] = "error";
    $response['message'] = "Email atau password salah";
}

// Mengirimkan respon ke Flutter
echo json_encode($response);
?>