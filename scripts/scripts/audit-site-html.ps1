param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"

$resolvedRoot = Resolve-Path $Root
$files = Get-ChildItem -Path $resolvedRoot -File -Filter *.html
$templatesRoot = Join-Path $resolvedRoot "templates"

$requiredPatterns = @(
  'name="author"',
  'name="publisher"',
  'name="theme-color"',
  'name="referrer"',
  'name="format-detection"',
  'rel="canonical"',
  'rel="alternate" hreflang="id-ID"',
  'id="scroll-top"',
  'id="preloader"',
  'assets/css/main.css',
  'assets/css/site-overrides.css',
  'assets/js/main.js'
)

function Normalize-BlockText {
  param([string]$Text)
  return (($Text -replace '\s+', ' ').Trim())
}

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

function Get-SchemaTypesFromNode {
  param([object]$Node)

  if ($null -eq $Node) {
    return @()
  }

  $types = @()

  # Stop on scalar primitives to avoid deep recursion through .NET type members.
  if ($Node -is [string] -or $Node -is [ValueType]) {
    return @()
  }

  if ($Node -is [System.Collections.IEnumerable] -and -not ($Node -is [string])) {
    foreach ($item in $Node) {
      $types += Get-SchemaTypesFromNode -Node $item
    }
    return $types
  }

  $properties = $Node.PSObject.Properties

  $nodeTypeProperty = $properties['@type']
  if ($null -ne $nodeTypeProperty) {
    $nodeTypeValue = $nodeTypeProperty.Value
    if ($nodeTypeValue -is [System.Collections.IEnumerable] -and -not ($nodeTypeValue -is [string])) {
      foreach ($typeItem in $nodeTypeValue) {
        if (-not [string]::IsNullOrWhiteSpace([string]$typeItem)) {
          $types += [string]$typeItem
        }
      }
    } elseif (-not [string]::IsNullOrWhiteSpace([string]$nodeTypeValue)) {
      $types += [string]$nodeTypeValue
    }
  }

  foreach ($property in $properties) {
    if ($property.Name -eq '@type') {
      continue
    }
    $types += Get-SchemaTypesFromNode -Node $property.Value
  }

  return $types
}

function Get-ExpectedSchemaTypes {
  param([string]$FileName)

  $name = $FileName.ToLowerInvariant()

  switch -Regex ($name) {
    '^index\.html$' { return @('WebSite', 'WebPage') }
    '^about\.html$' { return @('AboutPage') }
    '^starter-page\.html$' { return @('ContactPage') }
    '^faq-seo\.html$' { return @('FAQPage') }
    '^lokasi-layanan\.html$' { return @('Service') }
    '^galeri\.html$' { return @('CollectionPage', 'BreadcrumbList') }
    '^blog\.html$' { return @('CollectionPage') }
    '^artikel\.html$' { return @('Article') }
    '^produk\.html$' { return @('CollectionPage') }
    '^service\.html$' { return @('CollectionPage') }
    '^service-details\.html$' { return @('CollectionPage') }
    '^portfolio-details\.html$' { return @('CollectionPage', 'BreadcrumbList') }
    '^portofolio-.*\.html$' { return @('CollectionPage', 'BreadcrumbList') }
    '^paket-.*\.html$' { return @('Product', 'FAQPage', 'BreadcrumbList') }
    '^layanan-.*\.html$' { return @('Service', 'FAQPage', 'BreadcrumbList') }
    '^(panduan-|strategi-|template-|cara-).*\.html$' { return @('Article', 'FAQPage', 'BreadcrumbList') }
    default { return @() }
  }
}

