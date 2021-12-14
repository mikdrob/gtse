param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $_ -PathType Leaf})]
    [string]
    $FilePath,

    [ValidateRange("NonNegative")]
    [int]
    $MaxSize = 50MB
)

$file = Get-Item -Path $FilePath

$fileSize = $file.Length

if ($fileSize -gt $MaxSize)
{
    throw "File is larger than maximum allowed - look at reducing this!  Max: $($MaxSize/1MB)MB; Actual: $($fileSize/1MB)MB."
}
else
{
    "Success!  File size is allowed: $($fileSize/1MB)MB."
}