#> Called as a particular player in order to consolidate kills and award/penalize time
# consolidates kills into good (rewardable) and bad(unrewardable) for each player
# @s should refer to one particular player
# 

scoreboard players set @s foll_player_badkilldetect 0
scoreboard players set @s foll_player_goodkilldetect 0

scoreboard players operation @s foll_player_badkilldetect += @s foll_claimaccident
scoreboard players operation @s foll_player_goodkilldetect += @s foll_claimkill

execute if score @s foll_claimkill matches 1.. run tellraw @a {text:"Note: ", color:"yellow", extra:[{selector:"@s", bold:true}, " is claiming a ", {text:"reward", color:"green", bold:true}, " for ", {score:{name:"@s", objective:"foll_claimkill"}, bold:true}, " undetected valid player kills."]}
execute if score @s foll_claimaccident matches 1.. run tellraw @a {text:"Note: ", color:"yellow", extra:[{selector:"@s", bold:true}, " is claiming a ", {text:"penalty", color:"red", bold:true}, " for ", {score:{name:"@s", objective:"foll_claimaccident"}, bold:true}, " undetected invalid player kills."]}

execute if score @s foll_player_lifetime >= #foll_tracker foll_yellow_life run scoreboard players operation @s foll_player_badkilldetect += @s foll_player_dkgreenkilldetect
execute if score @s foll_player_lifetime < #foll_tracker foll_yellow_life run scoreboard players operation @s foll_player_goodkilldetect += @s foll_player_dkgreenkilldetect

execute if score @s foll_player_lifetime >= #foll_tracker foll_red_life run scoreboard players operation @s foll_player_badkilldetect += @s foll_player_greenkilldetect
execute if score @s foll_player_lifetime >= #foll_tracker foll_red_life run scoreboard players operation @s foll_player_badkilldetect += @s foll_player_yellowkilldetect
execute if score @s foll_player_lifetime >= #foll_tracker foll_red_life run scoreboard players operation @s foll_player_badkilldetect += @s foll_player_redkilldetect

execute if score @s foll_player_lifetime < #foll_tracker foll_red_life run scoreboard players operation @s foll_player_goodkilldetect += @s foll_player_greenkilldetect
execute if score @s foll_player_lifetime < #foll_tracker foll_red_life run scoreboard players operation @s foll_player_goodkilldetect += @s foll_player_yellowkilldetect
execute if score @s foll_player_lifetime < #foll_tracker foll_red_life run scoreboard players operation @s foll_player_goodkilldetect += @s foll_player_redkilldetect

#if the player is the boogeyman, there are no bad kills, and we won't end up using the badkill score at all so we set it to 0
execute if entity @s[tag=foll-boogeyman] run scoreboard players operation @s foll_player_goodkilldetect += @s foll_player_badkilldetect
execute if entity @s[tag=foll-boogeyman] run scoreboard players set @s foll_player_badkilldetect 0

# tellraw @s {text:"Badkills: " , extra:[{score: {name: "*", objective: "foll_player_badkilldetect"}}] }
# tellraw @s {text:"Goodkills: " , extra:[{score: {name: "*", objective: "foll_player_goodkilldetect"}}] }

#the #foll_tracker goodkilldetect and badkilldetect are used to store calculated reward/penalty lifetime amounts.
scoreboard players operation #foll_2tracker foll_player_goodkilldetect = #foll_tracker foll_kill_reward
scoreboard players operation #foll_2tracker foll_player_badkilldetect = #foll_tracker foll_kill_penalty
scoreboard players operation #foll_2tracker foll_player_goodkilldetect *= @s foll_player_goodkilldetect
scoreboard players operation #foll_2tracker foll_player_badkilldetect *= @s foll_player_badkilldetect

# tellraw @s {text:"Calculated penalty: " , extra:[{score: {name: "#foll_2tracker", objective: "foll_player_badkilldetect"}}] }
# tellraw @s {text:"calculated reward: " , extra:[{score: {name: "#foll_2tracker", objective: "foll_player_goodkilldetect"}}] }

