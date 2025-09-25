#> A version of lifetime reward that automatically generates the title
# Takes two inputs subtitle and ticks
# subtitle should be a short description and will be displayed as the subtitle.
# ticks is the number of ticks to reward the player
# - in this case this function prepends a "+" and appends an appropriate unit

scoreboard players set #foll_tracker foll_player_lifetime 0

$execute if score #foll_tracker foll_player_lifetime matches $(ticks) run return 0

$scoreboard players set #foll_tracker foll_player_lifetime $(ticks)

scoreboard players operation #foll_tracker foll_player_lifetime_s = #foll_tracker foll_player_lifetime

scoreboard players operation #foll_tracker foll_player_lifetime_s /= #foll_tracker foll_20_const
scoreboard players operation #foll_tracker foll_player_lifetime_m = #foll_tracker foll_player_lifetime_s
scoreboard players operation #foll_tracker foll_player_lifetime_s %= #foll_tracker foll_60_const

scoreboard players operation #foll_tracker foll_player_lifetime_m /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker foll_player_lifetime_h = #foll_tracker foll_player_lifetime_m
scoreboard players operation #foll_tracker foll_player_lifetime_m %= #foll_tracker foll_60_const

scoreboard players operation #foll_tracker foll_player_lifetime_h /= #foll_tracker foll_60_const

$data modify storage foll_limited:tmp lifetimevar.ticks set value $(ticks)
$data modify storage foll_limited:tmp lifetimevar.subtitle set value "$(subtitle)"
data modify storage foll_limited:tmp lifetimevar.h set value ""
data modify storage foll_limited:tmp lifetimevar.hunit set value ""
data modify storage foll_limited:tmp lifetimevar.m set value ""
data modify storage foll_limited:tmp lifetimevar.munit set value ""
data modify storage foll_limited:tmp lifetimevar.s set value ""
data modify storage foll_limited:tmp lifetimevar.sunit set value ""

execute if score #foll_tracker foll_player_lifetime_h matches 1.. store result storage foll_limited:tmp lifetimevar.h int 1 run scoreboard players get #foll_tracker foll_player_lifetime_h
execute if score #foll_tracker foll_player_lifetime_h matches 1.. run data modify storage foll_limited:tmp lifetimevar.hunit set value "h"

execute if score #foll_tracker foll_player_lifetime_m matches 1.. store result storage foll_limited:tmp lifetimevar.m int 1 run scoreboard players get #foll_tracker foll_player_lifetime_m
execute if score #foll_tracker foll_player_lifetime_m matches 1.. run data modify storage foll_limited:tmp lifetimevar.munit set value "m"

execute if score #foll_tracker foll_player_lifetime_s matches 1.. store result storage foll_limited:tmp lifetimevar.s int 1 run scoreboard players get #foll_tracker foll_player_lifetime_s
execute if score #foll_tracker foll_player_lifetime_s matches 1.. run data modify storage foll_limited:tmp lifetimevar.sunit set value "s"

execute if score #foll_tracker foll_player_lifetime matches 0..19 store result storage foll_limited:tmp lifetimevar.s int 5 run scoreboard players get #foll_tracker foll_player_lifetime
execute if score #foll_tracker foll_player_lifetime matches 0..19 run data modify storage foll_limited:tmp lifetimevar.munit set value "."
execute if score #foll_tracker foll_player_lifetime matches 0..1 run data modify storage foll_limited:tmp lifetimevar.munit set value ".0"
execute if score #foll_tracker foll_player_lifetime matches 0..19 run data modify storage foll_limited:tmp lifetimevar.sunit set value "s"

function foll_limited:lifetime_reward_hms with storage foll_limited:tmp lifetimevar
