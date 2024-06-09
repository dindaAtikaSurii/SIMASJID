<?php 

include('fungsi.php');
include_once "library/database.php";
include_once "library/fungsi.php"; 

 
	session_start(); 
	
	
	if( !isset($_SESSION['id_user'])){
	header("location: index.php");
	exit;	
	}
	
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Selamat Datang - Masjid Al-Hakim</title>
        
<!-- 

Sentra Template

http://www.templatemo.com/tm-518-sentra

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="assets/apple-touch-icon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="assets/css/fontAwesome.css">
        <link rel="stylesheet" href="assets/css/light-box.css">
        <link rel="stylesheet" href="assets/css/owl-carousel.css">
        <link rel="stylesheet" href="assets/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

<body>



        <header class="nav-down responsive-nav hidden-lg hidden-md">
          <!-- untuk memanggil header.php-->
		 <?php  require_once "header.php"; ?>
        </header>

        <div class="sidebar-navigation hidde-sm hidden-xs">
           <!-- untuk memanggil sidebar.php-->
		 <?php  require_once "sidebar.php"; ?>
        </div>

        <div class="slider">
           <!-- untuk memanggil sidebar.php-->
		 <?php  require_once "slider.php"; ?>		
        </div>


        <div class="page-content">
		<section id="featured" class="content-section">
        <div class="section-heading">
            <h1>Agenda Kegiatan<br><em>Masjid Al-Hakim</em></h1>
            <p>Alhamdulillah, kami ucapkan terimakasih atas<br>Nikmat Allah yang Maha Kuasa.</p>
        </div>
        <div class="table-responsive">
            <table class="table table-condensed table-bordered table-hover">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Kegiatan</th>
                        <th>Waktu</th>
                        <th>Tanggal</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        // Koneksi ke database
                        include('koneksidb.php');

                        // Hapus kegiatan yang sudah berlalu
                        $hapus = $koneksi->prepare("DELETE FROM tbl_agenda WHERE tgl_akhir < CURDATE() OR (tgl_akhir = CURDATE() AND jam_akhir < CURTIME())");
                        $hapus->execute();

                        // Tampilkan kegiatan yang belum berlalu
                        $i = 1;
                        $tampil = $koneksi->prepare("SELECT id_agenda, judul, jam_awal, jam_akhir, tgl_awal, tgl_akhir, keterangan FROM tbl_agenda WHERE tgl_akhir >= CURDATE() ORDER BY tgl_awal ASC, jam_awal ASC");
                        $tampil->execute();
                        $tampil->store_result();
                        $tampil->bind_result($id, $judul, $jamawal, $jamakhir, $tglawal, $tglakhir, $ket);
                        if($tampil->num_rows() == 0){
                            echo "<tr align='center' bgcolor='pink'><td colspan='6'><b>BELUM ADA DATA!</b></td></tr>";
                        } else {
                            while($tampil->fetch()) {
                    ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?php echo $judul; ?></td>
                        <td><?php echo $jamawal . " s/d " . $jamakhir; ?></td>
                        <td><?php echo $tglawal . " s/d " . $tglakhir; ?></td>
                        <td><?php echo $ket; ?></td>
                    </tr>
                    <?php
                            }
                        }
                    ?>
                </tbody>
            </table>
        </div>
        
        <div class="table-responsive">
            <table class="table table-bordered table-condensed">
                <thead>
                    <tr>
                        <th width="1%">No</th>
                        <th>Foto</th>
                        <th>Tanggal Upload</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $i = 1;
                        $tampil = $koneksi->prepare("SELECT id_album, file_name, tgl_upload FROM tbl_album");
                        $tampil->execute();
                        $tampil->store_result();
                        $tampil->bind_result($id, $nama, $tgl);
                        if($tampil->num_rows() == 0){
                            echo "<tr align='center' bgcolor='pink'><td colspan='10'><b>BELUM ADA DATA!</b></td></tr>";
                        } else {
                            while($tampil->fetch()) {
                    ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td><img src="petugas/library/files/<?php echo $nama; ?>" width="auto" height="150"></td>
                        <td><?php echo $tgl; ?></td>
                    </tr>
                    <?php
                            }
                        }
                    ?>
                </tbody>
            </table>
        </div>
    </section>
			
			<section id="projects" class="content-section">
                <div class="section-heading">
                    <h1>Jadwal<br><em>Adzan</em></h1>
                    <p>Alhamdulillah, kami ucapkan terimakasih atas
                    <br>Nikmat Allah yang Maha Kuasa.</p>
                <div class="section-content">
                    <div class="masonry">
                        <div class="row">
                            <div class="item">
                                <div class="col-md-12">
                                    <iframe src="https://www.jadwalsholat.org/adzan/monthly.php?id=171" height="900" width="600" frameborder="0"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>            
            </section>
			
			<section id="contact" class="content-section">
                <div class="section-heading">
                    <h1>Profile<br><em>Masjid</em></h1>
                    <p>Alhamdulillah, kami ucapkan terimakasih atas
                    <br>Nikmat Allah yang Maha Kuasa.</p>
                </div>
                <div style="border:0; padding:10px; width:760px; height:auto; text-align:left;">
					<form action="action-input-data.php" method="POST" name="form-input-data">
						<table width="760" border="2" align="center" cellpadding="0" cellspacing="0">


						<tr height="46">
    <td style="width: 200px; padding: 10px;">&nbsp;Nama Masjid</td>
    <td style="width: 300px; padding: 10px;">&nbsp;Al-Hakim</td>
