class Item {
    [byte]$worth
    [char[]]$Encryption
    [string]$Name
}

$Rock = [Item]@{
    worth      = 1
    Encryption = 'A', 'X'
    Name       = 'Rock'
}

$Paper = [Item]@{
    worth      = 2
    Encryption = 'B', 'Y'
    Name       = 'Paper'
}

$Scissor = [Item]@{
    worth      = 3
    Encryption = 'C', 'Z'
    Name       = 'Scissor'
}

function Fight {
    [CmdletBinding()]
    param (
        [Item]$Player,
        [Item]$Opponent
    )

    if ($Player.Name -eq $Opponent.Name ) {
        $points = $Player.worth + 3
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