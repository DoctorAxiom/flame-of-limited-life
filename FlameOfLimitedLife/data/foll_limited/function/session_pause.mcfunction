#> Function to call to pause an active session

#> set session not running
scoreboard players set #foll_tracker foll_session_running 0

#>Stop daytime and weather from progressing
gamerule doDaylightCycle false
gamerule doWeatherCycle false