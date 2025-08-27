#> Called as a particular player who has a death detected.
# @s must refer to the player who just had the detected death.

scoreboard players operation #foll_tracker foll_player_lifetime = #foll_tracker foll_death_penalty

execute store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_tracker foll_player_lifetime
data modify storage foll_limited:tmp lifetimevar.subtitle set value "for dying"

function foll_limited:lifetime_penalize_unit with storage foll_limited:tmp lifetimevar