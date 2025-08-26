#> The base function that gets called every tick for foll

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run return 0

execute if score #foll_tracker foll_session_running matches 1.. run function foll_limited:tick_activegame
execute if score #foll_tracker foll_session_running matches 0 run function foll_limited:tick_inactivegame

execute as @a[tag=!foll-limited-player] run title @s times 0 10 0
execute as @a[tag=!foll-limited-player] run title @s subtitle {text:"Ask an op to run setup_players", color:"aqua"}
execute as @a[tag=!foll-limited-player] run title @s title {text:"You are not set-up!", color:"yellow"}