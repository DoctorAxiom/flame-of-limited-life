#> Deducts time from the current player and displays a title for them
# Takes three inputs title, subtitle, and ticks
# subtitle should be a short description and will be displayed as the subtitle.
# title is the actual reward function
# ticks is the number of ticks to deduct

$scoreboard players remove @s foll_player_lifetime $(ticks)

title @s clear
title @s times 10 30 20
$title @s subtitle {text:"$(subtitle)", color:"yellow"}
$title @s title {text:"$(title)", color:"red"}
