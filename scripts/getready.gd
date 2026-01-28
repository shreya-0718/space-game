
extends Area2D
@onready var astro = get_node("../astronaut")
@onready var reversedim = get_node("../reversedim")
@onready var spawn = get_node("../stop1")
@onready var text = get_node("../Label")

var player_entered1 = false

func _ready():
	text.visible = false
	
func _on_body_entered(body):
	player_entered1 = true
	text.visible = true

	
func _process(delta):
	if player_entered1 and Input.is_action_just_pressed("enter"):
		astro.global_position = spawn.global_position
		text.visible = false
		undim_screen()
		

func undim_screen():
	var color = reversedim.color
	color.a = 0
	reversedim.color = color
