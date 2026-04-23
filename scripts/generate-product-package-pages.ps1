$ErrorActionPreference = "Stop"

$baseUrl = "https://vendorsouvenirkantor.web.id"

$packages = @(
  [PSCustomObject]@{
    Slug = "paket-onboarding-kit-basic.html"
    Title = "Paket Onboarding Kit Basic"
    Category = "Onboarding Kit"
    PriceDisplay = "Mulai Rp49.000"
    PriceNumber = "49000"
    MOQ = "50 pcs"
    LeadTime = "14-21 hari kerja"
    Image = "assets/img/product/product-1.webp"
    MetaDesc = "Detail Paket Onboarding Kit Basic untuk perusahaan: komponen paket, opsi branding, MOQ, lead time, dan alur pemesanan souvenir kantor custom."
    Keywords = "paket onboarding kit basic, souvenir onboarding karyawan, paket souvenir kantor basic, merchandise karyawan baru"
    Short = "Paket onboarding ekonomis untuk karyawan baru dengan komponen fungsional yang tetap merepresentasikan identitas brand perusahaan."
    Components = @("Notebook custom logo", "Tumbler basic 450ml", "Pulpen premium", "Goodie bag non-woven", "Kartu ucapan onboarding")
    UseCases = @("Program onboarding karyawan baru", "Welcome kit internal perusahaan", "Kickoff tim atau divisi baru", "Paket apresiasi peserta training internal")
    CardDesc = "Paket onboarding ekonomis dengan item fungsional untuk program karyawan baru."
  },
  [PSCustomObject]@{
    Slug = "paket-seminar-kit-pro.html"
    Title = "Paket Seminar Kit Pro"
    Category = "Seminar Kit"
    PriceDisplay = "Mulai Rp35.000"
    PriceNumber = "35000"
    MOQ = "100 pcs"
    LeadTime = "10-18 hari kerja"
    Image = "assets/img/product/product-2.webp"
    MetaDesc = "Detail Paket Seminar Kit Pro: isi paket, opsi branding logo, estimasi produksi, dan skema distribusi untuk kebutuhan seminar perusahaan."
    Keywords = "paket seminar kit pro, seminar kit perusahaan, merchandise seminar custom, souvenir event kantor"
    Short = "Paket seminar siap distribusi untuk event perusahaan dengan komponen praktis, desain branding konsisten, dan proses produksi terukur."
    Components = @("Block note custom", "Tote bag seminar", "Lanyard + ID card holder", "Pulpen promosi", "Sticker atau tag event")
    UseCases = @("Seminar internal perusahaan", "Workshop eksternal", "Konferensi kampus atau instansi", "Pelatihan mitra dan channel partner")
    CardDesc = "Paket seminar praktis untuk event skala menengah hingga besar dengan branding perusahaan."
  },
  [PSCustomObject]@{
    Slug = "paket-corporate-gift-premium.html"
    Title = "Paket Corporate Gift Premium"
    Category = "Corporate Gift"
    PriceDisplay = "Mulai Rp89.000"
    PriceNumber = "89000"
    MOQ = "50 pcs"
    LeadTime = "14-24 hari kerja"
    Image = "assets/img/product/product-3.webp"
    MetaDesc = "Detail Paket Corporate Gift Premium untuk relasi bisnis dan klien: spesifikasi paket, opsi kemasan eksklusif, serta custom branding logo."
    Keywords = "corporate gift premium, souvenir relasi bisnis, paket hadiah perusahaan, merchandise premium custom"
    Short = "Paket corporate gift premium untuk klien dan relasi bisnis dengan kualitas material lebih tinggi dan opsi packaging eksklusif."
    Components = @("Tumbler stainless premium", "Notebook hard cover", "Gift box rigid custom", "Thank you card personal", "Sleeve atau ribbon branding")
    UseCases = @("Gift untuk klien strategis", "Apresiasi partner bisnis", "Hadiah momen tahunan perusahaan", "Paket relasi pada campaign B2B")
    CardDesc = "Paket hadiah premium untuk relasi bisnis dengan kesan eksklusif dan finishing rapi."
  },
  [PSCustomObject]@{
    Slug = "paket-hampers-korporat.html"
    Title = "Paket Hampers Korporat"
    Category = "Hampers Korporat"
    PriceDisplay = "Mulai Rp29.000"
    PriceNumber = "29000"
    MOQ = "100 pcs"
    LeadTime = "10-20 hari kerja"
    Image = "assets/img/product/product-4.webp"
    MetaDesc = "Detail Paket Hampers Korporat untuk event perusahaan: komponen hampers, opsi custom logo, dan skema pengiriman multi alamat."
    Keywords = "paket hampers korporat, hampers perusahaan custom, souvenir hampers event kantor, hampers branding perusahaan"
    Short = "Paket hampers fleksibel untuk campaign internal dan eksternal dengan opsi isi paket yang bisa disesuaikan budget perusahaan."
    Components = @("Snack atau produk pilihan", "Pouch atau box hampers", "Kartu ucapan custom", "Stiker branding", "Label nama penerima (opsional)")
    UseCases = @("Paket hampers hari raya", "Apresiasi karyawan", "Gift campaign internal", "Paket ucapan untuk klien")
    CardDesc = "Paket hampers custom untuk campaign apresiasi karyawan, klien, dan partner bisnis."
  },
  [PSCustomObject]@{
    Slug = "paket-merchandise-event.html"
    Title = "Paket Merchandise Event"
    Category = "Merchandise Event"
    PriceDisplay = "Mulai Rp59.000"
    PriceNumber = "59000"
    MOQ = "100 pcs"
    LeadTime = "12-21 hari kerja"
    Image = "assets/img/product/product-5.webp"
    MetaDesc = "Detail Paket Merchandise Event untuk kebutuhan campaign dan gathering perusahaan: item paket, branding, timeline, dan distribusi."
    Keywords = "paket merchandise event, souvenir event perusahaan, merchandise kantor custom, paket event gathering"
    Short = "Paket merchandise event untuk kebutuhan gathering, campaign, dan aktivasi brand dengan komposisi item yang mudah disesuaikan."
    Components = @("T-shirt atau tote bag custom", "Lanyard event", "Notebook mini", "Pulpen promosi", "Packaging distribusi")
    UseCases = @("Gathering perusahaan", "Brand activation", "Roadshow produk", "Event komunitas perusahaan")
    CardDesc = "Paket merchandise untuk event dan campaign dengan komponen fleksibel."
  },
  [PSCustomObject]@{
    Slug = "paket-seminar-kit-eco.html"
    Title = "Paket Seminar Kit Eco"
    Category = "Seminar Kit"
    PriceDisplay = "Mulai Rp45.000"
    PriceNumber = "45000"
    MOQ = "100 pcs"
    LeadTime = "12-20 hari kerja"
    Image = "assets/img/product/product-6.webp"
    MetaDesc = "Detail Paket Seminar Kit Eco dengan opsi material lebih ramah lingkungan untuk kebutuhan seminar, workshop, dan event edukasi perusahaan."
    Keywords = "paket seminar kit eco, souvenir seminar ramah lingkungan, merchandise eco friendly perusahaan"
    Short = "Paket seminar kit dengan orientasi material ramah lingkungan untuk perusahaan yang ingin memperkuat citra sustainability."
    Components = @("Notebook kertas daur ulang", "Tote bag kanvas", "Pulpen kertas", "Tumbler reusable", "Tag edukasi sustainability")
    UseCases = @("Seminar bertema sustainability", "Workshop edukasi lingkungan", "Event CSR perusahaan", "Program kampanye internal hijau")
    CardDesc = "Paket seminar bertema ramah lingkungan untuk event perusahaan berorientasi sustainability."
  },
  [PSCustomObject]@{
    Slug = "paket-corporate-gift-signature.html"
    Title = "Paket Corporate Gift Signature"
    Category = "Corporate Gift"
    PriceDisplay = "Mulai Rp79.000"
    PriceNumber = "79000"
    MOQ = "50 pcs"
    LeadTime = "14-24 hari kerja"
    Image = "assets/img/product/product-7.webp"
    MetaDesc = "Detail Paket Corporate Gift Signature: souvenir perusahaan dengan komposisi elegan untuk klien prioritas dan relasi bisnis."
    Keywords = "corporate gift signature, souvenir klien prioritas, paket hadiah relasi bisnis perusahaan"
    Short = "Paket corporate gift signature untuk kebutuhan relasi prioritas dengan komposisi produk elegan dan kemasan profesional."
    Components = @("Notebook executive", "Tumbler metal premium", "Pouch organizer", "Gift box custom", "Personal card insert")
    UseCases = @("Paket gift untuk top client", "Apresiasi partner strategis", "Paket eksekutif perusahaan", "Momentum signing atau launching")
    CardDesc = "Paket gift signature untuk klien prioritas dengan kemasan profesional."
  },
  [PSCustomObject]@{
    Slug = "paket-hampers-festive-branding.html"
    Title = "Paket Hampers Festive Branding"
    Category = "Hampers Korporat"
    PriceDisplay = "Mulai Rp39.000"
    PriceNumber = "39000"
    MOQ = "100 pcs"
    LeadTime = "10-20 hari kerja"
    Image = "assets/img/product/product-8.webp"
    MetaDesc = "Detail Paket Hampers Festive Branding untuk momen musiman perusahaan dengan opsi personalisasi logo, kartu ucapan, dan distribusi multi kota."
    Keywords = "hampers festive branding, hampers musiman perusahaan, paket hampers custom logo"
    Short = "Paket hampers musiman dengan sentuhan branding perusahaan untuk momen hari raya, akhir tahun, atau campaign apresiasi."
    Components = @("Box hampers tematik", "Produk pilihan musiman", "Kartu ucapan custom", "Stiker atau sleeve logo", "Opsional personal nama penerima")
    UseCases = @("Hampers hari raya", "Paket akhir tahun", "Campaign apresiasi pelanggan", "Program loyalitas partner")
    CardDesc = "Paket hampers musiman dengan branding perusahaan untuk momen spesial."
  }
)

