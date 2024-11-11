class_name GameLoop
extends Node

@onready var player_1: Player = $Player1
@onready var player_2: Player = $Player2

func _initialize():
	print("Initialized:")

func _process(delta):
	determine_player_lanes()

func _finalize():
	print("Finalized:")
	
#UtilFunctions
# TODO: this is gross
# It's handled this way so that the players don't need to have a reference to the other player
# Doing that would completely destroy the scene heiharchy and make things very messy
func determine_player_lanes():
	if player_1.current_lane > player_2.current_lane:
		player_1.set_upper_lane()
		player_2.set_lower_lane()
	elif player_1.current_lane == player_2.current_lane:
		player_1.set_same_lane()
		player_2.set_same_lane()
	elif player_1.current_lane < player_2.current_lane:
		player_1.set_lower_lane()
		player_2.set_upper_lane()
		
