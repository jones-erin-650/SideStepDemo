class_name PlayerState
extends State

#only difference between this class and state is the reference to the player node
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

# TODO: We could source these animations from resources so we don't have to handle
# the paths and such ourselves everytimes we add something

#animation names
var neutral_idle_animation: String = "Idle"
var neutral_walk_animation: String = "Walk"

# TODO: These should be taken from attack resources to streamline development
var punch_animation: String = "Punch"
var jab_animation: String = "Jab"
var kick_animation: String = "Kick"

# TODO: should have its own animation
var side_step_animation: String = "Jump"

# TODO: these should have their own animations
var upper_idle_animation: String = "Idle"
var lower_idle_animation: String = "Idle"
var upper_walk_animation: String = "Walk"
var lower_walk_animation: String = "Walk"

# States
@export_group("States")
@export var neutral_idle_state: PlayerState
@export var neutral_walk_state: PlayerState

@export var side_step_state: PlayerState

@export var seperate_lane_idle_state: PlayerState
@export var seperate_lane_walk_state: PlayerState



# State Variables
var sprite_flipped: bool = false

#Input Keys
var movement_key: String = "Movement"
var left_key: String = "Left"
var right_key: String = "Right"

#Input Action
var left_actions: Array = InputMap.action_get_events(left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
var right_actions: Array = InputMap.action_get_events(right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))


#Util Fn
func determine_sprite_flipped(event_text: String) -> void:
#	If there is an input event in the left_actions array, flip the sprite
	if left_actions.find(event_text) != -1: sprite_flipped = true
	elif right_actions.find(event_text) != -1: sprite_flipped = false
	print("sprite_flipped: " + str(sprite_flipped))
	player.sprite.flip_h = sprite_flipped
	pass

#Base Fn

func process_physics(delta: float) -> State:
#	super() should always be called in child classes with overrided methods so 
#   generic logic that applies to all states can be contained in here, 
#	while specific logic stays in the child states
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
	
func exit(new_state: State = null) -> void:
	super()
#	avoids a null assignment problem
	if new_state:
		#	pass on the sprite flipped value to the next state
		new_state.sprite_flipped = sprite_flipped
