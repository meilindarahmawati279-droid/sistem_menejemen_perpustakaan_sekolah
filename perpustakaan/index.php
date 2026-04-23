<?php include 'koneksi.php'; ?>

<h2>Data Buku</h2>
<a href="tambah.php">+ Tambah Buku</a>

<table border="1" cellpadding="10">
<tr>
    <th>No</th>
    <th>Judul</th>
    <th>Stok</th>
    <th>Aksi</th>
</tr>

<?php
$no = 1;
$stmt = $conn->prepare("SELECT * FROM buku");
$stmt->execute();
$result = $stmt->get_result();

while ($d = $result->fetch_assoc()) {
?>
<tr>
    <td><?= $no++ ?></td>
    <td><?= htmlspecialchars($d['judul']) ?></td>
    <td><?= $d['stok'] ?></td>
    <td>
        <a href="edit.php?id=<?= $d['id_buku'] ?>">Edit</a> |
        <a href="hapus.php?id=<?= $d['id_buku'] ?>" onclick="return confirm('Yakin?')">Hapus</a>
    </td>
</tr>
<?php } ?>
</table>