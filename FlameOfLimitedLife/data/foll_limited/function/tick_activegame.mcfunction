
#> Gamemode checks
execute as @a[tag=foll-limited-player] run gamemode survival
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

#> Detect player deaths
execute as @a[tag=foll-limited-player, scores={foll_player_deathdetect=1..}] run function foll_limited:event_deathdetect

#> Reset all detection scores to 0
scoreboard players set @a[tag=foll-limited-player] foll_player_deathdetect 0

scoreboard players set @a[tag=foll-limited-player] foll_player_dkgreenkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_greenkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_yellowkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_redkilldetect 0

scoreboard players set @a[tag=foll-limited-player] foll_player_mobkilldetect 0


#> Decrement 1 each tick from the player lifetime
# and also catch any scores set below 0
scoreboard players remove @a[tag=foll-limited-player, scores={foll_player_lifetime=1..}] foll_player_lifetime 1
scoreboard players set @a[tag=foll-limited-player, scores={foll_player_lifetime=..0}] foll_player_lifetime 0