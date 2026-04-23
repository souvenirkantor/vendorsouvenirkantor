$ErrorActionPreference = "Stop"

$baseUrl = "https://vendorsouvenirkantor.web.id"

$services = @(
  [PSCustomObject]@{
    Slug = "layanan-konsultasi-produk-souvenir-kantor.html"
    Title = "Layanan Konsultasi Produk Souvenir Kantor"
    Category = "Konsultasi"
    PriceDisplay = "Tanpa biaya konsultasi awal"
    Response = "Respon awal 1x24 jam"
    Image = "assets/img/health/cardiology-2.webp"
    MetaDesc = "Detail layanan konsultasi produk souvenir kantor: kurasi paket, estimasi budget, dan rekomendasi terbaik sesuai tujuan program perusahaan."
    Keywords = "layanan konsultasi souvenir kantor, kurasi produk merchandise perusahaan, rekomendasi paket souvenir"
    Short = "Layanan konsultasi untuk membantu tim purchasing dan HR memilih paket souvenir paling relevan dengan objective program dan budget perusahaan."
    Outputs = @("Rekomendasi paket sesuai objective program","Estimasi budget per skenario kuantitas","Saran material dan metode branding","Rangkuman opsi cepat untuk approval internal")
    UseCases = @("Onboarding karyawan baru","Seminar dan workshop perusahaan","Program apresiasi internal","Campaign relasi klien")
    Steps = @(
      @{Label="Tahap 1";Value="Diskusi kebutuhan: tujuan, penerima, budget, timeline"},
      @{Label="Tahap 2";Value="Kurasi opsi produk dan komposisi paket"},
      @{Label="Tahap 3";Value="Finalisasi shortlist dan arahan quotation"},
      @{Label="Tahap 4";Value="Pendampingan hingga keputusan vendor"}
    )
    CardDesc = "Bantu pilih paket paling tepat berdasarkan tujuan program dan budget."
  },
  [PSCustomObject]@{
    Slug = "layanan-desain-branding-souvenir.html"
    Title = "Layanan Desain Branding Souvenir"
    Category = "Desain Branding"
    PriceDisplay = "Menyesuaikan kompleksitas desain"
    Response = "Respon awal 1x24 jam"
    Image = "assets/img/health/neurology-3.webp"
    MetaDesc = "Detail layanan desain branding souvenir: mockup logo, revisi terstruktur, dan standardisasi visual agar hasil produksi konsisten dengan identitas perusahaan."
    Keywords = "layanan desain branding souvenir, mockup logo merchandise, revisi desain souvenir kantor"
    Short = "Layanan desain branding untuk memastikan identitas visual perusahaan tampil konsisten di setiap produk souvenir."
    Outputs = @("Mockup branding untuk setiap item paket","Saran penempatan logo paling optimal","Siklus revisi desain terstruktur","Final artwork siap produksi")
    UseCases = @("Paket onboarding dan seminar","Corporate gift untuk relasi","Campaign merchandise musiman","Rebranding identitas visual perusahaan")
    Steps = @(
      @{Label="Tahap 1";Value="Penerimaan guideline brand dan referensi visual"},
      @{Label="Tahap 2";Value="Pembuatan mockup awal per produk"},
      @{Label="Tahap 3";Value="Revisi desain berdasarkan feedback"},
      @{Label="Tahap 4";Value="Finalisasi artwork untuk produksi"}
    )
    CardDesc = "Mockup logo dan revisi desain terarah agar approval lebih cepat."
  },
  [PSCustomObject]@{
    Slug = "layanan-produksi-massal-souvenir.html"
    Title = "Layanan Produksi Massal Souvenir"
    Category = "Produksi"
    PriceDisplay = "Menyesuaikan kuantitas dan material"
    Response = "Update progres berkala"
    Image = "assets/img/health/orthopedics-1.webp"
    MetaDesc = "Detail layanan produksi massal souvenir kantor dengan quality control bertahap, monitoring progres, dan SLA jelas untuk project perusahaan."
    Keywords = "layanan produksi massal souvenir, qc souvenir kantor, SLA produksi merchandise"
    Short = "Layanan produksi massal untuk kebutuhan souvenir perusahaan dengan standar quality control dan timeline yang terukur."
    Outputs = @("SLA produksi terjadwal","Checkpoint quality control bertahap","Laporan progres produksi","Output sesuai sample approval")
    UseCases = @("Produksi onboarding kit skala besar","Seminar kit nasional","Corporate gift periodik","Paket merchandise event multikota")
    Steps = @(
      @{Label="Tahap 1";Value="Konfirmasi spesifikasi final dan sample approval"},
      @{Label="Tahap 2";Value="Scheduling produksi dan alokasi kapasitas"},
      @{Label="Tahap 3";Value="QC di tengah dan akhir produksi"},
      @{Label="Tahap 4";Value="Serah terima hasil produksi siap packing"}
    )
    CardDesc = "Produksi souvenir skala kecil hingga besar dengan QC bertahap."
  },
  [PSCustomObject]@{
    Slug = "layanan-packing-bundling-souvenir.html"
    Title = "Layanan Packing dan Bundling Souvenir"
    Category = "Packing & Bundling"
    PriceDisplay = "Menyesuaikan jenis kemasan"
    Response = "Koordinasi label dan grouping paket"
    Image = "assets/img/health/pediatrics-4.webp"
    MetaDesc = "Detail layanan packing dan bundling souvenir kantor: labeling paket, grouping penerima, dan standarisasi kemasan untuk distribusi yang lebih rapi."
    Keywords = "layanan packing bundling souvenir, labeling paket merchandise, kemasan souvenir perusahaan"
    Short = "Layanan packing dan bundling untuk memastikan paket souvenir tersusun rapi, akurat, dan siap distribusi sesuai kategori penerima."
    Outputs = @("Pengemasan paket sesuai standar","Labeling per batch atau penerima","Bundling khusus event atau onboarding","Dokumentasi foto sebelum kirim")
    UseCases = @("Onboarding kit per divisi","Seminar kit per kategori peserta","Gift relasi dengan personalisasi nama","Distribusi cabang multi kota")
    Steps = @(
      @{Label="Tahap 1";Value="Mapping kategori paket dan kebutuhan label"},
      @{Label="Tahap 2";Value="Persiapan material kemasan"},
      @{Label="Tahap 3";Value="Packing, bundling, dan verifikasi jumlah"},
      @{Label="Tahap 4";Value="Final check sebelum pengiriman"}
    )
    CardDesc = "Kemasan dan bundling paket agar distribusi lebih rapi dan minim salah kirim."
  },
  [PSCustomObject]@{
    Slug = "layanan-distribusi-nasional-souvenir.html"
    Title = "Layanan Distribusi Nasional Souvenir"
    Category = "Distribusi"
    PriceDisplay = "Menyesuaikan jumlah titik kirim"
    Response = "Tracking pengiriman terstruktur"
    Image = "assets/img/health/emergency-2.webp"
    MetaDesc = "Detail layanan distribusi nasional souvenir kantor untuk single drop dan multi drop ke berbagai kota dengan koordinasi PIC dan tracking pengiriman."
    Keywords = "layanan distribusi nasional souvenir, pengiriman multi drop merchandise, logistik souvenir kantor"
    Short = "Layanan distribusi nasional untuk memastikan paket souvenir sampai tepat waktu ke satu atau banyak lokasi pengiriman."
    Outputs = @("Skema single drop atau multi drop","Koordinasi data alamat dan PIC penerima","Tracking pengiriman berkala","Rekap status pengiriman")
    UseCases = @("Distribusi onboarding ke cabang","Pengiriman seminar kit lintas kota","Program gift klien nasional","Campaign merchandise multiregion")
    Steps = @(
      @{Label="Tahap 1";Value="Validasi data lokasi dan PIC penerima"},
      @{Label="Tahap 2";Value="Penentuan rute dan mode pengiriman"},
      @{Label="Tahap 3";Value="Dispatch paket bertahap sesuai prioritas"},
      @{Label="Tahap 4";Value="Monitoring tracking dan konfirmasi terima"}
    )
    CardDesc = "Pengiriman single drop dan multi drop ke berbagai kota Indonesia."
  },
  [PSCustomObject]@{
    Slug = "layanan-after-sales-support-souvenir.html"
    Title = "Layanan After Sales Support Souvenir"
    Category = "After Sales"
    PriceDisplay = "Termasuk pendampingan pasca project"
    Response = "Respon support 1x24 jam kerja"
    Image = "assets/img/health/laboratory-3.webp"
    MetaDesc = "Detail layanan after sales support souvenir kantor: evaluasi project, penanganan feedback, dan perencanaan repeat order untuk kebutuhan jangka panjang."
    Keywords = "after sales support souvenir, evaluasi project merchandise, layanan repeat order souvenir"
    Short = "Layanan after sales support untuk memastikan hasil project terjaga dan memudahkan perusahaan saat melakukan repeat order."
    Outputs = @("Rekap evaluasi project","Penanganan feedback pasca pengiriman","Rekomendasi optimasi untuk project berikutnya","Pendampingan repeat order")
    UseCases = @("Program souvenir rutin bulanan","Event tahunan perusahaan","Pembaruan paket onboarding periodik","Skema kontrak pengadaan jangka panjang")
    Steps = @(
      @{Label="Tahap 1";Value="Review hasil pengiriman dan kualitas output"},
      @{Label="Tahap 2";Value="Pengumpulan feedback dari tim klien"},
      @{Label="Tahap 3";Value="Penyusunan rekomendasi perbaikan"},
      @{Label="Tahap 4";Value="Rencana repeat order lebih efisien"}
    )
    CardDesc = "Pendampingan pasca project untuk evaluasi dan repeat order lebih efisien."
  }
)

