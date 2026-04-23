<?php
include 'koneksi.php';

$id = $_GET['id'];

$stmt = $conn->prepare("DELETE FROM buku WHERE id_buku=?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: index.php");
?>