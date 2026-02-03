extends Area2D

var speedd = 300
var direction = -1 #up

@onready var astronautt = get_node("../../astronaut")
@onready var climbpointt = get_node("climbpointt")
@onready var startpositionn = get_node("startpositionn")
var enteredd = false
var pressedd = false

func _on_body_entered(body):
	if body.name == "astronaut": 
		enteredd = true

func _process(delta):
	if enteredd:
		if Input.is_action_just_pressed("space"):
			pressedd = true
			astronautt.global_position = startpositionn.global_position
	if pressedd:
		global.climbing = true
		astronautt.global_position.y += speedd * direction * delta
	if astronautt.global_position.y <= climbpointt.global_position.y and astronautt.global_position.x >= climbpointt.global_position.x:
		pressedd = false
		global.climbing = false

func _on_body_exited(body):
	if body.name == "astronaut":
		enteredd = false
