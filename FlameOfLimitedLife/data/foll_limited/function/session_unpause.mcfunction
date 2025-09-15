#> Function to call to unpause an already started paused session

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run say "You must run function foll_limited:setup_initial before running any other functions."
execute if score #foll_tracker foll_initialized matches 0 run return 0

#> Catch if this session has not yet been started
execute if score #foll_tracker foll_session_time matches -1 run dialog show @s {type:"minecraft:notice",title:"There is no current paused session to unpause.",yes:{label:"OK"}}
execute if score #foll_tracker foll_session_time matches -1 run return fail

#> Set session as running again.
scoreboard players set #foll_tracker foll_session_running 1

#> TP all players to their previous locations when the game was last running.
execute as @a run function foll_limited:tp_stored_pos

#>Resume daytime and weather progression
gamerule doDaylightCycle true
gamerule doWeatherCycle true