extends CharacterBody2D

@onready var tile_map: TileMap = $"../TileMap"

var is_moving = false


#	Lane System
#		Need to keep the state of what lane the character is in
#		Also need to keep track of what lane the other player is in 
#		VAR: playerLane
#		STATE: sameLane
#		STATE: seperateLane
#TODO: this should be filled out by tilemap data rather than set values. doing it this way makes it a lot harder to add extra lanes
var lanes = [10, -5, -20]
var current_lane = 1
var horizontal_speed = 200

#	Character Moveset Handling
#		STATE: normalMoveset
#		STATE: knockdownMoveset
#		STATE: sideStepMoveset


func _ready():
	position.y = lanes[current_lane]  # Set the initial position to the first lane

func _process(delta):
	handle_input(delta)

func handle_input(delta):
	# Vertical Inputs
#		If you press up or down then it switches you into the corresponding lane
#		This is done with grid based movement where each lane is a different vertical grid
	if Input.is_action_just_pressed("ui_up"):
#        TODO: incrementing and decrementing the lanes should be handled by a function 
#		 TODO: that function should emit an event for the gameloop to listen to
#		 TODO: there should be logic to prevent the player from switching lanes while they're in the process of moving
		if current_lane < lanes.size() - 1:
			current_lane += 1
			position.y = lanes[current_lane]  
	elif Input.is_action_just_pressed("ui_down"):
		if current_lane > 0:
			current_lane -= 1
			position.y = lanes[current_lane]  
		
#	Horizontal Inputs
	# Horizontal movement is not grid based, only vertical side stepping is
	# As good practice, you should replace UI actions with custom gameplay actions.
#	TODO: movement should be strictly analog, find something to replace action strength with
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	position.x += horizontal_input * horizontal_speed * delta


#	Vertical Direction Handling
#		or FUNC: switchVerticalDirection() so the game loop can handle it
	
#	Horizontal direction handling

#		FUNCT: switchVerticalDirection()


	
	
	#		FUNC: incrementLane()
	#		FUNC: decrementLane()
	#		EVENT: laneSwitched()
