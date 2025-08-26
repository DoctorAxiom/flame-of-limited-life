#> Short function to set red life threshold prior to game start
# takes one input value in gameticks
# e.g. call with function foll_limited:set_red_life {value: 72000}
# the number above is equal to 1 hour1.

$scoreboard players set #foll_tracker foll_red_life $(value)