extends Node2D
class_name Moveset

#empty dictionary
@export var move_list = {
#	Assigns a command input to a specific attack

#	A attacks
	"neutral+a": null,
	"forward+a": null,
	"down_forward+a": null,
	"down+a": null,
	"down_back+a": null,
	"back+a": null,
	"up_back+a": null,
	"up+a": null,
	"up_forward+a": null,
}

# constructor
func _init(custom_movelist: Dictionary):
	if custom_movelist:
		move_list = custom_movelist
