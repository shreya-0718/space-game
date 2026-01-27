extends Area2D



@export var zoom_level = Vector2(0.5, 0.5) 

func _on_body_entered(body):
	if body.name == "astronaut":
		var cam = body.get_node("Camera2D")
		if cam:
			cam.zoom = zoom_level  