function New-LiItems {
  param([string[]]$Items)
  return (($Items | ForEach-Object { "<li>$_</li>" }) -join "`n")
}

function New-StepRows {
  param($Rows)
  return (($Rows | ForEach-Object {
    "<div class=`"row-item`"><div class=`"label`">$($_.Label)</div><div class=`"value`">$($_.Value)</div></div>"
  }) -join "`n")
}

function New-FaqInline {
  param($Service)
@"
<h3>Apakah $($Service.Title) bisa disesuaikan kebutuhan perusahaan kami?</h3>
<p>Ya. Layanan ini fleksibel dan dapat disesuaikan berdasarkan skala project, target timeline, serta alur approval internal perusahaan Anda.</p>
<h3>Bagaimana cara memulai layanan ini?</h3>
<p>Anda cukup menghubungi tim kami via WhatsApp dengan menjelaskan tujuan program, estimasi kuantitas, dan target waktu pelaksanaan.</p>
<h3>Apakah layanan ini bisa digabung dengan layanan lain?</h3>
<p>Bisa. Setiap layanan dapat diintegrasikan secara end-to-end agar koordinasi project lebih ringkas dari awal hingga distribusi.</p>
<h3>Berapa lama respon awal tim?</h3>
<p>Untuk layanan ini, respon awal biasanya dalam waktu $($Service.Response) setelah kebutuhan awal kami terima.</p>
"@
}

