extends Area2D

@onready var crystal = get_node("crystalimage")
@onready var label = get_node("../Label3")
func _ready():
	label.visible = false
func _on_body_entered(body):
	if body.name == "astronaut":
		crystal.visible = false
		label.visible = true
	if get_tree().current_scene.scene_file_path == "res://scenes/mercury.tscn":
		global.passedmercury = true
	if get_tree().current_scene.scene_file_path == "res://scenes/venus.tscn":
		global.passedvenus = true
	if get_tree().current_scene.scene_file_path == "res://scenes/earth_ocean.tscn":
		global.passedearth = true
		
	
		
		
