class_name Player
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animation: AnimationPlayer = $Animation
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var collision: CollisionShape2D = $Collision
@export var controls: PlayerControls


func get_controls() -> PlayerControls:
	print("Returning controls: ", controls)

	return controls as PlayerControls

func _ready(): 
	
	print("Player Node _ready()")
	print("Controls: ", controls)
	state_machine.init()


func _process(delta): state_machine.process_frame(delta)

func _physics_process(delta): state_machine.process_physics(delta)

func _input(event): state_machine.process_input(event)
