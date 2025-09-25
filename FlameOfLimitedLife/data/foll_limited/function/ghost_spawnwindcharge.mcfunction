#> Spawns windcharge if the current player is a ghost and the ability is off cooldown
# Should be executed once as each player who is a ghost.

#> Decrement cooldown by 1
execute if score @s foll_windcharge_cooldown matches 1.. run scoreboard players remove @s foll_windcharge_cooldown 1

#> exit if the player has not triggered a spawn windcharge.
execute if score @s foll_spawn_windcharge matches 0 run return 0
#otherwise, continue on

#> exit if the player is not a ghost
execute if entity @s[tag=!foll-ghost] run tellraw @s {text:"You cannot use this ability if you are not a ghost!",color:"red"}
execute if entity @s[tag=!foll-ghost] run return 0
#otherwise continue on

#> If still on cooldown, tell player how much cooldown is left, and then exit.
execute if score @s foll_windcharge_cooldown matches 1.. run data modify storage foll_limited:tmp cooldownvar.prefix set value "Your Spawn Windcharge ability still has "
execute if score @s foll_windcharge_cooldown matches 1.. run data modify storage foll_limited:tmp cooldownvar.suffix set value " to cooldown."
execute if score @s foll_windcharge_cooldown matches 1.. run data modify storage foll_limited:tmp cooldownvar.color set value "red"
execute if score @s foll_windcharge_cooldown matches 1.. store result storage foll_limited:tmp cooldownvar.ticks int 1 run scoreboard players get @s foll_windcharge_cooldown
execute if score @s foll_windcharge_cooldown matches 1.. run function foll_limited:tell_unit with storage foll_limited:tmp cooldownvar
execute if score @s foll_windcharge_cooldown matches 1.. run return 0
# otherwise continue to actually spawn windcharge.

execute as @s at @s run summon marker ^ ^ ^10 {Tags:["foll-shootdir"]}

execute store result score #foll_shootdir foll_player_xpos as @e[type=marker,tag=foll-shootdir,limit=1] run data get entity @s Pos[0] 64
execute store result score #foll_shootdir foll_player_ypos as @e[type=marker,tag=foll-shootdir,limit=1] run data get entity @s Pos[1] 64
execute store result score #foll_shootdir foll_player_zpos as @e[type=marker,tag=foll-shootdir,limit=1] run data get entity @s Pos[2] 64

scoreboard players operation #foll_shootdir foll_player_xpos -= @s foll_player_xpos
scoreboard players operation #foll_shootdir foll_player_ypos -= @s foll_player_ypos
scoreboard players operation #foll_shootdir foll_player_zpos -= @s foll_player_zpos

execute as @s at @s anchored eyes positioned ^ ^ ^ run summon minecraft:wind_charge ~ ~ ~ {Tags:["foll-currproj"]}

execute store result entity @e[tag=foll-currproj, limit=1] Motion[0] double 0.000001 run scoreboard players get #foll_shootdir foll_player_xpos
execute store result entity @e[tag=foll-currproj, limit=1] Motion[1] double 0.000001 run scoreboard players get #foll_shootdir foll_player_ypos
execute store result entity @e[tag=foll-currproj, limit=1] Motion[2] double 0.000001 run scoreboard players get #foll_shootdir foll_player_zpos

tag @e[tag=foll-currproj] remove foll-currproj
kill @e[tag=foll-shootdir]

scoreboard players operation @s foll_windcharge_cooldown = #foll_tracker foll_windcharge_cooldown