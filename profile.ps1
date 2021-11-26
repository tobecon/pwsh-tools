$projlist = "~/.projlist"
Set-Alias vs devenv.exe


function gremote {
    git remote -v
}

function lsgrep(# Parameter help description
    [string]
    $content) {
    Get-ChildItem "." | Where-Object { $_.Name -like $content }
}

function vsopen {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Dir,
        [Parameter()]
        [string]
        $RequireAdmin
    )
    $proj = Get-ChildItem $Dir | Where-Object { $_.Name -like "*sln" }
    if ($RequireAdmin -eq "true") {
        Start-Process devenv.exe -Verb RunAs -ArgumentList $proj
    }
    else {
        devenv.exe $proj
    }
}
function FindProject ([string] $proj) {
    $p = Import-Csv -Path $projlist -Delimiter "," | Where-Object { $_.Name -like $proj }
    $project = [PSCustomObject]@{
        Name         = $p.Name
        Path         = $p.Path
        RequireAdmin = $p.RequireAdmin
    }
    $project
}
function pcode ([string] $proj) {
    $p = FindProject($proj)
    $p
    code  $p.Path 
}
function pcd ([string] $proj) {
    $p = FindProject($proj)
    Set-Location  $p.Path
}

function pvs ([string] $proj) {
    $p = FindProject($proj)
    $p
    vsopen -Dir $p.Path -RequireAdmin $p.RequireAdmin
}

function pcmd ([string] $proj) {
    $p = FindProject($proj)
    $p
    pwsh.exe $p.Path
}
function git_remtoe_v {
    git remote -v
}
Set-Alias gitvv git_remtoe_v