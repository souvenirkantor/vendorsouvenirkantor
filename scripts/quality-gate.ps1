param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"

$resolvedRoot = Resolve-Path $Root
Push-Location $resolvedRoot

try {
  Write-Output "Step 1/3: Normalizing HTML..."
  ./scripts/normalize-site-html.ps1 -Root .
  if (-not $?) {
    throw "normalize-site-html.ps1 failed"
  }

  Write-Output "Step 2/3: Auditing HTML consistency..."
  ./scripts/audit-site-html.ps1 -Root .
  if (-not $?) {
    throw "audit-site-html.ps1 failed"
  }

  Write-Output "Step 3/3: Checking JavaScript syntax..."
  node --check assets/js/main.js | Out-Null
  if ($LASTEXITCODE -ne 0) {
    throw "node --check exited with code $LASTEXITCODE"
  }

  Write-Output "Quality gate PASSED"
}
catch {
  Write-Output "Quality gate FAILED"
  throw
}
finally {
  Pop-Location
}
