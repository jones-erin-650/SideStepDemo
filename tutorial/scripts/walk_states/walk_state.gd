class_name WalkState
extends PlayerState

const SPEED: float = 50

func enter() -> void:
	super()
	player.animation.play(neutral_walk_animation)
	
func exit(new_state: State = null) -> void:
	super()
	player.velocity.x = 0.0

func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(controls.movement_key): determine_sprite_flipped(event.as_text())
	return null

func process_physics(delta: float)	-> State:
	do_move(get_move_direction())
	if get_move_direction() == 0.0: return sl_idle_state
	super(delta)
	return null
	
func get_move_direction() -> float:
	return Input.get_axis(controls.left_key, controls.right_key)
	
func do_move(move_direction: float) -> void:		
	player.velocity.x = move_direction * SPEED
