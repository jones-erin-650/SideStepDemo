class_name IdleState
extends PlayerState

func enter() -> void:
	print("Idle State")
	player.animation.play(idle_animation)
	
func exit(new_state: State = null) -> void:
	super(new_state)


func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(movement_key):
#		Flip sprite
		determine_sprite_flipped(event.as_text())
		return walk_state
	return null

func process_physics(delta: float)	-> State:
	super(delta)
	return null
