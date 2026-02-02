extends Area2D

@onready var platform = get_node("../platform/block")

func _ready():
	platform.disabled = true
	
func _on_body_entered(body):
	if body.name == "astronaut":
		print("hello")
		platform.disabled = false
