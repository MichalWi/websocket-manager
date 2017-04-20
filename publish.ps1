param(
    [Parameter(Mandatory=$true)][string]$repo,
    [switch]$stable = $false,
    [string]$versionSuffix = "1"
)

$projects = @(
    "WebSocketManager",
    "WebSocketManager.Common",
    "WebSocketManager.Client",
    "WebSocketManager.Sockets",
    "AsyncWebSocketClient"
)

$packArguments = New-Object System.Collections.ArrayList
$_ = $packArguments.Add("pack")
$_ = $packArguments.Add("--include-source")
$_ = $packArguments.Add("--include-symbols")
$_ = $packArguments.Add("--version-suffix")
$_ = $packArguments.Add($versionSuffix)

if ($stable) {
    $_ = $packArguments.RemoveAt($packArguments.Count - 1)
    $_ = $packArguments.RemoveAt($packArguments.Count - 1)
}

foreach ($project in $projects) {
    $_ = $packArguments.Add("src\$project\$project.csproj")
    dotnet @packArguments
    $_ = $packArguments.RemoveAt($packArguments.Count - 1)
}

Get-ChildItem "." -Recurse -Filter "*.nupkg" | 
Foreach-Object {
    $name = $_.FullName
    nuget add $name -Source $repo -NonInteractive
    Remove-Item $name
}