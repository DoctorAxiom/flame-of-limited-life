#> inactive game tick

execute as @a run gamemode spectator

#Pull any updated values into player stats, but ignores players if they've already started a session
execute as @a[tag=foll-limited-player, tag=!foll-has-started] run scoreboard players operation @s foll_player_lifetime = #foll_tracker foll_starting_life