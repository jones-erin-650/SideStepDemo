class_name HitstunState
extends PlayerState

@onready var hurt_box: PlayerHurtBox = $HurtBox

var hitstun_over: bool

func enter() -> void:
	hitstun_over = false
	player.animation.play(hitstun_animation)
	hurt_box.add_game_juice()
#	has_attacked indicates that the attack finished and the state can transition
	player.animation.animation_finished.connect(func(_anim): hitstun_over = true)
	
func exit(new_state: State = null) -> void:
	super(new_state)


func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_frame(delta: float) -> State:
	super(delta)
	if hitstun_over:
		if player.same_lane:
			return sl_idle_state
		elif player.upper_lane:
			return ul_idle_state
		elif player.lower_lane:
			return ll_idle_state
	return null
