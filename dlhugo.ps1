[CmdletBinding()]
param(
    [Parameter()][string]$Release = 'latest',
    [Parameter()][string]$Pattern = 'hugo_extended_*_Windows-64bit.zip',
    [Parameter()][string]$OutFile = '.\hugo.exe'
)

Set-StrictMode -Version 3
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

if ($Release -ne 'latest') {
    $Release = "tags/$Release"
}
$releaseUri = "https://api.github.com/repos/gohugoio/hugo/releases/$Release"
$hugoAsset = ((Invoke-WebRequest $releaseUri) | ConvertFrom-Json).assets | Where-Object { $_.name -like $Pattern }
$hugoUri = $hugoAsset.browser_download_url

$tempFolderPath = Join-Path $env:TEMP $(New-Guid)
New-Item -ItemType Directory -Path $tempFolderPath | Out-Null

$zipFilePath = Join-Path $tempFolderPath hugo.zip
$zipFolderPath = Join-Path $tempFolderPath hugo
$hugoFilePath = Join-Path $zipFolderPath hugo.exe

try {
    Write-Host "Downloading $hugoUri"
    Invoke-WebRequest -Uri $hugoUri -OutFile $zipFilePath

    Write-Host "Extracting $zipFilePath"
    Expand-Archive -Path $zipFilePath -DestinationPath $zipFolderPath

    Write-Host "Copying hugo.exe to $OutFile"
    Copy-Item -Path $hugoFilePath -Destination $OutFile
}
finally {
    Remove-Item -Recurse -Force $tempFolderPath -ErrorAction SilentlyContinue
}
