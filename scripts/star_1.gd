extends Area2D

func _on_body_entered(body: Node2D):
	if body.name == "astronaut":
		global.mercury_stars += 1
		queue_free()
