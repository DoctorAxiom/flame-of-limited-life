#> called as each player to append current player name to list of players in setupadjvar

loot replace block ~ -64 ~ container.0 loot foll_limited:playerheadloot
data modify storage foll_limited:tmp setupadjvar.playerlist append from block ~ -64 ~ Items[0].components."minecraft:profile".name

