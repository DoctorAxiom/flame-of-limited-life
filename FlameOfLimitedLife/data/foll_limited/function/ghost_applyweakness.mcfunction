#> Processes whether weakness should be applied to a player being spectated
# Should be executed once as each player who is a ghost.

#Toggle if player has triggered the toggle.
execute if score @s foll_weaknesstoggle matches 1.. if score @s foll_applyingweakness matches 0 run scoreboard players set #foll_tracker2 foll_applyingweakness 1
execute if score @s foll_weaknesstoggle matches 1.. if score @s foll_applyingweakness matches 1 run scoreboard players set #foll_tracker2 foll_applyingweakness 0
execute if score @s foll_weaknesstoggle matches 1.. run scoreboard players operation @s foll_applyingweakness = #foll_tracker2 foll_applyingweakness

#> Apply weakness to any player at 0 distance which means you are spectating that player
execute if score @s foll_applyingweakness matches 1 at @s as @a[tag=foll-limited-player,tag=!foll-ghost,distance=0,limit=1] run effect give @s minecraft:resistance 1 3