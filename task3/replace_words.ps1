$wordOld = Read-Host "Введите старое слово: "
$wordNew = Read-Host "Введите новое слово: "
$directory = Get-Location

$files = Get-ChildItem "$directory" -Filter *.txt

foreach ($file in $files) {
    if (Get-Content $file | Select-String -Pattern $wordOld -Quiet) {
        $file | Set-Content -Value ((Get-Content $file) -replace $wordOld, $wordNew)
        Add-Content -Path out.txt -Value $file.FullName
    }
}

Write-Host "out.txt"