Project: Vendor Souvenir Kantor
Exported on: 2026-04-21 14:04 with Bootstrap v5.3.8
Generated Using BootstrapMade Builder

Maintenance Helpers
- Normalize semua halaman HTML (meta konsisten, nav active dibersihkan, whitespace rapi):
  .\scripts\normalize-site-html.ps1
- Audit cepat konsistensi HTML (meta wajib, link lokal, nav active hardcoded):
  .\scripts\audit-site-html.ps1
- Jalankan quality gate end-to-end (normalize + audit + cek syntax JS):
  .\scripts\quality-gate.ps1

Refactor Notes
- Script TOC + share detail halaman sudah dipusatkan ke assets\js\main.js.
- Styling CTA galeri dipindah ke assets\css\galeri-page.css (tanpa inline <style>).
- Komponen global nav, social links, dan footer diseragamkan via folder templates.
- Override styling lintas halaman dipusatkan di assets\css\site-overrides.css.
