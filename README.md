# Tic Tac Toe

## Rules
- Two players represented with X and O
- First time the game is played, X startsEach player alternate turns to put a mark in the board on any available slot
- The game ends when either one of the players matches the size number marks in a horizontal, vertical or diagonal row or there are no more moves available
- Once the game finishes, players are asked if they want to play again. If they do, the player who lost the previous match starts. In case of a draw, the player who did the second-to-last movement starts


# How to play

## Instalation
Add the TicTacToe-0.1.0.gem file located in this repository into your project folder.

And then execute the next command for install it:

    $ gem install --local TicTacToe-0.1.0.gem

Can you execute:

    $ gem list 

for check the successful installation.

Finally,we only require the gem with the next line:
```ruby
require "TicTacToe" 
```

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
