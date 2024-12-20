class_name SameLaneIdleState
extends IdleState

func enter() -> void:
	print("SL_IdleState")
	print("Initial sprite_flipped: " + str(sprite_flipped))
	super()
	
func exit(new_state: State = null) -> void:
	super(new_state)

# TODO: Make sure it returns sl_walk_state properly
func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(controls.movement_key):
#		Flip sprite
		determine_sprite_flipped(event.as_text())
		return sl_walk_state
#		Flip sprite
		return side_step_state
	elif event.is_action_pressed(controls.light_attack): return sl_punch_state
	elif event.is_action_pressed(controls.heavy_attack): return kick_state
	elif event.is_action_pressed(controls.up_key) and can_sidestep_up(): return sidestep_up_state
	elif event.is_action_pressed(controls.down_key) and can_sidestep_down(): return sidestep_down_state
	return null

func process_physics(delta: float)	-> State:
	super(delta)
	
	if player.upper_lane:
		return ul_idle_state
	elif player.lower_lane:
		return ll_idle_state
		
	return null
