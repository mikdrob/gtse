param
(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    $BuildId,

    [Parameter(Mandatory=$true)]
    [ValidatePattern('(/bugfix/|/feature/|/hotfix/|/release/|develop|master)')]
    [string]
    $BuildSourceBranch,

    [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
    [string]
    $VersionFilePath = "./version.txt",

    [ValidateNotNullOrEmpty()]
    [string]
    $Version
)

# If Version not specified, get it from VersionFilePath
if (!$Version)
{
    $versionFile = Get-Content -Path $VersionFilePath

    $Version = ($versionFile -Split [Environment]::NewLine -Split "=" | Where-Object { $_ -Match "[\d]+" }) -Join "."
}

"Using version: $Version"
"Using source branch: $BuildSourceBranch"
"Using build id: $BuildId"

# Hashtable of GitFlow branches and suffixes
$branchSuffixes =
@{
    "/bugfix/" = "-alpha";
    "/feature/" = "-alpha";
    "/hotfix/" = "-rc";
    "/release/" = "-rc";
    "develop" = "-beta";
    "master" = "";
}

# Match up BuildSourceBranch to branchSuffix key for corresponding suffix
$branchSuffixKey = ($branchSuffixes.Keys | Where-Object { $BuildSourceBranch -match $_ })

# If found, append branchSuffix value to Version
if ($branchSuffixKey)
{
    $Version += $branchSuffixes[$branchSuffixKey]
}

$buildNumber = "$Version-$BuildId"

"Setting build number: $buildNumber"
"$("##vso[build.updatebuildnumber]")$($buildNumber)"