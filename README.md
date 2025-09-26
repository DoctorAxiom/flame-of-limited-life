# Flame of Limited Life
A datapack for minecraft enabling play of a game similar to Grian's Limited Life, initially created for the Flame of Life gaming group.

Please note this is currently a **Work In Progress**. It's pretty much completely done but has not yet been tested in a complete game. There may be bugs still present.

**This datapack is meant to be run once per world for a self contained game.**

# Initial Set up

0. There are some steps that are easier to set up if you start BEFORE installing the datapack, which only happens on step 6.
1. Find a seed you like where it has a good play area WITHIN 5000 blocks of 0,0 (some datapack features are buggy farther away from world origin).
2. Set desired world border size and location using the worldborder command. Highly recommend not exceeding 1250 meters for the width of the world border.
3. Set desired world spawn location.
4. Create any pre-built structures you would like to have using the ```/place ``` command or manually building them
5. Highly recommend ```/gamerule keep_inventory true``` on for this game. If you are playing a shorter game (<12hours) consider increasing the random tick speed with ```/gamerule randomTickSpeed 6 ``` (the default is 3)
6. Install the datapack by copying the "FlameOfLimitedLife" folder from this repository into your datapacks folder.
7. Invite all the friends you want to be in the game
8. run ```/trigger foll_op_menu ``` as operator to get the privileged menu. Click on "Setup/Adjustment Menu", and click on "Setup Current Players" to register all current players.
	- Alternatively you can run the command ```function foll_limited:setup_players``` (which is what going through the above menu does.)
9. Set up other game parameters through the settings menu which can be accessed at any time by typing the command ```/trigger foll_op_menu``` and clicking on "FOLL Settings"
10. Make sure your players have their "Quick Options" bound to a key (default G) because this can be used to access the player menu quickly.
11. When you are ready to start the first session, the bottom of the main op menu (which you get with ```/trigger foll_op_menu```) has a "Start Session" button. The game automatically times the session based on the number of gameticks.


# Rules

0. The game runs in fixed sessions that last a certain amount of time. When a session is not active, everyone is placed in spectator mode.
1. Every player starts with an amount of time to live on the server. When you run out of time, you are made a ghost (permanently spectator.)
	- Ghosts still have some limited abilities- they can spawn wind charges, spawn enchanted golden apples (notch apples), and give resistance and weakness or fill the hunger of players/mobs that they spectate.
2. Every time you die, you lose a certain amount of your time to live.
3. When you lose enough time, you become a yellow player.
4. When you are critically low on time you become a red player.
5. Yellow players can kill dark green players to receive some bonus time to live.
6. Red players can kill ANY other player to receive some bonus time to live.
7. Every session- some players are designated boogeymen. Boogeymen can kill ANY player in order to receive bonus time to live. Boogeymen receive a multiplier compared to other players making a valid kill.
	- If a boogeyman fails to kill someone, the next session they will receive a multiplied penalty as if they had died.
	- Red players cannot be boogeymen
	- When a boogeyman is penalized the game will at MOST drop them to Red life threshold.
8. Invalid kills (i.e. if you are a green player trying to kill someone and are not the boogeyman) ALSO deduct a penalty from your time to live
9. Mob kills and acheivements also award small amounts to your time to live
10. The last player standing wins the game.


# Notes/FAQ

- **Ticks to real time** - If you are making manual adjustments to the session time or player lifetimes, please note that there are 20 ticks in a second. Use a calculator to calculate how many ticks are in the amount of time you wish to add (or do it in your head if you are smarter than me).
- **Resurrecting a Ghost Player** - Ghosts are resurrected at red life level by default. You may want to manually adjust their time further in the op menu after resurrecting a ghost.

