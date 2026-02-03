extends Area2D

@onready var platform = get_node("../StaticBody2D")

var pressed = false
func _on_body_entered(body):
	if body.name == "astronaut":
		pressed = true  

func _process(delta):
	if pressed and Input.is_action_just_pressed("space"):
		if is_instance_valid(platform):
			print("freed")
			var shape = platform.get_node("CollisionShape2D")
			if shape:
				shape.disabled = true  
				platform.free()
				if not is_instance_valid(platform):
					print("actually freed")
	

func _on_body_exited(body):
	pressed = false
