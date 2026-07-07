$ErrorActionPreference = "Stop"

$templatePath = Join-Path $PSScriptRoot "..\portfolio-details.html"
$template = Get-Content -Raw -Path $templatePath

$cases = @(
  @{
    Slug = "portofolio-onboarding-kit-1200-paket.html"
    Name = "Onboarding Kit 1.200 Paket"
    MetaDesc = "Studi kasus pengadaan onboarding kit 1.200 paket untuk program karyawan baru dengan alur approval cepat, produksi terukur, dan distribusi tepat waktu."
    Keywords = "portofolio onboarding kit, studi kasus souvenir kantor, onboarding kit perusahaan, vendor souvenir kantor"
    Category = "Onboarding Kit"
    Client = "Perusahaan teknologi nasional (NDA)"
    Date = "Februari 2026"
    Scale = "1.200 paket"
    Area = "Jabodetabek (Jakarta, Bekasi, Tangerang)"
    Intro1 = "Studi kasus ini membahas project pengadaan Onboarding Kit 1.200 Paket untuk program rekrutmen batch besar. Target utama klien adalah memastikan pengalaman karyawan baru tetap konsisten meski proses distribusi dilakukan ke beberapa titik sekaligus."
    Intro2 = "Tim kami menyiapkan alur kerja dari pemetaan kebutuhan HR, kurasi item per paket, simulasi branding, hingga rencana distribusi bertahap. Dengan skema ini, proses approval lintas divisi berjalan lebih ringkas dan eksekusi project tetap aman terhadap deadline."
    Impact = "Hasil project menunjukkan peningkatan efisiensi koordinasi internal karena semua keputusan utama sudah dibungkus dalam format ringkas: komposisi item, opsi branding, timeline produksi, dan status distribusi per batch."
    Closing = "Jika perusahaan Anda sedang menyiapkan onboarding skala besar, studi kasus ini dapat dijadikan referensi implementasi agar project lebih terukur dari tahap perencanaan sampai paket diterima oleh karyawan baru."
    Testimonial = "Pendekatan tim Vendor Souvenir Kantor sangat membantu saat kami harus menyiapkan 1.200 paket dalam waktu terbatas. Komunikasi terstruktur dan update progres yang rutin membuat proses internal kami jauh lebih tenang."
    Person = "Rani Pratama"
    Role = "People Operations Manager"
    Slide1Src = "assets/img/portfolio/portfolio-portrait-1.webp"
    Slide1Alt = "Portofolio onboarding kit 1.200 paket untuk program karyawan baru"
    Slide2Src = "assets/img/portfolio/portfolio-1.webp"
    Slide2Alt = "Detail isi paket onboarding kit perusahaan"
    Slide3Src = "assets/img/portfolio/portfolio-5.webp"
    Slide3Alt = "Proses packing onboarding kit sebelum distribusi"
    Slide4Src = "assets/img/portfolio/portfolio-10.webp"
    Slide4Alt = "Distribusi onboarding kit ke beberapa lokasi kantor"
  },
  @{
    Slug = "portofolio-seminar-kit-nasional.html"
    Name = "Seminar Kit Nasional"
    MetaDesc = "Studi kasus seminar kit nasional untuk kebutuhan event multi kota dengan pengendalian kualitas terstandar dan skema distribusi terjadwal."
    Keywords = "portofolio seminar kit nasional, seminar kit perusahaan, merchandise event multi kota, vendor souvenir kantor"
    Category = "Seminar Kit"
    Client = "Perusahaan FMCG nasional (NDA)"
    Date = "Maret 2026"
    Scale = "2.000 paket"
    Area = "Jakarta, Surabaya, Makassar, Medan"
    Intro1 = "Project Seminar Kit Nasional ini ditujukan untuk event internal lintas kota dengan jumlah peserta besar. Tantangan utama berada pada konsistensi kualitas antar batch dan sinkronisasi jadwal distribusi di beberapa region."
    Intro2 = "Kami memulai dari standardisasi komponen seminar kit, lalu menyiapkan mockup branding yang seragam untuk seluruh kota pelaksanaan. Setelah approval final, produksi dilakukan bertahap dengan checkpoint quality control di setiap tahap kunci."
    Impact = "Dengan alur terstruktur ini, tim penyelenggara event dapat memantau progres produksi dan distribusi secara lebih jelas, sehingga risiko keterlambatan menjelang hari H bisa ditekan."
    Closing = "Studi kasus ini relevan untuk perusahaan yang rutin menyelenggarakan seminar internal atau roadshow nasional dengan kebutuhan merchandise yang konsisten."
    Testimonial = "Kami terbantu karena tim vendor tidak hanya produksi, tetapi juga menyusun alur distribusi yang sesuai timeline event di tiap kota."
    Person = "Nadia Putri"
    Role = "Corporate Event Lead"
    Slide1Src = "assets/img/portfolio/portfolio-2.webp"
    Slide1Alt = "Portofolio seminar kit nasional untuk event perusahaan"
    Slide2Src = "assets/img/portfolio/portfolio-10.webp"
    Slide2Alt = "Proses kurasi item seminar kit multi kota"
    Slide3Src = "assets/img/portfolio/portfolio-6.webp"
    Slide3Alt = "Branding seminar kit dengan identitas perusahaan"
    Slide4Src = "assets/img/portfolio/portfolio-5.webp"
    Slide4Alt = "Distribusi seminar kit ke berbagai kota Indonesia"
  },
  @{
    Slug = "portofolio-corporate-gift-klien-vip.html"
    Name = "Corporate Gift Klien VIP"
    MetaDesc = "Studi kasus corporate gift klien VIP dengan kurasi produk premium, personalisasi branding elegan, dan kontrol kualitas detail."
    Keywords = "portofolio corporate gift vip, hadiah klien premium, souvenir relasi bisnis, vendor corporate gift"
    Category = "Corporate Gift"
    Client = "Perusahaan jasa keuangan (NDA)"
    Date = "April 2026"
    Scale = "350 paket"
    Area = "Jakarta, Bandung, Surabaya"
    Intro1 = "Project Corporate Gift Klien VIP berfokus pada paket apresiasi premium untuk relasi strategis perusahaan. Prioritas utama klien adalah kualitas material, detail finishing, dan presentasi kemasan yang mencerminkan positioning brand."
    Intro2 = "Pada tahap awal, kami menyiapkan beberapa opsi kombinasi item premium disertai simulasi branding yang tetap elegan. Proses finalisasi dilakukan bersama tim marketing dan procurement untuk memastikan kesesuaian dengan objective relasi bisnis."
    Impact = "Output project ini membantu klien menjaga pengalaman penerima tetap eksklusif sekaligus memastikan proses pengadaan tetap efisien di sisi operasional internal."
    Closing = "Jika Anda membutuhkan paket corporate gift premium untuk klien prioritas, studi kasus ini bisa menjadi referensi untuk menyusun skema produk dan eksekusi yang lebih presisi."
    Testimonial = "Kami puas dengan hasil akhirnya. Detail branding rapi, kualitas produk konsisten, dan semua paket sampai sesuai standar yang kami inginkan."
    Person = "Michael Adrian"
    Role = "Marketing Communications Manager"
    Slide1Src = "assets/img/portfolio/portfolio-portrait-2.webp"
    Slide1Alt = "Portofolio corporate gift premium untuk klien VIP"
    Slide2Src = "assets/img/portfolio/portfolio-7.webp"
    Slide2Alt = "Komposisi item corporate gift premium"
    Slide3Src = "assets/img/portfolio/portfolio-1.webp"
    Slide3Alt = "Detail personalisasi branding pada corporate gift"
    Slide4Src = "assets/img/portfolio/portfolio-2.webp"
    Slide4Alt = "Kemasan corporate gift untuk relasi bisnis prioritas"
  },
  @{
    Slug = "portofolio-hampers-akhir-tahun.html"
    Name = "Hampers Akhir Tahun"
    MetaDesc = "Studi kasus hampers akhir tahun perusahaan dengan skema bundling rapi, personalisasi kartu ucapan, dan distribusi multi alamat."
    Keywords = "portofolio hampers akhir tahun, hampers perusahaan, bundling hampers corporate, vendor souvenir kantor"
    Category = "Hampers"
    Client = "Perusahaan retail nasional (NDA)"
    Date = "Desember 2025"
    Scale = "900 paket"
    Area = "Jabodetabek dan kota besar Jawa"
    Intro1 = "Studi kasus Hampers Akhir Tahun ini ditujukan untuk program apresiasi tahunan kepada klien dan partner bisnis. Kebutuhan utama project adalah bundling paket yang rapi, personalisasi ucapan, dan pengiriman ke banyak alamat dalam waktu yang relatif singkat."
    Intro2 = "Tim kami menyiapkan alur kerja mulai dari finalisasi komponen hampers, desain elemen branding, sampai penjadwalan distribusi bertahap. Dengan koordinasi ini, risiko salah kirim dan keterlambatan pengiriman dapat ditekan sejak awal."
    Impact = "Project berjalan lebih lancar karena setiap tahap memiliki checklist kontrol, terutama pada proses packing dan validasi data penerima sebelum pengiriman."
    Closing = "Bagi perusahaan yang menyiapkan hampers musiman, studi kasus ini bisa menjadi acuan eksekusi agar campaign apresiasi tetap tepat waktu dan konsisten kualitasnya."
    Testimonial = "Proses distribusi ke banyak alamat berjalan rapi. Tim vendor sangat responsif saat ada update data penerima di fase akhir project."
    Person = "Anita Maharani"
    Role = "Corporate Relations Supervisor"
    Slide1Src = "assets/img/portfolio/portfolio-portrait-4.webp"
    Slide1Alt = "Portofolio hampers akhir tahun untuk program apresiasi perusahaan"
    Slide2Src = "assets/img/portfolio/portfolio-4.webp"
    Slide2Alt = "Proses bundling hampers corporate akhir tahun"
    Slide3Src = "assets/img/portfolio/portfolio-6.webp"
    Slide3Alt = "Detail kemasan hampers dengan branding perusahaan"
    Slide4Src = "assets/img/portfolio/portfolio-10.webp"
    Slide4Alt = "Distribusi hampers akhir tahun ke berbagai alamat"
  },
  @{
    Slug = "portofolio-merchandise-gathering.html"
    Name = "Merchandise Gathering"
    MetaDesc = "Studi kasus merchandise gathering perusahaan untuk event internal dengan kombinasi item fungsional dan branding konsisten."
    Keywords = "portofolio merchandise gathering, souvenir event perusahaan, paket gathering kantor, vendor souvenir kantor"
    Category = "Event Merchandise"
    Client = "Perusahaan telekomunikasi (NDA)"
    Date = "Januari 2026"
    Scale = "750 paket"
    Area = "Bandung, Yogyakarta, Surabaya"
    Intro1 = "Project Merchandise Gathering ini disusun untuk mendukung kegiatan employee gathering perusahaan di beberapa kota. Fokus utama klien adalah item yang fungsional untuk peserta, namun tetap memiliki identitas brand yang kuat."
    Intro2 = "Kami membantu tim internal menyiapkan shortlist produk, simulasi branding per item, dan timeline produksi yang disesuaikan dengan jadwal event. Seluruh paket kemudian diproses dengan standar quality control yang sama agar hasil antar batch tetap konsisten."
    Impact = "Dari sisi operasional, project ini membantu penyelenggara event mengurangi beban koordinasi karena seluruh kebutuhan merchandise ditangani dalam satu alur kerja terintegrasi."
    Closing = "Jika Anda sedang menyiapkan event gathering skala menengah hingga besar, studi kasus ini dapat menjadi referensi untuk menyusun paket merchandise yang efektif dan relevan."
    Testimonial = "Item yang dipilih benar-benar sesuai kebutuhan peserta event. Proses approval cepat dan pengiriman tepat dengan jadwal acara kami."
    Person = "Dewi Oktaviani"
    Role = "Internal Event Coordinator"
    Slide1Src = "assets/img/portfolio/portfolio-5.webp"
    Slide1Alt = "Portofolio merchandise gathering perusahaan"
    Slide2Src = "assets/img/portfolio/portfolio-portrait-1.webp"
    Slide2Alt = "Persiapan paket merchandise untuk event gathering"
    Slide3Src = "assets/img/portfolio/portfolio-2.webp"
    Slide3Alt = "Branding merchandise gathering sesuai guideline"
    Slide4Src = "assets/img/portfolio/portfolio-6.webp"
    Slide4Alt = "Distribusi merchandise gathering ke lokasi event"
  },
  @{
    Slug = "portofolio-paket-welcome-employee.html"
    Name = "Paket Welcome Employee"
    MetaDesc = "Studi kasus paket welcome employee untuk program internal perusahaan dengan komposisi item efisien dan branding konsisten."
    Keywords = "portofolio welcome employee kit, paket welcome employee, onboarding merchandise, vendor souvenir kantor"
    Category = "Welcome Kit"
    Client = "Perusahaan konsultan bisnis (NDA)"
    Date = "Mei 2026"
    Scale = "1.500 paket"
    Area = "Jakarta, Medan, Makassar"
    Intro1 = "Project Paket Welcome Employee berfokus pada penyediaan paket sambutan karyawan baru secara berkala sepanjang kuartal. Klien membutuhkan format paket yang efisien, mudah direplikasi, dan tetap menjaga konsistensi brand experience."
    Intro2 = "Tim kami menyusun standard kit, menentukan metode branding paling sesuai, serta menyiapkan jadwal produksi batch per batch. Pendekatan ini membantu perusahaan menjaga ketersediaan paket saat ada gelombang rekrutmen baru."
    Impact = "Dengan standar paket yang terdokumentasi, proses repeat order menjadi lebih cepat dan risiko perubahan spesifikasi di tengah jalan dapat diminimalkan."
    Closing = "Studi kasus ini cocok dijadikan acuan untuk perusahaan yang membutuhkan paket welcome employee berulang dengan kebutuhan kuantitas yang dinamis."
    Testimonial = "Yang kami apresiasi adalah konsistensi hasil antar batch. Meskipun order dilakukan bertahap, kualitas dan tampilan paket tetap sama."
    Person = "Fajar Ramadhan"
    Role = "HR Operations Lead"
    Slide1Src = "assets/img/portfolio/portfolio-6.webp"
    Slide1Alt = "Portofolio paket welcome employee untuk karyawan baru"
    Slide2Src = "assets/img/portfolio/portfolio-2.webp"
    Slide2Alt = "Komponen paket welcome employee perusahaan"
    Slide3Src = "assets/img/portfolio/portfolio-1.webp"
    Slide3Alt = "Branding paket welcome employee sesuai identitas brand"
    Slide4Src = "assets/img/portfolio/portfolio-10.webp"
    Slide4Alt = "Distribusi paket welcome employee lintas kota"
  }
)

