#> Saves the various settings from the follsettings menu into scoreboard
# Should be called with dynamic/run_command with the following:
# function foll_limited:menu_follsettings_save {sessiondurationm: $(sessiondurationm), startlifem: $(startlifem), greenlifem: $(greenlifem), yellowlifem: $(yellowlifem), redlifem: $(redlifem), killrewardm: $(killrewardm), killpenaltym: $(killpenaltym), deathpenaltym: $(deathpenaltym), boogeydelaym: $(boogeydelaym), boogeynum: $(boogeynum), boogeymultiplier: $(boogeymultiplier), mobkillreward: $(mobkillreward), advancementreward: $(advancementreward), bigadvancementreward: $(bigadvancementreward)}
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

$data modify storage foll_limited:tmp follsettingsvar.sessiondurationm set value $(sessiondurationm)
$data modify storage foll_limited:tmp follsettingsvar.startlifem set value $(startlifem)
$data modify storage foll_limited:tmp follsettingsvar.greenlifem set value $(greenlifem)
$data modify storage foll_limited:tmp follsettingsvar.yellowlifem set value $(yellowlifem)
$data modify storage foll_limited:tmp follsettingsvar.redlifem set value $(redlifem)
$data modify storage foll_limited:tmp follsettingsvar.killrewardm set value $(killrewardm)
$data modify storage foll_limited:tmp follsettingsvar.killpenaltym set value $(killpenaltym)
$data modify storage foll_limited:tmp follsettingsvar.deathpenaltym set value $(deathpenaltym)
$data modify storage foll_limited:tmp follsettingsvar.boogeydelaym set value $(boogeydelaym)
$data modify storage foll_limited:tmp follsettingsvar.boogeynum set value $(boogeynum)
$data modify storage foll_limited:tmp follsettingsvar.boogeymultiplier set value $(boogeymultiplier)
$data modify storage foll_limited:tmp follsettingsvar.mobkillreward set value $(mobkillreward)
$data modify storage foll_limited:tmp follsettingsvar.advancementreward set value $(advancementreward)
$data modify storage foll_limited:tmp follsettingsvar.bigadvancementreward set value $(bigadvancementreward)


execute store result score #foll_tracker foll_session_duration run data get storage foll_limited:tmp follsettingsvar.sessiondurationm 60
execute store result score #foll_tracker foll_starting_life run data get storage foll_limited:tmp follsettingsvar.startlifem 60
execute store result score #foll_tracker foll_green_life run data get storage foll_limited:tmp follsettingsvar.greenlifem 60
execute store result score #foll_tracker foll_yellow_life run data get storage foll_limited:tmp follsettingsvar.yellowlifem 60
execute store result score #foll_tracker foll_red_life run data get storage foll_limited:tmp follsettingsvar.redlifem 60
execute store result score #foll_tracker foll_kill_reward run data get storage foll_limited:tmp follsettingsvar.killrewardm 60
execute store result score #foll_tracker foll_kill_penalty run data get storage foll_limited:tmp follsettingsvar.killpenaltym 60
execute store result score #foll_tracker foll_death_penalty run data get storage foll_limited:tmp follsettingsvar.deathpenaltym 60
execute store result score #foll_tracker foll_boogey_choosing_delay run data get storage foll_limited:tmp follsettingsvar.boogeydelaym 60
execute store result score #foll_tracker foll_number_of_boogeymen run data get storage foll_limited:tmp follsettingsvar.boogeynum 1
execute store result score #foll_tracker foll_boogey_multiplier run data get storage foll_limited:tmp follsettingsvar.boogeymultiplier 1
execute store result score #foll_tracker foll_mobkill_reward run data get storage foll_limited:tmp follsettingsvar.mobkillreward 1
execute store result score #foll_tracker foll_advancement_reward run data get storage foll_limited:tmp follsettingsvar.advancementreward 1
execute store result score #foll_tracker foll_advancement_bigreward run data get storage foll_limited:tmp follsettingsvar.bigadvancementreward 1