extends Area2D

@onready var platform = get_node("../StaticBody2D/CollisionShape2D")

var pressed = false
func _on_body_entered(body):
	if body.name == "astronaut":
		pressed = true
		print(pressed)

func _process(delta):
	if pressed and Input.is_action_just_pressed("space"):
		platform.disabled = true
		print(platform.disabled)

func _on_body_exited(body):
	pressed = false