#boogey kill checks.
execute if entity @s[tag=foll-boogeyman, scores={foll_player_goodkilldetect=1..}] run scoreboard players operation #foll_2tracker foll_player_goodkilldetect *= #foll_tracker foll_boogey_multiplier
execute if entity @s[tag=foll-boogeyman, scores={foll_player_goodkilldetect=1..}] store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_2tracker foll_player_goodkilldetect
execute if entity @s[tag=foll-boogeyman, scores={foll_player_goodkilldetect=1..}] run data modify storage foll_limited:tmp lifetimevar.subtitle set value "You are no longer a Boogeyman!"
execute if entity @s[tag=foll-boogeyman, scores={foll_player_goodkilldetect=1..}] run function foll_limited:lifetime_reward_unit with storage foll_limited:tmp lifetimevar

#add goodkill reward and subtract badkill penalties to get a final amount
scoreboard players operation #foll_2tracker foll_player_lifetime = #foll_2tracker foll_player_goodkilldetect
scoreboard players operation #foll_2tracker foll_player_lifetime -= #foll_2tracker foll_player_badkilldetect

# execute store result storage foll_limited:tmp debug int 1 run scoreboard players get #2foll_tracker foll_player_lifetime
# tellraw @s {text:"Final tick change: " , extra:[{type:"nbt", nbt:"debug", storage:"foll_limited:tmp"}] }

execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=0}] store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_2tracker foll_player_lifetime
execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=0}] run data modify storage foll_limited:tmp lifetimevar.subtitle set value "Valid player kill!"
execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=0}] run function foll_limited:lifetime_reward_unit with storage foll_limited:tmp lifetimevar

execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=0, foll_player_badkilldetect=1..}] store result storage foll_limited:tmp lifetimevar.ticks int -1 run scoreboard players get #foll_2tracker foll_player_lifetime
execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=0, foll_player_badkilldetect=1..}] run data modify storage foll_limited:tmp lifetimevar.subtitle set value "Invalid player kill!"
execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=0, foll_player_badkilldetect=1..}] run function foll_limited:lifetime_penalize_unit with storage foll_limited:tmp lifetimevar

# execute store result storage foll_limited:tmp debug int 1 run scoreboard players get #foll_2tracker foll_player_lifetime
# tellraw @s {text:"How about now?: " , extra:[{type:"nbt", nbt:"debug", storage:"foll_limited:tmp"}] }

# execute if score #foll_2tracker foll_player_lifetime matches ..-1 run tellraw @s "tickchange is negative!"
# execute if score #foll_2tracker foll_player_lifetime matches 0.. run tellraw @s "tickchange is positive!"

execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=1..}] run data modify storage foll_limited:tmp lifetimevar.subtitle set value "Simultaneous valid+invalid kills!"

execute if score #foll_2tracker foll_player_lifetime matches ..-1 as @s run execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=1..}] store result storage foll_limited:tmp lifetimevar.ticks int -1 run scoreboard players get #foll_2tracker foll_player_lifetime
execute if score #foll_2tracker foll_player_lifetime matches ..-1 as @s run execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=1..}] run function foll_limited:lifetime_penalize_unit with storage foll_limited:tmp lifetimevar

execute if score #foll_2tracker foll_player_lifetime matches 0.. as @s run execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=1..}] store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_2tracker foll_player_lifetime
execute if score #foll_2tracker foll_player_lifetime matches 0.. as @s run execute if entity @s[tag=!foll-boogeyman, scores={foll_player_goodkilldetect=1.., foll_player_badkilldetect=1..}] run function foll_limited:lifetime_reward_unit with storage foll_limited:tmp lifetimevar


# We can only remove this tag at the very end because we use it to filter all the other players.
execute if entity @s[tag=foll-boogeyman, scores={foll_player_goodkilldetect=1..}] run tag @s remove foll-boogeyman