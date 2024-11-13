class_name PlayerHurtBox
extends HurtBox

@onready var hitstun_state: HitstunState = $".."
@onready var state_machine: StateMachine = $"../.."

func on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null: return
	super(hitbox)
	add_game_juice()
	state_machine.change_state(hitstun_state)
