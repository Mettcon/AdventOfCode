enum RPS {
    Rock = 1
    Paper = 2
    Scissor = 3
}

class Key {
    [RPS]$Value
    [char[]]$Names
}

$Rock = [Key]@{
    $Value = [RPS]::Rock
    $Names = 'A','X'
}

$Paper = [Key]@{
    $Value = [RPS]::Paper
    $Names = 'B','Y'
}

$Scissor = [Key]@{
    $Value = [RPS]::Scissor
    $Names = 'C','Z'
}

function Fight {
    [CmdletBinding()]
    param (
        $Player,
        $Opponent
    )

    if ($Player.Value -eq $Opponent.Value ) {
        $points = $Player.Value + 3
        $points
    }
}

<#
rock Paper
rock Scissor
Paper Scissor
Paper rock
Scissor rock
Scissor Paper
#>