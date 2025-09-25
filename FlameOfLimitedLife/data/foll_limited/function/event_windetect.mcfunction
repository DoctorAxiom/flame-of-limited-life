#> Detects a win and displays a message

execute if score #foll_tracker2 foll_alive_player_count matches 2 if score #foll_tracker foll_alive_player_count matches 1 as @a[tag=foll-limited-player,tag=!foll-ghost] run tellraw @a [{selector:"@s", bold:true, color:"green"}," has won the game!"]

execute if score #foll_tracker2 foll_alive_player_count matches 2.. if score #foll_tracker foll_alive_player_count matches 0 as @a[tag=foll-limited-player,gamemode=survival] run tellraw @a [{selector:"@s", bold:true, color:"green"}," has tied for win!"]


scoreboard players operation #foll_tracker2 foll_alive_player_count = #foll_tracker foll_alive_player_count