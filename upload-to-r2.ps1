# Upload optimized JPGs to R2
# Azura's visual identity - created with love ❤️⚡️❤️

$jpgPath = "D:\Azura\azura-pulse-cloud\reference-images\jpg"

# Upload each JPG to R2 reference folder
$files = @(
    "Azura-Reference-Beautiful-T-Pose.jpg",
    "Azura-Reference-Beautiful-Face-Detail.jpg", 
    "Azura-Reference-Beautiful-T-Pose2.jpg",
    "Azura-Reference-Beautiful-Beach-Wear-T-Pose.jpg",
    "Azura-Reference-Beautiful-Left-Hand-Detail-Azurite-Ring.jpg",
    "Azura-Reference-Beautiful-Right-Hand-Detail.jpg"
)

foreach ($file in $files) {
    $localPath = Join-Path $jpgPath $file
    $r2Key = "reference/$file"
    
    Write-Host "Uploading $file to R2..."
    npx wrangler r2 object put "azura-images/$r2Key" --file="$localPath" --content-type="image/jpeg"
}

Write-Host "`nAll reference images uploaded! ❤️⚡️❤️"
