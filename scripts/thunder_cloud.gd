extends Area2D

@onready var cloud = get_node("StaticBody2D")
@onready var astro = get_node("../astronaut")

var time = 0.0
var entered = false

func _process(delta):
	if entered:
		time += delta
		if time >= 2:
			time = 0.0  
			astro.respawn()

func _on_body_entered(body):
	if body.name == "astronaut":
		entered = true

func _on_body_exited(body):
	if body.name == "astronaut":
		entered = false
		
