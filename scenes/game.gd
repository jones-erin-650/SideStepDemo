extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
#	Player lanes
#		Other game logic relies on knowing which lanes the players are in
#		STATE: sameLane
#		STATE: differentLanes
	
#	Horizontal Direction Handling
#		The horizontal direction should be based on the location of the other player
#		if player 2 is to the left of p1, then face left, etc
#		FUNC: determineHorizontalDirection()
#		uses a method in the player script to switch their direction
	
#	Vertical Direction Handling
#		Characters need to face up or down based on what lane the other player is in
#		waits for the players to emit an laneSwtich event
#		uses a method in the player script to switch their direction
#		FUNC: determineVerticalDirection()
	pass
