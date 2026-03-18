[CmdletBinding()]
param(
  [switch]$Install,
  [int]$Port = 4000,
  [string]$BindHost = "127.0.0.1",
  [switch]$NoForcePolling
)

$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

$bundle = Get-Command bundle -ErrorAction SilentlyContinue
if (-not $bundle) {
  Write-Host "Bundler was not found on PATH." -ForegroundColor Red
  Write-Host "Install Ruby first, then run: gem install bundler"
  exit 1
}

if ($Install) {
  Write-Host "Installing project gems..."
  & bundle install
  if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
  }
} else {
  & bundle check | Out-Null
  if ($LASTEXITCODE -ne 0) {
    Write-Host "Project gems are missing. Running bundle install..."
    & bundle install
    if ($LASTEXITCODE -ne 0) {
      exit $LASTEXITCODE
    }
  }
}

Write-Host "Serving site at http://$BindHost`:$Port"
$jekyllArgs = @("exec", "jekyll", "serve", "--livereload", "--host", $BindHost, "--port", $Port)

if (-not $NoForcePolling) {
  $jekyllArgs += "--force_polling"
}

& bundle @jekyllArgs
exit $LASTEXITCODE
