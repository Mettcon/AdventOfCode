$content = Get-Content $PSScriptRoot\input.txt

$content.ForEach{
    $half = $_.Length / 2
    $compartment1 = $_.Substring(0, $half)

    for ($i = $half; $i -lt $_.Length; $i++) {
        [char]$char = $_[$i]
        if ($compartment1.contains($char)) {
            if ([char]::IsUpper($char)) {
                [int]$char - 38 
            }
            else {
                [int]$char - 96
            }
            break
        }
    }
} | Measure-Object -Sum


# Part 2
$result = for ($i = 0; $i -lt $content.Count; $i += 3 ) {
    foreach ($char in $content[$i].GetEnumerator()) {
        if ( 
            $content[$i + 1].Contains($char) -and 
            $content[$i + 2].Contains($char)
        ) {
            if ([char]::IsUpper($char)) {
                [int]$char - 38 
            }
            else {
                [int]$char - 96
            }
            break
        }
    }
} 
$result | measure -Sum