</tr>

							<tr height="46">
								<td  style="width: 200px; padding: 10px;">&nbsp;Pendiri</td>
								<td style="width: 300px; padding: 10px;">&nbsp;H. Arnes Azwar</td>
							</tr>

							<tr height="46">
        <td  style="width: 200px; padding: 10px;">&nbsp;Keterangan</td>
        <td style="width: 300px; padding: 10px;" class="justify-text">&nbsp;Masjid Al-Hakim Padang adalah sebuah masjid bergaya Taj Mahal yang terletak di tepi Pantai Padang, Kota Padang, Sumatera Barat. Masjid ini merupakan salah satu destinasi wisata religi di Kota Padang 
        dan telah menerima penghargaan dari Pemprov Sumbar atas prestasinya di bidang pariwisata dan kebersihan lingkungan.
        Masjid Al-Hakim Padang memiliki arsitektur yang terinspirasi dari Taj Mahal di India, dengan satu kubah besar di tengah, dikelilingi oleh empat kubah yang lebih kecil, dan empat menara. Masjid ini juga memiliki tampilan simetris. 
        Pembangunan masjid Al-Hakim Padang dibiayai oleh seorang donatur, sementara lahannya disediakan oleh Pemerintah Kota Padang. Pada 2016, seorang donatur menyampaikan niatnya untuk membangun masjid di tepi pantai, dan pembangunan dapat dikerjakan setelah PKL direlokasi ke tempat baru.
        </td>
    </tr>

							<tr height="46">
								<td  style="width: 200px; padding: 10px;">&nbsp;Alamat</td>
								<td style="width: 300px; padding: 10px;">&nbsp;Jl. Samudera, Berok Nipah, Kec. Padang Bar., Kota Padang, Sumatera Barat</td>
							</tr>
							<tr height="46">
            <td style="width: 200px; padding: 10px;">&nbsp;Link Maps</td>
            <td style="width: 300px; padding: 10px;">&nbsp; <a href="https://maps.app.goo.gl/f9KiSntWkNgD1Wn28" target="_blank">Lihat Maps Klik Di Sini</a></td>
        </tr>
					</form>
				</div>            
            </section>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="assets/js/vendor/bootstrap.min.js"></script>
    
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>

	<script language="javascript">
	function hanyaAngka(e,decimal){
		var key;
		var keychar;
		if(window.event){
			key = window.event.keyCode;
		}else
			if(e){
				key = e.which;
			}else return true;
			
			keychar = String.fromCharCode(key);
			if((key==null) || (key==0) || (key==8) || (key==9) || (key==13) || (key==27)){
				return true;
			}else
				if((("0123456789").indexOf(keychar)>-1)){
					return true;
				}else
					if(decimal && (keychar ==".")){
						return true;
					}else return false;
	}
	</script>
	
    <script>
        // Hide Header on on scroll down
        var didScroll;
        var lastScrollTop = 0;
        var delta = 5;
        var navbarHeight = $('header').outerHeight();

        $(window).scroll(function(event){
            didScroll = true;
        });

        setInterval(function() {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);

        function hasScrolled() {
            var st = $(this).scrollTop();
            
            // Make sure they scroll more than delta
            if(Math.abs(lastScrollTop - st) <= delta)
                return;
            
            // If they scrolled down and are past the navbar, add class .nav-up.
            // This is necessary so you never see what is "behind" the navbar.
            if (st > lastScrollTop && st > navbarHeight){
                // Scroll Down
                $('header').removeClass('nav-down').addClass('nav-up');
            } else {
                // Scroll Up
                if(st + $(window).height() < $(document).height()) {
                    $('header').removeClass('nav-up').addClass('nav-down');
                }
            }
            
            lastScrollTop = st;
        }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>

</body>
</html>