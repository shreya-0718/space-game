extends Area2D


var entered = false
var pressed = false 

func _on_body_entered(body):
	if body.name == "astronaut":
		entered = true
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("enter"):
			pressed = true
	if pressed:
		get_tree().change_scene_to_file("res://scenes/earth_ocean.tscn")
		entered = false
		pressed = false
		
