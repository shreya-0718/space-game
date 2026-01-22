extends Button



func _on_pressed():
	dim_screen()
	check_surety()
	

@onready var dim = get_node("../../CanvasLayer6/dim")
@onready var usure = get_node("../../usure?")

func dim_screen():
	var color = dim.color
	color.a = 0.8
	dim.color = color

func check_surety():
	usure.visible = true

	
