class_name AttackState
extends PlayerState

@onready var hitbox: Area2D = $HitBox


var has_attacked: bool

func enter() -> void:
	has_attacked = false
#	TODO: This should definitely be handled by a super() call to a generic Attack state
	if sprite_flipped: hitbox.scale.x = -1
	else: hitbox.scale.x = 1
	player.animation.play(punch_animation)
	
#	has_attacked indicates that the attack finished and the state can transition
	player.animation.animation_finished.connect(func(_anim): has_attacked = true)
	
func exit(new_state: State = null) -> void:
	super(new_state)


func process_input(event: InputEvent) -> State:
	super(event)
	if has_attacked and event.is_action_pressed(controls.movement_key):
#		Flip sprite
		determine_sprite_flipped(event.as_text())
		return sl_walk_state
	elif has_attacked and event.is_action_pressed(controls.light_attack): sl_punch_state
	elif has_attacked and event.is_action_pressed(controls.heavy_attack): kick_state
	return null

func process_frame(delta: float) -> State:
	super(delta)
	if has_attacked: return sl_idle_state
	return null
