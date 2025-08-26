#> Initial session time checks
scoreboard objectives add foll_session_time dummy
scoreboard objectives add foll_session_running dummy
scoreboard objectives add foll_initialized dummy

#This only resets session time if the foll_session_running is false
#Meant to catch server crashes so that a session may be resumed partway.
execute if score #foll_tracker foll_session_running matches 0 run scoreboard players set #foll_tracker foll_session_time -1
scoreboard players set #foll_tracker foll_session_running 0

# if initialized already, will not reset, otherwise will initiate this scoreboard variable
execute unless score #foll_tracker foll_initialized matches 1 run scoreboard players set #foll_tracker foll_initialized 0
execute if score #foll_tracker foll_initialized matches 0 run function foll_limited:setup_initial


summon armor_stand ~ ~ ~ {ShowArms:1b,Invulnerable:1b,NoGravity:1b,Tags:["foll_temp_spawn_marker"]}

execute store result score #foll_tracker foll_player_xpos run data get entity @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1] Pos[0] 64
execute store result score #foll_tracker foll_player_ypos run data get entity @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1] Pos[1] 64
execute store result score #foll_tracker foll_player_zpos run data get entity @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1] Pos[2] 64

scoreboard players set #foll_tracker foll_player_xrot 0
scoreboard players set #foll_tracker foll_player_yrot 0

kill @e[type=minecraft:armor_stand,tag=foll_temp_spawn_marker,limit=1]