$expectedNav = Normalize-BlockText -Text (Read-TemplateBlock -TemplateFileName "navmenu.html" -Fallback @'
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
'@)

$expectedSocial = Normalize-BlockText -Text (Read-TemplateBlock -TemplateFileName "social-links.html" -Fallback @'
<div class="social-links text-center">
        <a href="https://wa.me/62895639068080" class="twitter" aria-label="WhatsApp"><i class="bi bi-whatsapp"></i></a>
        <a href="mailto:halo@vendorsouvenirkantor.web.id" class="facebook" aria-label="Email"><i class="bi bi-envelope-fill"></i></a>
        <a href="https://vendorsouvenirkantor.web.id" class="instagram" aria-label="Website"><i class="bi bi-globe"></i></a>
      </div>
'@)

$expectedFooter = Normalize-BlockText -Text (Read-TemplateBlock -TemplateFileName "footer.html" -Fallback @'
<footer id="footer" class="footer position-relative">

    <div class="container">
      <div class="copyright text-center ">
        <p>&copy; <span>Copyright</span> <strong class="px-1 sitename">Vendor Souvenir Kantor</strong> <span>All Rights Reserved</span></p>
      </div>

    </div>

  </footer>
'@)

$errors = @()

foreach ($file in $files) {
  $raw = Get-Content -Raw -Path $file.FullName

  foreach ($pattern in $requiredPatterns) {
    if ($raw -notmatch [regex]::Escape($pattern)) {
      $errors += "[MISSING] $($file.Name) -> $pattern"
    }
  }

  foreach ($pattern in @('name="author"', 'name="publisher"', 'name="theme-color"', 'name="referrer"', 'name="format-detection"')) {
    $count = ([regex]::Matches($raw, [regex]::Escape($pattern))).Count
    if ($count -gt 1) {
      $errors += "[DUPLICATE] $($file.Name) -> $pattern x$count"
    }
  }

  if ($raw -match '(?s)<style>.*?</style>') {
    $errors += "[STYLE] $($file.Name) -> inline <style> should be moved to stylesheet"
  }

  $navMatch = [regex]::Match($raw, '(?s)<nav id="navmenu"[^>]*>.*?</nav>')
  if (-not $navMatch.Success) {
    $errors += "[NAV] $($file.Name) -> navmenu component not found"
  } else {
    $normalizedNav = Normalize-BlockText -Text $navMatch.Value
    if ($normalizedNav -ne $expectedNav) {
      $errors += "[NAV] $($file.Name) -> navmenu does not match template"
    }
  }

  $socialMatch = [regex]::Match($raw, '(?s)<div class="social-links text-center">.*?</div>')
  if (-not $socialMatch.Success) {
    $errors += "[SOCIAL] $($file.Name) -> social-links component not found"
  } else {
    $normalizedSocial = Normalize-BlockText -Text $socialMatch.Value
    if ($normalizedSocial -ne $expectedSocial) {
      $errors += "[SOCIAL] $($file.Name) -> social-links does not match template"
    }
  }

  $footerMatch = [regex]::Match($raw, '(?s)<footer id="footer" class="footer position-relative">.*?</footer>')
  if (-not $footerMatch.Success) {
    $errors += "[FOOTER] $($file.Name) -> footer component not found"
  } else {
    $normalizedFooter = Normalize-BlockText -Text $footerMatch.Value
    if ($normalizedFooter -ne $expectedFooter) {
      $errors += "[FOOTER] $($file.Name) -> footer does not match template"
    }
  }

  if (($raw -match '<body class="artikel-page"') -and ($raw -match 'id="tocWrapper"' -or $raw -match 'class="article-content') -and $raw -notmatch [regex]::Escape('assets/css/article-detail.css')) {
    $errors += "[CSS] $($file.Name) -> detail artikel missing assets/css/article-detail.css"
  }
  if ($raw -match '<body class="product-package-page"' -and $raw -notmatch [regex]::Escape('assets/css/product-package-detail.css')) {
    $errors += "[CSS] $($file.Name) -> product-package-page missing assets/css/product-package-detail.css"
  }
  if ($raw -match '<body class="service-package-page"' -and $raw -notmatch [regex]::Escape('assets/css/service-detail-page.css')) {
    $errors += "[CSS] $($file.Name) -> service-package-page missing assets/css/service-detail-page.css"
  }
  if ($raw -match '<body class="galeri-page"' -and $raw -notmatch [regex]::Escape('assets/css/galeri-page.css')) {
    $errors += "[CSS] $($file.Name) -> galeri-page missing assets/css/galeri-page.css"
  }

  $inlineScripts = [regex]::Matches($raw, '(?s)<script(?![^>]*\bsrc=)([^>]*)>.*?</script>')
  foreach ($inlineScript in $inlineScripts) {
    $attrs = $inlineScript.Groups[1].Value
    $isLdJson = $attrs -match 'type="application/ld\+json"'
    $isJsonConfig = $attrs -match 'type="application/json"'
    if (-not $isLdJson -and -not $isJsonConfig) {
      $errors += "[SCRIPT] $($file.Name) -> non-JSON inline script found"
      break
    }
  }

  $ldJsonScripts = [regex]::Matches($raw, '(?s)<script\s+type="application/ld\+json"\s*>(.*?)</script>')
  if ($ldJsonScripts.Count -eq 0) {
    $errors += "[SCHEMA] $($file.Name) -> missing JSON-LD block"
  } else {
    $schemaTypes = @()
    $index = 0
    foreach ($ldJsonScript in $ldJsonScripts) {
      $index++
      $jsonText = $ldJsonScript.Groups[1].Value.Trim()
      if ([string]::IsNullOrWhiteSpace($jsonText)) {
        $errors += "[SCHEMA] $($file.Name) -> empty JSON-LD block #$index"
        continue
      }

      if ($jsonText -notmatch '"@context"\s*:') {
        $errors += "[SCHEMA] $($file.Name) -> missing @context in JSON-LD block #$index"
      }

      try {
        $obj = $jsonText | ConvertFrom-Json
        $schemaTypes += Get-SchemaTypesFromNode -Node $obj
      } catch {
        $errors += "[SCHEMA] $($file.Name) -> invalid JSON-LD block #$index"
      }
    }

    $schemaTypes = $schemaTypes | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Sort-Object -Unique

    if (-not ($schemaTypes -contains 'Organization')) {
      $errors += "[SCHEMA] $($file.Name) -> missing Organization schema"
    }

    $expectedTypes = Get-ExpectedSchemaTypes -FileName $file.Name
    foreach ($expectedType in $expectedTypes) {
      if (-not ($schemaTypes -contains $expectedType)) {
        $errors += "[SCHEMA] $($file.Name) -> expected type missing: $expectedType"
      }
    }
  }

  $hrefMatches = [regex]::Matches($raw, 'href\s*=\s*"([^"]+)"')
  foreach ($match in $hrefMatches) {
    $href = $match.Groups[1].Value
    if ($href -match '^(https?:|mailto:|tel:|#|javascript:|data:|whatsapp:|//)') { continue }
    if ($href -match '\.(css|js|png|jpg|jpeg|webp|svg|gif|woff2?|pdf)(\?|#|$)') { continue }

    $cleanHref = ($href -split '[#?]')[0]
    if ([string]::IsNullOrWhiteSpace($cleanHref)) { continue }

    $targetPath = Join-Path $resolvedRoot $cleanHref
    if (-not (Test-Path $targetPath)) {
      $errors += "[LINK] $($file.Name) -> missing local target: $href"
    }
  }
}

if ($errors.Count -gt 0) {
  Write-Output "Audit FAILED"
  $errors | Sort-Object | ForEach-Object { Write-Output $_ }
  exit 1
}

Write-Output ("Audit PASSED for {0} HTML files" -f $files.Count)
