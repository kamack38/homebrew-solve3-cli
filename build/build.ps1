[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $Version
)

Invoke-Webrequest "https://registry.npmjs.org/solve3-cli/-/solve3-cli-$Version.tgz" -OutFile "v$Version.tar.gz"
$fileHash = Get-FileHash -Algorithm SHA256 -Path "v$Version.tar.gz"
$hash = $fileHash.Hash.ToLower()
Remove-Item -Path "v$Version.tar.gz"
$content = Get-Content './solve3-cli.txt' -Raw
$content = $content.Replace('<VERSION>', $Version)
$content = $content.Replace('<SHA256>', $hash)
$content | Out-File -Encoding 'UTF8' '../solve3-cli.rb'
