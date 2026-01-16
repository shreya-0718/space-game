extends Area2D

@onready var label = get_node("../text")
@onready var skates = get_node("../iceskates/skatesimage")

var player_inside = false
var interacted = false

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.name == "astronaut" and not interacted:
		label.visible = true
		player_inside = true

func _on_body_exited(body):
	if body.name == "astronaut":
		label.visible = false
		player_inside = false
		

func _process(delta):
	if player_inside and Input.is_action_just_pressed("equip") and not interacted:
		label.visible = false
		global.ice_skates += 1
		skates.queue_free()
		interacted = true
	
