extends CharacterBody2D


const SPEED = 80.0


func _physics_process(delta):

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

#	Vertical Direction Handling
#		or FUNC: switchVerticalDirection() so the game loop can handle it
	
#	Horizontal direction handling

#		FUNCT: switchVerticalDirection()
	
#	Horizontal Movement Handling

	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#	Vertical Movement handling
#		If you press up or down then it switches you into the corresponding lane
#		FUNC: incrementLane()
#		FUNC: decrementLane()
#		EVENT: laneSwitched()

