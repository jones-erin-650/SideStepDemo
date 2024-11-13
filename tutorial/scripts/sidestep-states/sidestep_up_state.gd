class_name SidestepUpState
extends SidestepState

#TODO: Tween the animation upwards at a speed set in the Player script
func enter() -> void:
	print("Sidestep Up State")
	super()
	
	tween_up()
	print("player", controls.player_index, " upper_lane: ", player.upper_lane)
	print("player", controls.player_index, " same_lane: ", player.same_lane)
	print("player", controls.player_index, " lower_lane: ", player.lower_lane)

	
func exit(new_state: State = null) -> void:
	super(new_state)
	
#TODO: If the other player is in a lower lane after the sidestep, change to the upper idle state
#TODO: If the other player is in the same lane after the sidestep, change to the neutral idle state

#	TODO: if has_stepped and the player's in the same lane as opponent, transition to that state, else do the other one
func process_input(event: InputEvent) -> State:
	super(event)
	return null

# TODO: what state it returns should be determined by which lane the player is in
func process_frame(delta: float) -> State:
	super(delta)
	if has_stepped:
		if player.same_lane:
			return sl_idle_state
		elif player.upper_lane:
			return ul_idle_state
		elif player.lower_lane:
			return ll_idle_state
	return null
