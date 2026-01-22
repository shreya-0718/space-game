extends Button


@onready var usure = get_node("../../usure?")


func _on_pressed():
	usure.visible = false
	undim_screen()

@onready var dim = get_node("../../CanvasLayer6/dim")

func undim_screen():
	var color = dim.color
	color.a = 0
	dim.color = color
