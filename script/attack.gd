class_name Attack

@export var attack_damage: int
@export var knock_back_force: float
@export var animation_name: String
@export var knocksdown: bool
#enums can't be exported normally so you have to make a variable that calls it
@export var target: targets
enum targets{HIGH, MID, LOW}

# Hitstun
@export var hitstun_on_block: int
@export var hitstun_on_hit: int
@export var hitstun_on_counter: int
