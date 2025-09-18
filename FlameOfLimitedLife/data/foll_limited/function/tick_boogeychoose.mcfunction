#> All the boogeyman notification functions go here. The actual assigning of boogeymen should go in event_boogeychoose



#> Determine time till boogeychoose
# foll_boogey_choosing_delay - (foll_session_duration - foll_session_time)
# = foll_session_time + foll_boogey_choosing_delay - foll_session_duration
# this value will be stored in #foll_tracker3 foll_session_time and is a tick countdown to boogey choosing time.
scoreboard players operation #foll_tracker3 foll_session_time = #foll_tracker foll_session_time
scoreboard players operation #foll_tracker3 foll_session_time -= #foll_tracker foll_session_duration
scoreboard players operation #foll_tracker3 foll_session_time += #foll_tracker foll_boogey_choosing_delay

execute if score #foll_tracker3 foll_session_time matches 12000 run tellraw @a [{text:"Boogeymen will be chosen in ", color:"white"}, {text:"10 minutes", color:"yellow", bold:true}]
execute if score #foll_tracker3 foll_session_time matches 6000 run tellraw @a [{text:"Boogeymen will be chosen in ", color:"white"}, {text:"5 minutes", color:"yellow", bold:true}]
execute if score #foll_tracker3 foll_session_time matches 1200 run tellraw @a [{text:"Boogeymen will be chosen in ", color:"white"}, {text:"1 minute", color:"yellow", bold:true}]
execute if score #foll_tracker3 foll_session_time matches 300 run tellraw @a [{text:"Boogeymen will be chosen in ", color:"white"}, {text:"15 seconds", color:"yellow", bold:true}]

execute if score #foll_tracker3 foll_session_time matches 112 as @a[tag=foll-limited-player] run function foll_limited:event_boogeyfinalcountdown {num:"3"}
execute if score #foll_tracker3 foll_session_time matches 92 as @a[tag=foll-limited-player] run function foll_limited:event_boogeyfinalcountdown {num:"2"}
execute if score #foll_tracker3 foll_session_time matches 72 as @a[tag=foll-limited-player] run function foll_limited:event_boogeyfinalcountdown {num:"1"}
execute if score #foll_tracker3 foll_session_time matches 52 as @a[tag=foll-limited-player] run function foll_limited:event_boogeyprereveal

#> exit without storage modification unless within these two ticks.
execute if score #foll_tracker3 foll_session_time matches 2.. run return 0
execute if score #foll_tracker3 foll_session_time matches ..-1 run return 0

execute store result storage foll_limited:tmp boogeyvar.boogeynumber int 1 run scoreboard players get #foll_tracker foll_number_of_boogeymen
execute store result storage foll_limited:tmp boogeyvar.redlife int 1 run scoreboard players get #foll_tracker foll_red_life
execute if score #foll_tracker3 foll_session_time matches 1 run function foll_limited:event_boogeychoose with storage foll_limited:tmp boogeyvar

execute if score #foll_tracker3 foll_session_time matches 0 as @a[tag=foll-limited-player] run function foll_limited:event_boogeyreveal