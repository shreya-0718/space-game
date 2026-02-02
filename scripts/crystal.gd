extends Area2D

@onready var crystal = get_node("crystalimage")
@onready var label = get_node("../Label3")
func _ready():
	label.visible = false
func _on_body_entered(body):
	if body.name == "astronaut":
		crystal.visible = false
		label.visible = true
		global.passedmercury = true
		global.passedvenus = true
		global.passedearth = true
		
	
		
		
