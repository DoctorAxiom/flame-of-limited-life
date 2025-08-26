#> Short function to set starting life value prior to game start
# takes one input value in gameticks
# call with function foll_limited:set_starting_life {value: 576000}
# the number above is equal to 8 hours.

$scoreboard players set #foll_tracker foll_starting_life $(value)