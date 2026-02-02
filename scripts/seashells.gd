extends Area2D

@onready var shell = get_node("shell")

func _on_body_entered(body):
	if body.name == "astronaut":
		global.seashells += 1
		shell.visible = false
		
