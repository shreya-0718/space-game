extends Button

@onready var left = get_node("../../left")
@onready var right = get_node("../../right")
@onready var up = get_node("../../up")
@onready var button = get_node("../../CanvasLayer4/skiptutorial")
@onready var astronaut= get_node("../../astronaut")
@onready var check = get_node("../../removetutorial")
func _on_pressed():
	left.visible = false
	right.visible = false
	up.visible = false
	button.visible = false

func _process(delta):
	if astronaut.position.x >= check.position.x:
		visible = false
	
