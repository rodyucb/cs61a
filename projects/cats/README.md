# CS 61A Autocorrected Typing Software
![GUI Capture](https://user-images.githubusercontent.com/111802251/204208385-dfedb597-dc8b-4654-aeef-b76bf8c302ca.gif)
# 1.) Introduction
In this project, you will compete with multiple players to find out who types the fastest with the most accuracy per word. Additionally, the game also has autocorrect, which is a feature that attempts to correct the spelling of a word after a user types it. This project is inspired by [typeracer](https://play.typeracer.com/).
## Features
- Calculates the correctness (%) of words in the typed paragraph compared to the reference paragraph
- Calculates the number of typed words per minute (wpm) and the elapsed time
- Autocorrect attempts to correct the spelling of a word after a user types it
## Files in Project
`cats.py`: The typing test logic.

`utils.py`: Utility functions for interacting with files and strings.

`ucb.py`: Utility functions for CS 61A projects.

`data/sample_paragraphs.txt`: A file containing text samples to be typed. These are scraped Wikipedia articles about various topics.

`data/common_words.txt`: A file containing common English words in order of frequency.

`data/words.txt`: A file containing many more English words in order of frequency.

`cats_gui.py`: A web server for the web-based graphical user interface (GUI).

`gui_files`: A directory of files needed for the graphical user interface (GUI).

`multiplayer`: A directory of files needed to support multiplayer mode.

`favicons`: A directory of icons.

`images`: A directory of images.

`ok, proj02.ok, tests`: Testing files.
# 2.) Playing the Game
Time to test your typing speed! You can use the command line to test your typing speed on paragraphs about a particular topic. For example, the command below will load paragraphs about cats or kittens. See the `run_typing_test` function for the implementation if you're curious (but it is defined for you).
```
python3 cats.py -t cats kittens
```
You can try out the web-based graphical user interface (GUI) using the following command. (You may have to use `Ctrl+C` or `Cmd+C` on your terminal to quit the GUI after you close the tab in your browser).
```
python3 cats_gui.py
```
## Multiplayer
You can also play against other players. Set `enable_multiplayer` to `True` near the bottom of `cats.py` and type swiftly!
```
python3 cats_gui.py
```
# 3.) Class Website Project Information
[Click Here](https://inst.eecs.berkeley.edu/~cs61a/sp22/proj/cats/)
