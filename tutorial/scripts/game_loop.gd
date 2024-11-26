class_name GameLoop
extends Node

@onready var player_1: Player = $Player1
@onready var player_2: Player = $Player2

@onready var player_1_score: int = 0
@onready var player_2_score: int = 0

@export var winning_score: int = 3


func _process(delta):
	determine_player_lanes()
	determine_winner()

	
#UtilFunctions

func determine_winner():
	if(player_1_score >= winning_score):
		print("Player 1 Wins!!")
		engine_slow(.1)
		await get_tree().create_timer(0.1 * 0.5).timeout
		get_tree().reload_current_scene() 

	elif(player_2_score >= winning_score):
		print("Player 2 Wins!!")
		engine_slow(.1)
		await get_tree().create_timer(0.1 * 0.5).timeout
		get_tree().reload_current_scene() 

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
		

func _on_player_1_player_hurt() -> void:
	player_2_score+=1
	print("Player 2 Score: ", player_2_score)

func _on_player_2_player_hurt() -> void:
	player_1_score+=1
	print("Player 1 Score: ", player_1_score)
	
func engine_slow(slowdown_scale) -> void:
	Engine.time_scale = slowdown_scale
	await get_tree().create_timer(slowdown_scale * 0.5).timeout
	Engine.time_scale = 1
