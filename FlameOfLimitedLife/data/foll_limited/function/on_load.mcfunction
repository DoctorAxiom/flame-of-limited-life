#> Initial session time checks
scoreboard objectives add foll_session_time dummy
scoreboard objectives add foll_session_running dummy
scoreboard objectives add foll_initialized dummy

#This only resets session time if the foll_session_running is false
#Meant to catch server crashes so that a session may be resumed partway.
execute if score #foll_tracker foll_session_running matches 0 run scoreboard players set #foll_tracker foll_session_time -1
scoreboard players set #foll_tracker foll_session_running 0

# if initialized already, will not reset, otherwise will initiate this scoreboard variable
execute if score #foll_tracker foll_initialized matches 1 run return 0
scoreboard players set #foll_tracker foll_initialized 0
function foll_limited:setup_initial

