#> Called as a particular player who has a mobkill detected
# @s must refer to the player who just had the detected mobkill

scoreboard players operation #foll_2tracker foll_player_lifetime = #foll_tracker foll_mobkill_reward
scoreboard players operation #foll_2tracker foll_player_lifetime *= @s foll_player_mobkilldetect

execute store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_2tracker foll_player_lifetime
data modify storage foll_limited:tmp lifetimevar.subtitle set value "mob kill!"

function foll_limited:lifetime_reward_unit with storage foll_limited:tmp lifetimevar