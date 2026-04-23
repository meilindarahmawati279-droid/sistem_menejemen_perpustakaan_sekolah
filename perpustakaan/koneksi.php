<?php
$host = "localhost";
$user = "root";
$pass = ""; // default XAMPP kosong
$db   = "perpustakaan";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>