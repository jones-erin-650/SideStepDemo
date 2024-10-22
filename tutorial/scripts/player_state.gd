class_name PlayerState
extends State

#only difference between this class and state is the reference to the player node
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var collision: CollisionShape2D = get_tree().get_first_node_in_group("Collision")

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
@export var sl_idle_state: PlayerState
@export var sl_walk_state: PlayerState
@export var dl_idle_state: PlayerState
@export var dl_walk_state: PlayerState


@export var side_step_state: PlayerState

@export var punch_state: PunchState
@export var kick_state: KickState



# State Variables
var sprite_flipped: bool = false
# -1 for bottom lane, 0 for middle, 1 for top
var lanes = [-1, 0, 1]
var current_lane: int = 0

#Input Keys
var movement_key: String = "Movement"
var sidestep_key: String = "Sidestep"
var left_key: String = "Left"
var right_key: String = "Right"
var up_key: String = "Up"
var down_key: String = "Down"
var light_attack: String = "Light"
var heavy_attack: String = "Heavy"

#Input Action
var left_actions: Array = InputMap.action_get_events(left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
var right_actions: Array = InputMap.action_get_events(right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))

var up_actions: Array = InputMap.action_get_events(up_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
var down_actions: Array = InputMap.action_get_events(down_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))

#Util Fn
func determine_sprite_flipped(event_text: String) -> void:
#	If there is an input event in the left_actions array, flip the sprite
	if left_actions.find(event_text) != -1: sprite_flipped = true
	elif right_actions.find(event_text) != -1: sprite_flipped = false
	print("sprite_flipped: " + str(sprite_flipped))
	player.sprite.flip_h = sprite_flipped
	pass

# Returns 1 if you're trying to sidestep up, returns -1 for sidestep down, and 0 for unable to sidestep
func determine_lane_switch(event_text: String) -> void:
	#	If there is an input event in the vertical actions array and you can sidestep in that direction, increment the lane
	if up_actions.find(event_text) != -1 and can_sidestep_up(): current_lane+=1
	if down_actions.find(event_text) != -1 and can_sidestep_down(): current_lane-=1
	pass
	
func can_sidestep_up() -> bool:
	if current_lane < 1:
		return true
	return false

func can_sidestep_down() -> bool:
	if current_lane > -1:
		return true
	return false

#Base Fn

#TODO: Not sure if this should be handled this way
#TODO: For some reason you can sidestep during a side step animation
func process_physics(delta: float) -> State:
#	super() should always be called in child classes with overrided methods so 
#   generic logic that applies to all states can be contained in here, 
#	while specific logic stays in the child states
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	
	match current_lane:
		-1:
			player.set_collision_mask_value(3, true)
			player.set_collision_mask_value(4, false)
			player.set_collision_mask_value(5, false)
			
		0:
			player.set_collision_mask_value(3, false)
			player.set_collision_mask_value(4, true)
			player.set_collision_mask_value(5, false)
		1:
			player.set_collision_mask_value(3, false)
			player.set_collision_mask_value(4, false)
			player.set_collision_mask_value(5, true)
	
	return null
	
func exit(new_state: State = null) -> void:
	super()
#	avoids a null assignment problem
	if new_state:
		#	pass on the sprite flipped value to the next state
		new_state.sprite_flipped = sprite_flipped
		new_state.current_lane = current_lane
