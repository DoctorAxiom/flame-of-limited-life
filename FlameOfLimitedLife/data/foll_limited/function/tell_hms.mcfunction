#Tells the current player a hms timestamp
# Takes 8 inputs prefix, h, hunit, m, munit, s, sunit, suffix, color

$tellraw @s {text:"$(prefix)$(h)$(hunit)$(m)$(munit)$(s)$(sunit)$(suffix)", color:"$(color)"}