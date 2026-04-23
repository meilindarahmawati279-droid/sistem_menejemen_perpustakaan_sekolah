<?php include 'koneksi.php'; ?>

<h2>Tambah Buku</h2>

<form method="POST">
    Judul: <input type="text" name="judul" required><br><br>
    Stok: <input type="number" name="stok" required><br><br>
    <button name="simpan">Simpan</button>
</form>

<?php
if (isset($_POST['simpan'])) {
    $judul = $_POST['judul'];
    $stok  = $_POST['stok'];

    $stmt = $conn->prepare("INSERT INTO buku (judul, stok) VALUES (?, ?)");
    $stmt->bind_param("si", $judul, $stok);
    $stmt->execute();

    header("Location: index.php");
}
?>