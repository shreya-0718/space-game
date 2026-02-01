extends Area2D


var speed = 100
var direction = Vector2.ZERO 
func _ready():
	direction.x = 1
	direction.y = 0.3 #down

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
			
func _on_body_exited(body):
	if body.name == "astronaut":
		entered = false
	if body.name == "StaticBody2D":
		body.visible = false
