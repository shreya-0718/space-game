extends Node

@onready var usure = get_node("usure?")

func _process(delta):
	update_stars()
	update_powerups()

func update_stars():
	var container = get_node("CanvasLayer2/star_container") 
	var stars = container.get_children()
	for i in range(stars.size()):
		stars[i].modulate = Color(1, 1, 1, 1) if i < global.venus_stars else Color(1, 1, 1, 0.3)

func update_powerups():
	var container = get_node("CanvasLayer4/powerups")
	var powerups = container.get_children()
	for i in range(powerups.size()):
		powerups[0].modulate = Color(1, 1, 1, 1) if global.ice_skates > 0 else Color(1, 1, 1, 0)
		powerups[1].modulate = Color(1, 1, 1, 1) if global.raincoat > 0 else Color(1, 1, 1, 0)
		powerups[2].modulate = Color(1, 1, 1, 1) if global.boots > 0 else Color(1, 1, 1, 0)

func _ready():
	print("Ready Venus")
	usure.visible = false
	
