extends Node

func _process(delta):
	update_stars()

func update_stars():
	var container = get_node("CanvasLayer2/star_container") 
	var stars = container.get_children()
	for i in range(stars.size()):
		stars[i].modulate = Color(1, 1, 1, 1) if i < global.venus_stars else Color(1, 1, 1, 0.3)
