#> This function is used by the lifetime_reward_unit function
# Takes 8 inputs h, hunit, m, munit, s, sunit, subtitle, and ticks
# subtitle should be a short description and will be displayed as the subtitle.
# h, m, and s are three separate strings. hunit, munit, and sunit are automatically appended after each string.
# ticks is the number of ticks to add

$scoreboard players add @s foll_player_lifetime $(ticks)

title @s times 5 10 20
$title @s subtitle {text:"$(subtitle)", color:"yellow"}
$title @s title {text:"+$(h)$(hunit)$(m)$(munit)$(s)$(sunit)", color:"green"}
