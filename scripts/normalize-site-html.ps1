param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"

$resolvedRoot = Resolve-Path $Root
$files = Get-ChildItem -Path $resolvedRoot -File -Filter *.html
$templatesRoot = Join-Path $resolvedRoot "templates"

$updatedFiles = 0

function Read-TemplateBlock {
  param(
    [string]$TemplateFileName,
    [string]$Fallback
  )

  $templatePath = Join-Path $templatesRoot $TemplateFileName
  if (Test-Path $templatePath) {
    return (Get-Content -Raw -Path $templatePath).Trim()
  }
  return $Fallback.Trim()
}

$standardNav = Read-TemplateBlock -TemplateFileName "navmenu.html" -Fallback @'
<nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="index.html"><i class="bi bi-house navicon"></i>Home</a></li>
          <li><a href="about.html"><i class="bi bi-person navicon"></i> Tentang</a></li>
          <li><a href="produk.html"><i class="bi bi-bag navicon"></i> Produk</a></li>
          <li><a href="service.html"><i class="bi bi-hdd-stack navicon"></i> Layanan</a></li>
          <li><a href="blog.html"><i class="bi bi-journal-text navicon"></i> Artikel</a></li>
          <li class="dropdown"><a href="#"><i class="bi bi-menu-button navicon"></i> <span>Info</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="portfolio-details.html">Portofolio</a></li>
              <li><a href="lokasi-layanan.html">Area Layanan</a></li>
              <li><a href="galeri.html">Galeri</a></li>
              <li><a href="faq-seo.html">FAQ Vendor</a></li>
            </ul>
          </li>
          <li><a href="starter-page.html"><i class="bi bi-envelope navicon"></i> Kontak</a></li>
        </ul>
      </nav>
'@

$standardSocial = Read-TemplateBlock -TemplateFileName "social-links.html" -Fallback @'
<div class="social-links text-center">
        <a href="https://wa.me/62895639068080" class="twitter" aria-label="WhatsApp"><i class="bi bi-whatsapp"></i></a>
        <a href="mailto:halo@vendorsouvenirkantor.web.id" class="facebook" aria-label="Email"><i class="bi bi-envelope-fill"></i></a>
        <a href="https://vendorsouvenirkantor.web.id" class="instagram" aria-label="Website"><i class="bi bi-globe"></i></a>
      </div>
'@

$standardFooter = Read-TemplateBlock -TemplateFileName "footer.html" -Fallback @'
<footer id="footer" class="footer position-relative">

    <div class="container">
      <div class="copyright text-center ">
        <p>&copy; <span>Copyright</span> <strong class="px-1 sitename">Vendor Souvenir Kantor</strong> <span>All Rights Reserved</span></p>
      </div>

    </div>

  </footer>
'@

$standardOrganizationSchema = @'
<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "Vendor Souvenir Kantor",
    "url": "https://vendorsouvenirkantor.web.id",
    "logo": "https://vendorsouvenirkantor.web.id/assets/img/logo.png",
    "contactPoint": {
      "@type": "ContactPoint",
      "telephone": "+62-895-6390-68080",
      "contactType": "customer service",
      "areaServed": "ID",
      "availableLanguage": [
        "id"
      ]
    },
    "sameAs": [
      "https://www.facebook.com/",
      "https://www.instagram.com/",
      "https://www.linkedin.com/"
    ]
  }
</script>
'@

function EnsureSingleCssLink {
  param(
    [string]$Html,
    [string]$Href
  )

  $escapedHref = [regex]::Escape($Href)
  $linkLine = '  <link href="{0}" rel="stylesheet">' -f $Href
  $cleaned = [regex]::Replace(
    $Html,
    ('(?m)^[ \t]*<link href="' + $escapedHref + '" rel="stylesheet">\s*\r?\n?'),
    ''
  )

  if ($cleaned -match '<link href="assets/css/main.css" rel="stylesheet">') {
    $replacement = '$1' + "`r`n" + $linkLine
    return ($cleaned -replace '(<link href="assets/css/main.css" rel="stylesheet">)', $replacement)
  }

  if ($cleaned -match '</head>') {
    return [regex]::Replace($cleaned, '</head>', $linkLine + "`r`n" + '</head>', 1)
  }

  return $cleaned
}

function RemoveCssLink {
  param(
    [string]$Html,
    [string]$Href
  )

  $escapedHref = [regex]::Escape($Href)
  return [regex]::Replace(
    $Html,
    ('(?m)^[ \t]*<link href="' + $escapedHref + '" rel="stylesheet">\s*\r?\n?'),
    ''
  )
}

