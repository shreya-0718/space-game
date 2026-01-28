extends Area2D

@onready var label = get_node("../Label3")
@onready var boots = get_node("../boots/Boots")

var player__inside = false
var interacted = false

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.name == "astronaut" and not interacted:
		label.visible = true
		player__inside = true

func _on_body_exited(body):
	if body.name == "astronaut":
		label.visible = false
		player__inside = false

func _process(delta):
	if player__inside and Input.is_action_just_pressed("equip") and not interacted:
		label.visible = false
		global.boots += 1
		boots.queue_free()
		interacted = true
	
