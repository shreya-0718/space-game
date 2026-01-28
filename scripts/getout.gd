extends Area2D

@onready var astro = get_node("../astronaut")
@onready var reversedim = get_node("../reversedim")
@onready var stop2 = get_node("../stop2")
@onready var text2 = get_node("../Label2")

var player_entered = false

func _ready():
	text2.visible = false
	
func _on_body_entered(body):
	text2.visible = true
	player_entered = true

func _process(delta):
	if player_entered and Input.is_action_just_pressed("space"):
		astro.global_position = stop2.global_position
		text2.visible = false
		dim_screen()
		

func dim_screen():
	var color = reversedim.color
	color.a = 0.8
	reversedim.color = color
