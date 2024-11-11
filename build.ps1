# Build script for DotEnv-Tools module

# Module information
$moduleName = "DotEnv-Tools"
$author = "juangelos"
$description = "PowerShell module for loading .env files into environment variables"
$moduleVersion = "0.1.0"

# Create module directory if it doesn't exist
$modulePath = Join-Path $PSScriptRoot $moduleName
if (-not (Test-Path $modulePath)) {
    New-Item -Path $modulePath -ItemType Directory
}

# Copy module files
Copy-Item -Path "$PSScriptRoot\$moduleName.psm1" -Destination $modulePath
Copy-Item -Path "$PSScriptRoot\LICENSE" -Destination $modulePath
Copy-Item -Path "$PSScriptRoot\README.md" -Destination $modulePath

# Create module manifest
$manifestParams = @{
    Path              = Join-Path $modulePath "$moduleName.psd1"
    RootModule        = "$moduleName.psm1"
    ModuleVersion     = $moduleVersion
    Author            = $author
    Description       = $description
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Set-DotEnv')
    Tags             = @('Environment', 'DotEnv', '.env', 'Configuration')
    ProjectUri       = 'https://github.com/juangelos/DotEnv-Tools'
    LicenseUri       = 'https://github.com/juangelos/DotEnv-Tools/blob/main/LICENSE'
}

New-ModuleManifest @manifestParams

Write-Host "Module built successfully at: $modulePath"
Write-Host ""
Write-Host "To publish to PowerShell Gallery:"
Write-Host "1. Get your API key from https://www.powershellgallery.com/"
Write-Host "2. Run the following command:"
Write-Host "Publish-Module -Path '$modulePath' -NuGetApiKey 'YOUR-API-KEY-HERE' -Verbose"