function New-LiItems {
  param([string[]]$Items)
  return (($Items | ForEach-Object { "<li>$_</li>" }) -join "`n")
}

function New-SpecRows {
  param($Pkg)
  $rows = @(
    @{ Label = "Kategori"; Value = $Pkg.Category }
    @{ Label = "Harga"; Value = $Pkg.PriceDisplay + " per paket (tergantung qty dan metode branding)" }
    @{ Label = "MOQ"; Value = $Pkg.MOQ }
    @{ Label = "Lead Time"; Value = $Pkg.LeadTime }
    @{ Label = "Metode Branding"; Value = "Sablon, laser, UV print, emboss (menyesuaikan material)" }
    @{ Label = "Kemasan"; Value = "Polybag, pouch, atau box custom sesuai kebutuhan" }
    @{ Label = "Distribusi"; Value = "Single drop dan multi drop ke berbagai kota di Indonesia" }
  )
  return (($rows | ForEach-Object {
    "<div class=`"row-item`"><div class=`"label`">$($_.Label)</div><div class=`"value`">$($_.Value)</div></div>"
  }) -join "`n")
}

function New-FaqInline {
  param($Pkg)
  @"
<h3>Berapa minimal order untuk $($Pkg.Title)?</h3>
<p>Minimal order untuk paket ini dimulai dari $($Pkg.MOQ). Jumlah akhir bisa disesuaikan dengan skenario event dan distribusi.</p>
<h3>Apakah paket ini bisa custom logo perusahaan?</h3>
<p>Bisa. Kami menyediakan beberapa metode branding sesuai jenis produk, kebutuhan visual, dan target budget project Anda.</p>
<h3>Berapa lama proses produksi paket ini?</h3>
<p>Estimasi produksi paket ini sekitar $($Pkg.LeadTime), tergantung finalisasi desain, sample approval, dan kuantitas order.</p>
<h3>Apakah bisa kirim ke banyak alamat sekaligus?</h3>
<p>Bisa. Kami mendukung skema pengiriman multi drop untuk cabang perusahaan, peserta event, atau daftar penerima relasi bisnis.</p>
"@
}

