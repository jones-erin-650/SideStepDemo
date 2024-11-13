class_name UpperLanePunchState
extends PlayerState

@onready var hitbox: Area2D = $HitBox


var has_attacked: bool

func enter() -> void:
	print("UL Punch State")
	has_attacked = false
#	TODO: This should definitely be handled by a super() call to a generic Attack state
	if sprite_flipped: hitbox.scale.x = -1
	else: hitbox.scale.x = 1
	player.animation.play(punch_animation)
	
#	has_attacked indicates that the attack finished and the state can transition
	player.animation.animation_finished.connect(func(_anim): has_attacked = true)
	
#	Move the player down a lane
	tween_down()
	
func exit(new_state: State = null) -> void:
	super(new_state)


func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_frame(delta: float) -> State:
	super(delta)
	if has_attacked:
		if player.same_lane:
			return sl_idle_state
		elif player.upper_lane:
			return ul_idle_state
		elif player.lower_lane:
			return ll_idle_state	
	return null
