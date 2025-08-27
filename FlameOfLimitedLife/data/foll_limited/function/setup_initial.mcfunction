#> exits the function if already initialized
execute if score #foll_tracker foll_initialized matches 1 run return 0

#> Remove any player tags that were previously initialized
tag @a remove foll-limited-player
tag @a remove foll-has-started

#> Player test var
scoreboard objectives remove foll_playertestvar
scoreboard objectives add foll_playertestvar dummy
scoreboard players set #foll_tracker foll_playertestvar 0

#> Initial session time checks
scoreboard objectives remove foll_session_time
scoreboard objectives add foll_session_time dummy
scoreboard objectives remove foll_session_running
scoreboard objectives add foll_session_running dummy

#> Conversion constants
scoreboard objectives remove foll_20_const
scoreboard objectives remove foll_60_const
scoreboard objectives remove foll_100_const
scoreboard objectives add foll_20_const dummy
scoreboard players set #foll_tracker foll_20_const 20
scoreboard objectives add foll_60_const dummy
scoreboard players set #foll_tracker foll_60_const 60
scoreboard objectives add foll_100_const dummy
scoreboard players set #foll_tracker foll_100_const 100

#> Customizable parameters of the game
scoreboard objectives remove foll_starting_life
scoreboard objectives remove foll_yellow_life
scoreboard objectives remove foll_red_life
scoreboard objectives remove foll_session_duration
scoreboard objectives remove foll_kill_reward
scoreboard objectives remove foll_kill_penalty
scoreboard objectives remove foll_death_penalty
scoreboard objectives remove foll_advancement_reward
scoreboard objectives remove foll_advancement_bigreward
scoreboard objectives remove foll_mobkill_reward

scoreboard objectives add foll_starting_life dummy
scoreboard objectives add foll_yellow_life dummy
scoreboard objectives add foll_red_life dummy
scoreboard objectives add foll_session_duration dummy
scoreboard objectives add foll_kill_reward dummy
scoreboard objectives add foll_kill_penalty dummy
scoreboard objectives add foll_death_penalty dummy
scoreboard objectives add foll_boogey_multiplier dummy
scoreboard objectives add foll_advancement_reward dummy
scoreboard objectives add foll_advancement_bigreward dummy
scoreboard objectives add foll_mobkill_reward dummy

scoreboard players set #foll_tracker foll_starting_life 576000
scoreboard players set #foll_tracker foll_yellow_life 288000
scoreboard players set #foll_tracker foll_red_life 72000
scoreboard players set #foll_tracker foll_session_duration 144000
scoreboard players set #foll_tracker foll_kill_reward 18000
scoreboard players set #foll_tracker foll_kill_penalty 12000
scoreboard players set #foll_tracker foll_death_penalty 24000
scoreboard players set #foll_tracker foll_boogey_multiplier 3
scoreboard players set #foll_tracker foll_advancement_reward 600
scoreboard players set #foll_tracker foll_advancement_bigreward 2400
scoreboard players set #foll_tracker foll_mobkill_reward 20

#>Loop indices
scoreboard objectives remove foll_teamloop_index
scoreboard objectives add foll_teamloop_index dummy
scoreboard players set #foll_tracker foll_teamloop_index 0

#> Player specific tracking objectives
scoreboard objectives remove foll_player_lifetime
scoreboard objectives remove foll_player_lifetime_h
scoreboard objectives remove foll_player_lifetime_m
scoreboard objectives remove foll_player_lifetime_s

scoreboard objectives add foll_player_lifetime dummy
scoreboard objectives add foll_player_lifetime_h dummy
scoreboard objectives add foll_player_lifetime_m dummy
scoreboard objectives add foll_player_lifetime_s dummy

scoreboard objectives modify foll_player_lifetime_h numberformat styled {color:"green"}
scoreboard objectives modify foll_player_lifetime_m numberformat styled {color:"yellow"}
scoreboard objectives modify foll_player_lifetime_s numberformat styled {color:"red"}
scoreboard objectives modify foll_player_lifetime numberformat fixed ""

scoreboard objectives setdisplay list foll_player_lifetime

scoreboard objectives remove foll_player_xpos
scoreboard objectives remove foll_player_ypos
scoreboard objectives remove foll_player_zpos
scoreboard objectives remove foll_player_xrot
scoreboard objectives remove foll_player_yrot

scoreboard objectives add foll_player_xpos dummy
scoreboard objectives add foll_player_ypos dummy
scoreboard objectives add foll_player_zpos dummy
scoreboard objectives add foll_player_xrot dummy
scoreboard objectives add foll_player_yrot dummy


#> Detection objectives for killing different colors, mobs, deaths
scoreboard objectives remove foll_player_deathdetect

scoreboard objectives remove foll_player_greenkilldetect
scoreboard objectives remove foll_player_yellowkilldetect
scoreboard objectives remove foll_player_redkilldetect

scoreboard objectives remove foll_player_mobkilldetect

scoreboard objectives add foll_player_deathdetect deathCount

scoreboard objectives add foll_player_greenkilldetect teamkill.green
scoreboard objectives add foll_player_yellowkilldetect teamkill.yellow
scoreboard objectives add foll_player_redkilldetect teamkill.red

scoreboard objectives add foll_player_mobkilldetect minecraft.custom:minecraft.mob_kills

#> Set of trigger-able objectives
# foll_claimkill - should be used by players to claim an indirect kill
# foll_claimaccident - should be used by players to claim an indirect accident
#                      (for which they should receive a penalty)
scoreboard objectives remove foll_opmenu

scoreboard objectives remove foll_claimkill
scoreboard objectives remove foll_claimaccident

scoreboard objectives remove foll_spawn_windcharge
scoreboard objectives remove foll_spawn_notchapple
scoreboard objectives remove foll_resistancetoggle
scoreboard objectives remove foll_weaknesstoggle

scoreboard objectives add foll_opmenu trigger

scoreboard objectives add foll_claimkill trigger
scoreboard objectives add foll_claimaccident trigger

scoreboard objectives add foll_spawn_windcharge trigger
scoreboard objectives add foll_spawn_notchapple trigger
scoreboard objectives add foll_resistancetoggle trigger
scoreboard objectives add foll_weaknesstoggle trigger

#> Initial session time set
# -1 means that there is no active session.
scoreboard players set #foll_tracker foll_session_time -1
scoreboard players set #foll_tracker foll_session_running 0

#> Finalize Set up flag
scoreboard players set #foll_tracker foll_initialized 1