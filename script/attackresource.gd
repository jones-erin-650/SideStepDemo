extends Resource
class_name AttackResource

@export var attack_name: String
@export var attack_damage: int
@export var knock_back_force: float
@export var knocksdown: bool
#enums can't be exported normally so you have to make a variable that calls it
@export var target: targets
enum targets{HIGH, MID, LOW}

# Hitstun
@export var hitstun_on_block: int
@export var hitstun_on_hit: int
@export var hitstun_on_counter: int

# TODO: unsure whether to do animation name or path
@export var animation_name: String
