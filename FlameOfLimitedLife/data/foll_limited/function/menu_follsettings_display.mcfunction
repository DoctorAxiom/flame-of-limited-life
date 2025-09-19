#> The inner macro to display menu_follsettings
# Takes several inputs to ensure correct values are displayed
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
#
# $(outtemp) - the output template is fed in separately to avoid substitution problems from macro processing

dialog clear @s 
$dialog show @s {type:"minecraft:confirmation",title:"FOLL Settings",inputs:[{type:"minecraft:number_range",key:"sessiondurationm",width:300,label:"Session Duration",label_format:"%1$s: %2$sm",start:60,end:240,step:10,initial:$(sessiondurationm)},{type:"minecraft:number_range",key:"startlifem",width:300,label:"Starting Life",label_format:"%1$s: %2$sm",start:120,end:1440,step:10,initial:$(startlifem)},{type:"minecraft:number_range",key:"greenlifem",width:300,label:"Green Life Threshold",label_format:"%1$s: %2$sm",start:90,end:960,step:10,initial:$(greenlifem)},{type:"minecraft:number_range",key:"yellowlifem",width:300,label:"Yellow Life Threshold",label_format:"%1$s: %2$sm",start:60,end:720,step:10,initial:$(yellowlifem)},{type:"minecraft:number_range",key:"redlifem",width:300,label:"Red Life Threshold",label_format:"%1$s: %2$sm",start:30,end:360,step:10,initial:$(redlifem)},{type:"minecraft:number_range",key:"killrewardm",width:300,label:"Valid Kill Reward",label_format:"%1$s: %2$sm",start:0,end:60,step:1,initial:$(killrewardm)},{type:"minecraft:number_range",key:"killpenaltym",width:300,label:"Wrong Kill Penalty",label_format:"%1$s: %2$sm",start:0,end:60,step:1,initial:$(killpenaltym)},{type:"minecraft:number_range",key:"deathpenaltym",width:300,label:"Penalty for Dying",label_format:"%1$s: %2$sm",start:0,end:60,step:1,initial:$(deathpenaltym)},{type:"minecraft:number_range",key:"boogeydelaym",width:300,label:"Time until Boogey assigned",label_format:"%1$s: %2$sm",start:1,end:30,step:1,initial:$(boogeydelaym)},{type:"minecraft:number_range",key:"boogeynum",width:300,label:"Number of Boogeymen",start:0,end:4,step:1,initial:$(boogeynum)},{type:"minecraft:number_range",key:"boogeymultiplier",width:300,label:"Boogey Penalty/Reward Multiplier",start:1,end:5,step:1,initial:$(boogeymultiplier)},{type:"minecraft:number_range",key:"mobkillreward",width:300,label:"Mob Kill Reward",label_format:"%1$s: %2$s ticks",start:10,end:100,step:1,initial:$(mobkillreward)},{type:"minecraft:number_range",key:"advancementreward",width:300,label:"Advancement Reward",label_format:"%1$s: %2$s ticks",start:200,end:1200,step:1,initial:$(advancementreward)},{type:"minecraft:number_range",key:"bigadvancementreward",width:300,label:"Big Advancement Reward",label_format:"%1$s: %2$s ticks",start:400,end:4800,step:1,initial:$(bigadvancementreward)}],can_close_with_escape:true,yes:{label:"Save Settings",action:{type:"minecraft:dynamic/run_command",template:"$(outtemp)"}},no:{label:"Cancel Changes"}}