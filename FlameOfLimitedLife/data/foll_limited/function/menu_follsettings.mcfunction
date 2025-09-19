#> Populates the settings menu with the current value of various settings
# And then displays said menu
# list of macro variables for my reference:
# $(sessiondurationm) 
# $(startlifem)
# $(greenlifem)
# $(yellowlifem)
# $(redlifem)
# $(killrewardm)
# $(killpenaltym)
# $(deathpenaltym)
# $(boogeydelaym)
# $(boogeynum)
# $(boogeymultiplier)
# $(mobkillreward)
# $(advancementreward)
# $(bigadvancementreward)


scoreboard players operation #foll_tracker2 foll_session_duration = #foll_tracker foll_session_duration
scoreboard players operation #foll_tracker2 foll_starting_life = #foll_tracker foll_starting_life
scoreboard players operation #foll_tracker2 foll_green_life = #foll_tracker foll_green_life
scoreboard players operation #foll_tracker2 foll_yellow_life = #foll_tracker foll_yellow_life
scoreboard players operation #foll_tracker2 foll_red_life = #foll_tracker foll_red_life
scoreboard players operation #foll_tracker2 foll_kill_reward = #foll_tracker foll_kill_reward
scoreboard players operation #foll_tracker2 foll_kill_penalty = #foll_tracker foll_kill_penalty
scoreboard players operation #foll_tracker2 foll_death_penalty = #foll_tracker foll_death_penalty
scoreboard players operation #foll_tracker2 foll_boogey_choosing_delay = #foll_tracker foll_boogey_choosing_delay

scoreboard players operation #foll_tracker2 foll_session_duration /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_starting_life /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_green_life /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_yellow_life /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_red_life /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_kill_reward /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_kill_penalty /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_death_penalty /= #foll_tracker foll_60_const
scoreboard players operation #foll_tracker2 foll_boogey_choosing_delay /= #foll_tracker foll_60_const


execute store result storage foll_limited:tmp follsettingsvar.sessiondurationm int 1 run scoreboard players get #foll_tracker2 foll_session_duration
execute store result storage foll_limited:tmp follsettingsvar.startlifem int 1 run scoreboard players get #foll_tracker2 foll_starting_life
execute store result storage foll_limited:tmp follsettingsvar.greenlifem int 1 run scoreboard players get #foll_tracker2 foll_green_life
execute store result storage foll_limited:tmp follsettingsvar.yellowlifem int 1 run scoreboard players get #foll_tracker2 foll_yellow_life
execute store result storage foll_limited:tmp follsettingsvar.redlifem int 1 run scoreboard players get #foll_tracker2 foll_red_life
execute store result storage foll_limited:tmp follsettingsvar.killrewardm int 1 run scoreboard players get #foll_tracker2 foll_kill_reward
execute store result storage foll_limited:tmp follsettingsvar.killpenaltym int 1 run scoreboard players get #foll_tracker2 foll_kill_penalty
execute store result storage foll_limited:tmp follsettingsvar.deathpenaltym int 1 run scoreboard players get #foll_tracker2 foll_death_penalty
execute store result storage foll_limited:tmp follsettingsvar.boogeydelaym int 1 run scoreboard players get #foll_tracker2 foll_boogey_choosing_delay
execute store result storage foll_limited:tmp follsettingsvar.boogeynum int 1 run scoreboard players get #foll_tracker foll_number_of_boogeymen
execute store result storage foll_limited:tmp follsettingsvar.boogeymultiplier int 1 run scoreboard players get #foll_tracker foll_boogey_multiplier
execute store result storage foll_limited:tmp follsettingsvar.mobkillreward int 1 run scoreboard players get #foll_tracker foll_mobkill_reward
execute store result storage foll_limited:tmp follsettingsvar.advancementreward int 1 run scoreboard players get #foll_tracker foll_advancement_reward
execute store result storage foll_limited:tmp follsettingsvar.bigadvancementreward int 1 run scoreboard players get #foll_tracker foll_advancement_bigreward

data modify storage foll_limited:tmp follsettingsvar.outtemp set value "function foll_limited:menu_follsettings_save {sessiondurationm: $(sessiondurationm), startlifem: $(startlifem), greenlifem: $(greenlifem), yellowlifem: $(yellowlifem), redlifem: $(redlifem), killrewardm: $(killrewardm), killpenaltym: $(killpenaltym), deathpenaltym: $(deathpenaltym), boogeydelaym: $(boogeydelaym), boogeynum: $(boogeynum), boogeymultiplier: $(boogeymultiplier), mobkillreward: $(mobkillreward), advancementreward: $(advancementreward), bigadvancementreward: $(bigadvancementreward)}"

function foll_limited:menu_follsettings_display with storage foll_limited:tmp follsettingsvar