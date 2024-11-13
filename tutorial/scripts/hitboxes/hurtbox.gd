class_name HurtBox
extends Area2D

func _ready() -> void:
	collision_layer = 7
	collision_mask = 6
	self.area_entered.connect(on_area_entered)
	
func on_area_entered(hitbox: HitBox) -> void:
	if hitbox == null: return
#	deal damage
	pass
	print("damage dealt")
