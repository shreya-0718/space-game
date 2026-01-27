extends Area2D



func _on_body_entered(body):
	if global.ice_skates != 1:
		if body.is_in_group("astronaut"):
			body.die()