foreach ($caseItem in $cases) {
  $content = $template
  $url = "https://vendorsouvenirkantor.web.id/$($caseItem.Slug)"
  $ogImage = "https://vendorsouvenirkantor.web.id/$($caseItem.Slide1Src)"

  $content = [regex]::Replace($content, '<title>.*?</title>', "<title>Portofolio $($caseItem.Name) | Vendor Souvenir Kantor</title>")
  $content = [regex]::Replace($content, '<meta name="description" content="[^"]*">', "<meta name=`"description`" content=`"$($caseItem.MetaDesc)`">")
  $content = [regex]::Replace($content, '<meta name="keywords" content="[^"]*">', "<meta name=`"keywords`" content=`"$($caseItem.Keywords)`">")
  $content = [regex]::Replace($content, '<link rel="canonical" href="[^"]*">', "<link rel=`"canonical`" href=`"$url`">")
  $content = [regex]::Replace($content, '<link rel="alternate" hreflang="id-ID" href="[^"]*">', "<link rel=`"alternate`" hreflang=`"id-ID`" href=`"$url`">")
  $content = [regex]::Replace($content, '<meta property="og:title" content="[^"]*">', "<meta property=`"og:title`" content=`"Portofolio $($caseItem.Name) | Vendor Souvenir Kantor`">")
  $content = [regex]::Replace($content, '<meta property="og:description" content="[^"]*">', "<meta property=`"og:description`" content=`"$($caseItem.MetaDesc)`">")
  $content = [regex]::Replace($content, '<meta property="og:url" content="[^"]*">', "<meta property=`"og:url`" content=`"$url`">")
  $content = [regex]::Replace($content, '<meta property="og:image" content="[^"]*">', "<meta property=`"og:image`" content=`"$ogImage`">")
  $content = [regex]::Replace($content, '<meta property="og:image:alt" content="[^"]*">', "<meta property=`"og:image:alt`" content=`"Portofolio $($caseItem.Name)`">")
  $content = [regex]::Replace($content, '<meta name="twitter:title" content="[^"]*">', "<meta name=`"twitter:title`" content=`"Portofolio $($caseItem.Name) | Vendor Souvenir Kantor`">")
  $content = [regex]::Replace($content, '<meta name="twitter:description" content="[^"]*">', "<meta name=`"twitter:description`" content=`"$($caseItem.MetaDesc)`">")
  $content = [regex]::Replace($content, '<meta name="twitter:image" content="[^"]*">', "<meta name=`"twitter:image`" content=`"$ogImage`">")
  $content = [regex]::Replace($content, '<meta name="twitter:image:alt" content="[^"]*">', "<meta name=`"twitter:image:alt`" content=`"Portofolio $($caseItem.Name)`">")
  $content = $content.Replace("https://vendorsouvenirkantor.web.id/portfolio-details.html", $url)
  $content = $content.Replace('Detail Portofolio', $caseItem.Name)

  $content = $content.Replace(
    'src="assets/img/portfolio/portfolio-1.webp" alt="Portofolio onboarding kit corporate untuk program karyawan baru" width="1200" height="800" fetchpriority="high" decoding="async"',
    "src=`"$($caseItem.Slide1Src)`" alt=`"$($caseItem.Slide1Alt)`" width=`"1200`" height=`"800`" fetchpriority=`"high`" decoding=`"async`""
  )
  $content = $content.Replace(
    'src="assets/img/portfolio/portfolio-10.webp" alt="Portofolio seminar kit perusahaan dengan branding logo" width="1200" height="800" loading="lazy" decoding="async"',
    "src=`"$($caseItem.Slide2Src)`" alt=`"$($caseItem.Slide2Alt)`" width=`"1200`" height=`"800`" loading=`"lazy`" decoding=`"async`""
  )
  $content = $content.Replace(
    'src="assets/img/portfolio/portfolio-7.webp" alt="Portofolio corporate gift premium untuk relasi bisnis" width="1200" height="800" loading="lazy" decoding="async"',
    "src=`"$($caseItem.Slide3Src)`" alt=`"$($caseItem.Slide3Alt)`" width=`"1200`" height=`"800`" loading=`"lazy`" decoding=`"async`""
  )
  $content = $content.Replace(
    'src="assets/img/portfolio/portfolio-4.webp" alt="Portofolio hampers branding untuk campaign perusahaan" width="1200" height="800" loading="lazy" decoding="async"',
    "src=`"$($caseItem.Slide4Src)`" alt=`"$($caseItem.Slide4Alt)`" width=`"1200`" height=`"800`" loading=`"lazy`" decoding=`"async`""
  )

  $content = $content.Replace("Studi Kasus Project Souvenir Kantor", "Studi Kasus: $($caseItem.Name)")
  $content = $content.Replace(
    "Halaman portofolio ini merangkum pola eksekusi project souvenir kantor untuk beberapa kebutuhan perusahaan: onboarding karyawan baru, seminar internal, corporate gift untuk relasi bisnis, dan hampers campaign musiman. Semua project dikerjakan dengan pendekatan yang sama: objective jelas, alur approval ringkas, dan kualitas hasil yang konsisten dari sample sampai distribusi.",
    $caseItem.Intro1
  )
  $content = $content.Replace(
    "Pada setiap studi kasus, tim kami memulai dari pemetaan target penerima, budget per paket, serta deadline event. Dari brief tersebut, kami menyusun shortlist produk, opsi branding, metode produksi, hingga skema pengiriman single drop atau multi drop. Dengan cara ini, tim purchasing dan HR bisa mengambil keputusan lebih cepat karena semua opsi sudah terstruktur dan mudah dibandingkan.",
    $caseItem.Intro2
  )
  $content = $content.Replace(
    "Yang paling membantu dari tim Vendor Souvenir Kantor adalah koordinasi yang rapi dari awal. Kami tidak hanya menerima produk, tetapi juga mendapatkan alur kerja yang jelas sehingga proses approval internal dan distribusi berjalan jauh lebih cepat.",
    $caseItem.Testimonial
  )
  $content = $content.Replace("Rani Pratama", $caseItem.Person)
  $content = $content.Replace("HR & Procurement Coordinator", $caseItem.Role)
  $content = $content.Replace(
    "Dari berbagai project yang telah berjalan, hasil yang paling terasa untuk klien biasanya ada pada tiga area utama: efisiensi waktu koordinasi lintas tim, konsistensi kualitas antar batch, dan ketepatan distribusi menjelang event. Kombinasi ketiganya membuat program souvenir tidak hanya terlihat baik secara visual, tetapi juga efektif secara operasional.",
    $caseItem.Impact
  )
  $content = $content.Replace(
    "Jika perusahaan Anda sedang menyiapkan project serupa, halaman ini bisa digunakan sebagai referensi awal untuk menentukan paket, skema branding, dan alur eksekusi yang paling sesuai. Setelah itu, tim kami dapat membantu menyusun rekomendasi detail berdasarkan objective, kuantitas, dan deadline spesifik perusahaan Anda.",
    $caseItem.Closing
  )

  $content = [regex]::Replace($content, '<li><strong>Kategori</strong>.*?</li>', "<li><strong>Kategori</strong> $($caseItem.Category)</li>", 1)
  $content = [regex]::Replace($content, '<li><strong>Klien</strong>.*?</li>', "<li><strong>Klien</strong> $($caseItem.Client)</li>", 1)
  $content = [regex]::Replace($content, '<li><strong>Tanggal Project</strong>.*?</li>', "<li><strong>Tanggal Project</strong> $($caseItem.Date)</li>", 1)
  $content = [regex]::Replace($content, '<li><strong>Skala Order</strong>.*?</li>', "<li><strong>Skala Order</strong> $($caseItem.Scale)</li>", 1)
  $content = [regex]::Replace($content, '<li><strong>Area Pengiriman</strong>.*?</li>', "<li><strong>Area Pengiriman</strong> $($caseItem.Area)</li>", 1)

  $targetPath = Join-Path (Split-Path $templatePath -Parent) $caseItem.Slug
  Set-Content -Path $targetPath -Value $content -Encoding UTF8
}

Write-Output ("Generated {0} portfolio detail pages." -f $cases.Count)
