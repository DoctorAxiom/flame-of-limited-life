#> Called place title of if current player is the boogeyman.
#

title @s clear
title @s reset
title @s times 2 40 18
execute if entity @s[tag=!foll-boogeyman] run title @s title {text:"NOT the Boogeyman.", color:"green"}
execute if entity @s[tag=foll-boogeyman] run title @s title {text:"The Boogeyman!", color:"red"}
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2 1
execute at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 4 1 1