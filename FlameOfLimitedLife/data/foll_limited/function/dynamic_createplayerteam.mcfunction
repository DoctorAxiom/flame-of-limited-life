#> This function dynamically refreshes a team and adds the player
# it removes a team with the given name $(teamname) and then recreates it,
# and then makes the current @s player join the team.

$team remove $(teamname)
$team add $(teamname)
$team join $(teamname) @s