function New-FaqSchema {
  param($Pkg)
  $faq = [PSCustomObject]@{
    "@context" = "https://schema.org"
    "@type" = "FAQPage"
    mainEntity = @(
      @{
        "@type" = "Question"
        name = "Berapa minimal order untuk $($Pkg.Title)?"
        acceptedAnswer = @{
          "@type" = "Answer"
          text = "Minimal order untuk paket ini dimulai dari $($Pkg.MOQ) dan dapat disesuaikan berdasarkan kebutuhan project perusahaan."
        }
      },
      @{
        "@type" = "Question"
        name = "Apakah paket ini bisa custom logo perusahaan?"
        acceptedAnswer = @{
          "@type" = "Answer"
          text = "Ya, paket ini mendukung custom logo dengan metode branding yang disesuaikan material produk dan target visual brand."
        }
      },
      @{
        "@type" = "Question"
        name = "Berapa estimasi lead time produksi paket ini?"
        acceptedAnswer = @{
          "@type" = "Answer"
          text = "Estimasi lead time paket ini adalah $($Pkg.LeadTime), tergantung finalisasi desain, sample approval, dan kuantitas."
        }
      }
    )
  }
  return ($faq | ConvertTo-Json -Depth 8 -Compress)
}

function New-ProductSchema {
  param($Pkg)
  $schema = [PSCustomObject]@{
    "@context" = "https://schema.org"
    "@type" = "Product"
    name = $Pkg.Title
    description = $Pkg.Short
    category = $Pkg.Category
    image = @("$baseUrl/$($Pkg.Image)")
    brand = @{
      "@type" = "Brand"
      name = "Vendor Souvenir Kantor"
    }
    offers = @{
      "@type" = "Offer"
      priceCurrency = "IDR"
      price = $Pkg.PriceNumber
      availability = "https://schema.org/InStock"
      url = "$baseUrl/$($Pkg.Slug)"
    }
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
  <meta property="og:type" content="product">
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
  <link href="assets/css/product-package-detail.css" rel="stylesheet">
  <script type="application/ld+json">{"@context":"https://schema.org","@type":"Organization","name":"Vendor Souvenir Kantor","url":"https://vendorsouvenirkantor.web.id","logo":"https://vendorsouvenirkantor.web.id/assets/img/favicon.png","contactPoint":{"@type":"ContactPoint","telephone":"+62-895-6390-68080","contactType":"sales","areaServed":"ID","availableLanguage":["id"]}}</script>
  <script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Home","item":"https://vendorsouvenirkantor.web.id/"},{"@type":"ListItem","position":2,"name":"Produk","item":"https://vendorsouvenirkantor.web.id/produk.html"},{"@type":"ListItem","position":3,"name":"__TITLE__","item":"__CANONICAL__"}]}</script>
  <script type="application/ld+json">__PRODUCT_SCHEMA__</script>
  <script type="application/ld+json">__FAQ_SCHEMA__</script>
</head>
<body class="product-package-page">
  <header id="header" class="header dark-background d-flex flex-column justify-content-center">
    <i class="header-toggle d-xl-none bi bi-list"></i>
    <div class="header-container d-flex flex-column align-items-start">
      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.html"><i class="bi bi-house navicon"></i>Home</a></li>
          <li><a href="about.html"><i class="bi bi-person navicon"></i> Tentang</a></li>
          <li><a href="produk.html" class="active"><i class="bi bi-bag navicon"></i> Produk</a></li>
          <li><a href="service.html"><i class="bi bi-hdd-stack navicon"></i> Layanan</a></li>
          <li><a href="blog.html"><i class="bi bi-journal-text navicon"></i> Artikel</a></li>
          <li class="dropdown"><a href="#"><i class="bi bi-menu-button navicon"></i> <span>Info</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="portfolio-details.html">Portofolio</a></li>
              <li><a href="product-details.html">Detail Produk</a></li>
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
            <li><a href="produk.html">Produk</a></li>
            <li class="current">__TITLE__</li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">
      <div class="container product-package-wrap">
        <article class="product-package-card">
          <h1 class="product-package-title">__TITLE__</h1>
          <p class="product-package-lead">__SHORT__</p>

          <figure class="product-figure">
            <img src="__IMAGE__" alt="__IMG_ALT__" class="img-fluid" width="1024" height="683" fetchpriority="high" decoding="async">
            <figcaption>Gambar paket: __TITLE__. Sumber gambar: arsip internal <a href="https://vendorsouvenirkantor.web.id">Vendor Souvenir Kantor</a>.</figcaption>
          </figure>

          <div class="quick-answer-box">
            <p><strong>Jawaban cepat:</strong> __TITLE__ tersedia dengan harga __PRICE_DISPLAY__, MOQ __MOQ__, dan estimasi produksi __LEADTIME__ setelah desain disetujui.</p>
          </div>

          <details class="toc-wrap" id="tocWrapper" open>
            <summary>Daftar Isi Detail Paket</summary>
            <ol id="tocList"></ol>
          </details>

          <div class="row g-3 mb-3">
            <div class="col-lg-6">
              <div class="product-facts">
                <h3>Ringkasan Paket</h3>
                <ul>
                  <li><strong>Kategori:</strong> __CATEGORY__</li>
                  <li><strong>Harga:</strong> __PRICE_DISPLAY__</li>
                  <li><strong>MOQ:</strong> __MOQ__</li>
                  <li><strong>Lead Time:</strong> __LEADTIME__</li>
                </ul>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="product-facts">
                <h3>Call To Action</h3>
                <p class="mb-2">Butuh penawaran resmi dan rekomendasi komposisi paket sesuai budget perusahaan Anda?</p>
                <a href="__WA_LINK__" class="btn btn-primary" target="_blank" rel="noopener">Konsultasi via WhatsApp</a>
              </div>
            </div>
          </div>

          <div class="product-content content">
            <h2 id="komponen-paket">Komponen Paket</h2>
            <p>Setiap paket dapat disesuaikan berdasarkan objective campaign, profil penerima, dan standar visual brand perusahaan. Berikut komponen inti yang biasanya dipakai untuk __TITLE__:</p>
            <ul>
              __COMPONENTS__
            </ul>

            <h2 id="spesifikasi-paket">Spesifikasi Paket</h2>
            <p>Parameter berikut membantu tim purchasing dan HR menilai kecocokan paket sebelum meminta quotation final.</p>
            <div class="spec-table">
              __SPEC_ROWS__
            </div>

            <h2 id="opsi-branding">Opsi Branding dan Kustomisasi</h2>
            <p>Paket ini mendukung beberapa metode branding sesuai material, seperti sablon, laser engraving, UV print, hingga emboss. Tim kami juga membantu penyesuaian warna, penempatan logo, dan pemilihan kemasan agar hasil akhir konsisten dengan identitas perusahaan.</p>
            <p>Untuk project yang melibatkan banyak stakeholder, kami merekomendasikan tahap mockup dan sample approval sebelum produksi massal agar risiko revisi akhir dapat ditekan.</p>

            <h2 id="rekomendasi-penggunaan">Rekomendasi Penggunaan</h2>
            <p>__TITLE__ cocok dipakai untuk skenario berikut:</p>
            <ul>
              __USE_CASES__
            </ul>

            <h2 id="alur-pemesanan">Alur Pemesanan Singkat</h2>
            <p>Proses pemesanan dimulai dari konsultasi kebutuhan, pemilihan item, pembuatan mockup, sample approval, produksi massal, quality control, lalu pengiriman sesuai skema single drop atau multi drop. Alur ini membantu project berjalan lebih terukur dan minim kejutan menjelang deadline.</p>

            <h2 id="faq-inline">FAQ Detail Paket</h2>
            __FAQ_INLINE__
          </div>

          <div class="share-buttons">
            <a class="btn btn-success btn-sm" id="shareWa" target="_blank" rel="noopener"><i class="bi bi-whatsapp"></i> Share WhatsApp</a>
            <a class="btn btn-primary btn-sm" id="shareFb" target="_blank" rel="noopener"><i class="bi bi-facebook"></i> Share Facebook</a>
            <a class="btn btn-info btn-sm text-white" id="shareX" target="_blank" rel="noopener"><i class="bi bi-twitter-x"></i> Share X</a>
            <button class="btn btn-outline-dark btn-sm" id="copyLinkBtn" type="button"><i class="bi bi-link-45deg"></i> Copy Link</button>
          </div>

          <div class="mt-4">
            <h2 class="h4 mb-3">Paket Terkait</h2>
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
      const container = document.querySelector('.product-content');
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
      const waText = encodeURIComponent('Baca detail paket ini: ' + document.title + ' - ' + window.location.href);
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

for ($i = 0; $i -lt $packages.Count; $i++) {
  $pkg = $packages[$i]
  $canonical = "$baseUrl/$($pkg.Slug)"
  $ogImage = "$baseUrl/$($pkg.Image)"
  $components = New-LiItems -Items $pkg.Components
  $useCases = New-LiItems -Items $pkg.UseCases
  $specRows = New-SpecRows -Pkg $pkg
  $faqInline = New-FaqInline -Pkg $pkg
  $faqSchema = New-FaqSchema -Pkg $pkg
  $productSchema = New-ProductSchema -Pkg $pkg
  $relatedHtml = New-RelatedHtml -Index $i -All $packages
  $waText = [uri]::EscapeDataString("Halo Vendor Souvenir Kantor, saya ingin detail dan penawaran untuk $($pkg.Title).")
  $waLink = "https://wa.me/62895639068080?text=$waText"

  $content = $template
  $content = $content.Replace("__TITLE__", $pkg.Title)
  $content = $content.Replace("__META_DESC__", $pkg.MetaDesc)
  $content = $content.Replace("__KEYWORDS__", $pkg.Keywords)
  $content = $content.Replace("__CANONICAL__", $canonical)
  $content = $content.Replace("__OG_IMAGE__", $ogImage)
  $content = $content.Replace("__IMAGE__", $pkg.Image)
  $content = $content.Replace("__IMG_ALT__", $pkg.Title)
  $content = $content.Replace("__SHORT__", $pkg.Short)
  $content = $content.Replace("__CATEGORY__", $pkg.Category)
  $content = $content.Replace("__PRICE_DISPLAY__", $pkg.PriceDisplay)
  $content = $content.Replace("__MOQ__", $pkg.MOQ)
  $content = $content.Replace("__LEADTIME__", $pkg.LeadTime)
  $content = $content.Replace("__COMPONENTS__", $components)
  $content = $content.Replace("__USE_CASES__", $useCases)
  $content = $content.Replace("__SPEC_ROWS__", $specRows)
  $content = $content.Replace("__FAQ_INLINE__", $faqInline)
  $content = $content.Replace("__FAQ_SCHEMA__", $faqSchema)
  $content = $content.Replace("__PRODUCT_SCHEMA__", $productSchema)
  $content = $content.Replace("__RELATED_HTML__", $relatedHtml)
  $content = $content.Replace("__WA_LINK__", $waLink)

  Set-Content -Path $pkg.Slug -Value $content -Encoding UTF8
}

Write-Output "Generated $($packages.Count) product detail pages."
