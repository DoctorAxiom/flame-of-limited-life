#> inactive game tick

execute as @a run gamemode spectator

#> Store any spawnpoint changes
summon armor_stand ~ ~ ~ {ShowArms:1b,Invulnerable:1b,NoGravity:1b,Tags:["foll_temp_spawn_marker"]}

execute store result score #foll_tracker foll_player_xpos run data get entity @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1] Pos[0] 64
execute store result score #foll_tracker foll_player_ypos run data get entity @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1] Pos[1] 64
execute store result score #foll_tracker foll_player_zpos run data get entity @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1] Pos[2] 64

scoreboard players set #foll_tracker foll_player_xrot 0
scoreboard players set #foll_tracker foll_player_yrot 0

kill @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker]

#Pull any updated values into player stats, but ignores players if they've already started a session
execute as @a[tag=foll-limited-player, tag=!foll-has-started] run scoreboard players operation @s foll_player_lifetime = #foll_tracker foll_starting_life