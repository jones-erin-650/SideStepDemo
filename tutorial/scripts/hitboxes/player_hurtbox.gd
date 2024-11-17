class_name PlayerHurtBox
extends HurtBox

@onready var hitstun_state: HitstunState = $".."
@onready var state_machine: StateMachine = $"../.."

@onready var hitting_area: Node2D

signal player_hurt()

func on_area_entered(hitbox: HitBox) -> void:
	player_hurt.emit()
	
	if hitbox == null: return
	super(hitbox)
	hitting_area = hitbox.owner
	add_game_juice()
	state_machine.change_state(hitstun_state)
