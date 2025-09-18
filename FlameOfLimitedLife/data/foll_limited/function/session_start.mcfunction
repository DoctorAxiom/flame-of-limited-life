#> Function to call to start a session

#> Catch if not initiated yet
execute if score #foll_tracker foll_initialized matches 0 run return 0

#> Catch if already started
execute unless score #foll_tracker foll_session_time matches -1 run dialog show @s {type:"minecraft:notice",title:"Current session was ALREADY STARTED. This function will do nothing.",yes:{label:"OK"}}
execute unless score #foll_tracker foll_session_time matches -1 run return fail

#if this is the first session this will add the foll-has-started tag to everyone.
tag @a[tag=foll-limited-player] add foll-has-started

tellraw @a {text:"Session has started!", bold: true, color: "yellow"}

scoreboard players operation #foll_tracker foll_session_time = #foll_tracker foll_session_duration
function foll_limited:session_unpause

execute as @a[tag=foll-limited-player, tag=foll-boogeyman] run function foll_limited:event_boogeyfail