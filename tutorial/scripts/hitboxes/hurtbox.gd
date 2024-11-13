class_name HurtBox
extends Area2D

@onready var camera: Camera = get_tree().get_first_node_in_group("Camera")

func _ready() -> void:
	collision_layer = 7
	collision_mask = 6
	self.area_entered.connect(on_area_entered)
	
func on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null: return
#	deal damage
	pass
	print("damage dealt")

func add_game_juice() -> void:
	print("Adding game juice")
	camera.set_zoom_strength(1.1)
	camera.set_shake_strength(Vector2(5, 5))
