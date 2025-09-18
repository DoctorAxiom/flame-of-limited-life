#> Called to put a number title countdown on a player's screen and play a sound
# takes an input num

title @s clear
title @s reset
title @s times 2 10 8
$title @s title {text:"$(num)", color:"green"}
execute at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1.2 1
