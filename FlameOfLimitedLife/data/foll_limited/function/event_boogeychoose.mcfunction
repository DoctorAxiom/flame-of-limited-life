#> chooses boogeymen
# out of all the event boogey functions, this is the only one that must be called globally
# rather than as each player. This actually chooses the boogeymen
# it requires two inputs: 
# boogeynumber - which is the number of boogeymen that will be chosen.
# redlife - which is the threshold for red lifetime, and redlifetime players cannot become boogeymen.

$tag @a[tag=foll-limited-player, scores={foll_player_lifetime=$(redlife)..}, sort=random, limit=$(boogeynumber)] add foll-boogeyman