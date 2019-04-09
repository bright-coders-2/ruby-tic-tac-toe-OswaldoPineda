# Tic Tac Toe
## Objective
In order to practice what we have learned regarding OOP and best practices, let's implement a Tic-Tac-Toe (Gato in Spanish) game!

## Rules
- Two players represented with X and O
- First time the game is played, X startsEach player alternate turns to put a mark in the board on any available slot
- The game ends when either one of the players matches three marks in a horizontal, vertical or diagonal row or there are no more moves available
- Once the game finishes, players are asked if they want to play again. If they do, the player who lost the previous match starts. In case of a draw, the player who did the second-to-last movement starts
## Considerations
- Will the logic have to change if I want to play on a N x N board instead of the original 3 x 3?
- Gem are supposed to be used by other programmers so they need to be well documented and tested
## Milestones
### Required
 -Create the game logic
    - Create the gem that contains that logic and verify that can be used correctly 
    - Create terminal interface
## This are not required but nice to have
 Create GUI interface (Shoes or Gosu) Create web app  Create API


# Tic Tac Toe

## Rules
- Two players represented with X and O
- First time the game is played, X startsEach player alternate turns to put a mark in the board on any available slot
- The game ends when either one of the players matches the size number marks in a horizontal, vertical or diagonal row or there are no more moves available
- Once the game finishes, players are asked if they want to play again. If they do, the player who lost the previous match starts. In case of a draw, the player who did the second-to-last movement starts


# How to play

## Instalation
Execute the next command for install it:

    $ bundle exec rake install
    
This create a folder called pkg where will our .gem file be found.

Can you execute:

    $ gem list --local

for check the successful installation.

Finally, we only require the gem with the next line on your proyect:
```ruby
require "TicTacToe" 
```
or start with irb.

## Usage
To use this gem you must first create two instances of player, each instance receives as parameter a hash with 2 values:
- mark: the simbol with which it will be represented on the board.
- name: the name of the player.

Example of instance:
```ruby
TicTacToe::Player.new({mark: "X", name: "Oswaldo"})
```

After of that, you must create one instance of game for play, this instance will be receive two params:
- param1: one array with two instances of players.
- param2: the size of game board. (NOTE: this one can be NxN)

Once the innstance is done, you can indicate that you directly access to play method.
Example of instance and play method:
```ruby
TicTacToe::Game.new(playersArray,3).play
```

When you run the file where you use this gem you will see the board in the console.

Enjoy it! :)
