class_name PlayerState
extends State

#only difference between this class and state is the reference to the player node
#@onready var player: Player = get_tree().get_first_node_in_group("Player")
# Using this instead of the node groups so it's easier to connect this class to the player node when having two players
# if I used groups then they would both point to the same Player node
@onready var player: Player = self.get_parent().get_parent()
#@onready var animation: AnimationPlayer = get_tree().get_first_node_in_group("Animation")
@onready var animation: AnimationPlayer = player.animation

@onready var collision: CollisionShape2D = player.collision

@onready var controls: PlayerControls = player.controls

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity", -9.8)

@onready var SIDESTEP_DISTANCE_Y: int = 15
@onready var SIDESTEP_SPEED_Y: int = 10

# TODO: We could source these animations from resources so we don't have to handle
# the paths and such ourselves everytimes we add something

#animation names
var neutral_idle_animation: String = "Idle"
var neutral_walk_animation: String = "Walk"

# TODO: These should be taken from attack resources to streamline development
var punch_animation: String = "Punch"
var jab_animation: String = "Jab"
var kick_animation: String = "Kick"

var upper_punch_animation: String = "Punch"
var lower_punch_animation: String = "Punch"


# TODO: should have its own animation
var side_step_animation: String = "Jump"

# TODO: these should have their own animations
var upper_idle_animation: String = "Idle"
var lower_idle_animation: String = "Idle"
var upper_walk_animation: String = "Walk"
var lower_walk_animation: String = "Walk"

# States
@export_group("States")

@export var ul_idle_state: UpperLaneIdleState
@export var sl_idle_state: SameLaneIdleState
@export var ll_idle_state: LowerLaneIdleState

@export var ul_walk_state: UpperLaneWalkState
@export var sl_walk_state: SameLaneWalkState
@export var ll_walk_state: LowerLaneWalkState

@export var side_step_state: SidestepState
@export var sidestep_up_state: SidestepUpState
@export var sidestep_down_state: SidestepDownState

@export var sl_punch_state: PunchState
@export var kick_state: KickState

@export var ul_punch_state: UpperLanePunchState
@export var ll_punch_state: LowerLanePunchState


# State Variables
@onready var sprite_flipped: bool = controls.is_second_player

#Input Keys
#var movement_key: String = "Movement"
#var sidestep_key: String = "Sidestep"
#var left_key: String = "Left"
#var right_key: String = "Right"
#var up_key: String = "Up"
#var down_key: String = "Down"
#var light_attack: String = "Light"
#var heavy_attack: String = "Heavy"

#Input Action
@onready var left_actions: Array = InputMap.action_get_events(controls.left_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
@onready var right_actions: Array = InputMap.action_get_events(controls.right_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))

@onready var up_actions: Array = InputMap.action_get_events(controls.up_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))
@onready var down_actions: Array = InputMap.action_get_events(controls.down_key).map(func(action: InputEvent) -> String: return action.as_text().get_slice(" (", 0))

#Util Fn
func determine_sprite_flipped(event_text: String) -> void:
#	If there is an input event in the left_actions array, flip the sprite
	if left_actions.find(event_text) != -1: sprite_flipped = true
	elif right_actions.find(event_text) != -1: sprite_flipped = false
	print("sprite_flipped: " + str(sprite_flipped))
	player.sprite.flip_h = sprite_flipped
	pass

	
func can_sidestep_up() -> bool:
	if player.current_lane < 1:
		return true
	return false

func can_sidestep_down() -> bool:
	if player.current_lane > -1:
		return true
	return false

func tween_up() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(player, "position", Vector2(player.position.x, player.position.y-SIDESTEP_DISTANCE_Y), .3)
	player.current_lane+=1
	print("Player", controls.player_index, " current_lane: ", player.current_lane)


func tween_down() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(player, "position", Vector2(player.position.x, player.position.y+SIDESTEP_DISTANCE_Y), .3)
	player.current_lane-=1
	print("Player", controls.player_index, " current_lane: ", player.current_lane)


#Base Fn

func process_physics(delta: float) -> State:
#	super() should always be called in child classes with overrided methods so 
#   generic logic that applies to all states can be contained in here, 
#	while specific logic stays in the child states
	#player.velocity.y += gravity * delta
	player.move_and_slide()
	
	return null
	
func exit(new_state: State = null) -> void:
	super()
#	avoids a null assignment problem
	if new_state:
		#	pass on the sprite flipped value to the next state
		new_state.sprite_flipped = sprite_flipped
		#new_state.current_lane = current_lane
