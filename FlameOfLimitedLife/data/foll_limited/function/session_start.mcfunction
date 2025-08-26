#> Function to call to start a session

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run say "You must run function foll_limited:setup_initial before running any other functions."
execute if score #foll_tracker foll_initialized matches 0 run return 0

#if this is the first session this will add the foll-has-started tag to everyone.
tag @a[tag=foll-limited-player] add foll-has-started

scoreboard players set #foll_tracker foll_session_time 0
function foll_limited:session_unpause