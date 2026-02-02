extends Area2D

var speed = 250
var direction = 1 #up

@onready var astronaut = get_node("../../astronaut/AnimatedSprite2D")
@onready var climbpoint = get_node("climbpoint")
@onready var startposition = get_node("startposition")
var entered = false
var pressed = false

func _on_body_entered(body):
	if body.name == "astronaut": 
		entered = true

func _process(delta):
	if entered:
		if Input.is_action_pressed("space"):
			pressed = true
			astronaut.global_position = startposition.global_position
			await get_tree().create_timer(0.1).timeout
	if pressed:
		astronaut.global_position.y += speed * direction * delta
	if astronaut.global_position.y >= climbpoint.global_position.y:
		speed = 0

func _on_body_exited(body):
	if body.name == "astronaut":
		entered = false
