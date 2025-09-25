#> Fills the hunger of a player you are spectating
# Should be executed once as each player who is a ghost.

#> exit if the player has not triggered a fill hunger
execute if score @s foll_refill_hunger matches 0 run return 0
#otherwise, continue on

#> exit if the player is not a ghost
execute if entity @s[tag=!foll-ghost] run tellraw @s {text:"You cannot use this ability if you are not a ghost!",color:"red"}
execute if entity @s[tag=!foll-ghost] run return 0
#otherwise continue on

#> Fill hunger of any player that is at 0 distance which means you are spectating that player
execute as @a[tag=foll-limited-player,tag=!foll-ghost,distance=0,limit=1] run effect give @s minecraft:saturation 1 63