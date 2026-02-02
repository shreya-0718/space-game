extends CanvasLayer

@onready var bar = $CanvasLayer/bar
@onready var slider = get_node("slider")
@onready var start = $CanvasLayer/start
@onready var end = $CanvasLayer/end
@onready var stop1 = $CanvasLayer/stop1
@onready var stop2 = $CanvasLayer/stop2
@onready var again = $CanvasLayer/again

var speed = 400
var direction = 1


var goodstart = start.position.x
var goodend = end.position.x

var stopleft = stop1.position.x
var stopright = stop2.position.x

func _ready():
	again.visible = false
	
func _process(delta):
	slider.position.x += speed * direction * delta
	if slider.position.x >= stopleft:
		direction = -1
	elif slider.position.x <= stopright:
		direction = 1
	if Input.is_action_just_pressed("space"):
		check()

func check():
	if slider.position.x >= goodstart and slider.position <= goodend:
		print("you won!")
	else:
		print("fail")
		again.visible = true
		get_tree().change_scene_to_file("res://scenes/mercurygame.tscn")
