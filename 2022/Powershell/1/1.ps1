using namespace System.Collections.Generic

#region Import
class Carry {
    [List[int]]$load
    [int]$Sum
}

$content = Get-Content $PSScriptRoot\input.txt
$reindeers = [List[Carry]]::new()
$carry = [Carry]@{
    load = [List[int]]::new()
}

for ($i = 0 ; $i -lt $content.Length; $i++) {
    $entry = $content[$i]
    if (-not $entry) {
        $reindeers.Add($carry)
        $carry = [Carry]@{
            load = [List[int]]::new()
        }
        continue
    }

    $carry.load.Add($entry)
    $carry.Sum += $entry

    if (-not $content[$i + 1] -and -not $content[$i + 2]) {
        $reindeers.Add($carry)
    }
}
#endregion

# 1st Part
$reindeers | sort -Property Sum

# 2nd Part
$reindeers | sort -Property Sum | select -Last 3 | foreach { $result += $_.Sum }
$result