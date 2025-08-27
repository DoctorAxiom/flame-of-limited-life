
data modify storage foll_limited:tmp lifetimevar.subtitle set value "For getting a difficult advancement"
execute store result storage foll_limited:tmp lifetimevar.ticks int 1 run scoreboard players get #foll_tracker foll_advancement_bigreward

function foll_limited:lifetime_reward_unit with storage foll_limited:tmp lifetimevar