### 2024-10-15 - ? hrs: planned
* Create a diagram for the state machine and uml diagrams for the State, PlayerStates, IdleState, and WalkState classes to better understand the inheritance between them

### 2024-10-15 - 4-5 hrs: started following a fighting game tutorial because I am not getting anywhere with these input state machines
* uses this asset pack: https://ansimuz.itch.io/streets-of-fight
* following this tutorial: https://www.youtube.com/watch?v=gtrOIQtnJmI&t=39s
* Implemented a state machine that handles every state a player can be in and the transitions between them
* Structure for player states is very expandable, so adding states for lane switching shouldn't be hard
* Idle state that plays the idle animation and waits for user left and right inputs to transition into the Walking State
* Walking State that plays the walking animation, handles character movement, and determines whether the player sprite should be flipped horizontally or not
* Structure for passing the sprite_flipped boolean between states during transitions

### 2024-10-14 - 1.5 hrs: refactored to resources and messed with attack logic more
* watched videos and read documentation to learn about resources: https://youtu.be/CAzdub_WO00?si=G372tupbvTyOkB6- and https://youtu.be/vzRZjM9MTGw?si=OVsTCDehpCw8Jjc_
* changed from nodes with classes to resources for the movelist and attacks
* tested changes by adding a second character to the game scene

### 2024-10-12 - 5 hrs: started creating logic for attacks
* watched this video for an idea of how to structure the attacks: https://youtu.be/AaJopFFkmNo?si=ZFShACer8ItWbNcP
* watched this video for help with classes: https://youtu.be/y3faMdIb2II?si=zNd5Z68Pa1rZqds7
* watched this video for help with exporting enums: https://youtube.com/shorts/FEQhHfiiUBM?si=ww441WDWcpKp2RvJ
* created a Moveset class that contains a dictionary that maps inputs to Attacks
* created an Attack class and exported its properties to a scene so you can easily create new attacks for the moveset
* Added new input maps for attacks
* Added extra properties on the player including an encapsulated Moveset class and states for directions and what movelist should be used
* When I was taking a break I was doodling and decided to put those in as placeholder assets for attack animations


### 2024-10-11 - 1 hrs: gd script video
* watched this video as right now I am relying on chatgpt as a crutch due to not knowing the language too well yet: https://www.youtube.com/watch?v=e1zJS31tr88

### 2024-10-8 - 1 hrs: Redone 3d movement Basics
* The way I set it up before was not the best
* it was hard to get grid based movement working properly, and trying to get regular horizontal movement to work nicely with it was not going well
* used chatgpt to make a basic structure that uses an array for lanes, and has up and down inputs increment the position in the array
* had to clean up some of its implementation, and there is still a lot I need to redo for it
* uploaded a new build to itch.io

### 2024-10-7 - 1.5 hrs: 3d movement basics
* resolved a merge conflight with the comment planning
* followed one tutorial for grid based movement but decided against it: https://www.youtube.com/watch?v=8tDcJEbQnW0&list=PL1VENaIqLopxeHHpqYY1nDQ3Erm37exLb&index=12&pp=gAQBiAQB
* somewhat followed a tutorial for grid based movement: https://www.youtube.com/watch?v=9u1Dq6h7sGU
* coded logic for moving around in a grid
* right now the character moves way too fast, and horizontal movement is still tied to a grid which isn't ideal
* used chatgpt to fix a bug where you could only use once then never again because of the way the is_moving variable was handled

### 2024-10-1 - 2 hr: comment prototypes
* began making a comment prototype of the character movement
* this just has explainations what what logic needs to be where
* planning out how tracking what lane the characters are in will work
* started planning out how the game loop will handle character directions
* spent a lot of time trying to get git and godot to work nicely together
*   had to fix an issue where main had the assets folder but a branch didn't for some reason

### 2024-09-24 - 2 hr: Setting Up the Project
* uploaded that build to itch.io
* created a mostly blank build from the project
* created a godot project
* created the devlog
* created a trello board and added tasks
* uploaded my proposal to git
* set up the gitignore and gitattributes
* created a git repo

