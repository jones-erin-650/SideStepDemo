class_name Camera
extends Camera2D

const INIT_ZOOM: Vector2 = Vector2.ONE * 5
const INIT_OFFSET: Vector2 = Vector2.ZERO 

var current_zoom: Vector2 = INIT_ZOOM
var current_offset: Vector2 = INIT_OFFSET

var shake_recovery_factor: float = 1
var zoom_recovery_factor: float = 1

var shake_intensity: Vector2 = Vector2.ZERO  # Intensity of the shake

func _ready() -> void:
	zoom = INIT_ZOOM
	offset = INIT_OFFSET

func _process(delta: float) -> void:
	recover_zoom(delta)

func recover_offset_and_shake(delta: float) -> void:
	current_offset = lerp(current_offset, INIT_OFFSET, delta * shake_recovery_factor)
	current_offset.x = randf_range(current_offset.x * -1, current_offset.x * 1)
	current_offset.y = randf_range(current_offset.y * -1, current_offset.y * 1)
	offset = current_offset

func recover_zoom(delta: float) -> void:
	current_zoom = lerp(current_zoom, INIT_ZOOM, delta * zoom_recovery_factor)
	zoom = current_zoom

func set_zoom_strength(zoom_strength: float) -> void:
	current_zoom *= zoom_strength

func set_shake_strength(shake_strength: Vector2) -> void:
	# Apply the shake once. If you want continuous shake, you could adjust this
	shake_intensity += shake_strength
