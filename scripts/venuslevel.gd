extends Node

@onready var usure = get_node("usure?")

func _process(delta):
	update_powerups()
	if global.passedvenus:
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/levelpage1.tscn")

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
	
