extends CharacterBody2D

@onready var tile_map: TileMap = $"../TileMap"
@onready var player: CharacterBody2D = $"."

var is_moving = false


#	Lane System
#		Need to keep the state of what lane the character is in
#		Also need to keep track of what lane the other player is in 
#		VAR: playerLane
#		STATE: sameLane
#		STATE: seperateLane

#	Character Moveset Handling
#		STATE: normalMoveset
#		STATE: knockdownMoveset
#		STATE: sideStepMoveset

func _physics_process(delta):
#	need to wait till we're finished moving before listening to new inputs
	if is_moving:
		return
	
	if Input.is_action_pressed("up"):
		move(Vector2.UP)
	elif Input.is_action_pressed("down"):
		move(Vector2.DOWN)
	elif Input.is_action_pressed("left"):
		move(Vector2.LEFT)
	elif Input.is_action_pressed("right"):
		move(Vector2.RIGHT)



#	Vertical Direction Handling
#		or FUNC: switchVerticalDirection() so the game loop can handle it
	
#	Horizontal direction handling

#		FUNCT: switchVerticalDirection()
	
#	Horizontal Movement Handling
	
	# Horizontal movement is not grid based, only vertical side stepping is
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
		#	Vertical Movement handling
#		If you press up or down then it switches you into the corresponding lane
#		This is done with grid based movement where each lane is a different vertical grid
func move(direction: Vector2):
	print(direction)
#	Get current tile Vector2i
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
#	Get target tile Vector2i
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x, current_tile.y + direction.y
	)
	print(current_tile, target_tile)
#	Get custom data layer from the target tile to see if it's walkable

	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	
	if tile_data.get_custom_data("is_walkable") == false:
		return

#	Move player
	is_moving = true

	global_position = tile_map.map_to_local(target_tile)
	
	
	is_moving = false
	
	
	#		FUNC: incrementLane()
	#		FUNC: decrementLane()
	#		EVENT: laneSwitched()
