extends Button

@onready var left = get_node("../../left")
@onready var right = get_node("../../right")
@onready var up = get_node("../../up")
@onready var button = get_node("../../CanvasLayer4/skiptutorial")
@onready var astronaut= get_node("../../astronaut")
@onready var check = get_node("../../removetutorial")

func _on_pressed():
	if left:
		left.queue_free()
	if right:
		right.queue_free()
	if up:
		up.queue_free()
	if button:
		button.queue_free()

func _process(delta):
	if astronaut.position.x >= check.position.x:
		visible = false
	
