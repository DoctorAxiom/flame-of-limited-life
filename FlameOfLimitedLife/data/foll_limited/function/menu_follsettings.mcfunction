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

execute store result storage foll_limited:tmp follsettingsvar.sessiondurationm int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_session_duration
execute store result storage foll_limited:tmp follsettingsvar.startlifem int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_starting_life
execute store result storage foll_limited:tmp follsettingsvar.greenlifem int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_green_life
execute store result storage foll_limited:tmp follsettingsvar.yellowlifem int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_yellow_life
execute store result storage foll_limited:tmp follsettingsvar.redlifem int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_red_life
execute store result storage foll_limited:tmp follsettingsvar.killrewardm int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_kill_reward
execute store result storage foll_limited:tmp follsettingsvar.killpenaltym int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_kill_penalty
execute store result storage foll_limited:tmp follsettingsvar.deathpenaltym int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_death_penalty
execute store result storage foll_limited:tmp follsettingsvar.boogeydelaym int 0.0008333333333333334 run scoreboard players get #foll_tracker foll_boogey_choosing_delay
execute store result storage foll_limited:tmp follsettingsvar.boogeynum int 1 run scoreboard players get #foll_tracker foll_number_of_boogeymen
execute store result storage foll_limited:tmp follsettingsvar.boogeymultiplier int 1 run scoreboard players get #foll_tracker foll_boogey_multiplier
execute store result storage foll_limited:tmp follsettingsvar.mobkillreward int 1 run scoreboard players get #foll_tracker foll_mobkill_reward
execute store result storage foll_limited:tmp follsettingsvar.advancementreward int 1 run scoreboard players get #foll_tracker foll_advancement_reward
execute store result storage foll_limited:tmp follsettingsvar.bigadvancementreward int 1 run scoreboard players get #foll_tracker foll_advancement_bigreward

function foll_limited:menu_follsettings_display with storage foll_limited:tmp follsettingsvar