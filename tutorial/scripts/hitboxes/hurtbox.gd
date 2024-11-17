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

func add_game_juice() -> void:
	engine_slow()
	
	
	camera.set_zoom_strength(1.1)
	camera.set_shake_strength(Vector2(5, 5))
	

	
func engine_slow() -> void:
	Engine.time_scale = 0.9
	await get_tree().create_timer(0.9 * 0.5).timeout
	Engine.time_scale = 1
