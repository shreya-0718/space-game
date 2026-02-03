extends Area2D

@onready var bridgepoint = get_node("bridgepoint")

func _on_body_entered(body):
	if body.name == "astronaut":
		body.global_position = bridgepoint.global_position
		global.earth_gravity = 90
