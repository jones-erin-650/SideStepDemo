class_name Player
extends CharacterBody2D

@export var controls: PlayerControls
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var collision: CollisionShape2D = $Collision
@onready var animation: AnimationPlayer = $Animation
@onready var state_machine: StateMachine = $StateMachine
@export var SPEED: float = 85

signal player_hurt

# -1 for bottom lane, 0 for middle, 1 for top
var lanes = [-1, 0, 1]
var current_lane: int = 0

# Same lane as the other player
var upper_lane = false
var same_lane = false
var lower_lane = false

func get_controls() -> PlayerControls:
	print("Returning controls: ", controls)

	return controls as PlayerControls

func _ready(): 
	print("Player 1:", controls.is_second_player, "_ready()")
	print("Controls: ", controls)
	print("Animation: ", state_machine)
	print("Sprite: ", sprite)
	print("Collision: ", collision)
	print("Animation: ", animation)
	print("StateMachine: ", state_machine)
	
#	make sure player 2 is facing the right direction at the start
	if controls.is_second_player: sprite.flip_h = true
	state_machine.init()


func _process(delta): state_machine.process_frame(delta)

func _physics_process(delta): state_machine.process_physics(delta)

func _input(event): state_machine.process_input(event)

#Util functions
	#Only one can be true at once
func set_same_lane():
	upper_lane = false
	same_lane = true
	lower_lane = false
	
func set_upper_lane():
	upper_lane = true
	same_lane = false
	lower_lane = false

func set_lower_lane():
	upper_lane = false
	same_lane = false
	lower_lane = true


func _on_hurt_box_player_hurt() -> void:
	print("in _on_hurt_box_player_hurt()")
	player_hurt.emit()
