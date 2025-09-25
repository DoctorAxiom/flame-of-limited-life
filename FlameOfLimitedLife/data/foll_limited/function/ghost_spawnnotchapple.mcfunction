#> Spawns notch apple if the current player is a ghost and the ability is off cooldown
# Should be executed once as each player who is a ghost.

#> Decrement cooldown by 1
execute if score @s foll_notchapple_cooldown matches 1.. run scoreboard players remove @s foll_notchapple_cooldown 1

#> exit if the player has not triggered a spawn windcharge.
execute if score @s foll_spawn_notchapple matches 0 run return 0
#otherwise, continue on

#> exit if the player is not a ghost
execute if entity @s[tag=!foll-ghost] run tellraw @s {text:"You cannot use this ability if you are not a ghost!",color:"red"}
execute if entity @s[tag=!foll-ghost] run return 0
#otherwise continue on

#> If still on cooldown, tell player how much cooldown is left, and then exit.
execute if score @s foll_notchapple_cooldown matches 1.. run data modify storage foll_limited:tmp cooldownvar.prefix set value "Your Spawn Notch Apple ability still has "
execute if score @s foll_notchapple_cooldown matches 1.. run data modify storage foll_limited:tmp cooldownvar.suffix set value " to cooldown."
execute if score @s foll_notchapple_cooldown matches 1.. run data modify storage foll_limited:tmp cooldownvar.color set value "red"
execute if score @s foll_notchapple_cooldown matches 1.. store result storage foll_limited:tmp cooldownvar.ticks int 1 run scoreboard players get @s foll_notchapple_cooldown
execute if score @s foll_notchapple_cooldown matches 1.. run function foll_limited:tell_unit with storage foll_limited:tmp cooldownvar
execute if score @s foll_notchapple_cooldown matches 1.. run return 0
# otherwise continue to actually spawn item

execute at @s run summon minecraft:item ~ ~ ~ {Item:{count:1, id: "minecraft:enchanted_golden_apple"}}

scoreboard players operation @s foll_notchapple_cooldown = #foll_tracker foll_notchapple_cooldown