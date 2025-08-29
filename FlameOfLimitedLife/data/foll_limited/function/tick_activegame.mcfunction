#> This function is run every tick when the game is active
#> Gamemode checks
execute as @a[tag=foll-limited-player, tag=!foll-ghost] run gamemode survival
execute as @a[tag=foll-limited-player, tag=foll-ghost] run gamemode spectator 
execute as @a[tag=!foll-limited-player] run gamemode spectator

#> Convert the number of ticks to hours, minutes, seconds
execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_s = @s foll_player_lifetime

execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_s /= #foll_tracker foll_20_const
execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_m = @s foll_player_lifetime_s
execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_s %= #foll_tracker foll_60_const

execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_m /= #foll_tracker foll_60_const
execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_h = @s foll_player_lifetime_m
execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_m %= #foll_tracker foll_60_const

execute as @a[tag=foll-limited-player] run scoreboard players operation @s foll_player_lifetime_h /= #foll_tracker foll_60_const

#> Display player actionbar with remaining time
execute as @a[tag=foll-limited-player] run execute if score @s foll_player_lifetime_s matches 0..9 if score @s foll_player_lifetime_m matches 0..9 run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}}, ":", {text:"0", color:"yellow"}, {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {text:"0", color:"red"}, {score: {name: "*", objective: "foll_player_lifetime_s"}} ]
execute as @a[tag=foll-limited-player] run execute if score @s foll_player_lifetime_s matches 10.. if score @s foll_player_lifetime_m matches 0..9 run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}}, ":", {text:"0", color:"yellow"}, {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {score: {name: "*", objective: "foll_player_lifetime_s"}} ]
execute as @a[tag=foll-limited-player] run execute if score @s foll_player_lifetime_s matches 0..9 if score @s foll_player_lifetime_m matches 10.. run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}},":", {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {text:"0", color:"red"}, {score: {name: "*", objective: "foll_player_lifetime_s"}} ]
execute as @a[tag=foll-limited-player] run execute if score @s foll_player_lifetime_s matches 10.. if score @s foll_player_lifetime_m matches 10.. run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}},":", {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {score: {name: "*", objective: "foll_player_lifetime_s"}} ]

#> Change player team suffix to reflect remaining time
execute as @a[tag=foll-limited-player] run function foll_limited:lifetimetagloop

#> Store player position
execute as @a[tag=foll-limited-player] run function foll_limited:store_player_pos

#> Ghost effects
execute as @a[tag=foll-limited-player, tag=foll-ghost] at @s run particle minecraft:ominous_spawning ~ ~1.5 ~ 0.2 0.2 0.2 0.2 1 force

#> Detect player deaths
execute as @a[tag=foll-limited-player, scores={foll_player_deathdetect=1..}] run function foll_limited:event_deathdetect

#> Detect player kills
execute as @a[tag=foll-limited-player, tag=!foll-ghost] run function foll_limited:tick_killdetect

#> Reset all detection scores to 0
scoreboard players set @a[tag=foll-limited-player] foll_player_deathdetect 0

scoreboard players set @a[tag=foll-limited-player] foll_player_dkgreenkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_greenkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_yellowkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_redkilldetect 0

scoreboard players set @a[tag=foll-limited-player] foll_player_mobkilldetect 0


#> Reset triggers
execute as @a[tag=foll-limited-player] if score @s foll_opmenu matches 1.. run scoreboard players set @s foll_opmenu 0
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


#> Decrement 1 each tick from the player lifetime
# and also catch any scores set below 0
# detect new deaths and set player as ghost

scoreboard players remove @a[tag=foll-limited-player, scores={foll_player_lifetime=1..}] foll_player_lifetime 1
execute as @a[tag=foll-limited-player, tag=!foll-ghost, scores={foll_player_lifetime=..0}] run function foll_limited:event_outoflifetime
scoreboard players set @a[tag=foll-limited-player, scores={foll_player_lifetime=..0}] foll_player_lifetime 0