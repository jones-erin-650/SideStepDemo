class_name LaneCollision
extends Area2D

@export var lane_index: int = 0;

func _ready() -> void:
	collision_layer = 3
	collision_mask = 4
	self.area_entered.connect(on_area_entered)
	
func on_area_entered(lane_detector: LaneDetector) -> void:
	print("Lane ", lane_index, " Entered")
	pass
