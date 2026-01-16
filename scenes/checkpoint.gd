extends Area2D

@export var scene_name: String


func _on_body_entered(body):
	if body.name == "astronaut":
		Global.checkpoint_position = global_position
		Global.checkpoint_scene = scene_name

	
