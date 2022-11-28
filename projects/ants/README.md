# Ants Vs. SomeBees
![splash (1)](https://user-images.githubusercontent.com/111802251/204198491-8de5083b-89ff-43f6-b09e-c284d16d64f2.png)
# 1.) Introduction
This project is a [tower defense](https://en.wikipedia.org/wiki/Tower_defense) game called Ants Vs. SomeBees. As the ant queen, you populate your colony with the bravest ants you can muster. Your ants must protect their queen from the evil bees that invade your territory. Irritate the bees enough by throwing leaves at them, and they will be vanquished. Fail to pester the airborne intruders adequately, and your queen will succumb to the bees' wrath. This game is inspired by PopCap Games' [Plants Vs. Zombies](https://www.ea.com/ea-studios/popcap/plants-vs-zombies).
## Files in Project

- `ants.py`: The game logic of Ants Vs. SomeBees

- `ants_gui.py`: The original GUI for Ants Vs. SomeBees

- `gui.py`: A new GUI for Ants Vs. SomeBees.

- `graphics.py`: Utilities for displaying simple two-dimensional animations

- `utils.py`: Some functions to facilitate the game interface

- `ucb.py`: Utility functions for CS 61A

- `state.py`: Abstraction for gamestate for gui.py

- `assets`: A directory of images and files used by gui.py

- `img`: A directory of images used by ants_gui.py

- `ok`: The autograder

- `proj3.ok`: The ok configuration file

- `tests`: A directory of tests used by ok

# 2.) The Game
A game of Ants Vs. SomeBees consists of a series of turns. In each turn, new bees may enter the ant colony. Then, new ants are placed to defend their colony. Finally, all insects (ants, then bees) take individual actions. Bees either try to move toward the end of the tunnel or sting ants in their way. Ants perform a different action depending on their type, such as collecting more food or throwing leaves at the bees. The game ends either when a bee reaches the end of the tunnel (you lose), the bees destroy the QueenAnt if it exists (you lose), or the entire bee fleet has been vanquished (you win).
![gui_explanation](https://user-images.githubusercontent.com/111802251/204199268-f27c3fb0-4138-4400-a859-cc36268fe796.png)
# 3.) Core Concepts
**The Colony**. This is where the game takes place. The colony consists of several Places that are chained together to form a tunnel where bees can travel through. The colony also has some quantity of food which can be expended in order to place an ant in a tunnel.

**Places**. A place links to another place to form a tunnel. The player can put a single ant into each place. However, there can be many bees in a single place.

**The Hive**. This is the place where bees originate. Bees exit the beehive to enter the ant colony.

**Ants**. Players place an ant into the colony by selecting from the available ant types at the top of the screen. Each type of ant takes a different action and requires a different amount of colony food to place. The two most basic ant types are the HarvesterAnt, which adds one food to the colony during each turn, and the ThrowerAnt, which throws a leaf at a bee each turn. 

**Bees**. In this game, bees are the antagonistic forces that the player must defend the ant colony from. Each turn, a bee either advances to the next place in the tunnel if no ant is in its way, or it stings the ant in its way. Bees win when at least one bee reaches the end of a tunnel.
# 4.) Core Classes
- `GameState`: Represents the colony and some state information about the game, including how much food is available, how much time has elapsed, where the AntHomeBase is, and all the Places in the game.

- `Place`: Represents a single place that holds insects. At most one Ant can be in a single place, but there can be many Bees in a single place. Place objects have an exit to the left and an entrance to the right, which are also places. Bees travel through a tunnel by moving to a Place's exit.

- `Hive`: Represents the place where Bees start out (on the right of the tunnel).

- `AntHomeBase`: Represents the place Ants are defending (on the left of the tunnel). If Bees get here, they win :(

- `Insect`: A superclass for Ant and Bee. All insects have health attribute, representing their remaining health, and a place attribute, representing the Place where they are currently located. Each turn, every active Insect in the game performs its action.

- `Ant`: Represents ants. Each Ant subclass has special attributes or a special action that distinguish it from other Ant types. For example, a HarvesterAnt gets food for the colony and a ThrowerAnt attacks Bees. Each ant type also has a food_cost attribute that indicates how much it costs to deploy one unit of that type of ant.

- `Bee`: Represents bees. Each turn, a bee either moves to the exit of its current Place if the Place is not blocked by an ant, or stings the ant occupying its same Place.
# 4.) Playing the Game
The game can be run in two modes: as a text-based game or using a graphical user interface (GUI). The game logic is the same in either case, but the GUI enforces a turn time limit that makes playing the game more exciting. The text-based interface is provided for debugging and development.

The files are separated according to these two modes. ants.py knows nothing of graphics or turn time limits.

To start a text-based game, run

`python3 ants_text.py`

To start a graphical game, run

`python3 gui.py`
