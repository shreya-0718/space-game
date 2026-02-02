extends Area2D

@onready var cloud = get_node("StaticBody2D")
@onready var astro = get_node("../astronaut")

@onready var light1 = get_node("../lightnings/Sprite2D")
@onready var light2 = get_node("../lightnings/Sprite2D2")
@onready var light3 = get_node("../lightnings/Sprite2D3")

var time = 0.0
var entered = false

var lightning = false
	
func _process(delta):
	if not lightning:
		light1.visible = false
		light2.visible = false
		light3.visible = false
	if lightning:
		light1.visible = true
		light2.visible = true
		light3.visible = true
		await get_tree().create_timer(0.5).timeout
		lightning = false
	if entered:
		time += delta
		if time >= 2:
			time = 0.0  
			lightning = true
			astro.respawn()
			

func _on_body_entered(body):
	if body.name == "astronaut":
		entered = true

func _on_body_exited(body):
	if body.name == "astronaut":
		entered = false
		
