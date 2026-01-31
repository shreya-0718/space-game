extends Area2D

var speed = 100
var direction = -1 #up

@onready var cloud = get_node("StaticBody2D")
@onready var start = get_node("startlocation")
@onready var end = get_node("endlocation")

var entered = false

func _on_body_entered(body):
	if body.name == "astronaut":
		entered = true

func _process(delta):
	if entered:
		cloud.global_position.y += speed * direction * delta
	if cloud.global_position.y <= end.global_position.y:
		direction = 1 #down
	elif cloud.global_position.y >= start.global_position.y:
		direction = -1 #up
		
func _on_body_exited(body):
	if body.name == "astronaut":
		entered = false
