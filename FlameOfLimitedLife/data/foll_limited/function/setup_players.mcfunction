#> The function to call to register current players and set up teams.

tag @a add foll-limited-player

#This part dynamically creates a new team for each player currently on the server, and then adds them to that team.

scoreboard players set #foll_tracker foll_teamloop_index 0

execute as @a run function foll_limited:setup_team_loop