<?php
include 'koneksi.php';

$id = $_GET['id'];

// Ambil data
$stmt = $conn->prepare("SELECT * FROM buku WHERE id_buku=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$data = $stmt->get_result()->fetch_assoc();
?>

<h2>Edit Buku</h2>

<form method="POST">
    Judul: <input type="text" name="judul" value="<?= htmlspecialchars($data['judul']) ?>" required><br><br>
    Stok: <input type="number" name="stok" value="<?= $data['stok'] ?>" required><br><br>
    <button name="update">Update</button>
</form>

<?php
if (isset($_POST['update'])) {
    $judul = $_POST['judul'];
    $stok  = $_POST['stok'];

    $stmt = $conn->prepare("UPDATE buku SET judul=?, stok=? WHERE id_buku=?");
    $stmt->bind_param("sii", $judul, $stok, $id);
    $stmt->execute();

    header("Location: index.php");
}
?>