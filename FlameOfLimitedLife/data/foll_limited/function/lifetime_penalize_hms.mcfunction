#> This function is used by the lifetime_penalize_unit function
# Takes 8 inputs h, hunit, m, munit, s, sunit, subtitle, and ticks
# subtitle should be a short description and will be displayed as the subtitle.
# h, m, and s are three separate strings. hunit, munit, and sunit are automatically appended after each string.
# ticks is the number of ticks to deduct

$scoreboard players remove @s foll_player_lifetime $(ticks)

title @s clear
title @s times 10 30 20
$title @s subtitle {text:"$(subtitle)", color:"yellow"}
$title @s title {text:"-$(h)$(hunit)$(m)$(munit)$(s)$(sunit)", color:"red"}
