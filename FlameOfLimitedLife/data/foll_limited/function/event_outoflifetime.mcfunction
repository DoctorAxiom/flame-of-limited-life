#> Called as a particular player who has completely run out of lifetime
# @s must refer to the player who just had the detected life out

#remove one from the registered player count.
scoreboard players remove #foll_tracker foll_alive_player_count 1

#make sure ghost ability tracking scores are set up for this player
scoreboard players set @s foll_applyingresistance 0
scoreboard players set @s foll_applyingweakness 0
scoreboard players set @s foll_notchapple_cooldown 0
scoreboard players set @s foll_windcharge_cooldown 0

tag @s add foll-ghost
particle minecraft:raid_omen ~ ~ ~ 0.15 0.15 0.15 3 18 force
particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 0 40 0 0 128 force
execute at @s run summon minecraft:lightning_bolt ~ 322.5 ~
playsound minecraft:ambient.soul_sand_valley.mood ambient @a ~ ~ ~ 1 2.0 1
tellraw @a {text:"", color:"red", bold:true, extra:[{selector:"@s"}," has been eliminated!"]}
