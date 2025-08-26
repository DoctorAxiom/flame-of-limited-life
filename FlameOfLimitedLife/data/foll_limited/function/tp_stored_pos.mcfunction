#> teleports the player to the location stored in the scoreboard

execute store result storage foll_limited:tmp posvar.xpos double 0.015625 run scoreboard players get @s foll_player_xpos
execute store result storage foll_limited:tmp posvar.ypos double 0.015625 run scoreboard players get @s foll_player_ypos
execute store result storage foll_limited:tmp posvar.zpos double 0.015625 run scoreboard players get @s foll_player_zpos

execute store result storage foll_limited:tmp posvar.xrot double 0.015625 run scoreboard players get @s foll_player_xrot
execute store result storage foll_limited:tmp posvar.yrot double 0.015625 run scoreboard players get @s foll_player_yrot

function foll_limited:dynamic_tpplayer with storage foll_limited:tmp posvar