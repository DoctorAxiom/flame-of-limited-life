#> Called as a particular player who has completely run out of lifetime
# @s must refer to the player who just had the detected life out

tag @s add foll-ghost
execute at @s run summon minecraft:lightning_bolt ~ 321 ~
execute at @s run summon minecraft:lightning_bolt ~-2 321 ~-2
execute at @s run summon minecraft:lightning_bolt ~2 321 ~2
execute at @s run summon minecraft:lightning_bolt ~-2 321 ~2
execute at @s run summon minecraft:lightning_bolt ~2 321 ~-2
