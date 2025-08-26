#> This function is the inside of a loop in setup_teams
# it is meant to be called for each player so that @s refers to that player.

execute store result storage foll_limited:tmp teamvar.teamname int 1 run scoreboard players get #foll_tracker foll_teamloop_index

scoreboard players operation @s foll_teamloop_index = #foll_tracker foll_teamloop_index
function foll_limited:dynamic_createplayerteam with storage foll_limited:tmp teamvar

scoreboard players add #foll_tracker foll_teamloop_index 1