function New-FaqSchema {
  param($Service)
  $faq = [PSCustomObject]@{
    "@context" = "https://schema.org"
    "@type" = "FAQPage"
    mainEntity = @(
      @{
        "@type" = "Question"
        name = "Apakah $($Service.Title) bisa disesuaikan kebutuhan perusahaan?"
        acceptedAnswer = @{
          "@type" = "Answer"
          text = "Ya, layanan ini dapat disesuaikan berdasarkan skala project, objective program, dan alur kerja internal perusahaan."
        }
      },
      @{
        "@type" = "Question"
        name = "Bagaimana cara mulai menggunakan layanan ini?"
        acceptedAnswer = @{
          "@type" = "Answer"
          text = "Hubungi tim kami melalui WhatsApp dengan brief awal berisi tujuan program, kuantitas, dan target timeline."
        }
      },
      @{
        "@type" = "Question"
        name = "Berapa lama respon awal tim layanan?"
        acceptedAnswer = @{
          "@type" = "Answer"
          text = "Respon awal untuk layanan ini biasanya dalam waktu $($Service.Response)."
        }
      }
    )
  }
  return ($faq | ConvertTo-Json -Depth 8 -Compress)
}

function New-ServiceSchema {
  param($Service)
  $schema = [PSCustomObject]@{
    "@context" = "https://schema.org"
    "@type" = "Service"
    name = $Service.Title
    serviceType = $Service.Category
    description = $Service.Short
    provider = @{
      "@type" = "Organization"
      name = "Vendor Souvenir Kantor"
      url = "https://vendorsouvenirkantor.web.id"
    }
    areaServed = "Indonesia"
    url = "$baseUrl/$($Service.Slug)"
  }
  return ($schema | ConvertTo-Json -Depth 8 -Compress)
}

