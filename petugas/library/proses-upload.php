<?php 
include "database.php";

if (isset($_POST['kirim'])) {
    $lokasi_file = $_FILES['fupload']['tmp_name'];
    $nama_file = $_FILES['fupload']['name'];
    $error_file = $_FILES['fupload']['error'];
    
    session_start();
    if (!isset($_SESSION['id_petugas'])) {
        echo "<script>
                alert('Session tidak ditemukan. Anda harus login terlebih dahulu.');
                window.location.href=('../index.php');
              </script>";
        exit();
    }

    $idpetugas = $_SESSION['id_petugas'];
    $tgl = date('Ymd');
    $folder = "files/$nama_file";
    
    // Cek apakah direktori files ada, jika tidak buat direktori tersebut
    if (!is_dir('files')) {
        if (!mkdir('files', 0777, true)) {
            die('Failed to create directories...');
        }
    }

    if ($error_file === UPLOAD_ERR_OK) {
        if (move_uploaded_file($lokasi_file, $folder)) {
            $query = $koneksi->query("INSERT INTO tbl_album (id_petugas, file_name, tgl_upload) VALUES ('$idpetugas', '$nama_file', '$tgl')");
            if ($query) {
                echo "<script>
                        alert('Berhasil diunggah!');
                        window.location.href=('../index.php?m=contents&p=album');
                      </script>";
            } else {
                $error_message = "Database error: " . $koneksi->error;
                echo "<script>
                        alert('{$error_message}');
                        console.log('{$error_message}');
                        document.write('{$error_message}');
                      </script>";
            }
        } else {
            $error_message = "Gagal memindahkan file.";
            echo "<script>
                    alert('{$error_message}');
                    console.log('{$error_message}');
                    document.write('{$error_message}');
                  </script>";
        }
    } else {
        $error_message = "Gagal diunggah. Error kode: $error_file";
        echo "<script>
                alert('{$error_message}');
                console.log('{$error_message}');
                document.write('{$error_message}');
              </script>";
    }
}

if (isset($_GET['del'])) {
    $SQL = $koneksi->query("DELETE FROM tbl_album WHERE id_album =".$_GET['del']);
    if ($SQL) {
        echo "<script>
                window.location.href=('index.php?m=contents&p=album');
              </script>";
    } else {
        $error_message = "Database error: " . $koneksi->error;
        echo "<script>
                alert('{$error_message}');
                console.log('{$error_message}');
                document.write('{$error_message}');
              </script>";
    }
}
?>
