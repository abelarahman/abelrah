<?php
session_start(); 

if (!isset($_SESSION['username']) || $_SESSION['role'] !== 'admin') {
    header('Location: login.php');
    exit();
}

include('koneksi.php');
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action'])) {
        $action = $_POST['action'];

        if ($action === 'add') {
            $nama = $_POST['username'];
            $npm = $_POST['npm'];
            $fakultas = $_POST['fakultas'];
            $jurusan = $_POST['jurusan'];
            $jadwal = $_POST['jadwal'];

            $sql = "INSERT INTO mahasiswa (nama, npm, fakultas, jurusan, jadwal_pemeriksaan) VALUES (?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssss", $nama, $npm, $fakultas, $jurusan, $jadwal);
            if ($stmt->execute()) {
                echo "Data mahasiswa berhasil ditambahkan!";
            } else {
                echo "Gagal menambahkan data mahasiswa!";
            }
            $stmt->close();
        }
        if ($action === 'delete') {
            $id = $_POST['id'];

            $sql = "DELETE FROM mahasiswa WHERE id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("i", $id);
            if ($stmt->execute()) {
                echo "Data mahasiswa berhasil dihapus!";
            } else {
                echo "Gagal menghapus data mahasiswa!";
            }
            $stmt->close();
        }
    }
}
$sql = "SELECT * FROM mahasiswa";
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard Admin</title>
  <link rel="stylesheet" href="adminstyle.css">
</head>
<body>
<header>
  <div style="display: flex; align-items: center;">
    <img src="images/logo.png"Logo Universitas Khairun">
    <div>
      <h1>Dashboard Admin</h1>
      <p>Kelola Data Mahasiswa</p>
    </div>
  </div>
  <button class="btn-keluar" onclick="window.location.href='logout.php'">Keluar</button>
</header>

<div class="container">
  <h2>Data Mahasiswa</h2>
  <button onclick="showForm()">Tambah/Modifikasi Data</button>
  <table>
    <thead>
      <tr>
        <th>Nama</th>
        <th>NPM</th>
        <th>Fakultas</th>
        <th>Jurusan</th>
        <th>Jadwal Pemeriksaan</th>
        <th>Aksi</th>
      </tr>
    </thead>
    <tbody id="dataMahasiswa">
      <tr>
        <td>Budi</td>
        <td>08352211002</td>
        <td>Teknik</td>
        <td>Elektro</td>
        <td>2024-11-22</td>
        <td>
          <button onclick="deleteData(this)">Delete</button>
        </td>
      </tr>
      <tr>
        <td>Abel</td>
        <td>0735</td>
        <td>Ekonomi</td>
        <td>Manajemen</td>
        <td>2024-12-13</td>
        <td>
          <button onclick="deleteData(this)">Delete</button>
        </td>
      </tr>
      <tr>
        <td>Riska</td>
        <td>07352211182</td>
        <td>Kedokteran</td>
        <td>Kedokteran Umum</td>
        <td>2024-12-14</td>
        <td>
          <button onclick="deleteData(this)">Delete</button>
        </td>
      </tr>
    </tbody>
  </table>

  <div class="form-section" id="formSection" style="display: none;">
    <h3>Form Tambah/Modifikasi Data Mahasiswa</h3>
    <form id="mahasiswaForm" onsubmit="submitForm(event)">
      <label for="nama">Nama:</label>
      <input type="text" id="nama" name="nama" required>

      <label for="nim">NPM:</label>
      <input type="text" id="npm" name="npm" required>

      <label for="fakultas">Fakultas:</label>
      <select id="fakultas" name="fakultas" onchange="updateJurusan()" required>
        <option value="">Pilih Fakultas</option>
        <option value="Teknik">Teknik</option>
        <option value="Ekonomi">Ekonomi</option>
        <option value="Kedokteran">Kedokteran</option>
      </select>

      <label for="jurusan">Jurusan:</label>
      <select id="jurusan" name="jurusan" required>
        <option value="">Pilih Jurusan</option>
      </select>

      <label for="jadwal">Jadwal Pemeriksaan:</label>
      <input type="date" id="jadwal" name="jadwal" required>

      <div class="btn-container">
        <button type="submit">Simpan</button>
        <button type="button" onclick="cancelForm()">Batal</button>
      </div>
    </form>
  </div>
</div>
<script src="scriptadmin.js"></script>
<script src="utils.js"></script>
</body>
</html>
