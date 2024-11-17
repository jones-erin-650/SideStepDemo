class_name IdleState
extends PlayerState

func enter() -> void:
	player.animation.play(neutral_idle_animation)
	
func exit(new_state: State = null) -> void:
	super(new_state)


func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(controls.movement_key):
#		Flip sprite
		determine_sprite_flipped(event.as_text())
		return sl_walk_state
	elif event.is_action_pressed(controls.light_attack): return sl_punch_state
	elif event.is_action_pressed(controls.heavy_attack): return kick_state
	elif event.is_action_pressed(controls.up_key): return sidestep_up_state
	elif event.is_action_pressed(controls.down_key): return sidestep_down_state

	return null

func process_physics(delta: float)	-> State:
	super(delta)
	return null
