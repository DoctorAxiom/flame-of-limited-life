#> Stores the player's position in corresponding scoreboard
execute store result score @s foll_player_xpos run data get entity @s Pos[0] 64
execute store result score @s foll_player_ypos run data get entity @s Pos[1] 64
execute store result score @s foll_player_zpos run data get entity @s Pos[2] 64

execute store result score @s foll_player_xrot run data get entity @s Rotation[0] 64
execute store result score @s foll_player_yrot run data get entity @s Rotation[1] 64