#> Function to call to end an active session

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run say "You must run function foll_limited:setup_initial before running any other functions."
execute if score #foll_tracker foll_initialized matches 0 run return 0

#> Broadcast session end message
tellraw @a {text:"Session has ended!", bold: true, color: "yellow"}

#> set session not running
function foll_limited:session_pause
scoreboard players set #foll_tracker foll_session_time -1