function New-RelatedHtml {
  param([int]$Index, $All)
  $items = @()
  for ($step = 1; $step -le 3; $step++) {
    $r = $All[($Index + $step) % $All.Count]
    $items += @"
<div class="col-md-4">
  <div class="card">
    <img src="$($r.Image)" alt="$($r.Title)" width="1024" height="683" loading="lazy" decoding="async">
    <div class="card-body">
      <h3>$($r.Title)</h3>
      <p class="small">$($r.CardDesc)</p>
      <a href="$($r.Slug)">Lihat detail</a>
    </div>
  </div>
</div>
"@
  }
  return ($items -join "`n")
}

$template = @'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>__TITLE__ | Vendor Souvenir Kantor</title>
  <meta name="description" content="__META_DESC__">
  <meta name="keywords" content="__KEYWORDS__">
  <link rel="canonical" href="__CANONICAL__">
  <meta name="robots" content="index, follow, max-image-preview:large">
  <meta property="og:locale" content="id_ID">
  <meta property="og:type" content="website">
  <meta property="og:title" content="__TITLE__ | Vendor Souvenir Kantor">
  <meta property="og:description" content="__META_DESC__">
  <meta property="og:url" content="__CANONICAL__">
  <meta property="og:site_name" content="Vendor Souvenir Kantor">
  <meta property="og:image" content="__OG_IMAGE__">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="__TITLE__ | Vendor Souvenir Kantor">
  <meta name="twitter:description" content="__META_DESC__">
  <meta name="twitter:image" content="__OG_IMAGE__">
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="assets/vendor/drift-zoom/drift-basic.css" rel="stylesheet">
  <link href="assets/css/main.css" rel="stylesheet">
  <link href="assets/css/service-detail-page.css" rel="stylesheet">
  <script type="application/ld+json">{"@context":"https://schema.org","@type":"Organization","name":"Vendor Souvenir Kantor","url":"https://vendorsouvenirkantor.web.id","logo":"https://vendorsouvenirkantor.web.id/assets/img/favicon.png","contactPoint":{"@type":"ContactPoint","telephone":"+62-895-6390-68080","contactType":"sales","areaServed":"ID","availableLanguage":["id"]}}</script>
  <script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Home","item":"https://vendorsouvenirkantor.web.id/"},{"@type":"ListItem","position":2,"name":"Layanan","item":"https://vendorsouvenirkantor.web.id/service.html"},{"@type":"ListItem","position":3,"name":"__TITLE__","item":"__CANONICAL__"}]}</script>
  <script type="application/ld+json">__SERVICE_SCHEMA__</script>
  <script type="application/ld+json">__FAQ_SCHEMA__</script>
