class_name Player
extends CharacterBody2D

@export var controls: PlayerControls
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var collision: CollisionShape2D = $Collision
@onready var animation: AnimationPlayer = $Animation
@onready var state_machine: StateMachine = $StateMachine


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
