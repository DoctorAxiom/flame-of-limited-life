#Automatically calculates time from ticks to tell player in a message.
# takes 4 inputs - prefix, ticks, suffix, color.

$scoreboard players set #foll_calc foll_player_lifetime $(ticks)

scoreboard players operation #foll_calc foll_player_lifetime_s = #foll_calc foll_player_lifetime

scoreboard players operation #foll_calc foll_player_lifetime_s /= #foll_tracker foll_20_const
scoreboard players operation #foll_calc foll_player_lifetime_m = #foll_calc foll_player_lifetime_s
scoreboard players operation #foll_calc foll_player_lifetime_s %= #foll_tracker foll_60_const

scoreboard players operation #foll_calc foll_player_lifetime_m /= #foll_tracker foll_60_const
scoreboard players operation #foll_calc foll_player_lifetime_h = #foll_calc foll_player_lifetime_m
scoreboard players operation #foll_calc foll_player_lifetime_m %= #foll_tracker foll_60_const

scoreboard players operation #foll_calc foll_player_lifetime_h /= #foll_tracker foll_60_const

$data modify storage foll_limited:tmp tellvar.prefix set value "$(prefix)"
$data modify storage foll_limited:tmp tellvar.suffix set value "$(suffix)"
$data modify storage foll_limited:tmp tellvar.color set value "$(color)"

data modify storage foll_limited:tmp tellvar.h set value ""
data modify storage foll_limited:tmp tellvar.hunit set value ""
data modify storage foll_limited:tmp tellvar.m set value ""
data modify storage foll_limited:tmp tellvar.munit set value ""
data modify storage foll_limited:tmp tellvar.s set value ""
data modify storage foll_limited:tmp tellvar.sunit set value ""

execute if score #foll_calc foll_player_lifetime_h matches 1.. store result storage foll_limited:tmp tellvar.h int 1 run scoreboard players get #foll_calc foll_player_lifetime_h
execute if score #foll_calc foll_player_lifetime_h matches 1.. run data modify storage foll_limited:tmp tellvar.hunit set value "h"

execute if score #foll_calc foll_player_lifetime_m matches 1.. store result storage foll_limited:tmp tellvar.m int 1 run scoreboard players get #foll_calc foll_player_lifetime_m
execute if score #foll_calc foll_player_lifetime_m matches 1.. run data modify storage foll_limited:tmp tellvar.munit set value "m"

execute if score #foll_calc foll_player_lifetime_s matches 1.. store result storage foll_limited:tmp tellvar.s int 1 run scoreboard players get #foll_calc foll_player_lifetime_s
execute if score #foll_calc foll_player_lifetime_s matches 1.. run data modify storage foll_limited:tmp tellvar.sunit set value "s"

execute if score #foll_calc foll_player_lifetime matches 0..19 store result storage foll_limited:tmp tellvar.s int 5 run scoreboard players get #foll_calc foll_player_lifetime
execute if score #foll_calc foll_player_lifetime matches 0..19 run data modify storage foll_limited:tmp tellvar.munit set value "0."
execute if score #foll_calc foll_player_lifetime matches 0..1 run data modify storage foll_limited:tmp tellvar.munit set value "0.0"
execute if score #foll_calc foll_player_lifetime matches 0..19 run data modify storage foll_limited:tmp tellvar.sunit set value "s"

function foll_limited:tell_hms with storage foll_limited:tmp tellvar