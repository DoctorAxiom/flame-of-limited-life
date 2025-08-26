#> A version of lifetime penalize that can take a number for the title
# Takes three inputs title, subtitle, and ticks
# subtitle should be a short description and will be displayed as the subtitle.
# title is the actual reward amount in human readable text- in this case this function prepends a "-" and appends an "m"

$scoreboard players add @s foll_player_lifetime $(ticks)

title @s times 5 10 20
$title @s subtitle {text:"$(subtitle)", color:"yellow"}
$title @s title {text:"-$(title)m", color:"red"}
