extends Area2D

@onready var text = get_node("Label")

func _on_body_entered(body):
	if body.name == "astronaut":
		#if global.seashells < 5:
			#body.restart()
		if global.seashells == 5:
			text.visible = false
