#> Processes whether resistance should be applied to a player being spectated
# Should be executed once as each player who is a ghost.

#Toggle if player has triggered the toggle.
execute if score @s foll_resistancetoggle matches 1 if score @s foll_applyingresistance matches 0 run scoreboard players set @s foll_applyingresistance 1
execute if score @s foll_resistancetoggle matches 1 if score @s foll_applyingresistance matches 1 run scoreboard players set @s foll_applyingresistance 0

#> Fill hunger of any player that is at 0 distance which means you are spectating that player
execute if score @s foll_applyingresistance matches 1 at @s as @a[tag=foll-limited-player,tag=!foll-ghost,distance=0,limit=1] run effect give @s minecraft:resistance 1 3