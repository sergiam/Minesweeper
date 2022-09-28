Feature: Minesweeper

  '
    empty cell: "o"
    cell with mine: "x"

    Hidden cell: "o" > "_"
    Flag tag: "!"
    Questionable tag: "?"
    Row "-"
    Empty "."

    1 means a cell with 1 adjacent mine
    2 means a cell with 2 adjacents mines
    3 means a cell with 3 adjacents mines
    4 means a cell with 4 adjacents mines
    5 means a cell with 5 adjacents mines
    6 means a cell with 6 adjacents mines
    7 means a cell with 7 adjacents mines
    8 means a cell with 8 adjacents mines
  '

Background: 
Given a user enters to the page

Scenario: Revealing cell with a bomb > Game Over
Given the user loads the layout "xo"
When the user presses the cell '1-1'
Then the user loses the game

Scenario: Revealing cell with a bomb > Showing the mine [MINED CELL]
Given the user loads the layout "xo"
When the user presses the cell '1-1'
Then the cell "1/1" should show "mine"

Scenario: Default display screen: bomb counter
Given the user loads the "<defaultLayout>"
Then the bomb counters should be "<number>"

Examples:
|  defaultLayout  | number      |
|   xoo-ooo-ooo   | 1           |
|   xxo-oxo-ooo   | 3           |
|   xxo-oxx-xoo   | 5           |
|   xxx-oxx-xxx   | 8           |

Scenario: Clicking a cell without a bomb, showing number of surrounding mines [NUM CELL]
Given the user loads the "<defaultLayout>"
When the user reveals the cell "2/2"
Then the cell "2-2" should show "number"

Examples:
|  defaultLayout  | number      |
|   xoo-ooo-ooo   | 1           |
|   xxo-xox-ooo   | 4           |
|   xxo-xox-oxo   | 5           |
|   xxo-xxx-oxx   | 7           |
|   xxx-xox-xxx   | 8           |

Scenario: Cell without mine and without surrounding mines > Empty cell [EMPTY CELL]
Given the user loads the "ooo-ooo-ooo" layout
When the user reveals the cell "2/2"
Then the cell "2-2" should be "empty"

Scenario Outline: Revealing an empty cell > Revealing the surrounding cells
Given the user loads the "<defaultLayout>"
When the user clicks the cell "<cell>"
Then should show the "<output>"

Examples:
|  defaultLayout  | cell | output       |
|   xoo-ooo-ooo   | 1-2  | ooo-1oo-ooo  |
|   xxo-ooo-ooo   | 1-2  | ooo-2oo-ooo  |
|   xxx-ooo-ooo   | 1-2  | ooo-3oo-ooo  |
|   xxx-oxo-ooo   | 1-2  | ooo-4oo-ooo  |
|   xxx-xox-ooo   | 2-2  | ooo-o5o-ooo  |
|   xxx-xox-xoo   | 2-2  | ooo-o6o-ooo  |
|   xxx-xxx-xoo   | 3-2  | ooo-ooo-o7o  |
|   xxx-xxx-xox   | 3-2  | ooo-ooo-o8o  |

Scenario Outline: Revealing an empty cell > Revealing the surrounding cells
Given the user loads the "defaultLayout"
When the user clicks the cell "2-2"
Then should show the "<output>"

Examples:
|  defaultLayout                    | cell | output                         |
|   ooo-ooo-ooo                     | 2-2  | ...-...-...                    |
|   xxxxx-xooox-xooox-xooox-xxxxx   | 3-3  | _____-_555_-_5.5_-_555_-_____  |
|   xooo-oooo-oooo-oooo             | 4-4  | .1__-11__-____-____            |


Scenario: An empty cell is revealead by a neighbour > Revealing again adjacent mines


Scenario: Default display screen: All the cells must be covered
Then All the cells should be "covered"

Scenario: Default display screen: Default time counter
Then the timer should be "0"

Scenario: Default display screen: Default face
Then the face should be 'normal'

Scenario: Smile face
Given the user wins the game
Then the face should be 'smile'

Scenario: Sad face
Given the user lose the game
Then the face should be 'sad'



Scenario: Restarting the game by playing
Given the user is still playing and wants to restart
When the user clicks the button 'normal face' 
Then the game restarts

Scenario: Restarting the game by losing
Given the user lost and wants to play again
When the user clicks the 'sad face' button
Then the game restarts

Scenario: Winning the game by revealing cells
Given the user loads the layout "xo"
When the user clicks at the cell '1-2'
Then the user wins and has to restart the game for playing again

Scenario: Untagging Flag tag
Given the user loads the default layout
When the user marks the cell '1-1' with flag tag by clicking Right Click twice
Then the remaining flags counter should show "9"

Scenario: Tagging Flag tag
Given the user loads the default layout
When the user unmarks the cell '1-1' with flag tag by clicking Right Click twice
Then the remaining flags counter should show "10"

Scenario: Untagging questionable mark
Given the user loads the default layout
When the user marks the cell '1-1' with question mark by clicking Right Click
Then the remaining flags counter should show "9"

Scenario: Tagging questionable mark
Given the user loads the default layout
When the user unmarks the cell '1-1' with question mark by clicking Right Click
Then the remaining flags counter should show "10"



Scenario Outline: Revealing around cells by clicking
Given the user loads the "<defaultLayout>"
When the user clicks the cell "<cell>"
Then should show the "<output>"

Examples:
|  defaultLayout  | cell | output       |
|   xoo-ooo-ooo   | 1-2  | ooo-1oo-ooo  |
|   xxo-ooo-ooo   | 1-2  | ooo-2oo-ooo  |
|   xxx-ooo-ooo   | 1-2  | ooo-3oo-ooo  |
|   xxx-oxo-ooo   | 1-2  | ooo-4oo-ooo  |
|   xxx-xox-ooo   | 2-2  | ooo-o5o-ooo  |
|   xxx-xox-xoo   | 2-2  | ooo-o6o-ooo  |
|   xxx-xxx-xoo   | 3-2  | ooo-ooo-o7o  |
|   xxx-xxx-xox   | 3-2  | ooo-ooo-o8o  |

/Scenario: Revealing an empty cell (neighbours)
/Definition of an empty cell