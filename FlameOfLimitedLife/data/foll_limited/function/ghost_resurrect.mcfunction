#> Should be called as a ghost player to resurrect them
# Should be executed once as each player who is a ghost.

execute unless entity @s[tag=foll-ghost] run tellraw @a ["Attempted to resurrect non-ghost player ", {selector:"@s"}, " doing nothing instead."]
execute unless entity @s[tag=foll-ghost] run return 0

scoreboard players operation @s foll_player_lifetime = #foll_tracker foll_red_life
tag @s remove foll-ghost

title @s clear
title @s times 5 10 20
title @s subtitle {text:"Make the most of it!", color:"yellow"}
title @s title {text:"Resurrected!", color:"green"}

# Add one back to the still alive player count.
scoreboard players add #foll_tracker foll_alive_player_count 1

effect give @s absorption 6 4 true
effect give @s resistance 6 4 true

tellraw @a [{text:"[", color:"green"}, {selector:"@s"}, " was resurrected!]"]