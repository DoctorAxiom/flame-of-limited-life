#> Initial session time checks
scoreboard objectives add foll_session_time dummy
scoreboard objectives add foll_session_running dummy
scoreboard objectives add foll_initialized dummy

#make sure session is not running
function foll_limited:session_pause

# if initialized already, will not reset, otherwise will initiate this scoreboard variable
execute if score #foll_tracker foll_initialized matches 1 run return 0

scoreboard players set #foll_tracker foll_initialized 0
function foll_limited:setup_initial

