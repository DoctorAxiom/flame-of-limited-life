# Flame of Limited Life
A datapack for minecraft enabling play of a game similar to Grian's Limited Life, initially created for the Flame of Life gaming group.

Please note this is currently a **Work In Progress**. It's almost done and is fairly functional, but it's missing some details so you're not going to a full game out of this yet if you download and install it.

# Initial Set up

1. Find a seed you like where it has a good play area WITHIN 5000 blocks of spawn (some datapack features are buggy farther away from spawn).
2. Set desired world border size and location using the worldborder command.
3. Set desired world spawn location.
4. Create any pre-built structures you would like to have.
5. Highly recommend ```/gamerule keep_inventory true``` on for this game.
6. Copy the "FlameOfLimitedLife" folder from this repository into your datapacks folder.
7. Invite all the friends you want to be in the game
8. run ```/trigger op_menu ``` as operator to get the privileged menu. Click on "Setup/Adjustment Menu", and click on "Setup Current Players" to register all current players.
	- Alternatively you can run the command ```function foll_limited:setup_players``` (which is what going through the above menu does.)
9. Set up other game parameters through the settings menu which can be accessed at any time by typing the command ```/trigger op_menu``` and clicking on "FOLL Settings"
10. When you are ready to start the first session, the bottom of the main op menu (which you get with ```/trigger op_menu```) has a "Start Session" button. The game automatically times the session based on the number of gameticks.

# Notes/FAQ

- If you are making manual adjustments to the session time or player lifetimes, please note that there are 20 ticks in a second. Use a calculator to calculate how many ticks are in the amount of time you wish to add (or do it in your head if you are smarter than me).
