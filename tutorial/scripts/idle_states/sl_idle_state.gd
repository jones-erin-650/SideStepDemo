class_name SameLaneIdleState
extends IdleState

func enter() -> void:
	print("SL_IdleState")
	super()
	
func exit(new_state: State = null) -> void:
	super(new_state)

# TODO: Make sure it returns sl_walk_state properly
func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(movement_key):
#		Flip sprite
		print("InputEvent in upper_idle_state: " + event.as_text())
		determine_sprite_flipped(event.as_text())
		return sl_walk_state
	elif event.is_action_pressed(light_attack): return punch_state
	elif event.is_action_pressed(heavy_attack): return kick_state
	return null

func process_physics(delta: float)	-> State:
	super(delta)
	return null
