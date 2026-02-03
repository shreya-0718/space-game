extends Area2D

@onready var bridgepointt = get_node("bridgepointt")

func _on_body_entered(body):
	if body.name == "astronaut":
		body.global_position = bridgepointt.global_position