foreach ($file in $files) {
  $raw = Get-Content -Raw -Path $file.FullName
  $updated = $raw

  $canonicalMatch = [regex]::Match($updated, '<link\s+rel="canonical"\s+href="([^"]+)"\s*/?>')
  if ($canonicalMatch.Success -and $updated -notmatch 'rel="alternate"\s+hreflang="id-ID"') {
    $altLine = '  <link rel="alternate" hreflang="id-ID" href="' + $canonicalMatch.Groups[1].Value + '">'
    $updated = [regex]::Replace(
      $updated,
      '(<link\s+rel="canonical"\s+href="[^"]+"\s*/?>)',
      '$1' + "`r`n" + $altLine,
      1
    )
  }

  if ($updated -notmatch 'name="author"') {
    $line = '  <meta name="author" content="Vendor Souvenir Kantor">'
    if ($updated -match '<meta\s+name="keywords"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="keywords"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } elseif ($updated -match '<meta\s+name="description"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="description"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } else {
      $updated = [regex]::Replace($updated, '(<meta[^>]*name="viewport"[^>]*>)', '$1' + "`r`n" + $line, 1)
    }
  }

  if ($updated -notmatch 'name="publisher"') {
    $line = '  <meta name="publisher" content="Vendor Souvenir Kantor">'
    if ($updated -match '<meta\s+name="author"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="author"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } else {
      $updated = [regex]::Replace($updated, '(<meta\s+name="keywords"[^>]*>)', '$1' + "`r`n" + $line, 1)
    }
  }

  if ($updated -notmatch 'name="theme-color"') {
    $line = '  <meta name="theme-color" content="#660000">'
    if ($updated -match '<meta\s+name="geo\.placename"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="geo\.placename"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } elseif ($updated -match '<meta\s+name="publisher"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="publisher"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } else {
      $updated = [regex]::Replace($updated, '(<meta\s+name="author"[^>]*>)', '$1' + "`r`n" + $line, 1)
    }
  }

  if ($updated -notmatch 'name="referrer"') {
    $line = '  <meta name="referrer" content="strict-origin-when-cross-origin">'
    if ($updated -match '<meta\s+name="theme-color"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="theme-color"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } else {
      $updated = [regex]::Replace($updated, '(<meta\s+name="publisher"[^>]*>)', '$1' + "`r`n" + $line, 1)
    }
  }

  if ($updated -notmatch 'name="format-detection"') {
    $line = '  <meta name="format-detection" content="telephone=no">'
    if ($updated -match '<meta\s+name="referrer"[^>]*>') {
      $updated = [regex]::Replace($updated, '(<meta\s+name="referrer"[^>]*>)', '$1' + "`r`n" + $line, 1)
    } else {
      $updated = [regex]::Replace($updated, '(<meta\s+name="theme-color"[^>]*>)', '$1' + "`r`n" + $line, 1)
    }
  }

  # Keep shared components consistent across all pages.
  $updated = [regex]::Replace($updated, '(?s)<nav id="navmenu"[^>]*>.*?</nav>', $standardNav, 1)
  $updated = [regex]::Replace($updated, '(?s)<div class="social-links text-center">.*?</div>', $standardSocial, 1)
  $updated = [regex]::Replace($updated, '(?s)<footer id="footer" class="footer position-relative">.*?</footer>', $standardFooter, 1)

  # Use shared stylesheet modules instead of inline styles.
  if ($file.Name -eq 'panduan-memilih-vendor-souvenir-kantor-untuk-perusahaan.html') {
    $updated = [regex]::Replace($updated, '(?s)\s*<style>.*?</style>\s*', "`r`n", 1)
    $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/article-detail.css'
  }

  if ($file.Name -eq 'galeri.html') {
    $updated = [regex]::Replace($updated, '(?s)\s*<style>.*?</style>\s*', "`r`n", 1)
    $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/galeri-page.css'
  }

  $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/site-overrides.css'

  if ($updated -match '<body class="artikel-page"') {
    if ($updated -match 'id="tocWrapper"' -or $updated -match 'class="article-content') {
      $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/article-detail.css'
    } else {
      $updated = RemoveCssLink -Html $updated -Href 'assets/css/article-detail.css'
    }
  }
  if ($updated -match '<body class="product-package-page"') {
    $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/product-package-detail.css'
  }
  if ($updated -match '<body class="service-package-page"') {
    $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/service-detail-page.css'
  }
  if ($updated -match '<body class="galeri-page"') {
    $updated = EnsureSingleCssLink -Html $updated -Href 'assets/css/galeri-page.css'
  }

  # Standardize all JSON-LD script blocks (pretty + valid).
  $updated = [regex]::Replace(
    $updated,
    '(?s)<script\s+type="application/ld\+json"\s*>(.*?)</script>',
    {
      param($m)
      $jsonText = $m.Groups[1].Value.Trim()
      if ([string]::IsNullOrWhiteSpace($jsonText)) {
        return $m.Value
      }

      try {
        $obj = $jsonText | ConvertFrom-Json
        $formatted = $obj | ConvertTo-Json -Depth 100
        $indented = ($formatted -split "`r?`n" | ForEach-Object { '  ' + $_.TrimEnd() }) -join "`r`n"
        return '<script type="application/ld+json">' + "`r`n" + $indented + "`r`n" + '  </script>'
      } catch {
        return $m.Value
      }
    }
  )

  if ($updated -notmatch '"@type"\s*:\s*"Organization"') {
    if ($updated -match '</head>') {
      $updated = [regex]::Replace(
        $updated,
        '</head>',
        ('  ' + ($standardOrganizationSchema -replace "`r?`n", "`r`n  ") + "`r`n" + '</head>'),
        1
      )
    }
  }

  # Keep detail-page enhancement scripts centralized in assets/js/main.js.
  $updated = [regex]::Replace(
    $updated,
    '(?s)\s*<script>\s*\(function\s*\(\)\s*\{.*?\}\)\(\);\s*</script>\s*(?=</body>)',
    "`r`n",
    1
  )

  # Trim trailing spaces and enforce one newline at EOF.
  $lines = $updated -split "`r?`n"
  $lines = $lines | ForEach-Object { $_ -replace '\s+$', '' }
  while ($lines.Count -gt 0 -and [string]::IsNullOrWhiteSpace($lines[$lines.Count - 1])) {
    $lines = $lines[0..($lines.Count - 2)]
  }
  $updated = ($lines -join "`r`n") + "`r`n"

  if ($updated -ne $raw) {
    [System.IO.File]::WriteAllText($file.FullName, $updated, [System.Text.UTF8Encoding]::new($false))
    $updatedFiles++
  }
}

Write-Output ("Normalized HTML files: {0}" -f $updatedFiles)
