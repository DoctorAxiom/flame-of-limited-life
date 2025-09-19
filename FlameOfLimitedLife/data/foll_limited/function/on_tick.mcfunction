#> The base function that gets called every tick for foll

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run return 0

#> Execute subfunction based on whether game is active or not.
execute if score #foll_tracker foll_session_running matches 1.. run function foll_limited:tick_activegame
execute if score #foll_tracker foll_session_running matches 0 run function foll_limited:tick_inactivegame

#> Detect opmenu
execute as @a run execute if score @s foll_opmenu matches 1.. run dialog show @s foll_limited:op_menu

#> Reset triggers
execute as @a if score @s foll_opmenu matches 1.. run scoreboard players set @s foll_opmenu 0
execute as @a[tag=foll-limited-player] if score @s foll_playermenu matches 1.. run scoreboard players set @s foll_playermenu 0

execute as @a[tag=foll-limited-player] if score @s foll_claimkill matches 1.. run scoreboard players set @s foll_claimkill 0
execute as @a[tag=foll-limited-player] if score @s foll_claimaccident matches 1.. run scoreboard players set @s foll_claimaccident 0

execute as @a[tag=foll-limited-player] if score @s foll_spawn_windcharge matches 1.. run scoreboard players set @s foll_spawn_windcharge 0
execute as @a[tag=foll-limited-player] if score @s foll_spawn_notchapple matches 1.. run scoreboard players set @s foll_spawn_notchapple 0
execute as @a[tag=foll-limited-player] if score @s foll_resistancetoggle matches 1.. run scoreboard players set @s foll_resistancetoggle 0
execute as @a[tag=foll-limited-player] if score @s foll_weaknesstoggle matches 1.. run scoreboard players set @s foll_weaknesstoggle 0

scoreboard players enable @a[tag=foll-limited-player] foll_opmenu
scoreboard players enable @a[tag=foll-limited-player] foll_playermenu

scoreboard players enable @a[tag=foll-limited-player] foll_claimkill
scoreboard players enable @a[tag=foll-limited-player] foll_claimaccident

scoreboard players enable @a[tag=foll-limited-player] foll_spawn_windcharge
scoreboard players enable @a[tag=foll-limited-player] foll_spawn_notchapple
scoreboard players enable @a[tag=foll-limited-player] foll_resistancetoggle
scoreboard players enable @a[tag=foll-limited-player] foll_weaknesstoggle

#> Display title to unregistered players.
execute as @a[tag=!foll-limited-player] run title @s times 0 10 0
execute as @a[tag=!foll-limited-player] run title @s subtitle {text:"Ask an op to run setup_players", color:"aqua"}
execute as @a[tag=!foll-limited-player] run title @s title {text:"You are not set-up!", color:"yellow"}

