#> Rewards the current player with time and displays a title for them
# Takes three inputs title, subtitle, and ticks
# subtitle should be a short description and will be displayed as the subtitle.
# title is the actual reward function

$scoreboard players add @s foll_player_lifetime $(ticks)

title @s times 5 10 20
$title @s subtitle {text:"$(subtitle)", color:"yellow"}
$title @s title {text:"$(title)", color:"green"}
