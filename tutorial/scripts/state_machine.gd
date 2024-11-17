class_name StateMachine
extends Node

var current_state: State
@export var starting_state: State

func init() -> void: 
	change_state(starting_state)

# All of these child methods return State. If any of those return values are 
# not null then the current_state is changed to the returned new_state

func process_frame(delta: float) -> void:
#	checks the frame for a new state, when the new_state is not null it changes 
	var new_state: State = current_state.process_frame(delta)
	if new_state: change_state(new_state)

func process_input(event: InputEvent) -> void:
	var new_state: State = current_state.process_input(event)
	if new_state: change_state(new_state)

func process_physics(delta: float) -> void:
	var new_state: State = current_state.process_physics(delta)
	if new_state: change_state(new_state)

func change_state(new_state: State) -> void:
	if current_state: current_state.exit(new_state)
	current_state = new_state
	current_state.enter()
