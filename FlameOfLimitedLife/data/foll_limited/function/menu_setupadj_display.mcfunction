#> the function to call to actually display the setupadj menu
# Takes inputs
# playerlist
#
# outtemptarget
# outtemplifeticks
# outtempsessionticks 
#
# Relies on the base function to populate these appropriately.

dialog clear @s
$dialog show @s {type:"minecraft:multi_action",title:"Setup/Adjustment Menu",body:{type:"minecraft:plain_message",contents:"This menu requires operator permissions to use. It will not work if you do not have operator permissions"},inputs:[{type:"minecraft:single_option",key:"targetinput",label:"Target",options:$(playerlist)},{type:"minecraft:text",key:"valueinput",label:"Value"}],can_close_with_escape:1b,exit_action:{label:"Cancel"},columns:2,actions:[{label:"Manual Reward (ticks)",action:{type:"minecraft:dynamic/run_command",template:"execute as $(outtemptarget) run function foll_limited:lifetime_reward_unit $(outtemplifeticks)"}},{label:"Manual Penalty (ticks)",action:{type:"minecraft:dynamic/run_command",template:"execute as $(outtemptarget) run function foll_limited:lifetime_penalize_unit $(outtemplifeticks)"}},{label:"Extend Session (ticks)",action:{type:"minecraft:dynamic/run_command",template:"scoreboard players add #foll_tracker foll_session_time $(outtempsessionticks)"}},{label:"Resurrect Ghost",tooltip:"Resurrect a ghost at red life level.",action:{type:"minecraft:dynamic/run_command",template:"execute as $(outtemptarget) run function foll_limited:ghost_resurrect"}},{label:"Setup Current Players",tooltip:"include all players currently on the server in the game",action:{type:"minecraft:run_command",command:"function foll_limited:setup_players"}}]}