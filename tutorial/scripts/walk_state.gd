class_name WalkState
extends PlayerState

const SPEED: float = 50

func enter() -> void:
	print("Walk State")
	super()
	player.animation.play(walk_animation)
	
func exit(new_state: State = null) -> void:
	super()
	player.velocity.x = 0.0

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(movement_key): determine_sprite_flipped(event.as_text())
	return null

func process_physics(delta: float)	-> State:
	do_move(get_move_direction())
	if get_move_direction() == 0.0: return idle_state
	super(delta)
	return null
	
func get_move_direction() -> float:
	return Input.get_axis(left_key, right_key)
	
func do_move(move_direction: float) -> void:		
	player.velocity.x = move_direction * SPEED
