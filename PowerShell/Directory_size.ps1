$Path="c:\users\dennissun\"
Get-ChildItem -path $path -Directory -Force | ForEach-Object {
    $size = (Get-ChildItem $_.FullName -Recurse -File -Force | Measure-Object Length -Sum).Sum
    Write-Output "$($_.Name): $($size/1GB) GB"
}