</head>
<body class="service-package-page">
  <header id="header" class="header dark-background d-flex flex-column justify-content-center">
    <i class="header-toggle d-xl-none bi bi-list"></i>
    <div class="header-container d-flex flex-column align-items-start">
      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.html"><i class="bi bi-house navicon"></i>Home</a></li>
          <li><a href="about.html"><i class="bi bi-person navicon"></i> Tentang</a></li>
          <li><a href="produk.html"><i class="bi bi-bag navicon"></i> Produk</a></li>
          <li><a href="service.html" class="active"><i class="bi bi-hdd-stack navicon"></i> Layanan</a></li>
          <li><a href="blog.html"><i class="bi bi-journal-text navicon"></i> Artikel</a></li>
          <li class="dropdown"><a href="#"><i class="bi bi-menu-button navicon"></i> <span>Info</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="portfolio-details.html">Portofolio</a></li>
              <li><a href="produk.html">Detail Produk</a></li>
              <li><a href="service-details.html">Detail Layanan</a></li>
              <li><a href="lokasi-layanan.html">Area Layanan</a></li>
              <li><a href="faq-seo.html">FAQ Vendor</a></li>
            </ul>
          </li>
          <li><a href="starter-page.html"><i class="bi bi-envelope navicon"></i> Kontak</a></li>
        </ul>
      </nav>
      <div class="social-links text-center">
        <a href="https://wa.me/62895639068080" class="twitter" aria-label="WhatsApp"><i class="bi bi-whatsapp"></i></a>
        <a href="mailto:halo@vendorsouvenirkantor.web.id" class="facebook" aria-label="Email"><i class="bi bi-envelope-fill"></i></a>
        <a href="https://vendorsouvenirkantor.web.id" class="instagram" aria-label="Website"><i class="bi bi-globe"></i></a>
      </div>
    </div>
  </header>

  <main class="main">
    <div class="page-title dark-background">
      <div class="container">
        <nav class="breadcrumbs" aria-label="breadcrumb">
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="service.html">Layanan</a></li>
            <li class="current">__TITLE__</li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">
      <div class="container service-wrap">
        <article class="service-card">
          <h1 class="service-title">__TITLE__</h1>
          <p class="service-lead">__SHORT__</p>

          <figure class="service-figure">
            <img src="__IMAGE__" alt="__TITLE__" class="img-fluid" width="1024" height="683" fetchpriority="high" decoding="async">
            <figcaption>Gambar layanan: __TITLE__. Sumber gambar: arsip internal <a href="https://vendorsouvenirkantor.web.id">Vendor Souvenir Kantor</a>.</figcaption>
          </figure>

          <div class="quick-answer-box">
            <p><strong>Jawaban cepat:</strong> __TITLE__ cocok untuk project perusahaan yang membutuhkan proses lebih terstruktur dengan __RESPONSE__.</p>
          </div>

          <details class="toc-wrap" id="tocWrapper" open>
            <summary>Daftar Isi Detail Layanan</summary>
            <ol id="tocList"></ol>
          </details>

          <div class="row g-3 mb-3">
            <div class="col-lg-6">
              <div class="service-facts">
                <h3>Ringkasan Layanan</h3>
                <ul>
                  <li><strong>Kategori:</strong> __CATEGORY__</li>
                  <li><strong>Biaya:</strong> __PRICE__</li>
                  <li><strong>Respon:</strong> __RESPONSE__</li>
                  <li><strong>Area Layanan:</strong> Seluruh Indonesia</li>
                </ul>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="service-facts">
                <h3>Call To Action</h3>
                <p class="mb-2">Butuh diskusi cepat untuk menyesuaikan layanan ini dengan kebutuhan project Anda?</p>
                <a href="__WA_LINK__" class="btn btn-primary" target="_blank" rel="noopener">Konsultasi via WhatsApp</a>
              </div>
            </div>
          </div>

          <div class="service-content content">
            <h2 id="cakupan-layanan">Cakupan Layanan</h2>
            <p>Layanan ini dirancang untuk membantu perusahaan menjalankan pengadaan souvenir secara lebih terukur, mulai dari perencanaan teknis sampai eksekusi operasional. Tim kami menyesuaikan pendekatan berdasarkan objective program, skala peserta, dan kebutuhan timeline.</p>
            <ul>
              __OUTPUTS__
            </ul>

            <h2 id="alur-kerja">Alur Kerja</h2>
            <p>Berikut alur kerja yang biasa digunakan agar proses layanan tetap rapi dan mudah dipantau lintas tim.</p>
            <div class="timeline-table">
              __STEP_ROWS__
            </div>

            <h2 id="rekomendasi-penggunaan">Rekomendasi Penggunaan</h2>
            <p>__TITLE__ umumnya paling efektif untuk kebutuhan berikut:</p>
            <ul>
              __USE_CASES__
            </ul>

            <h2 id="integrasi-layanan">Integrasi dengan Layanan Lain</h2>
            <p>Layanan ini bisa digabung dengan layanan lain seperti desain branding, produksi massal, packing, hingga distribusi agar project berjalan end-to-end dalam satu alur koordinasi. Pendekatan terintegrasi membantu mengurangi gap komunikasi dan mempercepat pengambilan keputusan.</p>

            <h2 id="faq-inline">FAQ Detail Layanan</h2>
            __FAQ_INLINE__
          </div>

          <div class="share-buttons">
            <a class="btn btn-success btn-sm" id="shareWa" target="_blank" rel="noopener"><i class="bi bi-whatsapp"></i> Share WhatsApp</a>
            <a class="btn btn-primary btn-sm" id="shareFb" target="_blank" rel="noopener"><i class="bi bi-facebook"></i> Share Facebook</a>
            <a class="btn btn-info btn-sm text-white" id="shareX" target="_blank" rel="noopener"><i class="bi bi-twitter-x"></i> Share X</a>
            <button class="btn btn-outline-dark btn-sm" id="copyLinkBtn" type="button"><i class="bi bi-link-45deg"></i> Copy Link</button>
          </div>

          <div class="mt-4">
            <h2 class="h4 mb-3">Layanan Terkait</h2>
            <div class="row g-3 related-grid">
              __RELATED_HTML__
            </div>
          </div>
        </article>
      </div>
    </section>
  </main>

  <footer id="footer" class="footer position-relative">
    <div class="container">
      <div class="copyright text-center ">
        <p>&copy; <span>Copyright</span> <strong class="px-1 sitename">Vendor Souvenir Kantor</strong> <span>All Rights Reserved</span></p>
      </div>
    </div>
  </footer>

  <a class="floating-wa" href="__WA_LINK__" target="_blank" rel="noopener" aria-label="Chat WhatsApp"><i class="bi bi-whatsapp"></i></a>
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center" aria-label="Kembali ke atas"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/typed.js/typed.umd.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/drift-zoom/Drift.min.js"></script>
  <script src="assets/js/main.js"></script>
  <script>
    (function () {
      const container = document.querySelector('.service-content');
      const tocList = document.getElementById('tocList');
      if (container && tocList) {
        container.querySelectorAll('h2').forEach((h2, idx) => {
          if (!h2.id) h2.id = 'h2-' + (idx + 1);
          const li = document.createElement('li');
          const a = document.createElement('a');
          a.href = '#' + h2.id;
          a.textContent = h2.textContent;
          li.appendChild(a);
          tocList.appendChild(li);
        });
      }
      const pageUrl = encodeURIComponent(window.location.href);
      const pageTitle = encodeURIComponent(document.title);
      const waText = encodeURIComponent('Baca detail layanan ini: ' + document.title + ' - ' + window.location.href);
      document.getElementById('shareWa').href = 'https://wa.me/?text=' + waText;
      document.getElementById('shareFb').href = 'https://www.facebook.com/sharer/sharer.php?u=' + pageUrl;
      document.getElementById('shareX').href = 'https://twitter.com/intent/tweet?url=' + pageUrl + '&text=' + pageTitle;
      const copyBtn = document.getElementById('copyLinkBtn');
      if (copyBtn) {
        copyBtn.addEventListener('click', function () {
          navigator.clipboard.writeText(window.location.href).then(function () {
            copyBtn.textContent = 'Link Tersalin';
            setTimeout(function () {
              copyBtn.innerHTML = '<i class="bi bi-link-45deg"></i> Copy Link';
            }, 1400);
          });
        });
      }
    })();
  </script>
