class_name SidestepState
extends PlayerState


var has_stepped: bool

func enter() -> void:
	print("Sidestep State")
	has_stepped = false
	player.animation.play(side_step_animation)
	
#	has_stepped indicates that the sidestep finished and the state can transition
	player.animation.animation_finished.connect(func(_anim): has_stepped = true)
	
func exit(new_state: State = null) -> void:
	super(new_state)

#	TODO: if has_stepped and the player's in the same lane as opponent, transition to that state, else do the other one
func process_input(event: InputEvent) -> State:
	super(event)
	if has_stepped and event.is_action_pressed(movement_key):
#		Flip sprite
		print("InputEvent in sidestep_state: " + event.as_text())
		determine_sprite_flipped(event.as_text())
		return sl_walk_state
	return null

# TODO: what state it returns should be determined by which lane the player is in
func process_frame(delta: float) -> State:
	super(delta)
	if has_stepped: return sl_idle_state
	return null
