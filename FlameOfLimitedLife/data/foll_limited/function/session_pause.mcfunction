#> Function to call to pause an active session

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run say "You must run function foll_limited:setup_initial before running any other functions."
execute if score #foll_tracker foll_initialized matches 0 run return 0

#> set session running
scoreboard players set #foll_tracker foll_session_running 0