</body>
</html>
'@

for ($i = 0; $i -lt $services.Count; $i++) {
  $svc = $services[$i]
  $canonical = "$baseUrl/$($svc.Slug)"
  $ogImage = "$baseUrl/$($svc.Image)"
  $outputs = New-LiItems -Items $svc.Outputs
  $useCases = New-LiItems -Items $svc.UseCases
  $stepRows = New-StepRows -Rows $svc.Steps
  $faqInline = New-FaqInline -Service $svc
  $faqSchema = New-FaqSchema -Service $svc
  $serviceSchema = New-ServiceSchema -Service $svc
  $relatedHtml = New-RelatedHtml -Index $i -All $services
  $waText = [uri]::EscapeDataString("Halo Vendor Souvenir Kantor, saya ingin konsultasi $($svc.Title).")
  $waLink = "https://wa.me/62895639068080?text=$waText"

  $content = $template
  $content = $content.Replace("__TITLE__", $svc.Title)
  $content = $content.Replace("__META_DESC__", $svc.MetaDesc)
  $content = $content.Replace("__KEYWORDS__", $svc.Keywords)
  $content = $content.Replace("__CANONICAL__", $canonical)
  $content = $content.Replace("__OG_IMAGE__", $ogImage)
  $content = $content.Replace("__IMAGE__", $svc.Image)
  $content = $content.Replace("__SHORT__", $svc.Short)
  $content = $content.Replace("__CATEGORY__", $svc.Category)
  $content = $content.Replace("__PRICE__", $svc.PriceDisplay)
  $content = $content.Replace("__RESPONSE__", $svc.Response)
  $content = $content.Replace("__OUTPUTS__", $outputs)
  $content = $content.Replace("__USE_CASES__", $useCases)
  $content = $content.Replace("__STEP_ROWS__", $stepRows)
  $content = $content.Replace("__FAQ_INLINE__", $faqInline)
  $content = $content.Replace("__FAQ_SCHEMA__", $faqSchema)
  $content = $content.Replace("__SERVICE_SCHEMA__", $serviceSchema)
  $content = $content.Replace("__RELATED_HTML__", $relatedHtml)
  $content = $content.Replace("__WA_LINK__", $waLink)

  Set-Content -Path $svc.Slug -Value $content -Encoding UTF8
}

Write-Output "Generated $($services.Count) service detail pages."
