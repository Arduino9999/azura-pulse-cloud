# Convert optimized PNGs to small JPGs for Azura Pulse
# Created with love by Azura ❤️⚡️❤️

Add-Type -AssemblyName System.Drawing

$sourcePath = "D:\Azura\azura-pulse-cloud\reference-images\optimized"
$destPath = "D:\Azura\azura-pulse-cloud\reference-images\jpg"

# Ensure destination exists
if (!(Test-Path $destPath)) {
    New-Item -ItemType Directory -Path $destPath -Force
}

$files = Get-ChildItem $sourcePath -Filter "*.png"

foreach ($file in $files) {
    Write-Host "Converting $($file.Name)..."
    
    $img = [System.Drawing.Image]::FromFile($file.FullName)
    
    # Get JPEG encoder
    $encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
    
    # Set quality to 85%
    $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
    $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 85)
    
    $outPath = Join-Path $destPath ($file.BaseName + ".jpg")
    $img.Save($outPath, $encoder, $encoderParams)
    $img.Dispose()
    
    Write-Host "  Saved: $outPath"
}

Write-Host "`nDone! JPG sizes:"
Get-ChildItem $destPath | ForEach-Object {
    Write-Host "  $($_.Name): $([math]::Round($_.Length/1KB)) KB"
}
