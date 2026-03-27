$htmlFile = "c:\Users\carlo\Downloads\1000 sermos\99\passa-repassa-landing (1).html"
$cssFile = "c:\Users\carlo\Downloads\1000 sermos\99\style.css"
$content = Get-Content -Raw -Path $htmlFile -Encoding UTF8
if ($content -match '(?s)<style>(.*?)</style>') {
    $cssContent = $matches[1].Trim()
    Set-Content -Path $cssFile -Value $cssContent -Encoding UTF8
    $newContent = $content -replace '(?s)<style>.*?</style>', '<link rel="stylesheet" href="style.css">'
    Set-Content -Path $htmlFile -Value $newContent -Encoding UTF8
    Write-Output "CSS extracted successfully to style.css"
} else {
    Write-Output "No <style> block found."
}
