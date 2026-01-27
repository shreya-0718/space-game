extends Area2D

@onready var crystal = get_node("crystalimage")

func _on_body_entered(body):
	if body.name == "astronaut":
		crystal.visible = false
		global.passedmercury = true
		
	
		
		
