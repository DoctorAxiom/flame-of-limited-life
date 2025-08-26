#> This function updates team colors and suffixes with provided data
# assumes 1 team for each player and updates the suffix to match the timer
# as well as updating the team color.

$team modify $(teamname) suffix [{text:"[", color:"dark_aqua"}, {text:"$(h)", color:"$(color)"}, {text:":", color:"dark_aqua"}, {text:"$(mpad)$(m)", color:"$(color)"}, {text:":", color:"dark_aqua"}, {text:"$(spad)$(s)", color:"$(color)"}, {text:"]", color:"dark_aqua"} ]
$team modify $(teamname) color $(color)