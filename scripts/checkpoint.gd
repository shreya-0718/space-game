extends Area2D

@onready var white = get_node("white")
@onready var purple = get_node("purple")

func _ready():
	purple.visible = false
	
func _on_body_entered(body):
	if body.name == "astronaut":
		global.passedcheckpoint = true
		purple.visible = true
		white.visible = false
