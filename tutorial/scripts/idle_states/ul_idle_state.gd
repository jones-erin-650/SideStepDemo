class_name UpperLaneIdleState
extends IdleState

func enter() -> void:
	print("UL_IdleState")
	super()
	
func exit(new_state: State = null) -> void:
	super(new_state)

# TODO: Different Lane attacking logic
func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(controls.movement_key):
#		Flip sprite
		determine_sprite_flipped(event.as_text())
		return ul_walk_state
	elif event.is_action_pressed(controls.light_attack): return ul_punch_state
	#elif event.is_action_pressed(heavy_attack): return kick_state
	elif event.is_action_pressed(controls.up_key) and can_sidestep_up(): return sidestep_up_state
	elif event.is_action_pressed(controls.down_key) and can_sidestep_down(): return sidestep_down_state
	return null

func process_physics(delta: float)	-> State:
	super(delta)
	if player.same_lane:
		return sl_idle_state
	elif player.lower_lane:
		return ll_idle_state
	return null
