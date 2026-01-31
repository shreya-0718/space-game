extends Node2D

var bar: TextureRect
var slider: Sprite2D
var start: Marker2D
var end: Marker2D
var stop1: Marker2D
var stop2: Marker2D
var again: TextureButton
var goodstart: float
var goodend: float
var stopleft: float
var stopright: float
var label: Label

func _ready():
	start = get_node("CanvasLayer/start")
	bar = get_node("CanvasLayer/bar")
	slider = get_node("CanvasLayer/slider")
	end = get_node("CanvasLayer/end")
	stop1 = get_node("CanvasLayer/stop1")
	stop2 = get_node("CanvasLayer/stop2")
	again = get_node("CanvasLayer/again")
	label = get_node("CanvasLayer/Label")
	again.visible = false
	label.visible = false
	goodstart = start.position.x
	goodend = end.position.x
	stopleft = stop1.position.x
	stopright = stop2.position.x

var speed = 600
var direction = 1

func _process(delta):
	slider.position.x += speed * direction * delta
	if slider.position.x <= stopleft:
		direction = 1
	elif slider.position.x >= stopright:
		direction = -1
	if Input.is_action_just_pressed("space"):
		check()

func check():
	if slider.position.x >= goodstart and slider.position.x <= goodend:
		label.visible = true
		speed = 0
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://scenes/mercury.tscn")
		global.entered = true
		global.raincoat = 1
		global.pressed = true
	else:
		again.visible = true
		speed = 0
		
		
