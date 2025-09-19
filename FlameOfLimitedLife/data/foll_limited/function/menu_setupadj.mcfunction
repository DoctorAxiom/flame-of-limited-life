#> the function to call to show the setup adj menu.
# This autopopulates the setupadjvar with a list of current players as well as a outtemp var.

setblock ~ -64 ~ minecraft:barrel{Items:[]}
data modify storage foll_limited:tmp setupadjvar.playerlist set value []

execute as @a[tag=foll-limited-player] positioned ~ ~ ~ run function foll_limited:dynamic_appendplayerlist

data modify storage foll_limited:tmp setupadjvar.outtemp set value "tellraw @a \"Target is: $(targetinput)\""