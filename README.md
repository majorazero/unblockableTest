# README

# unblockableTest

So, I'm not super familar with Rails' default templating language, I worked mostly with React,
and setting that up from scratch would burn too much time so I just did the backend portion of this assignment.

In terms of end points, I made 3, and it's really all you would need to play the game.
The end points are /new_game, /game/:id/select_move, /game/:id/get_available/moves.

The game is structured into multiple tables and the gist is...

A Game has many Boards (2).
Each Board has many Coordinates and Ships.
A Ship has many Coordinates.
A Coordinate belongs to  both and contains both the x and y coordinates and a
 status between, 'unoccupied', 'occupied' and 'hit'
A Ship is considerd alive if it still contains one Coordinate that has not been 'hit'.
A Board(player) is considered alive still if it has one ship that is still alive.
And a Game is Over when one of the Board is no longer alive.

The end points...
a. generate a new game and initializes both boards by populating them with coordinates and ships
b. allows you to select a move against the AI and return available coordinates that is allowed to be picked.
c. return available coordinates that are allowed to be picked.

Things that were not included but I would of liked...
- The visual component would of been ideal.
- The end points send you raw data of the coordinates which includes if they are occupied or not. That is not a
very fun game obviously. The front end could of remedied that, but I was hoping to implement a serializer so it 
only sent the x and y coordinates. Couldn't get that working in time.
- The controllers and models are also pretty bloated. Ideally The model just has methods that are queries in them,
I was hoping to implement a command/service pattern to tuck all the big giant methods in but I couldnt get
config.autoload to work.
- Also both players board is auto-generated, I got too focused on the previous points that I forgot to include an
option to let the human player place their own pieces.
