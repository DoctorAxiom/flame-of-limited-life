
#> Gamemode checks
execute as @a run gamemode survival

#> Convert the number of ticks to hours, minutes, seconds
execute as @a run scoreboard players operation @s foll_player_lifetime_s = @s foll_player_lifetime

execute as @a run scoreboard players operation @s foll_player_lifetime_s /= #foll_tracker foll_20_const
execute as @a run scoreboard players operation @s foll_player_lifetime_m = @s foll_player_lifetime_s
execute as @a run scoreboard players operation @s foll_player_lifetime_s %= #foll_tracker foll_60_const

execute as @a run scoreboard players operation @s foll_player_lifetime_m /= #foll_tracker foll_60_const
execute as @a run scoreboard players operation @s foll_player_lifetime_h = @s foll_player_lifetime_m
execute as @a run scoreboard players operation @s foll_player_lifetime_m %= #foll_tracker foll_60_const

execute as @a run scoreboard players operation @s foll_player_lifetime_h /= #foll_tracker foll_60_const

#> Display player actionbar with remaining time
execute as @a run execute if score @s foll_player_lifetime_s matches 0..9 if score @s foll_player_lifetime_m matches 0..9 run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}}, ":", {text:"0", color:"yellow"}, {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {text:"0", color:"red"}, {score: {name: "*", objective: "foll_player_lifetime_s"}} ]
execute as @a run execute if score @s foll_player_lifetime_s matches 10.. if score @s foll_player_lifetime_m matches 0..9 run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}}, ":", {text:"0", color:"yellow"}, {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {score: {name: "*", objective: "foll_player_lifetime_s"}} ]
execute as @a run execute if score @s foll_player_lifetime_s matches 0..9 if score @s foll_player_lifetime_m matches 10.. run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}},":", {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {text:"0", color:"red"}, {score: {name: "*", objective: "foll_player_lifetime_s"}} ]
execute as @a run execute if score @s foll_player_lifetime_s matches 10.. if score @s foll_player_lifetime_m matches 10.. run title @s actionbar ["Lifetime: ", {score: {name: "*", objective: "foll_player_lifetime_h"}},":", {score: {name: "*", objective: "foll_player_lifetime_m"}}, ":", {score: {name: "*", objective: "foll_player_lifetime_s"}} ]

#> Change player team suffix to reflect remaining time
execute as @a run function foll_limited:lifetimetagloop

#> Decrement 1 each tick from the player lifetime
scoreboard players remove @a foll_player_lifetime 1

#> Store player position
execute as @a run function foll_limited:store_player_pos