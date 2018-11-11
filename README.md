# mars_rover

## The Problem
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau,
which is curiously rectangular, must be navigated by the rovers so that their on-board
cameras can get a complete view of the surrounding terrain to send back to Earth. A rover's
position and location is represented by a combination of x and y coordinates and a letter
representing one of the four cardinal compass points. The plateau is divided up into a grid to
simplify navigation. An example position might be 0, 0, N, which means the rover is in the
bottom left corner and facing North. In order to control a rover, NASA sends a simple string
of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees
left or right respectively, without moving from its current spot. 'M' means move forward one
grid point, and maintain the same heading.
Assume that the square directly North from (x, y) is (x, y+1).
It must be possible to supply input data to your application via a text file specified on the
command line.

### INPUT :
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates
are assumed to be 0,0.
The rest of the input is information pertaining to the rovers that have been deployed. Each
rover has two lines of input. The first line gives the rover's position, and the second line is a
series of instructions telling the rover how to explore the plateau. The position is made up of
two integers and a letter separated by spaces, corresponding to the x and y coordinates and
the rover's orientation.
Each rover will be finished sequentially, which means that the second rover won't start to
move until the first one has finished moving.
### OUTPUT :
The output for each rover should be its final coordinates and heading.


### SAMPLE INPUT AND OUTPUT:
Test Input:
```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```
Expected Output:

```
1 3 N
5 1 E
```

## How to start

* This application is using ruby version `2.5.3` installed with rbenv help.
* Click [here](https://gorails.com/setup/osx/10.14-mojave) to see how to install rbenv
* if you have rbenv you can upgrade to this ruby version by running the following commands
```
brew update
brew upgrade ruby-build
rbenv install 2.5.3 --skip-existing
gem install bundle
```

* for tests we use `rspec`
* to install rspec run `bundle install` or simply `bundle`

## How to run it
* Once everying is set up, go into you `mars_rover` folder 
* Run `ruby start_program.rb`
* It will prompt you to enter a file with data
* If you don't have any file, just press `enter` button and the progam will use default file `./src/input.txt`

## To run tests write
* `rspec`

## Some thoughts for this solution:
* I wanted to practive Object-Oriented design and devide the application into several managable classe
* Rover moves on plateau, so it should know on what plateau to move
* Plateau should know what coordinates it has
* Direction should know what coordinates to have for each direction (N, S, W, E). the rover will use this coordinates to move. For example, current coordinates of the rover (2,2) and it's direction is S (south). South has coordinates (0,-1).
Therefore, if rover makes a move in south direction, it's coordinates will become(2, 1)
* Command represnts each move type, i.e:  'R' = Command.right. Command is responsible for getting a new direction for the rover if it turned right or left, and Command is responsible for getting the coordinates for that direction described above.
These retrieve coordinates for the direction will show how rover's coordinates might change.
* Rover can turn righ, left or make a move. It knows it's current direction, current coordinate and a plateau it is on. It can alter it's attributes if needed. 
