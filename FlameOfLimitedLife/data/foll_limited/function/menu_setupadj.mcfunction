#> the function to call to show the setup adj menu.
# This autopopulates the setupadjvar with a list of current players as well as multiple outtemp vars

setblock ~ -64 ~ minecraft:barrel{Items:[]}
data modify storage foll_limited:tmp setupadjvar.playerlist set value []

execute as @a[tag=foll-limited-player] positioned ~ ~ ~ run function foll_limited:dynamic_appendplayerlist

data modify storage foll_limited:tmp setupadjvar.outtemptarget set value "$(targetinput)"
data modify storage foll_limited:tmp setupadjvar.outtemplifeticks set value "{subtitle:\\\"Manually adjusted by Operator\\\", ticks:$(valueinput)}"
data modify storage foll_limited:tmp setupadjvar.outtempsessionticks set value "$(valueinput)"

function foll_limited:menu_setupadj_display with storage foll_limited:tmp setupadjvar