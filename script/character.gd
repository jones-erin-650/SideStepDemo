extends CharacterBody2D

class_name Character

@onready var tile_map: TileMap = $"../TileMap"
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Character Moveset
@export var moveset : Moveset

# Easier to customize this way

@export var character_stats: CharacterStats

# Character States
var current_lane: int = 1
var actionable = true

enum current_movelist {knockdown, standard, side_step}
enum vertical_direction {up, down, neutral}
enum horizontal_direction {left, right}
var attack_playing = false

var is_moving = false


#	Lane System
#		Need to keep the state of what lane the character is in
#		Also need to keep track of what lane the other player is in 
#		VAR: playerLane
#		STATE: sameLane
#		STATE: seperateLane
#TODO: this should be filled out by tilemap data rather than set values. doing it this way makes it a lot harder to add extra lanes
var lanes = [10, -5, -20]

#	Character Moveset Handling
#		STATE: normalMoveset
#		STATE: knockdownMoveset
#		STATE: sideStepMoveset


func _ready():
	position.y = lanes[current_lane]

func _process(delta):
	handle_input(delta)

func handle_input(delta):
	# Vertical Inputs
#		If you press up or down then it switches you into the corresponding lane
#		This is done with grid based movement where each lane is a different vertical grid
	if Input.is_action_just_pressed("Up"):
#        TODO: incrementing and decrementing the lanes should be handled by a function 
#		 TODO: that function should emit an event for the gameloop to listen to
#		 TODO: there should be logic to prevent the player from switching lanes while they're in the process of moving
		if current_lane < lanes.size() - 1:
			increment_lane()
	elif Input.is_action_just_pressed("Down"):
		if current_lane > 0:
			decrement_lane()
	elif Input.is_action_just_pressed("Light"):
		animated_sprite.play("neutral_a")



		
#	Horizontal Inputs
	# Horizontal movement is not grid based, only vertical side stepping is
	# As good practice, you should replace UI actions with custom gameplay actions.
#	TODO: movement should be strictly analog, find something to replace action strength with
	var horizontal_input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	position.x += horizontal_input * character_stats.HORIZONTAL_SPEED * delta

func increment_lane():
	current_lane += 1
	position.y = lanes[current_lane]  
	print(current_lane)
	
func decrement_lane():
	current_lane -= 1
	position.y = lanes[current_lane]  
	print(current_lane)

	
	

#	Vertical Direction Handling
#		or FUNC: switchVerticalDirection() so the game loop can handle it
	
#	Horizontal direction handling

#		FUNCT: switchVerticalDirection()


	
	
	#		FUNC: incrementLane()
	#		FUNC: decrementLane()
	#		EVENT: laneSwitched()
