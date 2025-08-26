#> The inside of a loop for each player
# The contents of this file are meant to be executed sequentially by an execute function as @a
# so that each player gets the @s which pulls their scoreboard info corresponding to their team.

execute store result storage foll_limited:tmp teamvar.teamname int 1 run scoreboard players get @s foll_teamloop_index

# pulls in hours, minutes, seconds into h, m, s structure which can be passed to dynamic_updateteam
execute store result storage foll_limited:tmp teamvar.h int 1 run scoreboard players get @s foll_player_lifetime_h

execute store result storage foll_limited:tmp teamvar.m int 1 run scoreboard players get @s foll_player_lifetime_m
execute if score @s foll_player_lifetime_m matches 0..9 run data modify storage foll_limited:tmp teamvar.mpad set value "0"
execute if score @s foll_player_lifetime_m matches 10.. run data modify storage foll_limited:tmp teamvar.mpad set value ""

execute store result storage foll_limited:tmp teamvar.s int 1 run scoreboard players get @s foll_player_lifetime_s
execute if score @s foll_player_lifetime_s matches 0..9 run data modify storage foll_limited:tmp teamvar.spad set value "0"
execute if score @s foll_player_lifetime_s matches 10.. run data modify storage foll_limited:tmp teamvar.spad set value ""

data modify storage foll_limited:tmp teamvar.color set value "green"
execute if score @s foll_player_lifetime < #foll_tracker foll_yellow_life run data modify storage foll_limited:tmp teamvar.color set value "yellow"
execute if score @s foll_player_lifetime < #foll_tracker foll_red_life run data modify storage foll_limited:tmp teamvar.color set value "red"

function foll_limited:dynamic_updateteam with storage foll_limited:tmp teamvar