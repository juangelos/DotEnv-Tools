# DotEnv-Tools

A PowerShell module for loading environment variables from .env files.

## Installation

```powershell
# Search for the module
Find-Module DotEnv-Tools

# Install the module
Install-Module DotEnv-Tools -Scope CurrentUser
```

## Usage

### Interactive Shell

1. Import the module:
   ```powershell
   Import-Module DotEnv-Tools
   ```

2. Create a `.env` file in your project directory with your environment variables:
   ```
   DB_HOST=localhost
   DB_PORT=5432
   API_KEY=your_secret_key
   ```

3. Load the environment variables:
   ```powershell
   Set-DotEnv
   ```

### In Scripts

When using `Set-DotEnv` in scripts, the environment variables are set in the Process scope. This means:
- Variables are available throughout your script after calling `Set-DotEnv`
- Variables are automatically cleaned up when the script/process ends
- Variables don't persist in your system environment

Example script:
```powershell
# Import the module
Import-Module DotEnv-Tools

# Load environment variables from .env
Set-DotEnv

# Use the variables in your script
$connectionString = "Server=$env:DB_HOST;Port=$env:DB_PORT"
Write-Host "Using API Key: $env:API_KEY"

# When the script ends, the environment variables are automatically cleaned up
```

Example `.env` file:
```
DB_HOST=localhost
DB_PORT=5432
API_KEY=your_secret_key
```

> **Note**: Since environment variables are set in the Process scope, they will only exist for the duration of your PowerShell session or script execution. This is a security feature that ensures sensitive information (like API keys) doesn't persist in your system environment.

## For Module Development

### Building the Module

1. Clone this repository
2. Run the build script:
   ```powershell
   .\build.ps1
   ```

### Publishing to PowerShell Gallery

1. Create an account at [PowerShell Gallery](https://www.powershellgallery.com/)
2. Get your API key from your account settings
3. Run:
   ```powershell
   Publish-Module -Path ".\DotEnv-Tools" -NuGetApiKey "YOUR-API-KEY-HERE" -Verbose
   ```

## Requirements

- PowerShell 5.1 or later

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
