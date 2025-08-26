#> Short function to set yellow life threshold prior to game start
# takes one input value in gameticks
# e.g. call with function foll_limited:set_yellow_life {value: 288000}
# the number above is equal to 4 hours.

$scoreboard players set #foll_tracker foll_yellow_life $(value)