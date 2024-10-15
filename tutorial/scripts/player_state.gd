class_name PlayerState
extends State

#only difference between this class and state is the reference to the player node
@onready var player: Player = get_tree().get_first_node_in_group("Player")

#animation names
var idle_animation: String = "Idle"
