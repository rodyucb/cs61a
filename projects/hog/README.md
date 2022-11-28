# The Game of Hog
![GUI Capture](https://user-images.githubusercontent.com/111802251/204210416-a8fc65eb-eb1e-4495-a62c-a7a38548ee2d.gif)
GIF Credit: [Shelly Tao](https://github.com/shelleytao/hog)
# 1.) Introduction
The Game of Hog is a game where multiple players alternate turns rolling a dice up to `GOAL` points to win with various obstacles and strategies implemented.

## Files in Project

- `hog.py`: A starter implementation of Hog

- `dice.py`: Functions for rolling dice

- `hog_gui.py`: A graphical user interface (GUI) for Hog (updated)

- `ucb.py`: Utility functions for CS 61A

- `ok`: CS 61A autograder

- `tests`: A directory of tests used by ok

- `gui_files`: A directory of various things used by the web GUI

- `calc.py`: A file you can use to approximately test your final strategy

# 2.) Rules
In Hog, two players alternate turns trying to be the first to end a turn with at least 100 total points. On each turn, the current player chooses some number of dice to roll, up to 10. That player's score for the turn is the sum of the dice outcomes. However, a player who rolls too many dice risks:
## Sow Sad
`Sow Sad`. If any of the dice outcomes is a 1, the current player's score for the turn is 1.

- *Example 1*: The current player rolls 7 dice, 5 of which are 1's. They score `1` point for the turn.

- *Example 2*: The current player rolls 4 dice, all of which are 3's. Since Sow Sad did not occur, they score 12 points for the turn.

In a normal game of Hog, those are all the rules. To spice up the game, we'll include some special rules:
## Hefty Hogs
**Hefty Hogs. If the opponent's score is 0** and the player chooses to roll zero dice, the player will get 1 point. However, **if the opponent's score is not 0**, a player who chooses to roll zero dice will gain points according to the following:

The opponent's score will be mapped to a series of functions to be applied to the player's score, starting from the rightmost digit (the one's place) and ending on the leftmost digit.
Each digit from `0` to `9` corresponds to a pre-defined function, `f0` through `f9`.
The result of this series of calls **modulo 30** is the amount of points the player receives for the turn.

- *Example 1*: The current player has 10 points. The opponent player has 32 points. The functions are applied in this order:

    - The rightmost digit of the opponent's score is `2`.

    - The corresponding function, `f2`, is applied to `10`.

    - The next digit of the opponent's score is `3`.

    - The corresponding function, `f3`, is applied to the result of `f2(10)`.

    - The points the current player gains is the result of that call, modulo 30: `f3(f2(10)) % 30`.

- *Example 2*: The current player has 33 points. The opponent player has 5439 points. The functions are applied in this order:

    - The rightmost digit of the opponent's score is `9`.

    - The corresponding function,`f9`, is applied to `33`.

    - And so on:

      - Function `f3` is applied to the result of `f9(33)`.

      - Function `f4` is applied to the result of `f3(f9(33))`.

      - Function `f5` is applied to the result of `f4(f3(f9(33)))`.

      - The points the current player gains is the result of that call, modulo 30: `f5(f4(f3(f9(33)))) % 30`.
## Hog Pile
**Hog Pile**. After points for the turn are added to the current player's score, if the one's digit (`ones_digit`) of the current player's score is the same as the one's digit of the opponent player's score, the current player gains an additional `ones_digit` points.

- *Example*:

  - Both players start out at 0. (0, 0)
  
  - Player 0 rolls 2 dice and gets `5` points. (5, 0)
  
  - Player 1 rolls 1 dice and gets `5` points. (5, 5) Player 1 gets `5` more points. (5, 10)
  
  - Player 0 rolls 2 dice and gets `6` points. (11, 10)
  
  - Player 1 rolls 8 dice and gets `1` point. (11, 11) Player 1 gets `1` more point. (11, 12)
  
# 3.) Playing the Game

To run the GUI from your terminal:
```
python3 hog_gui.py
```
# 4.) Class Website Project Information
[Click here.](https://inst.eecs.berkeley.edu/~cs61a/sp22/proj/hog/)
