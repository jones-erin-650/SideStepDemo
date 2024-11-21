### 2024-11-2 - 3 hrs (planned)
* have hurtboxes flip when the sprite flips
* unique hurtboxes for attacking
* unique hurtboxes for sidestepping
* let the animations finish playing after the winning hit

### 2024-11-17 - 3 hrs: polishing state transitions
* animations are faster
* kick hitboxes no longer hurt their own players hurtbox
* can attack and sidestep while walking
* faster sidestep tweening
* sidesteps tween you slightly horizontally too
*  knockback on hit so you don't get stuck in hitstun

### 2024-11-12 - 2 hrs: functional hitboxes, camera zooms, and win condition
* camera class and functions for shaking and zooming the camera on a hit
* hitstun hate that the player enters on hit
* engine slows down on hit
* point system where each player gains a point after hitting the other, first to 3 wins


### 2024-11-11 - 3 hrs: sidestep attacks
* seperate same lane, lower lane, and upper lane states for idling, attacking, and walking
* gameloop can now determine what lane a player is in and change their states based on that information
* sidestep attacks that are done while in other lanes, tweens the player towards the other player

### 2024-11-04 - 3 hrs: sidestep refactoring and lane detection
* sidesteps now work off two seperate states for sidestep up and down
* the player sprite is tweened to a different lane rather than being jammed into a collision box
* players can no longer sidestep multiple times during the animation
* player 2 faces left on round start
* player has a collision box that interacts with lane collision boxes to track what lanes both players are in

### 2024-10-29 - 2 hrs: player controls refactoring and multiplayer
* controls are now handled by a controls resource in player
* that controls variable is used through the Player reference in each State class, allowing them to call player.controls.left_key instead of left_key being a hardcoded string
* null pointer errors were avoided by changing the order of operations of the @onready variables, and making a couple variables that relied on player.controls also called @onready
* Refactored the Player reference in PlayerState to use get_parent() instead of getting a node in a group. This makes having two player scenes much easier as they don't have to reference two different groups and can instead just reference their parent nodes.
* Multiplayer now works!


### 2024-10-27 - 2 hrs: multiplayer (failed)
* tried and failed to implement local multiplayer to the game
* I attempted this by having two seperate inputmaps in a PlayerControl resource, then have the PlayerStates reference those inputs for the control logic
* However, there was a null pointer problem that I wasn't able to resolve as the resource is stored in the Player node, and the PlayerStates are loaded differently than that
* Getting a reference to that control map kept going wrong.


### 2024-10-25 - 1 hrs: hitboxes and hurtboxes
* added hitboxes to the attack animations
* they are only enabled during the active frames of an attack
* hitboxes are tied to the animations
* characters have hurtboxes that wait for hitboxes to enter them then deal damage

### 2024-10-23 - 2-3 hrs: lane switching prototype
* mostly writing this for myself
* Set up 2D physics layers for each lane and the player:
* ![image](https://github.com/user-attachments/assets/8e080e8d-7dac-4f72-b37a-33823439d829)
* Each physics layer in the tileset listens to the player's collision
* ![image](https://github.com/user-attachments/assets/d3de2e56-10ff-46d0-ba90-7e819f721588)
* Changing which layers the player collides with could be one way of switching lanes. This way we don't have to awkwardly have vertical movement be grid based with horizontal physics not be
* ![image](https://github.com/user-attachments/assets/7f5dfca0-3ad3-4647-800a-9ad4e0667dce)
* ![image](https://github.com/user-attachments/assets/31b043d4-d285-4449-9a24-17a680932b83)
* ![image](https://github.com/user-attachments/assets/5397c457-a5ea-42c5-b4cd-1abca5922468)
* This way we can also have attack hitboxes and hurtboxes on a seperate physics layer so players can be hit regardless of which lane they're in (for moves that switch lanes or track to different lanes)
* Created seperate states for walking and idling when the players are in the same lanes and different lanes
* Simplified State Machine:
* ![image](https://github.com/user-attachments/assets/5afd2e0f-ac98-4f10-afef-c0a91a6541ef)
* Created a SideStepState that moves the player to another lane
* handles by keeping track of the player's current lane in a range from -1 to 1, and the physics layer constantly determines which collision layer the player should be on. this is determined when the SidestepState calls the determine_sidestep() function


### 2024-10-21 - 1 hrs: basic attacks
* added states for a punch and kick attack
* pressing the attack buttons from idle transitions into these attacking states
* entering the attacking states plays their animations
* currently don't have hitboxes

### 2024-10-15 - .5-1 hrs: state and uml diagrams
* Created uml diagrams for the State, PlayerStates, IdleState, and WalkState classes to better understand the inheritance between them
* created a state machine diagram to plan out how I will handle SideStep states

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

