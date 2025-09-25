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
execute as @a[tag=foll-limited-player, tag=foll-ghost] at @s anchored eyes positioned ^ ^ ^ run function foll_limited:ghost_effects

#> Ghost abilities
execute as @a[tag=foll-limited-player, tag=foll-ghost] at @s run function foll_limited:ghost_spawnwindcharge

#> Detect player mob kills
execute as @a[tag=foll-limited-player, scores={foll_player_mobkilldetect=1..}] run function foll_limited:event_mobkill

#> Detect player deaths
execute as @a[tag=foll-limited-player, scores={foll_player_deathdetect=1..}] run function foll_limited:event_deathdetect

#> Detect player kills
execute as @a[tag=foll-limited-player, tag=!foll-ghost] run function foll_limited:tick_killdetect

#> Choose Boogeymen as appropriate
function foll_limited:tick_boogeychoose

#> Cure boogeymen who have dropped to red life (executes after player kill detect for last second kills.)
execute as @a[tag=foll-limited-player, tag=foll-boogeyman] run execute if score @s foll_player_lifetime < #foll_tracker foll_red_life run function foll_limited:event_boogeyredclear

#> Reset all detection scores to 0
scoreboard players set @a[tag=foll-limited-player] foll_player_deathdetect 0

scoreboard players set @a[tag=foll-limited-player] foll_player_dkgreenkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_greenkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_yellowkilldetect 0
scoreboard players set @a[tag=foll-limited-player] foll_player_redkilldetect 0

scoreboard players set @a[tag=foll-limited-player] foll_player_mobkilldetect 0


#> Decrement 1 each tick from the player lifetime
# and also catch any scores set below 0
# detect new deaths and set player as ghost

scoreboard players remove @a[tag=foll-limited-player, scores={foll_player_lifetime=1..}] foll_player_lifetime 1
execute as @a[tag=foll-limited-player, tag=!foll-ghost, scores={foll_player_lifetime=..0}] run function foll_limited:event_outoflifetime
scoreboard players set @a[tag=foll-limited-player, scores={foll_player_lifetime=..0}] foll_player_lifetime 0

#> Decrement 1 each tick from session time, broadcast messages for low times.
execute if score #foll_tracker foll_session_time matches 72000 run tellraw @a {text:"1h remaining in this session.", color:"yellow", bold:true}
execute if score #foll_tracker foll_session_time matches 36000 run tellraw @a {text:"30m remaining in this session.", color:"yellow", bold:true}
execute if score #foll_tracker foll_session_time matches 12000 run tellraw @a {text:"10m remaining in this session.", color:"yellow", bold:true}
execute if score #foll_tracker foll_session_time matches 6000 run tellraw @a {text:"5m remaining in this session.", color:"yellow", bold:true}
execute if score #foll_tracker foll_session_time matches 1200 run tellraw @a {text:"1m remaining in this session!", color:"yellow", bold:true}
execute if score #foll_tracker foll_session_time matches 200 run tellraw @a {text:"10 SECONDS REMAIN THIS SESSION!", color:"red", bold:true}
execute if score #foll_tracker foll_session_time matches 100 run tellraw @a {text:"5s to session end.", color:"red", bold:true}
execute if score #foll_tracker foll_session_time matches 80 run tellraw @a {text:"4s to session end.", color:"red", bold:true}
execute if score #foll_tracker foll_session_time matches 60 run tellraw @a {text:"3s to session end.", color:"red", bold:true}
execute if score #foll_tracker foll_session_time matches 40 run tellraw @a {text:"2s to session end.", color:"red", bold:true}
execute if score #foll_tracker foll_session_time matches 20 run tellraw @a {text:"1s to session end.", color:"red", bold:true}

execute if score #foll_tracker foll_session_time matches 0.. run scoreboard players remove #foll_tracker foll_session_time 1

#> end session if time is out.
execute if score #foll_tracker foll_session_time matches ..-1 run function foll_limited:session_end