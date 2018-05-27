## Command Line Chess

This provides an interface for a user (and a friend who is very close in proximity) to play chess on the command line. 

The user is presented with a board like this:

    8| r n b q k b n r
    7| p p p p p p p p
    6| . . . . . . . .
    5| . . . . . . . .
    4| . . . . . . . .
    3| . . . . . . . .
    2| P P P P P P P P
    1| R N B Q K B N R
     - - - - - - - - -
       a b c d e f g h

They can make moves using a simplified version of chess notation where you indicate the starting square and the target square. For example, "e2 e4" would move the white king's side pawn forward two spaces. 

Currently, this version supports turn-taking (white pieces can move first, then black, then so on), bad input checking (typing in "zebra" will print out a warning, but not affect the state of the board or whose turn it is), and bounds checking (no moving outside the board), but there is still some work to do in making sure that the players obey the rules of chess as far as how pieces can be moved on the board.

### Getting Started
1. Clone the project from GitHub.
2. Make sure Ruby is installed and is in your PATH.
3. Run ruby chess_game.rb from your command line interface.

### Prerequisites

* Ruby 2.5.1

### Built With

* [Ruby 2.5.1](https://www.ruby-lang.org/en/)

### Acknowledgments

* Thanks to [the code golf Stack Exchange question](https://codegolf.stackexchange.com/questions/95745/draw-an-ascii-chess-board/95950) that inspired this project and gave an initial idea of how to format the board.