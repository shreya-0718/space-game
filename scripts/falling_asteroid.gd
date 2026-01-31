extends Area2D


var speed = 100
var direction = Vector2.ZERO 
func _ready():
	direction.x = 1
	direction.y = 1 #down

@onready var asteroid = get_node("StaticBody2D")
@onready var start = get_node("startlocation")
@onready var end = get_node("endlocation")

var entered = false

func _on_body_entered(body):
	if body.name == "astronaut":
		entered = true

func _process(delta):
	if entered:
		asteroid.global_position += speed * direction * delta
	if asteroid.global_position.y <= end.global_position.y:
		direction.y = 1 #down
	elif asteroid.global_position.y >= start.global_position.y:
		direction.y = -1 #up
	if asteroid.global_position.x <= end.global_position.x:
		direction.x = 1
	if asteroid.global_position.x >= start.global_position.x:
		direction.x = -1
			
func _on_body_exited(body):
	if body.name == "astronaut":
		entered = false
