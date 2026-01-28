extends Area2D

@onready var entry = get_node("../gateentry/CollisionShape2D")


func _on_body_entered(body):
	if body.name == "astronaut":
		entry.disabled = false
		global.reverse = true

func _on_body_exited(body):
	if body.name == "astronaut":
		global.reverse = false
