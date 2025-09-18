#> Called as each player who failed boogey in order to decrement time as penalty.
# Boogeymen can at most drop to red life. We don't want to outright kill anyone for failing boogey.

tag @s remove foll-boogeyman

scoreboard players operation #foll_tracker3 foll_player_lifetime = #foll_tracker foll_kill_penalty
scoreboard players operation #foll_tracker3 foll_player_lifetime *= #foll_tracker foll_boogey_multiplier

scoreboard players operation #foll_tracker2 foll_player_lifetime = @s foll_player_lifetime
scoreboard players operation #foll_tracker2 foll_player_lifetime -= #foll_tracker foll_red_life

# if the penalty would bring the player to less than the red life threshold, instead just bring
# them to the red life threshold.
scoreboard players operation #foll_tracker3 foll_player_lifetime < #foll_tracker2 foll_player_lifetime

execute store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_tracker3 foll_player_lifetime
data modify storage foll_limited:tmp lifetimevar.subtitle set value "Consumed by the boogeyman curse!"

function foll_limited:lifetime_penalize_unit with storage foll_limited:tmp lifetimevar
