#> Called to say "You are...." on everyone's screen
#

title @s clear
title @s reset
title @s times 2 40 8
title @s title {text:"You are...", color:"green"}
execute at @s run playsound minecraft:entity.allay.ambient_without_item master @s ~ ~ ~ 4 0.8 1
execute at @s run playsound minecraft:block.bell.resonate master @s ~ ~ ~ 0.5 1 1
