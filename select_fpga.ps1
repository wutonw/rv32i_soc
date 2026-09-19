[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Position = 0)]
    [string]$Vendor
)

if ([string]::IsNullOrWhiteSpace($Vendor)) {
    Write-Host 'Select FPGA vendor:'
    Write-Host '  1 = Gowin'
    Write-Host '  2 = Xilinx'
    Write-Host '  3 = Exit'
    $Vendor = Read-Host 'Enter 1, 2, or 3'
}

switch ($Vendor.ToUpperInvariant()) {
    '1'      { $Vendor = 'Gowin' }
    'GOWIN'  { $Vendor = 'Gowin' }
    '2'      { $Vendor = 'Xilinx' }
    'XILINX' { $Vendor = 'Xilinx' }
    '3'      { Write-Output 'No changes made.'; exit 0 }
    default  { throw "Invalid selection '$Vendor'. Use 1 for Gowin, 2 for Xilinx, or 3 to exit." }
}

$topPath = Join-Path $PSScriptRoot 'src\top.v'
if (-not (Test-Path -LiteralPath $topPath -PathType Leaf)) {
    throw "Cannot find top module: $topPath"
}

$content = [System.IO.File]::ReadAllText($topPath)
$macroPattern = '(?m)^(?<indent>[ \t]*)(?<comment>//[ \t]*)?`define[ \t]+FPGA_(?<name>GOWIN|XILINX)[ \t]*(?<eol>\r?\n|$)'
$matches = [regex]::Matches($content, $macroPattern)

if ($matches.Count -ne 2 -or ($matches | ForEach-Object { $_.Groups['name'].Value } | Sort-Object -Unique) -join ',' -ne 'GOWIN,XILINX') {
    throw "Expected exactly one FPGA_GOWIN and one FPGA_XILINX selector in the first lines of $topPath"
}

$selected = $Vendor.ToUpperInvariant()
$updated = [regex]::Replace($content, $macroPattern, {
    param($match)

    $name = $match.Groups['name'].Value
    $indent = $match.Groups['indent'].Value
    $eol = $match.Groups['eol'].Value
    if ($name -eq $selected) {
        return $indent + [char]0x60 + "define FPGA_$name" + $eol
    }

    return $indent + '//' + [char]0x60 + "define FPGA_$name" + $eol
})

if ($PSCmdlet.ShouldProcess($topPath, "select FPGA vendor '$Vendor'")) {
    [System.IO.File]::WriteAllText($topPath, $updated, [System.Text.UTF8Encoding]::new($false))
}

Write-Output "FPGA vendor selected: $Vendor"
Write-Output "Updated: $topPath"
