extends Area2D
@onready var text = get_node("Label")

var player_inside = false

func _on_body_entered(body):
	player_inside = true
	
func _process(delta):
	if player_inside and Input.is_action_just_pressed("enter"):
		text.visible = false
		get_tree().change_scene_to_file("res://scenes/mercurygame.tscn")
	if global.pressed:
		text.visible = false
		global.raincoat += 1
	

		
	
