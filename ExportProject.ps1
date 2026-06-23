$OutputFile = "ProjectDump.txt"

$ExcludedFolders = @(
    "\bin\",
    "\obj\",
    "\.git\",
    "\.vs\",
    "\packages\",
    "\node_modules\",
    "\TestResults\",
    "\publish\",
    "\artifacts\"
)

$Extensions = @(
    "*.cs",
    "*.sql",
    "*.html",
    "*.cshtml",
    "*.js",
    "*.css",
    "*.json"
)

if (Test-Path $OutputFile) {
    Remove-Item $OutputFile -Force
}

$Files = Get-ChildItem -Path . -Recurse -File -Include $Extensions |
    Where-Object {
        $fullName = $_.FullName

        foreach ($folder in $ExcludedFolders) {
            if ($fullName -like "*$folder*") {
                return $false
            }
        }

        return $true
    }

foreach ($file in $Files) {

    Add-Content $OutputFile ""
    Add-Content $OutputFile "=================================================="
    Add-Content $OutputFile "FILE: $($file.FullName)"
    Add-Content $OutputFile "=================================================="
    Add-Content $OutputFile ""

    try {
        Get-Content $file.FullName -Raw | Add-Content $OutputFile
    }
    catch {
        Add-Content $OutputFile "[ERRORE LETTURA FILE]"
    }

    Add-Content $OutputFile ""
}

Write-Host ""
Write-Host "Creato file: $OutputFile"
Write-Host "File analizzati: $($Files.Count)"
Write-Host ""