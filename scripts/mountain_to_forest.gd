extends Area2D
@onready var text = get_node("Label")

var player_inside = false

func _on_body_entered(body):
	player_inside = true
	text.visible = true
	
func _process(delta):
	if player_inside and Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://scenes/earth_forest.tscn")
		global.earth_stars = 0
