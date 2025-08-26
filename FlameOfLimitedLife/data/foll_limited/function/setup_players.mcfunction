#> The function to call to register current players and set up teams.

#this tag will be referred to to get all registered players in the on_tick function and subfunctions.
tag @a add foll-limited-player

# Set default location of all players when game starts to be the spawn location
scoreboard players operation @a foll_player_xpos = #foll_tracker foll_player_xpos
scoreboard players operation @a foll_player_ypos = #foll_tracker foll_player_ypos
scoreboard players operation @a foll_player_zpos = #foll_tracker foll_player_zpos

scoreboard players operation @a foll_player_xrot = #foll_tracker foll_player_xrot
scoreboard players operation @a foll_player_yrot = #foll_tracker foll_player_yrot


#This part dynamically creates a new team for each player currently on the server, and then adds them to that team.
scoreboard players set #foll_tracker foll_teamloop_index 0

execute as @a run function foll_limited:setup_team_loop